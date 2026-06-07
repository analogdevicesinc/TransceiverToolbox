-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2025.1 (lin64) Build 6140274 Wed May 21 22:58:25 MDT 2025
-- Date        : Tue May 26 19:04:19 2026
-- Host        : nemo running 64-bit Ubuntu 24.04.4 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_sys_rstgen_0_sim_netlist.vhdl
-- Design      : system_sys_rstgen_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xczu3eg-sfva625-2-e
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upcnt_n is
  port (
    Q : out STD_LOGIC_VECTOR ( 5 downto 0 );
    seq_clr : in STD_LOGIC;
    seq_cnt_en : in STD_LOGIC;
    slowest_sync_clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upcnt_n;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upcnt_n is
  signal \^q\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal clear : STD_LOGIC;
  signal q_int0 : STD_LOGIC_VECTOR ( 5 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \q_int[1]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \q_int[2]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \q_int[3]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \q_int[4]_i_1\ : label is "soft_lutpair0";
begin
  Q(5 downto 0) <= \^q\(5 downto 0);
\q_int[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^q\(0),
      O => q_int0(0)
    );
\q_int[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      O => q_int0(1)
    );
\q_int[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \^q\(0),
      I1 => \^q\(1),
      I2 => \^q\(2),
      O => q_int0(2)
    );
\q_int[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^q\(2),
      I3 => \^q\(3),
      O => q_int0(3)
    );
\q_int[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(3),
      I4 => \^q\(4),
      O => q_int0(4)
    );
\q_int[5]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => seq_clr,
      O => clear
    );
\q_int[5]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^q\(2),
      I4 => \^q\(4),
      I5 => \^q\(5),
      O => q_int0(5)
    );
\q_int_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(0),
      Q => \^q\(0),
      R => clear
    );
\q_int_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(1),
      Q => \^q\(1),
      R => clear
    );
\q_int_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(2),
      Q => \^q\(2),
      R => clear
    );
\q_int_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(3),
      Q => \^q\(3),
      R => clear
    );
\q_int_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(4),
      Q => \^q\(4),
      R => clear
    );
\q_int_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => seq_cnt_en,
      D => q_int0(5),
      Q => \^q\(5),
      R => clear
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single : entity is "SINGLE";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SINGLE";
begin
  dest_out <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => src_in,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ is
  port (
    src_clk : in STD_LOGIC;
    src_in : in STD_LOGIC;
    dest_clk : in STD_LOGIC;
    dest_out : out STD_LOGIC
  );
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is 0;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is "xpm_cdc_single";
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is 0;
  attribute VERSION : integer;
  attribute VERSION of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is 0;
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is "TRUE";
  attribute keep_hierarchy : string;
  attribute keep_hierarchy of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is "true";
  attribute xpm_cdc : string;
  attribute xpm_cdc of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ : entity is "SINGLE";
end \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\;

architecture STRUCTURE of \decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\ is
  signal syncstages_ff : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute RTL_KEEP : string;
  attribute RTL_KEEP of syncstages_ff : signal is "true";
  attribute async_reg : string;
  attribute async_reg of syncstages_ff : signal is "true";
  attribute xpm_cdc of syncstages_ff : signal is "SINGLE";
  attribute ASYNC_REG_boolean : boolean;
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[0]\ : label is std.standard.true;
  attribute KEEP : string;
  attribute KEEP of \syncstages_ff_reg[0]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[0]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[1]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[1]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[1]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[2]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[2]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[2]\ : label is "SINGLE";
  attribute ASYNC_REG_boolean of \syncstages_ff_reg[3]\ : label is std.standard.true;
  attribute KEEP of \syncstages_ff_reg[3]\ : label is "true";
  attribute XPM_CDC of \syncstages_ff_reg[3]\ : label is "SINGLE";
begin
  dest_out <= syncstages_ff(3);
\syncstages_ff_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => src_in,
      Q => syncstages_ff(0),
      R => '0'
    );
\syncstages_ff_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(0),
      Q => syncstages_ff(1),
      R => '0'
    );
\syncstages_ff_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(1),
      Q => syncstages_ff(2),
      R => '0'
    );
