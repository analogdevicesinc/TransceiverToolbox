
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/axi_adrv9001_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "CMOS_LVDS_N" -parent ${Page_0}
  ipgui::add_param $IPINST -name "COMMON_2R2T_SUPPORT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DDS_DISABLE" -parent ${Page_0}
  set DISABLE_RX1_SSI [ipgui::add_param $IPINST -name "DISABLE_RX1_SSI" -parent ${Page_0}]
  set_property tooltip {NOTE: If checked, it disables Rx1 source synchronous interface} ${DISABLE_RX1_SSI}
  set DISABLE_RX2_SSI [ipgui::add_param $IPINST -name "DISABLE_RX2_SSI" -parent ${Page_0}]
  set_property tooltip {NOTE: If checked, it disables Rx2 source synchronous interface} ${DISABLE_RX2_SSI}
  set DISABLE_TX1_SSI [ipgui::add_param $IPINST -name "DISABLE_TX1_SSI" -parent ${Page_0} -widget checkBox]
  set_property tooltip {NOTE: If checked, it disables Tx1 source synchronous interface} ${DISABLE_TX1_SSI}
  set DISABLE_TX2_SSI [ipgui::add_param $IPINST -name "DISABLE_TX2_SSI" -parent ${Page_0} -widget checkBox]
  set_property tooltip {NOTE: If checked, it disables Tx2 source synchronous interface} ${DISABLE_TX2_SSI}
  ipgui::add_param $IPINST -name "ENABLE_REF_CLK_MON" -parent ${Page_0}
  ipgui::add_param $IPINST -name "EN_RX_MCS_TO_STRB_M" -parent ${Page_0} -widget checkBox
  set EXT_SYNC [ipgui::add_param $IPINST -name "EXT_SYNC" -parent ${Page_0} -widget checkBox]
  set_property tooltip {NOTE: If active enables the external synchronization features for Rx and Tx. The external sync signals must be synchronous with to ref_clk} ${EXT_SYNC}
  ipgui::add_param $IPINST -name "ID" -parent ${Page_0}
  ipgui::add_param $IPINST -name "INDEPENDENT_1R1T_SUPPORT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IODELAY_CTRL" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IODELAY_ENABLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "IO_DELAY_GROUP" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RX_USE_BUFG" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TDD_DISABLE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "TX_USE_BUFG" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USE_RX_CLK_FOR_TX1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "USE_RX_CLK_FOR_TX2" -parent ${Page_0}
  #Adding Group
  set FPGA_info [ipgui::add_group $IPINST -name "FPGA info" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "FPGA_TECHNOLOGY" -parent ${FPGA_info} -widget comboBox
  ipgui::add_param $IPINST -name "FPGA_FAMILY" -parent ${FPGA_info} -widget comboBox
  ipgui::add_param $IPINST -name "SPEED_GRADE" -parent ${FPGA_info} -widget comboBox
  ipgui::add_param $IPINST -name "DEV_PACKAGE" -parent ${FPGA_info} -widget comboBox



}

proc update_PARAM_VALUE.DISABLE_RX1_SSI { PARAM_VALUE.DISABLE_RX1_SSI PARAM_VALUE.USE_RX_CLK_FOR_TX1 PARAM_VALUE.USE_RX_CLK_FOR_TX2 } {
	# Procedure called to update DISABLE_RX1_SSI when any of the dependent parameters in the arguments change
	
	set DISABLE_RX1_SSI ${PARAM_VALUE.DISABLE_RX1_SSI}
	set USE_RX_CLK_FOR_TX1 ${PARAM_VALUE.USE_RX_CLK_FOR_TX1}
	set USE_RX_CLK_FOR_TX2 ${PARAM_VALUE.USE_RX_CLK_FOR_TX2}
	set values(USE_RX_CLK_FOR_TX1) [get_property value $USE_RX_CLK_FOR_TX1]
	set values(USE_RX_CLK_FOR_TX2) [get_property value $USE_RX_CLK_FOR_TX2]
	if { [gen_USERPARAMETER_DISABLE_RX1_SSI_ENABLEMENT $values(USE_RX_CLK_FOR_TX1) $values(USE_RX_CLK_FOR_TX2)] } {
		set_property enabled true $DISABLE_RX1_SSI
	} else {
		set_property enabled false $DISABLE_RX1_SSI
		set_property value [gen_USERPARAMETER_DISABLE_RX1_SSI_VALUE $values(USE_RX_CLK_FOR_TX1) $values(USE_RX_CLK_FOR_TX2)] $DISABLE_RX1_SSI
	}
}

