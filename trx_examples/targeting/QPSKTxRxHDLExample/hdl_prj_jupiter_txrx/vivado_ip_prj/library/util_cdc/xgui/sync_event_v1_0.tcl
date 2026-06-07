# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ASYNC_CLK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_OF_EVENTS" -parent ${Page_0}


}

proc update_PARAM_VALUE.ASYNC_CLK { PARAM_VALUE.ASYNC_CLK } {
	# Procedure called to update ASYNC_CLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK { PARAM_VALUE.ASYNC_CLK } {
	# Procedure called to validate ASYNC_CLK
	return true
}

proc update_PARAM_VALUE.NUM_OF_EVENTS { PARAM_VALUE.NUM_OF_EVENTS } {
	# Procedure called to update NUM_OF_EVENTS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_OF_EVENTS { PARAM_VALUE.NUM_OF_EVENTS } {
	# Procedure called to validate NUM_OF_EVENTS
	return true
}


proc update_MODELPARAM_VALUE.NUM_OF_EVENTS { MODELPARAM_VALUE.NUM_OF_EVENTS PARAM_VALUE.NUM_OF_EVENTS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_OF_EVENTS}] ${MODELPARAM_VALUE.NUM_OF_EVENTS}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK { MODELPARAM_VALUE.ASYNC_CLK PARAM_VALUE.ASYNC_CLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK}] ${MODELPARAM_VALUE.ASYNC_CLK}
}