\syncstages_ff_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => dest_clk,
      CE => '1',
      D => syncstages_ff(2),
      Q => syncstages_ff(3),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lpf is
  port (
    lpf_int : out STD_LOGIC;
    slowest_sync_clk : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lpf;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lpf is
  signal \AUX_LPF[3].asr_lpf_reg_n_0_[3]\ : STD_LOGIC;
  signal Q : STD_LOGIC;
  signal asr_d1 : STD_LOGIC;
  signal exr_d1 : STD_LOGIC;
  signal exr_lpf_0 : STD_LOGIC;
  signal lpf_asr : STD_LOGIC;
  signal lpf_asr_i_1_n_0 : STD_LOGIC;
  signal lpf_exr : STD_LOGIC;
  signal \lpf_int0__0\ : STD_LOGIC;
  signal p_1_in : STD_LOGIC;
  signal p_2_in : STD_LOGIC;
  signal p_3_in1_in : STD_LOGIC;
  attribute DEST_SYNC_FF : integer;
  attribute DEST_SYNC_FF of \ACTIVE_LOW_AUX.ACT_LO_AUX\ : label is 4;
  attribute INIT_SYNC_FF : integer;
  attribute INIT_SYNC_FF of \ACTIVE_LOW_AUX.ACT_LO_AUX\ : label is 0;
  attribute SIM_ASSERT_CHK : integer;
  attribute SIM_ASSERT_CHK of \ACTIVE_LOW_AUX.ACT_LO_AUX\ : label is 0;
  attribute SRC_INPUT_REG : integer;
  attribute SRC_INPUT_REG of \ACTIVE_LOW_AUX.ACT_LO_AUX\ : label is 0;
  attribute VERSION : integer;
  attribute VERSION of \ACTIVE_LOW_AUX.ACT_LO_AUX\ : label is 0;
  attribute XPM_CDC : string;
  attribute XPM_CDC of \ACTIVE_LOW_AUX.ACT_LO_AUX\ : label is "SINGLE";
  attribute XPM_MODULE : string;
  attribute XPM_MODULE of \ACTIVE_LOW_AUX.ACT_LO_AUX\ : label is "TRUE";
  attribute DEST_SYNC_FF of \ACTIVE_LOW_EXT.ACT_LO_EXT\ : label is 4;
  attribute INIT_SYNC_FF of \ACTIVE_LOW_EXT.ACT_LO_EXT\ : label is 0;
  attribute SIM_ASSERT_CHK of \ACTIVE_LOW_EXT.ACT_LO_EXT\ : label is 0;
  attribute SRC_INPUT_REG of \ACTIVE_LOW_EXT.ACT_LO_EXT\ : label is 0;
  attribute VERSION of \ACTIVE_LOW_EXT.ACT_LO_EXT\ : label is 0;
  attribute XPM_CDC of \ACTIVE_LOW_EXT.ACT_LO_EXT\ : label is "SINGLE";
  attribute XPM_MODULE of \ACTIVE_LOW_EXT.ACT_LO_EXT\ : label is "TRUE";
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of POR_SRL_I : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of POR_SRL_I : label is "SRL16";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of POR_SRL_I : label is "VCC:CE";
  attribute srl_name : string;
  attribute srl_name of POR_SRL_I : label is "U0/\EXT_LPF/POR_SRL_I ";
begin
\ACTIVE_LOW_AUX.ACT_LO_AUX\: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single
     port map (
      dest_clk => slowest_sync_clk,
      dest_out => p_3_in1_in,
      src_clk => '1',
      src_in => asr_d1
    );
\ACTIVE_LOW_AUX.ACT_LO_AUX_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => aux_reset_in,
      O => asr_d1
    );
\ACTIVE_LOW_EXT.ACT_LO_EXT\: entity work.\decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_xpm_cdc_single__1\
     port map (
      dest_clk => slowest_sync_clk,
      dest_out => exr_lpf_0,
      src_clk => '1',
      src_in => exr_d1
    );
\ACTIVE_LOW_EXT.ACT_LO_EXT_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => mb_debug_sys_rst,
      I1 => ext_reset_in,
      O => exr_d1
    );