proc validate_PARAM_VALUE.DISABLE_RX1_SSI { PARAM_VALUE.DISABLE_RX1_SSI } {
	# Procedure called to validate DISABLE_RX1_SSI
	return true
}

proc update_PARAM_VALUE.DISABLE_RX2_SSI { PARAM_VALUE.DISABLE_RX2_SSI PARAM_VALUE.USE_RX_CLK_FOR_TX1 PARAM_VALUE.USE_RX_CLK_FOR_TX2 } {
	# Procedure called to update DISABLE_RX2_SSI when any of the dependent parameters in the arguments change
	
	set DISABLE_RX2_SSI ${PARAM_VALUE.DISABLE_RX2_SSI}
	set USE_RX_CLK_FOR_TX1 ${PARAM_VALUE.USE_RX_CLK_FOR_TX1}
	set USE_RX_CLK_FOR_TX2 ${PARAM_VALUE.USE_RX_CLK_FOR_TX2}
	set values(USE_RX_CLK_FOR_TX1) [get_property value $USE_RX_CLK_FOR_TX1]
	set values(USE_RX_CLK_FOR_TX2) [get_property value $USE_RX_CLK_FOR_TX2]
	if { [gen_USERPARAMETER_DISABLE_RX2_SSI_ENABLEMENT $values(USE_RX_CLK_FOR_TX1) $values(USE_RX_CLK_FOR_TX2)] } {
		set_property enabled true $DISABLE_RX2_SSI
	} else {
		set_property enabled false $DISABLE_RX2_SSI
		set_property value [gen_USERPARAMETER_DISABLE_RX2_SSI_VALUE $values(USE_RX_CLK_FOR_TX1) $values(USE_RX_CLK_FOR_TX2)] $DISABLE_RX2_SSI
	}
}

proc validate_PARAM_VALUE.DISABLE_RX2_SSI { PARAM_VALUE.DISABLE_RX2_SSI } {
	# Procedure called to validate DISABLE_RX2_SSI
	return true
}

proc update_PARAM_VALUE.CMOS_LVDS_N { PARAM_VALUE.CMOS_LVDS_N } {
	# Procedure called to update CMOS_LVDS_N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CMOS_LVDS_N { PARAM_VALUE.CMOS_LVDS_N } {
	# Procedure called to validate CMOS_LVDS_N
	return true
}

proc update_PARAM_VALUE.COMMON_2R2T_SUPPORT { PARAM_VALUE.COMMON_2R2T_SUPPORT } {
	# Procedure called to update COMMON_2R2T_SUPPORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COMMON_2R2T_SUPPORT { PARAM_VALUE.COMMON_2R2T_SUPPORT } {
	# Procedure called to validate COMMON_2R2T_SUPPORT
	return true
}

proc update_PARAM_VALUE.DDS_DISABLE { PARAM_VALUE.DDS_DISABLE } {
	# Procedure called to update DDS_DISABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DDS_DISABLE { PARAM_VALUE.DDS_DISABLE } {
	# Procedure called to validate DDS_DISABLE
	return true
}

proc update_PARAM_VALUE.DEV_PACKAGE { PARAM_VALUE.DEV_PACKAGE } {
	# Procedure called to update DEV_PACKAGE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DEV_PACKAGE { PARAM_VALUE.DEV_PACKAGE } {
	# Procedure called to validate DEV_PACKAGE
	return true
}

proc update_PARAM_VALUE.DISABLE_TX1_SSI { PARAM_VALUE.DISABLE_TX1_SSI } {
	# Procedure called to update DISABLE_TX1_SSI when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DISABLE_TX1_SSI { PARAM_VALUE.DISABLE_TX1_SSI } {
	# Procedure called to validate DISABLE_TX1_SSI
	return true
}

proc update_PARAM_VALUE.DISABLE_TX2_SSI { PARAM_VALUE.DISABLE_TX2_SSI } {
	# Procedure called to update DISABLE_TX2_SSI when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DISABLE_TX2_SSI { PARAM_VALUE.DISABLE_TX2_SSI } {
	# Procedure called to validate DISABLE_TX2_SSI
	return true
}

