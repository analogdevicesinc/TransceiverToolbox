function attr = adrv9002_ssi_loopback(enable)
%ADRV9002_SSI_LOOPBACK  Enable/disable ADRV9002 SSI digital loopback on the
%   target, discovering the controlling debug attribute at runtime.
%
%   ATTR = ADRV9002_SSI_LOOPBACK(ENABLE) ssh-es to the board (reusing
%   PrbsLoopbackRegisters.sshExec), locates the adrv9002-phy iio device, and
%   searches its debugfs attributes for a loopback/ssi/test control. It writes
%   1 (ENABLE true) or 0 (false) to the best match and returns the attribute
%   path used, or '' if none was found.
%
%   The exact attribute name is the one piece not derivable from the repo --
%   this discovers it on the live device. If discovery fails, the printed
%   candidate list tells you what to wire up by hand (or via the ADI API
%   adi_adrv9001_Ssi_Loopback_Set on a board-side helper).
%
%   NOTE: a *digital/SSI* loopback returns the FPGA-driven Tx SSI words on the
%   Rx SSI bit-for-bit. Do NOT confuse it with the RF/datapath loopbacks or
%   the LoopbackDelayTracking calibration (adi.ADRV9002.Tx) -- those are not
%   what verifies the raw digital interface.

    R = PrbsLoopbackRegisters;
    val = '0'; if enable, val = '1'; end
    attr = '';

    % 1) find the adrv9002 iio device debugfs directory
    findDev = [ ...
        'for d in /sys/kernel/debug/iio/iio:device*; do ' ...
        '  n=$(cat $d/name 2>/dev/null); ' ...
        '  case "$n" in *adrv9002*|*adrv9001*) echo "$d";; esac; ' ...
        'done'];
    [rc, out] = R.sshExec(findDev);
    devdir = strtrim(char(out));
    if rc ~= 0 || isempty(devdir)
        fprintf(2, '[ssi_loopback] could not locate adrv9002 debugfs device.\n');
        return;
    end
    devdir = strsplit(devdir); devdir = devdir{1};
    fprintf('[ssi_loopback] adrv9002 debugfs: %s\n', devdir);

    % 2) list candidate attributes (loopback / ssi / test mode)
    listCmd = sprintf(['ls %s 2>/dev/null | ' ...
        'grep -Ei "loopback|ssi.*(loop|test|prbs)|test.?mode|datapath.?loop"'], devdir);
    [~, lout] = R.sshExec(listCmd);
    cands = strsplit(strtrim(char(lout)));
    cands = cands(~cellfun(@isempty, cands));
    if isempty(cands)
        fprintf(2, ['[ssi_loopback] no loopback/ssi/test attribute found under %s.\n' ...
            '  Dumping all debug attributes so you can pick the right one:\n'], devdir);
        [~, allout] = R.sshExec(sprintf('ls %s', devdir));
        disp(char(allout));
        return;
    end
    fprintf('[ssi_loopback] candidate attributes: %s\n', strjoin(cands, ', '));

    % 3) prefer an explicit "ssi*loopback", else first candidate
    pick = cands{1};
    for k = 1:numel(cands)
        if ~isempty(regexpi(cands{k}, 'ssi.*loop|loopback', 'once'))
            pick = cands{k}; break;
        end
    end
    attr = [devdir '/' pick];

    % 4) write the value (per-channel attrs may need voltage0/voltage1; try plain first)
    wcmd = sprintf('echo %s > %s 2>&1; echo RC=$?', val, attr);
    [~, wout] = R.sshExec(wcmd);
    fprintf('[ssi_loopback] %s <- %s : %s\n', attr, val, strtrim(char(wout)));
end