\AUX_LPF[1].asr_lpf_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_3_in1_in,
      Q => p_2_in,
      R => '0'
    );
\AUX_LPF[2].asr_lpf_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_2_in,
      Q => p_1_in,
      R => '0'
    );
\AUX_LPF[3].asr_lpf_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_1_in,
      Q => \AUX_LPF[3].asr_lpf_reg_n_0_[3]\,
      R => '0'
    );
POR_SRL_I: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"FFFF"
    )
        port map (
      A0 => '1',
      A1 => '1',
      A2 => '1',
      A3 => '1',
      CE => '1',
      CLK => slowest_sync_clk,
      D => '0',
      Q => Q
    );
lpf_asr_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"EAAAAAA8"
    )
        port map (
      I0 => lpf_asr,
      I1 => p_1_in,
      I2 => p_2_in,
      I3 => p_3_in1_in,
      I4 => \AUX_LPF[3].asr_lpf_reg_n_0_[3]\,
      O => lpf_asr_i_1_n_0
    );
lpf_asr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => lpf_asr_i_1_n_0,
      Q => lpf_asr,
      R => '0'
    );
lpf_exr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => exr_lpf_0,
      Q => lpf_exr,
      R => '0'
    );
lpf_int0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFD"
    )
        port map (
      I0 => dcm_locked,
      I1 => lpf_exr,
      I2 => lpf_asr,
      I3 => Q,
      O => \lpf_int0__0\
    );
lpf_int_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \lpf_int0__0\,
      Q => lpf_int,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sequence_psr is
  port (
    MB_out : out STD_LOGIC;
    Bsr_out : out STD_LOGIC;
    Pr_out : out STD_LOGIC;
    bsr_reg_0 : out STD_LOGIC;
    pr_reg_0 : out STD_LOGIC;
    lpf_int : in STD_LOGIC;
    slowest_sync_clk : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sequence_psr;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sequence_psr is
  signal \^bsr_out\ : STD_LOGIC;
  signal Core_i_1_n_0 : STD_LOGIC;
  signal \^mb_out\ : STD_LOGIC;
  signal \^pr_out\ : STD_LOGIC;
  signal \bsr_dec_reg_n_0_[0]\ : STD_LOGIC;
  signal \bsr_dec_reg_n_0_[2]\ : STD_LOGIC;
  signal bsr_i_1_n_0 : STD_LOGIC;
  signal \core_dec[0]_i_1_n_0\ : STD_LOGIC;
  signal \core_dec[2]_i_1_n_0\ : STD_LOGIC;
  signal \core_dec_reg_n_0_[0]\ : STD_LOGIC;
  signal \core_dec_reg_n_0_[1]\ : STD_LOGIC;
  signal \core_dec_reg_n_0_[2]\ : STD_LOGIC;
  signal from_sys_i_1_n_0 : STD_LOGIC;
  signal p_3_out : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal p_5_out : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \pr_dec0__0\ : STD_LOGIC;
  signal \pr_dec_reg_n_0_[0]\ : STD_LOGIC;
  signal \pr_dec_reg_n_0_[2]\ : STD_LOGIC;
  signal pr_i_1_n_0 : STD_LOGIC;
  signal seq_clr : STD_LOGIC;
  signal seq_cnt : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal seq_cnt_en : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of Core_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \bsr_dec[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \bsr_dec[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of bsr_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \core_dec[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \core_dec[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of from_sys_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of pr_i_1 : label is "soft_lutpair6";
begin
  Bsr_out <= \^bsr_out\;
  MB_out <= \^mb_out\;
  Pr_out <= \^pr_out\;
\ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^bsr_out\,
      O => bsr_reg_0
    );
\ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^pr_out\,
      O => pr_reg_0
    );
Core_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^mb_out\,
      I1 => \core_dec_reg_n_0_[2]\,
      O => Core_i_1_n_0
    );
Core_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => Core_i_1_n_0,
      Q => \^mb_out\,
      S => lpf_int
    );
SEQ_COUNTER: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_upcnt_n
     port map (
      Q(5 downto 0) => seq_cnt(5 downto 0),
      seq_clr => seq_clr,
      seq_cnt_en => seq_cnt_en,
      slowest_sync_clk => slowest_sync_clk
    );
\bsr_dec[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0090"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(4),
      I2 => seq_cnt(3),
      I3 => seq_cnt(5),
      O => p_5_out(0)
    );
\bsr_dec[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \core_dec_reg_n_0_[1]\,
      I1 => \bsr_dec_reg_n_0_[0]\,
      O => p_5_out(2)
    );
\bsr_dec_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_5_out(0),
      Q => \bsr_dec_reg_n_0_[0]\,
      R => '0'
    );