proc update_PARAM_VALUE.ENABLE_REF_CLK_MON { PARAM_VALUE.ENABLE_REF_CLK_MON } {
	# Procedure called to update ENABLE_REF_CLK_MON when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_REF_CLK_MON { PARAM_VALUE.ENABLE_REF_CLK_MON } {
	# Procedure called to validate ENABLE_REF_CLK_MON
	return true
}

proc update_PARAM_VALUE.EN_RX_MCS_TO_STRB_M { PARAM_VALUE.EN_RX_MCS_TO_STRB_M } {
	# Procedure called to update EN_RX_MCS_TO_STRB_M when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EN_RX_MCS_TO_STRB_M { PARAM_VALUE.EN_RX_MCS_TO_STRB_M } {
	# Procedure called to validate EN_RX_MCS_TO_STRB_M
	return true
}

proc update_PARAM_VALUE.EXT_SYNC { PARAM_VALUE.EXT_SYNC } {
	# Procedure called to update EXT_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.EXT_SYNC { PARAM_VALUE.EXT_SYNC } {
	# Procedure called to validate EXT_SYNC
	return true
}

proc update_PARAM_VALUE.FPGA_FAMILY { PARAM_VALUE.FPGA_FAMILY } {
	# Procedure called to update FPGA_FAMILY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FPGA_FAMILY { PARAM_VALUE.FPGA_FAMILY } {
	# Procedure called to validate FPGA_FAMILY
	return true
}

proc update_PARAM_VALUE.FPGA_TECHNOLOGY { PARAM_VALUE.FPGA_TECHNOLOGY } {
	# Procedure called to update FPGA_TECHNOLOGY when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FPGA_TECHNOLOGY { PARAM_VALUE.FPGA_TECHNOLOGY } {
	# Procedure called to validate FPGA_TECHNOLOGY
	return true
}

proc update_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to update ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to validate ID
	return true
}

proc update_PARAM_VALUE.INDEPENDENT_1R1T_SUPPORT { PARAM_VALUE.INDEPENDENT_1R1T_SUPPORT } {
	# Procedure called to update INDEPENDENT_1R1T_SUPPORT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.INDEPENDENT_1R1T_SUPPORT { PARAM_VALUE.INDEPENDENT_1R1T_SUPPORT } {
	# Procedure called to validate INDEPENDENT_1R1T_SUPPORT
	return true
}

proc update_PARAM_VALUE.IODELAY_CTRL { PARAM_VALUE.IODELAY_CTRL } {
	# Procedure called to update IODELAY_CTRL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IODELAY_CTRL { PARAM_VALUE.IODELAY_CTRL } {
	# Procedure called to validate IODELAY_CTRL
	return true
}

proc update_PARAM_VALUE.IODELAY_ENABLE { PARAM_VALUE.IODELAY_ENABLE } {
	# Procedure called to update IODELAY_ENABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IODELAY_ENABLE { PARAM_VALUE.IODELAY_ENABLE } {
	# Procedure called to validate IODELAY_ENABLE
	return true
}

proc update_PARAM_VALUE.IO_DELAY_GROUP { PARAM_VALUE.IO_DELAY_GROUP } {
	# Procedure called to update IO_DELAY_GROUP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IO_DELAY_GROUP { PARAM_VALUE.IO_DELAY_GROUP } {
	# Procedure called to validate IO_DELAY_GROUP
	return true
}

proc update_PARAM_VALUE.RX_USE_BUFG { PARAM_VALUE.RX_USE_BUFG } {
	# Procedure called to update RX_USE_BUFG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RX_USE_BUFG { PARAM_VALUE.RX_USE_BUFG } {
	# Procedure called to validate RX_USE_BUFG
	return true
}

proc update_PARAM_VALUE.SPEED_GRADE { PARAM_VALUE.SPEED_GRADE } {
	# Procedure called to update SPEED_GRADE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SPEED_GRADE { PARAM_VALUE.SPEED_GRADE } {
	# Procedure called to validate SPEED_GRADE
	return true
}

proc update_PARAM_VALUE.TDD_DISABLE { PARAM_VALUE.TDD_DISABLE } {
	# Procedure called to update TDD_DISABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TDD_DISABLE { PARAM_VALUE.TDD_DISABLE } {
	# Procedure called to validate TDD_DISABLE
	return true
}

