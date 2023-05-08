function ref_name = get_ref_name(rd_name)

s = strsplit(rd_name,' ');
board = lower(s{1});
carrier = lower(s{2});
variant = lower(s{3});
variant = strrep(variant,'(','');
variant = strrep(variant,')','');

if contains(board,'fmcomms2')
    board = 'fmcomms2';
end

ref_name = '';

    switch lower(carrier)
        case 'zcu102'
            switch lower(board)
                case 'ad9172'
                    ref_name = 'zynqmp-zcu102-rev10-ad9172-fmc-ebz-mode4';
                case 'fmcomms2'
                    ref_name = 'zynqmp-zcu102-rev10-ad9361-fmcomms2-3';
                case 'fmcomms5'
                    ref_name = 'zynqmp-zcu102-rev10-ad9361-fmcomms5';
                case 'adrv9002'
                    ref_name = 'zynqmp-zcu102-rev10-adrv9002';
                case 'adrv9009'
                    ref_name = 'zynqmp-zcu102-rev10-adrv9009';
                case 'ad9371'
                    ref_name = 'zynqmp-zcu102-rev10-adrv9371';
                case 'daq2'
                    ref_name = 'zynqmp-zcu102-rev10-fmcdaq2';
                case 'daq3'
                    ref_name = 'zynqmp-zcu102-rev10-fmcdaq3';
            end
            % zynqmp-zcu102-rev10-ad9364-fmcomms4   ZCU102      AD-FMCOMMS4-EBZ     doc
            % zynqmp-zcu102-rev10-adrv9375  ZCU102      ADRV9375    doc
            % zynqmp-zcu102-rev10-fmclidar1     ZCU102      AD-FMCLIDAR1-EBZ    doc
        case 'zc706'
            switch board
                case 'ad9172'
                    ref_name = 'zynq-zc706-adv7511-ad9172-fmc-ebz';
                case 'fmcomms2'
                    ref_name = 'zynq-zc706-adv7511-ad9361-fmcomms2-3';
                case 'fmcomms5'
                    ref_name = 'zynq-zc706-adv7511-ad9361-fmcomms5';
                case 'ad9434'
                    ref_name = 'zynq-zc706-adv7511-ad9434-fmc-500ebz';
                case 'adrv9009'
                    ref_name = 'zynq-zc706-adv7511-adrv9009';
                case 'ad9371'
                    ref_name = 'zynq-zc706-adv7511-adrv9371';
                case 'daq2'
                    ref_name = 'zynq-zc706-adv7511-fmcdaq2';
                case 'fmcomms11'
                    ref_name = 'zynq-zc706-adv7511-fmcomms11';
            end
            % zynq-zc706-adv7511    ZC706   ADV7511
            % zynq-zc706-adv7511-ad6676-fmc     ZC706   ADV7511     EVAL-AD6676
            % zynq-zc706-adv7511-ad9265-fmc-125ebz  ZC706   ADV7511     AD9265-FMC-125EBZ
            % zynq-zc706-adv7511-ad9361-fmcomms5-ext-lo-adf5355     ZC706   ADV7511     AD-FMCOMMS5-EBZ external LO     doc

            % zynq-zc706-adv7511-ad9364-fmcomms4    ZC706   ADV7511     AD-FMCOMMS4-EBZ     doc
            % zynq-zc706-adv7511-ad9434-fmc-500ebz  ZC706   ADV7511     AD9434-FMC-500EBZ   doc
            % zynq-zc706-adv7511-ad9625-fmcadc2     ZC706   ADV7511     AD-FMCADC2-EBZ  doc
            % zynq-zc706-adv7511-ad9625-fmcadc3     ZC706   ADV7511     AD-FMCADC3-EBZ
            % zynq-zc706-adv7511-ad9739a-fmc    ZC706   ADV7511     EVAL-AD9739A    doc
            % zynq-zc706-adv7511-adrv9008-1     ZC706   ADV7511     EVAL-ADRV9008-9009  doc
            % zynq-zc706-adv7511-adrv9008-2     ZC706   ADV7511     EVAL-ADRV9008-9009  doc

            % zynq-zc706-adv7511-adrv9375   ZC706   ADV7511     ADRV9375    doc
            % zynq-zc706-adv7511-fmcdaq3-revC   ZC706   ADV7511     eval-fmcdaq3-ebz    doc
            % zynq-zc706-adv7511-fmcjesdadc1    ZC706   ADV7511     AD-FMCJESDADC1-EBZ
            % zynq-zc706-adv7511-fmclidar1  ZC706   ADV7511     AD-FMCLIDAR1-EBZ    doc

        case 'zc702'
            switch board
                case 'fmcomms2'
                    ref_name = 'zynq-zc702-adv7511-ad9361-fmcomms2-3';
                case 'fmcomms5'
                    ref_name = 'zynq-zc702-adv7511-ad9361-fmcomms5';
            end
            % zynq-zc702-adv7511    ZC702   ADV7511
            % zynq-zc702-adv7511-ad9364-fmcomms4    ZC702   ADV7511     AD-FMCOMMS4-EBZ     doc

        case 'zed'
            switch board
                case 'fmcomms2'
                    ref_name = 'zynq-zed-adv7511-ad9361-fmcomms2-3';
                case 'adrv9002'
                    ref_name = 'zynq-zed-adv7511-adrv9002';
                case 'adrv9002_rx2tx2'
                    ref_name = 'zynq-zed-adv7511-adrv9002-rx2tx2';

                    % zynq-zed-adv7511  Zed Board   ADV7511
                    % zynq-zed-adv7511-ad9364-fmcomms4  Zed Board   ADV7511     AD-FMCOMMS4-EBZ     doc
                    % zynq-zed-adv7511-ad9467-fmc-250ebz    Zed Board   ADV7511     AD9467-FMC-250EBZ
                    % zynq-zed-adv7511-cn0363   Zed Board   ADV7511     EVAL-CN0363-PMDZ
                    % zynq-zed-ad40xx_fmc   Zed Board       EVAL-AD400x-FMCZ
                    % zynq-zed-ad4630   Zed Board       EVAL-AD4630-16
                    % zynq-zed-ad5758_sdz   Zed Board       EVAL-AD5758
                    % zynq-zed-ad5766_sdz   Zed Board       EVAL-AD5766
                    % zynq-zed-ad7134_fmc   Zed Board       EVAL-AD7134FMCZ
                    % zynq-zed-ad738x_fmc   Zed Board       EVAL-AD738xFMCZ
                    % zynq-zed-ad7405_fmc   Zed Board       eval-ad7405
                    % zynq-zed-ad7616_sdz   Zed Board       EVAL-AD7616
                    % zynq-zed-ad77681evb   Zed Board
                    % zynq-zed-ad7768evb    Zed Board       EVAL-CN0363-PMDZ
                    % zynq-zed-ad9467_fmc   Zed Board       EVAL-AD9467
                    % zynq-zed-adaq7980_sdz     Zed Board       EVAL-ADAQ7980
                    % zynq-zed-cn0363   Zed Board       CN0363
                    % zynq-zed-cn0506_mii   Zed Board       CN0506
                    % zynq-zed-cn0506_rgmii     Zed Board       CN0506
                    % zynq-zed-cn0506_rmii  Zed Board       CN0506
                    % zynq-zed-imageon  Zed Board   ADV7511     FMC-IMAGEON

            end
        case 'adrv9361z7035'
            switch board
                case 'ccbob_cmos'
                    ref_name = 'zynq-adrv9361-z7035-bob-cmos';
                case 'ccbob_lvds'
                    ref_name = 'zynq-adrv9361-z7035-bob';
                case 'ccfmc_lvds'
                    ref_name = 'zynq-adrv9361-z7035-fmc';
                case 'ccpackrf_lvds'
                    ref_name = 'zynq-adrv9361-z7035-packrf';
            end

        case 'adrv9364z7020'
            switch board
                case 'ccbob_cmos'
                    ref_name = 'zynq-adrv9364-z7020-bob-cmos';
                case 'ccbob_lvds'
                    ref_name = 'zynq-adrv9364-z7020-bob';
                case 'ccpackrf_lvds'
                    ref_name = 'zynq-adrv9364-z7020-packrf';
            end
    end

    % socfpga_arria10_socdk_ad9081  DK-SOC-10AS066S-A       EVAL-ad9081
    % socfpga_arria10_socdk_adrv9002    DK-SOC-10AS066S-A       EVAL-adrv9002
    % socfpga_arria10_socdk_adrv9009    DK-SOC-10AS066S-A       EVAL-ADRV9008-9009  doc
    % socfpga_arria10_socdk_adrv9371    DK-SOC-10AS066S-A       EVAL-ADRV9371   doc
    % socfpga_arria10_socdk_cn0506_mii  DK-SOC-10AS066S-A       CN0506
    % socfpga_arria10_socdk_daq2    DK-SOC-10AS066S-A       AD-FMCDAQ2-EBZ  doc
    % socfpga_arria10_socdk_fmclidar1   DK-SOC-10AS066S-A       AD-FMCLIDAR1-EBZ    doc
    % socfpga_arria10_socdk_fmcomms8    DK-SOC-10AS066S-A       EVAL-AD-FMCOMMS8-EBZ
    % socfpga_cyclone5_de10_nano_cn0540     Intel Cyclone 5 De10 Nano Kit       CN0540 board
    % socfpga_cyclone5_sockit_arradio   Intel Cyclone 5 SoC Kit         Arradio board

    % zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-revb     ADRV2CRR-FMC        ADRV9009-ZU11EG     doc
    % zynqmp-adrv9009-zu11eg-revb-adrv2crr-fmc-fmcomms8     ADRV2CRR-FMC        EVAL-AD-FMCOMMS8-EBZ    doc

    % zynq-coraz7s-cn0540   Cora Z7 Board   CN0540 board
    % zynq-coraz7s-cn0501   Cora Z7 Board

    % versal-vck190-ad9081_fmca_ebz     VCK190 Board    EVAL-AD9081

if strcmpi(ref_name, '')
    error(sprintf('No mapping found for reference design: %s\n',rd_name));
end

ref_name = sprintf('%s_%s_BOOT.BIN', ref_name, variant);

end