\bsr_dec_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_5_out(2),
      Q => \bsr_dec_reg_n_0_[2]\,
      R => '0'
    );
bsr_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^bsr_out\,
      I1 => \bsr_dec_reg_n_0_[2]\,
      O => bsr_i_1_n_0
    );
bsr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => bsr_i_1_n_0,
      Q => \^bsr_out\,
      S => lpf_int
    );
\core_dec[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9000"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(4),
      I2 => seq_cnt(3),
      I3 => seq_cnt(5),
      O => \core_dec[0]_i_1_n_0\
    );
\core_dec[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \core_dec_reg_n_0_[1]\,
      I1 => \core_dec_reg_n_0_[0]\,
      O => \core_dec[2]_i_1_n_0\
    );
\core_dec_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \core_dec[0]_i_1_n_0\,
      Q => \core_dec_reg_n_0_[0]\,
      R => '0'
    );
\core_dec_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \pr_dec0__0\,
      Q => \core_dec_reg_n_0_[1]\,
      R => '0'
    );
\core_dec_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => \core_dec[2]_i_1_n_0\,
      Q => \core_dec_reg_n_0_[2]\,
      R => '0'
    );
from_sys_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \^mb_out\,
      I1 => seq_cnt_en,
      O => from_sys_i_1_n_0
    );
from_sys_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => from_sys_i_1_n_0,
      Q => seq_cnt_en,
      S => lpf_int
    );
pr_dec0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0018"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(0),
      I2 => seq_cnt(2),
      I3 => seq_cnt(1),
      O => \pr_dec0__0\
    );
\pr_dec[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0480"
    )
        port map (
      I0 => seq_cnt_en,
      I1 => seq_cnt(3),
      I2 => seq_cnt(5),
      I3 => seq_cnt(4),
      O => p_3_out(0)
    );
\pr_dec[2]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \core_dec_reg_n_0_[1]\,
      I1 => \pr_dec_reg_n_0_[0]\,
      O => p_3_out(2)
    );
\pr_dec_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_3_out(0),
      Q => \pr_dec_reg_n_0_[0]\,
      R => '0'
    );
\pr_dec_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => p_3_out(2),
      Q => \pr_dec_reg_n_0_[2]\,
      R => '0'
    );
pr_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^pr_out\,
      I1 => \pr_dec_reg_n_0_[2]\,
      O => pr_i_1_n_0
    );
pr_reg: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => pr_i_1_n_0,
      Q => \^pr_out\,
      S => lpf_int
    );
seq_clr_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => '1',
      Q => seq_clr,
      R => lpf_int
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute C_AUX_RESET_HIGH : string;
  attribute C_AUX_RESET_HIGH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is "1'b0";
  attribute C_AUX_RST_WIDTH : integer;
  attribute C_AUX_RST_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is 4;
  attribute C_EXT_RESET_HIGH : string;
  attribute C_EXT_RESET_HIGH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is "1'b0";
  attribute C_EXT_RST_WIDTH : integer;
  attribute C_EXT_RST_WIDTH of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is "zynquplus";
  attribute C_NUM_BUS_RST : integer;
  attribute C_NUM_BUS_RST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is 1;
  attribute C_NUM_INTERCONNECT_ARESETN : integer;
  attribute C_NUM_INTERCONNECT_ARESETN of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is 1;
  attribute C_NUM_PERP_ARESETN : integer;
  attribute C_NUM_PERP_ARESETN of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is 1;
  attribute C_NUM_PERP_RST : integer;
  attribute C_NUM_PERP_RST of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset : entity is 1;
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset is
  signal Bsr_out : STD_LOGIC;
  signal MB_out : STD_LOGIC;
  signal Pr_out : STD_LOGIC;
  signal SEQ_n_3 : STD_LOGIC;
  signal SEQ_n_4 : STD_LOGIC;
  signal lpf_int : STD_LOGIC;
  attribute BOX_TYPE : string;
  attribute BOX_TYPE of \ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N\ : label is "PRIMITIVE";
  attribute BOX_TYPE of \BSR_OUT_DFF[0].FDRE_BSR\ : label is "PRIMITIVE";
  attribute BOX_TYPE of FDRE_inst : label is "PRIMITIVE";
  attribute BOX_TYPE of \PR_OUT_DFF[0].FDRE_PER\ : label is "PRIMITIVE";