proc update_PARAM_VALUE.TX_USE_BUFG { PARAM_VALUE.TX_USE_BUFG } {
	# Procedure called to update TX_USE_BUFG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.TX_USE_BUFG { PARAM_VALUE.TX_USE_BUFG } {
	# Procedure called to validate TX_USE_BUFG
	return true
}

proc update_PARAM_VALUE.USE_RX_CLK_FOR_TX1 { PARAM_VALUE.USE_RX_CLK_FOR_TX1 } {
	# Procedure called to update USE_RX_CLK_FOR_TX1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_RX_CLK_FOR_TX1 { PARAM_VALUE.USE_RX_CLK_FOR_TX1 } {
	# Procedure called to validate USE_RX_CLK_FOR_TX1
	return true
}

proc update_PARAM_VALUE.USE_RX_CLK_FOR_TX2 { PARAM_VALUE.USE_RX_CLK_FOR_TX2 } {
	# Procedure called to update USE_RX_CLK_FOR_TX2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_RX_CLK_FOR_TX2 { PARAM_VALUE.USE_RX_CLK_FOR_TX2 } {
	# Procedure called to validate USE_RX_CLK_FOR_TX2
	return true
}


proc update_MODELPARAM_VALUE.ID { MODELPARAM_VALUE.ID PARAM_VALUE.ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID}] ${MODELPARAM_VALUE.ID}
}

proc update_MODELPARAM_VALUE.CMOS_LVDS_N { MODELPARAM_VALUE.CMOS_LVDS_N PARAM_VALUE.CMOS_LVDS_N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CMOS_LVDS_N}] ${MODELPARAM_VALUE.CMOS_LVDS_N}
}

proc update_MODELPARAM_VALUE.TDD_DISABLE { MODELPARAM_VALUE.TDD_DISABLE PARAM_VALUE.TDD_DISABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TDD_DISABLE}] ${MODELPARAM_VALUE.TDD_DISABLE}
}

proc update_MODELPARAM_VALUE.DDS_DISABLE { MODELPARAM_VALUE.DDS_DISABLE PARAM_VALUE.DDS_DISABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DDS_DISABLE}] ${MODELPARAM_VALUE.DDS_DISABLE}
}

proc update_MODELPARAM_VALUE.INDEPENDENT_1R1T_SUPPORT { MODELPARAM_VALUE.INDEPENDENT_1R1T_SUPPORT PARAM_VALUE.INDEPENDENT_1R1T_SUPPORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.INDEPENDENT_1R1T_SUPPORT}] ${MODELPARAM_VALUE.INDEPENDENT_1R1T_SUPPORT}
}

proc update_MODELPARAM_VALUE.COMMON_2R2T_SUPPORT { MODELPARAM_VALUE.COMMON_2R2T_SUPPORT PARAM_VALUE.COMMON_2R2T_SUPPORT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COMMON_2R2T_SUPPORT}] ${MODELPARAM_VALUE.COMMON_2R2T_SUPPORT}
}

proc update_MODELPARAM_VALUE.DISABLE_RX1_SSI { MODELPARAM_VALUE.DISABLE_RX1_SSI PARAM_VALUE.DISABLE_RX1_SSI } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DISABLE_RX1_SSI}] ${MODELPARAM_VALUE.DISABLE_RX1_SSI}
}

proc update_MODELPARAM_VALUE.DISABLE_TX1_SSI { MODELPARAM_VALUE.DISABLE_TX1_SSI PARAM_VALUE.DISABLE_TX1_SSI } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DISABLE_TX1_SSI}] ${MODELPARAM_VALUE.DISABLE_TX1_SSI}
}

proc update_MODELPARAM_VALUE.DISABLE_RX2_SSI { MODELPARAM_VALUE.DISABLE_RX2_SSI PARAM_VALUE.DISABLE_RX2_SSI } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DISABLE_RX2_SSI}] ${MODELPARAM_VALUE.DISABLE_RX2_SSI}
}

proc update_MODELPARAM_VALUE.DISABLE_TX2_SSI { MODELPARAM_VALUE.DISABLE_TX2_SSI PARAM_VALUE.DISABLE_TX2_SSI } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DISABLE_TX2_SSI}] ${MODELPARAM_VALUE.DISABLE_TX2_SSI}
}

proc update_MODELPARAM_VALUE.RX_USE_BUFG { MODELPARAM_VALUE.RX_USE_BUFG PARAM_VALUE.RX_USE_BUFG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RX_USE_BUFG}] ${MODELPARAM_VALUE.RX_USE_BUFG}
}

proc update_MODELPARAM_VALUE.TX_USE_BUFG { MODELPARAM_VALUE.TX_USE_BUFG PARAM_VALUE.TX_USE_BUFG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.TX_USE_BUFG}] ${MODELPARAM_VALUE.TX_USE_BUFG}
}

proc update_MODELPARAM_VALUE.IODELAY_CTRL { MODELPARAM_VALUE.IODELAY_CTRL PARAM_VALUE.IODELAY_CTRL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IODELAY_CTRL}] ${MODELPARAM_VALUE.IODELAY_CTRL}
}

proc update_MODELPARAM_VALUE.IODELAY_ENABLE { MODELPARAM_VALUE.IODELAY_ENABLE PARAM_VALUE.IODELAY_ENABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IODELAY_ENABLE}] ${MODELPARAM_VALUE.IODELAY_ENABLE}
}

proc update_MODELPARAM_VALUE.IO_DELAY_GROUP { MODELPARAM_VALUE.IO_DELAY_GROUP PARAM_VALUE.IO_DELAY_GROUP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IO_DELAY_GROUP}] ${MODELPARAM_VALUE.IO_DELAY_GROUP}
}

proc update_MODELPARAM_VALUE.FPGA_TECHNOLOGY { MODELPARAM_VALUE.FPGA_TECHNOLOGY PARAM_VALUE.FPGA_TECHNOLOGY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FPGA_TECHNOLOGY}] ${MODELPARAM_VALUE.FPGA_TECHNOLOGY}
}

proc update_MODELPARAM_VALUE.FPGA_FAMILY { MODELPARAM_VALUE.FPGA_FAMILY PARAM_VALUE.FPGA_FAMILY } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FPGA_FAMILY}] ${MODELPARAM_VALUE.FPGA_FAMILY}
}

proc update_MODELPARAM_VALUE.SPEED_GRADE { MODELPARAM_VALUE.SPEED_GRADE PARAM_VALUE.SPEED_GRADE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SPEED_GRADE}] ${MODELPARAM_VALUE.SPEED_GRADE}
}

proc update_MODELPARAM_VALUE.DEV_PACKAGE { MODELPARAM_VALUE.DEV_PACKAGE PARAM_VALUE.DEV_PACKAGE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DEV_PACKAGE}] ${MODELPARAM_VALUE.DEV_PACKAGE}
}

proc update_MODELPARAM_VALUE.EXT_SYNC { MODELPARAM_VALUE.EXT_SYNC PARAM_VALUE.EXT_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EXT_SYNC}] ${MODELPARAM_VALUE.EXT_SYNC}
}

proc update_MODELPARAM_VALUE.ENABLE_REF_CLK_MON { MODELPARAM_VALUE.ENABLE_REF_CLK_MON PARAM_VALUE.ENABLE_REF_CLK_MON } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_REF_CLK_MON}] ${MODELPARAM_VALUE.ENABLE_REF_CLK_MON}
}

proc update_MODELPARAM_VALUE.EN_RX_MCS_TO_STRB_M { MODELPARAM_VALUE.EN_RX_MCS_TO_STRB_M PARAM_VALUE.EN_RX_MCS_TO_STRB_M } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.EN_RX_MCS_TO_STRB_M}] ${MODELPARAM_VALUE.EN_RX_MCS_TO_STRB_M}
}

proc update_MODELPARAM_VALUE.USE_RX_CLK_FOR_TX1 { MODELPARAM_VALUE.USE_RX_CLK_FOR_TX1 PARAM_VALUE.USE_RX_CLK_FOR_TX1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_RX_CLK_FOR_TX1}] ${MODELPARAM_VALUE.USE_RX_CLK_FOR_TX1}
}

proc update_MODELPARAM_VALUE.USE_RX_CLK_FOR_TX2 { MODELPARAM_VALUE.USE_RX_CLK_FOR_TX2 PARAM_VALUE.USE_RX_CLK_FOR_TX2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_RX_CLK_FOR_TX2}] ${MODELPARAM_VALUE.USE_RX_CLK_FOR_TX2}
}