begin
\ACTIVE_LOW_BSR_OUT_DFF[0].FDRE_BSR_N\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => SEQ_n_3,
      Q => interconnect_aresetn(0),
      R => '0'
    );
\ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => SEQ_n_4,
      Q => peripheral_aresetn(0),
      R => '0'
    );
\BSR_OUT_DFF[0].FDRE_BSR\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => Bsr_out,
      Q => bus_struct_reset(0),
      R => '0'
    );
EXT_LPF: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_lpf
     port map (
      aux_reset_in => aux_reset_in,
      dcm_locked => dcm_locked,
      ext_reset_in => ext_reset_in,
      lpf_int => lpf_int,
      mb_debug_sys_rst => mb_debug_sys_rst,
      slowest_sync_clk => slowest_sync_clk
    );
FDRE_inst: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => MB_out,
      Q => mb_reset,
      R => '0'
    );
\PR_OUT_DFF[0].FDRE_PER\: unisim.vcomponents.FDRE
    generic map(
      INIT => '1',
      IS_C_INVERTED => '0',
      IS_D_INVERTED => '0',
      IS_R_INVERTED => '0'
    )
        port map (
      C => slowest_sync_clk,
      CE => '1',
      D => Pr_out,
      Q => peripheral_reset(0),
      R => '0'
    );
SEQ: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_sequence_psr
     port map (
      Bsr_out => Bsr_out,
      MB_out => MB_out,
      Pr_out => Pr_out,
      bsr_reg_0 => SEQ_n_3,
      lpf_int => lpf_int,
      pr_reg_0 => SEQ_n_4,
      slowest_sync_clk => slowest_sync_clk
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "system_sys_rstgen_0,proc_sys_reset,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "proc_sys_reset,Vivado 2025.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute C_AUX_RESET_HIGH : string;
  attribute C_AUX_RESET_HIGH of U0 : label is "1'b0";
  attribute C_AUX_RST_WIDTH : integer;
  attribute C_AUX_RST_WIDTH of U0 : label is 4;
  attribute C_EXT_RESET_HIGH : string;
  attribute C_EXT_RESET_HIGH of U0 : label is "1'b0";
  attribute C_EXT_RST_WIDTH : integer;
  attribute C_EXT_RST_WIDTH of U0 : label is 1;
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynquplus";
  attribute C_NUM_BUS_RST : integer;
  attribute C_NUM_BUS_RST of U0 : label is 1;
  attribute C_NUM_INTERCONNECT_ARESETN : integer;
  attribute C_NUM_INTERCONNECT_ARESETN of U0 : label is 1;
  attribute C_NUM_PERP_ARESETN : integer;
  attribute C_NUM_PERP_ARESETN of U0 : label is 1;
  attribute C_NUM_PERP_RST : integer;
  attribute C_NUM_PERP_RST of U0 : label is 1;
  attribute x_interface_info : string;
  attribute x_interface_info of aux_reset_in : signal is "xilinx.com:signal:reset:1.0 aux_reset RST";
  attribute x_interface_mode : string;
  attribute x_interface_mode of aux_reset_in : signal is "slave aux_reset";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of aux_reset_in : signal is "XIL_INTERFACENAME aux_reset, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of ext_reset_in : signal is "xilinx.com:signal:reset:1.0 ext_reset RST";
  attribute x_interface_mode of ext_reset_in : signal is "slave ext_reset";
  attribute x_interface_parameter of ext_reset_in : signal is "XIL_INTERFACENAME ext_reset, BOARD.ASSOCIATED_PARAM RESET_BOARD_INTERFACE, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of mb_debug_sys_rst : signal is "xilinx.com:signal:reset:1.0 dbg_reset RST";
  attribute x_interface_mode of mb_debug_sys_rst : signal is "slave dbg_reset";
  attribute x_interface_parameter of mb_debug_sys_rst : signal is "XIL_INTERFACENAME dbg_reset, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute x_interface_info of mb_reset : signal is "xilinx.com:signal:reset:1.0 mb_rst RST";
  attribute x_interface_mode of mb_reset : signal is "master mb_rst";
  attribute x_interface_parameter of mb_reset : signal is "XIL_INTERFACENAME mb_rst, POLARITY ACTIVE_HIGH, TYPE PROCESSOR, INSERT_VIP 0";
  attribute x_interface_info of slowest_sync_clk : signal is "xilinx.com:signal:clock:1.0 clock CLK";
  attribute x_interface_mode of slowest_sync_clk : signal is "slave clock";
  attribute x_interface_parameter of slowest_sync_clk : signal is "XIL_INTERFACENAME clock, ASSOCIATED_RESET mb_reset:bus_struct_reset:interconnect_aresetn:peripheral_aresetn:peripheral_reset, FREQ_HZ 99999001, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN system_sys_ps8_0_pl_clk0, INSERT_VIP 0";
  attribute x_interface_info of bus_struct_reset : signal is "xilinx.com:signal:reset:1.0 bus_struct_reset RST";
  attribute x_interface_mode of bus_struct_reset : signal is "master bus_struct_reset";
  attribute x_interface_parameter of bus_struct_reset : signal is "XIL_INTERFACENAME bus_struct_reset, POLARITY ACTIVE_HIGH, TYPE INTERCONNECT, INSERT_VIP 0";
  attribute x_interface_info of interconnect_aresetn : signal is "xilinx.com:signal:reset:1.0 interconnect_low_rst RST";
  attribute x_interface_mode of interconnect_aresetn : signal is "master interconnect_low_rst";
  attribute x_interface_parameter of interconnect_aresetn : signal is "XIL_INTERFACENAME interconnect_low_rst, POLARITY ACTIVE_LOW, TYPE INTERCONNECT, INSERT_VIP 0";
  attribute x_interface_info of peripheral_aresetn : signal is "xilinx.com:signal:reset:1.0 peripheral_low_rst RST";
  attribute x_interface_mode of peripheral_aresetn : signal is "master peripheral_low_rst";
  attribute x_interface_parameter of peripheral_aresetn : signal is "XIL_INTERFACENAME peripheral_low_rst, POLARITY ACTIVE_LOW, TYPE PERIPHERAL, INSERT_VIP 0";
  attribute x_interface_info of peripheral_reset : signal is "xilinx.com:signal:reset:1.0 peripheral_high_rst RST";
  attribute x_interface_mode of peripheral_reset : signal is "master peripheral_high_rst";
  attribute x_interface_parameter of peripheral_reset : signal is "XIL_INTERFACENAME peripheral_high_rst, POLARITY ACTIVE_HIGH, TYPE PERIPHERAL, INSERT_VIP 0";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_proc_sys_reset
     port map (
      aux_reset_in => aux_reset_in,
      bus_struct_reset(0) => bus_struct_reset(0),
      dcm_locked => dcm_locked,
      ext_reset_in => ext_reset_in,
      interconnect_aresetn(0) => interconnect_aresetn(0),
      mb_debug_sys_rst => mb_debug_sys_rst,
      mb_reset => mb_reset,
      peripheral_aresetn(0) => peripheral_aresetn(0),
      peripheral_reset(0) => peripheral_reset(0),
      slowest_sync_clk => slowest_sync_clk
    );
end STRUCTURE;
