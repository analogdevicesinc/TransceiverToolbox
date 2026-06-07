
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/axi_dmac_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {General settings}]
  #Adding Group
  set DMA_Endpoint_Configuration [ipgui::add_group $IPINST -name "DMA Endpoint Configuration" -parent ${Page_0} -layout horizontal]
  #Adding Group
  set Source [ipgui::add_group $IPINST -name "Source" -parent ${DMA_Endpoint_Configuration}]
  ipgui::add_param $IPINST -name "DMA_TYPE_SRC" -parent ${Source} -widget comboBox
  ipgui::add_param $IPINST -name "DMA_AXI_PROTOCOL_SRC" -parent ${Source} -widget comboBox
  set DMA_DATA_WIDTH_SRC [ipgui::add_param $IPINST -name "DMA_DATA_WIDTH_SRC" -parent ${Source}]
  set_property tooltip {Bus Width: For Memory-Mapped interface the valid range is 32-1024 bits} ${DMA_DATA_WIDTH_SRC}
  ipgui::add_param $IPINST -name "AXI_SLICE_SRC" -parent ${Source}
  set AXIS_TUSER_SYNC [ipgui::add_param $IPINST -name "AXIS_TUSER_SYNC" -parent ${Source}]
  set_property tooltip {Transfer Start Synchronization on TUSER} ${AXIS_TUSER_SYNC}

  #Adding Group
  set Destination [ipgui::add_group $IPINST -name "Destination" -parent ${DMA_Endpoint_Configuration}]
  ipgui::add_param $IPINST -name "DMA_TYPE_DEST" -parent ${Destination} -widget comboBox
  ipgui::add_param $IPINST -name "DMA_AXI_PROTOCOL_DEST" -parent ${Destination} -widget comboBox
  set DMA_DATA_WIDTH_DEST [ipgui::add_param $IPINST -name "DMA_DATA_WIDTH_DEST" -parent ${Destination}]
  set_property tooltip {Bus Width: For Memory-Mapped interface the valid range is 32-1024 bits} ${DMA_DATA_WIDTH_DEST}
  ipgui::add_param $IPINST -name "AXI_SLICE_DEST" -parent ${Destination}

  #Adding Group
  set Scatter-Gather [ipgui::add_group $IPINST -name "Scatter-Gather" -parent ${DMA_Endpoint_Configuration}]
  ipgui::add_param $IPINST -name "DMA_AXI_PROTOCOL_SG" -parent ${Scatter-Gather}
  ipgui::add_param $IPINST -name "DMA_DATA_WIDTH_SG" -parent ${Scatter-Gather}


  #Adding Group
  set General_Configuration [ipgui::add_group $IPINST -name "General Configuration" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "ID" -parent ${General_Configuration}
  ipgui::add_param $IPINST -name "DMA_LENGTH_WIDTH" -parent ${General_Configuration}
  ipgui::add_param $IPINST -name "FIFO_SIZE" -parent ${General_Configuration} -widget comboBox
  ipgui::add_param $IPINST -name "MAX_BYTES_PER_BURST" -parent ${General_Configuration}
  ipgui::add_param $IPINST -name "AXI_AXCACHE" -parent ${General_Configuration}
  ipgui::add_param $IPINST -name "AXI_AXPROT" -parent ${General_Configuration}

  #Adding Group
  set Features [ipgui::add_group $IPINST -name "Features" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "CYCLIC" -parent ${Features}
  ipgui::add_param $IPINST -name "DMA_SG_TRANSFER" -parent ${Features}
  ipgui::add_param $IPINST -name "DMA_2D_TRANSFER" -parent ${Features}
  ipgui::add_param $IPINST -name "USE_EXT_SYNC" -parent ${Features}
  ipgui::add_param $IPINST -name "SYNC_TRANSFER_START" -parent ${Features}
  set CACHE_COHERENT [ipgui::add_param $IPINST -name "CACHE_COHERENT" -parent ${Features}]
  set_property tooltip {Assume DMA ports ensure cache coherence (e.g. Ultrascale HPC port)} ${CACHE_COHERENT}
  #Adding Group
  set 2D_Settings [ipgui::add_group $IPINST -name "2D Settings" -parent ${Features}]
  set DMA_2D_TLAST_MODE [ipgui::add_param $IPINST -name "DMA_2D_TLAST_MODE" -parent ${2D_Settings} -widget comboBox]
  set_property tooltip {AXI Stream TLAST port function} ${DMA_2D_TLAST_MODE}
  set FRAMELOCK [ipgui::add_param $IPINST -name "FRAMELOCK" -parent ${2D_Settings}]
  set_property tooltip {Requires Cyclic mode} ${FRAMELOCK}
  ipgui::add_param $IPINST -name "MAX_NUM_FRAMES_WIDTH" -parent ${2D_Settings} -widget comboBox


  #Adding Group
  set Clock_Domain_Configuration [ipgui::add_group $IPINST -name "Clock Domain Configuration" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "ASYNC_CLK_REQ_SRC" -parent ${Clock_Domain_Configuration}
  ipgui::add_param $IPINST -name "ASYNC_CLK_SRC_DEST" -parent ${Clock_Domain_Configuration}
  ipgui::add_param $IPINST -name "ASYNC_CLK_DEST_REQ" -parent ${Clock_Domain_Configuration}
  ipgui::add_param $IPINST -name "ASYNC_CLK_REQ_SG" -parent ${Clock_Domain_Configuration}
  ipgui::add_param $IPINST -name "ASYNC_CLK_SRC_SG" -parent ${Clock_Domain_Configuration}
  ipgui::add_param $IPINST -name "ASYNC_CLK_DEST_SG" -parent ${Clock_Domain_Configuration}

  #Adding Group
  set Debug [ipgui::add_group $IPINST -name "Debug" -parent ${Page_0}]
  ipgui::add_param $IPINST -name "DISABLE_DEBUG_REGISTERS" -parent ${Debug}
  ipgui::add_param $IPINST -name "ENABLE_DIAGNOSTICS_IF" -parent ${Debug}


  #Adding Page
  set Autorun_settings [ipgui::add_page $IPINST -name "Autorun settings"]
  set AUTORUN [ipgui::add_param $IPINST -name "AUTORUN" -parent ${Autorun_settings}]
  set_property tooltip {Set default register values through parameters. Allows to start a transfer after reset deassertion, without software intervention} ${AUTORUN}
  #Adding Group
  set Register_Defaults [ipgui::add_group $IPINST -name "Register Defaults" -parent ${Autorun_settings}]
  set AUTORUN_FLAGS [ipgui::add_param $IPINST -name "AUTORUN_FLAGS" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_FLAGS] Flags} ${AUTORUN_FLAGS}
  set AUTORUN_SRC_ADDR [ipgui::add_param $IPINST -name "AUTORUN_SRC_ADDR" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_SRC_ADDR] Source address} ${AUTORUN_SRC_ADDR}
  set AUTORUN_DEST_ADDR [ipgui::add_param $IPINST -name "AUTORUN_DEST_ADDR" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_DEST_ADDR] Destination address} ${AUTORUN_DEST_ADDR}
  set AUTORUN_X_LENGTH [ipgui::add_param $IPINST -name "AUTORUN_X_LENGTH" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_X_LENGTH] X length} ${AUTORUN_X_LENGTH}
  set AUTORUN_Y_LENGTH [ipgui::add_param $IPINST -name "AUTORUN_Y_LENGTH" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_Y_LENGTH] Y length} ${AUTORUN_Y_LENGTH}
  set AUTORUN_SRC_STRIDE [ipgui::add_param $IPINST -name "AUTORUN_SRC_STRIDE" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_SRC_STRIDE] Source stride} ${AUTORUN_SRC_STRIDE}
  set AUTORUN_DEST_STRIDE [ipgui::add_param $IPINST -name "AUTORUN_DEST_STRIDE" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_DEST_STRIDE] Destination stride} ${AUTORUN_DEST_STRIDE}
  set AUTORUN_SG_ADDRESS [ipgui::add_param $IPINST -name "AUTORUN_SG_ADDRESS" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_SG_ADDRESS] Scatter-Gather start address} ${AUTORUN_SG_ADDRESS}
  set AUTORUN_FRAMELOCK_CONFIG [ipgui::add_param $IPINST -name "AUTORUN_FRAMELOCK_CONFIG" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_FRAMELOCK_CONFIG] Framelock config} ${AUTORUN_FRAMELOCK_CONFIG}
  set AUTORUN_FRAMELOCK_STRIDE [ipgui::add_param $IPINST -name "AUTORUN_FRAMELOCK_STRIDE" -parent ${Register_Defaults}]
  set_property tooltip {[AUTORUN_FRAMELOCK_STRIDE] Framelock stride} ${AUTORUN_FRAMELOCK_STRIDE}



}

proc update_PARAM_VALUE.AUTORUN_DEST_ADDR { PARAM_VALUE.AUTORUN_DEST_ADDR PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_DEST_ADDR when any of the dependent parameters in the arguments change
	
	set AUTORUN_DEST_ADDR ${PARAM_VALUE.AUTORUN_DEST_ADDR}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_DEST_ADDR_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_DEST_ADDR
	} else {
		set_property enabled false $AUTORUN_DEST_ADDR
	}
}

proc validate_PARAM_VALUE.AUTORUN_DEST_ADDR { PARAM_VALUE.AUTORUN_DEST_ADDR } {
	# Procedure called to validate AUTORUN_DEST_ADDR
	return true
}

proc update_PARAM_VALUE.AUTORUN_DEST_STRIDE { PARAM_VALUE.AUTORUN_DEST_STRIDE PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_DEST_STRIDE when any of the dependent parameters in the arguments change
	
	set AUTORUN_DEST_STRIDE ${PARAM_VALUE.AUTORUN_DEST_STRIDE}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_DEST_STRIDE_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_DEST_STRIDE
	} else {
		set_property enabled false $AUTORUN_DEST_STRIDE
	}
}

proc validate_PARAM_VALUE.AUTORUN_DEST_STRIDE { PARAM_VALUE.AUTORUN_DEST_STRIDE } {
	# Procedure called to validate AUTORUN_DEST_STRIDE
	return true
}

proc update_PARAM_VALUE.AUTORUN_FLAGS { PARAM_VALUE.AUTORUN_FLAGS PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_FLAGS when any of the dependent parameters in the arguments change
	
	set AUTORUN_FLAGS ${PARAM_VALUE.AUTORUN_FLAGS}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_FLAGS_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_FLAGS
	} else {
		set_property enabled false $AUTORUN_FLAGS
	}
}

proc validate_PARAM_VALUE.AUTORUN_FLAGS { PARAM_VALUE.AUTORUN_FLAGS } {
	# Procedure called to validate AUTORUN_FLAGS
	return true
}

proc update_PARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG { PARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_FRAMELOCK_CONFIG when any of the dependent parameters in the arguments change
	
	set AUTORUN_FRAMELOCK_CONFIG ${PARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_FRAMELOCK_CONFIG_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_FRAMELOCK_CONFIG
	} else {
		set_property enabled false $AUTORUN_FRAMELOCK_CONFIG
	}
}

proc validate_PARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG { PARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG } {
	# Procedure called to validate AUTORUN_FRAMELOCK_CONFIG
	return true
}

proc update_PARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE { PARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_FRAMELOCK_STRIDE when any of the dependent parameters in the arguments change
	
	set AUTORUN_FRAMELOCK_STRIDE ${PARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_FRAMELOCK_STRIDE_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_FRAMELOCK_STRIDE
	} else {
		set_property enabled false $AUTORUN_FRAMELOCK_STRIDE
	}
}

proc validate_PARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE { PARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE } {
	# Procedure called to validate AUTORUN_FRAMELOCK_STRIDE
	return true
}

proc update_PARAM_VALUE.AUTORUN_SG_ADDRESS { PARAM_VALUE.AUTORUN_SG_ADDRESS PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_SG_ADDRESS when any of the dependent parameters in the arguments change
	
	set AUTORUN_SG_ADDRESS ${PARAM_VALUE.AUTORUN_SG_ADDRESS}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_SG_ADDRESS_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_SG_ADDRESS
	} else {
		set_property enabled false $AUTORUN_SG_ADDRESS
	}
}

proc validate_PARAM_VALUE.AUTORUN_SG_ADDRESS { PARAM_VALUE.AUTORUN_SG_ADDRESS } {
	# Procedure called to validate AUTORUN_SG_ADDRESS
	return true
}

proc update_PARAM_VALUE.AUTORUN_SRC_ADDR { PARAM_VALUE.AUTORUN_SRC_ADDR PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_SRC_ADDR when any of the dependent parameters in the arguments change
	
	set AUTORUN_SRC_ADDR ${PARAM_VALUE.AUTORUN_SRC_ADDR}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_SRC_ADDR_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_SRC_ADDR
	} else {
		set_property enabled false $AUTORUN_SRC_ADDR
	}
}

proc validate_PARAM_VALUE.AUTORUN_SRC_ADDR { PARAM_VALUE.AUTORUN_SRC_ADDR } {
	# Procedure called to validate AUTORUN_SRC_ADDR
	return true
}

proc update_PARAM_VALUE.AUTORUN_SRC_STRIDE { PARAM_VALUE.AUTORUN_SRC_STRIDE PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_SRC_STRIDE when any of the dependent parameters in the arguments change
	
	set AUTORUN_SRC_STRIDE ${PARAM_VALUE.AUTORUN_SRC_STRIDE}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_SRC_STRIDE_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_SRC_STRIDE
	} else {
		set_property enabled false $AUTORUN_SRC_STRIDE
	}
}

proc validate_PARAM_VALUE.AUTORUN_SRC_STRIDE { PARAM_VALUE.AUTORUN_SRC_STRIDE } {
	# Procedure called to validate AUTORUN_SRC_STRIDE
	return true
}

proc update_PARAM_VALUE.AUTORUN_X_LENGTH { PARAM_VALUE.AUTORUN_X_LENGTH PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_X_LENGTH when any of the dependent parameters in the arguments change
	
	set AUTORUN_X_LENGTH ${PARAM_VALUE.AUTORUN_X_LENGTH}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_X_LENGTH_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_X_LENGTH
	} else {
		set_property enabled false $AUTORUN_X_LENGTH
	}
}

proc validate_PARAM_VALUE.AUTORUN_X_LENGTH { PARAM_VALUE.AUTORUN_X_LENGTH } {
	# Procedure called to validate AUTORUN_X_LENGTH
	return true
}

proc update_PARAM_VALUE.AUTORUN_Y_LENGTH { PARAM_VALUE.AUTORUN_Y_LENGTH PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN_Y_LENGTH when any of the dependent parameters in the arguments change
	
	set AUTORUN_Y_LENGTH ${PARAM_VALUE.AUTORUN_Y_LENGTH}
	set AUTORUN ${PARAM_VALUE.AUTORUN}
	set values(AUTORUN) [get_property value $AUTORUN]
	if { [gen_USERPARAMETER_AUTORUN_Y_LENGTH_ENABLEMENT $values(AUTORUN)] } {
		set_property enabled true $AUTORUN_Y_LENGTH
	} else {
		set_property enabled false $AUTORUN_Y_LENGTH
	}
}

proc validate_PARAM_VALUE.AUTORUN_Y_LENGTH { PARAM_VALUE.AUTORUN_Y_LENGTH } {
	# Procedure called to validate AUTORUN_Y_LENGTH
	return true
}

proc update_PARAM_VALUE.AXIS_TUSER_SYNC { PARAM_VALUE.AXIS_TUSER_SYNC PARAM_VALUE.DMA_TYPE_SRC PARAM_VALUE.SYNC_TRANSFER_START } {
	# Procedure called to update AXIS_TUSER_SYNC when any of the dependent parameters in the arguments change
	
	set AXIS_TUSER_SYNC ${PARAM_VALUE.AXIS_TUSER_SYNC}
	set DMA_TYPE_SRC ${PARAM_VALUE.DMA_TYPE_SRC}
	set SYNC_TRANSFER_START ${PARAM_VALUE.SYNC_TRANSFER_START}
	set values(DMA_TYPE_SRC) [get_property value $DMA_TYPE_SRC]
	set values(SYNC_TRANSFER_START) [get_property value $SYNC_TRANSFER_START]
	if { [gen_USERPARAMETER_AXIS_TUSER_SYNC_ENABLEMENT $values(DMA_TYPE_SRC) $values(SYNC_TRANSFER_START)] } {
		set_property enabled true $AXIS_TUSER_SYNC
	} else {
		set_property enabled false $AXIS_TUSER_SYNC
	}
}

proc validate_PARAM_VALUE.AXIS_TUSER_SYNC { PARAM_VALUE.AXIS_TUSER_SYNC } {
	# Procedure called to validate AXIS_TUSER_SYNC
	return true
}

proc update_PARAM_VALUE.AXI_AXCACHE { PARAM_VALUE.AXI_AXCACHE PARAM_VALUE.CACHE_COHERENT } {
	# Procedure called to update AXI_AXCACHE when any of the dependent parameters in the arguments change
	
	set AXI_AXCACHE ${PARAM_VALUE.AXI_AXCACHE}
	set CACHE_COHERENT ${PARAM_VALUE.CACHE_COHERENT}
	set values(CACHE_COHERENT) [get_property value $CACHE_COHERENT]
	if { [gen_USERPARAMETER_AXI_AXCACHE_ENABLEMENT $values(CACHE_COHERENT)] } {
		set_property enabled true $AXI_AXCACHE
	} else {
		set_property enabled false $AXI_AXCACHE
	}
}

proc validate_PARAM_VALUE.AXI_AXCACHE { PARAM_VALUE.AXI_AXCACHE } {
	# Procedure called to validate AXI_AXCACHE
	return true
}

proc update_PARAM_VALUE.AXI_AXPROT { PARAM_VALUE.AXI_AXPROT PARAM_VALUE.CACHE_COHERENT } {
	# Procedure called to update AXI_AXPROT when any of the dependent parameters in the arguments change
	
	set AXI_AXPROT ${PARAM_VALUE.AXI_AXPROT}
	set CACHE_COHERENT ${PARAM_VALUE.CACHE_COHERENT}
	set values(CACHE_COHERENT) [get_property value $CACHE_COHERENT]
	if { [gen_USERPARAMETER_AXI_AXPROT_ENABLEMENT $values(CACHE_COHERENT)] } {
		set_property enabled true $AXI_AXPROT
	} else {
		set_property enabled false $AXI_AXPROT
	}
}

proc validate_PARAM_VALUE.AXI_AXPROT { PARAM_VALUE.AXI_AXPROT } {
	# Procedure called to validate AXI_AXPROT
	return true
}

proc update_PARAM_VALUE.CACHE_COHERENT { PARAM_VALUE.CACHE_COHERENT PARAM_VALUE.DMA_TYPE_SRC PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to update CACHE_COHERENT when any of the dependent parameters in the arguments change
	
	set CACHE_COHERENT ${PARAM_VALUE.CACHE_COHERENT}
	set DMA_TYPE_SRC ${PARAM_VALUE.DMA_TYPE_SRC}
	set DMA_TYPE_DEST ${PARAM_VALUE.DMA_TYPE_DEST}
	set values(DMA_TYPE_SRC) [get_property value $DMA_TYPE_SRC]
	set values(DMA_TYPE_DEST) [get_property value $DMA_TYPE_DEST]
	if { [gen_USERPARAMETER_CACHE_COHERENT_ENABLEMENT $values(DMA_TYPE_SRC) $values(DMA_TYPE_DEST)] } {
		set_property enabled true $CACHE_COHERENT
	} else {
		set_property enabled false $CACHE_COHERENT
	}
}

proc validate_PARAM_VALUE.CACHE_COHERENT { PARAM_VALUE.CACHE_COHERENT } {
	# Procedure called to validate CACHE_COHERENT
	return true
}

proc update_PARAM_VALUE.DMA_2D_TLAST_MODE { PARAM_VALUE.DMA_2D_TLAST_MODE PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to update DMA_2D_TLAST_MODE when any of the dependent parameters in the arguments change
	
	set DMA_2D_TLAST_MODE ${PARAM_VALUE.DMA_2D_TLAST_MODE}
	set DMA_2D_TRANSFER ${PARAM_VALUE.DMA_2D_TRANSFER}
	set values(DMA_2D_TRANSFER) [get_property value $DMA_2D_TRANSFER]
	if { [gen_USERPARAMETER_DMA_2D_TLAST_MODE_ENABLEMENT $values(DMA_2D_TRANSFER)] } {
		set_property enabled true $DMA_2D_TLAST_MODE
	} else {
		set_property enabled false $DMA_2D_TLAST_MODE
	}
}

proc validate_PARAM_VALUE.DMA_2D_TLAST_MODE { PARAM_VALUE.DMA_2D_TLAST_MODE } {
	# Procedure called to validate DMA_2D_TLAST_MODE
	return true
}

proc update_PARAM_VALUE.DMA_AXI_PROTOCOL_DEST { PARAM_VALUE.DMA_AXI_PROTOCOL_DEST PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to update DMA_AXI_PROTOCOL_DEST when any of the dependent parameters in the arguments change
	
	set DMA_AXI_PROTOCOL_DEST ${PARAM_VALUE.DMA_AXI_PROTOCOL_DEST}
	set DMA_TYPE_DEST ${PARAM_VALUE.DMA_TYPE_DEST}
	set values(DMA_TYPE_DEST) [get_property value $DMA_TYPE_DEST]
	if { [gen_USERPARAMETER_DMA_AXI_PROTOCOL_DEST_ENABLEMENT $values(DMA_TYPE_DEST)] } {
		set_property enabled true $DMA_AXI_PROTOCOL_DEST
	} else {
		set_property enabled false $DMA_AXI_PROTOCOL_DEST
	}
}

proc validate_PARAM_VALUE.DMA_AXI_PROTOCOL_DEST { PARAM_VALUE.DMA_AXI_PROTOCOL_DEST } {
	# Procedure called to validate DMA_AXI_PROTOCOL_DEST
	return true
}

proc update_PARAM_VALUE.DMA_AXI_PROTOCOL_SG { PARAM_VALUE.DMA_AXI_PROTOCOL_SG PARAM_VALUE.DMA_SG_TRANSFER } {
	# Procedure called to update DMA_AXI_PROTOCOL_SG when any of the dependent parameters in the arguments change
	
	set DMA_AXI_PROTOCOL_SG ${PARAM_VALUE.DMA_AXI_PROTOCOL_SG}
	set DMA_SG_TRANSFER ${PARAM_VALUE.DMA_SG_TRANSFER}
	set values(DMA_SG_TRANSFER) [get_property value $DMA_SG_TRANSFER]
	if { [gen_USERPARAMETER_DMA_AXI_PROTOCOL_SG_ENABLEMENT $values(DMA_SG_TRANSFER)] } {
		set_property enabled true $DMA_AXI_PROTOCOL_SG
	} else {
		set_property enabled false $DMA_AXI_PROTOCOL_SG
	}
}

proc validate_PARAM_VALUE.DMA_AXI_PROTOCOL_SG { PARAM_VALUE.DMA_AXI_PROTOCOL_SG } {
	# Procedure called to validate DMA_AXI_PROTOCOL_SG
	return true
}

proc update_PARAM_VALUE.DMA_AXI_PROTOCOL_SRC { PARAM_VALUE.DMA_AXI_PROTOCOL_SRC PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to update DMA_AXI_PROTOCOL_SRC when any of the dependent parameters in the arguments change
	
	set DMA_AXI_PROTOCOL_SRC ${PARAM_VALUE.DMA_AXI_PROTOCOL_SRC}
	set DMA_TYPE_SRC ${PARAM_VALUE.DMA_TYPE_SRC}
	set values(DMA_TYPE_SRC) [get_property value $DMA_TYPE_SRC]
	if { [gen_USERPARAMETER_DMA_AXI_PROTOCOL_SRC_ENABLEMENT $values(DMA_TYPE_SRC)] } {
		set_property enabled true $DMA_AXI_PROTOCOL_SRC
	} else {
		set_property enabled false $DMA_AXI_PROTOCOL_SRC
	}
}

proc validate_PARAM_VALUE.DMA_AXI_PROTOCOL_SRC { PARAM_VALUE.DMA_AXI_PROTOCOL_SRC } {
	# Procedure called to validate DMA_AXI_PROTOCOL_SRC
	return true
}

proc update_PARAM_VALUE.DMA_DATA_WIDTH_SG { PARAM_VALUE.DMA_DATA_WIDTH_SG PARAM_VALUE.DMA_SG_TRANSFER } {
	# Procedure called to update DMA_DATA_WIDTH_SG when any of the dependent parameters in the arguments change
	
	set DMA_DATA_WIDTH_SG ${PARAM_VALUE.DMA_DATA_WIDTH_SG}
	set DMA_SG_TRANSFER ${PARAM_VALUE.DMA_SG_TRANSFER}
	set values(DMA_SG_TRANSFER) [get_property value $DMA_SG_TRANSFER]
	if { [gen_USERPARAMETER_DMA_DATA_WIDTH_SG_ENABLEMENT $values(DMA_SG_TRANSFER)] } {
		set_property enabled true $DMA_DATA_WIDTH_SG
	} else {
		set_property enabled false $DMA_DATA_WIDTH_SG
	}
}

proc validate_PARAM_VALUE.DMA_DATA_WIDTH_SG { PARAM_VALUE.DMA_DATA_WIDTH_SG } {
	# Procedure called to validate DMA_DATA_WIDTH_SG
	return true
}

proc update_PARAM_VALUE.FRAMELOCK { PARAM_VALUE.FRAMELOCK PARAM_VALUE.DMA_2D_TRANSFER PARAM_VALUE.CYCLIC } {
	# Procedure called to update FRAMELOCK when any of the dependent parameters in the arguments change
	
	set FRAMELOCK ${PARAM_VALUE.FRAMELOCK}
	set DMA_2D_TRANSFER ${PARAM_VALUE.DMA_2D_TRANSFER}
	set CYCLIC ${PARAM_VALUE.CYCLIC}
	set values(DMA_2D_TRANSFER) [get_property value $DMA_2D_TRANSFER]
	set values(CYCLIC) [get_property value $CYCLIC]
	if { [gen_USERPARAMETER_FRAMELOCK_ENABLEMENT $values(DMA_2D_TRANSFER) $values(CYCLIC)] } {
		set_property enabled true $FRAMELOCK
	} else {
		set_property enabled false $FRAMELOCK
	}
}

proc validate_PARAM_VALUE.FRAMELOCK { PARAM_VALUE.FRAMELOCK } {
	# Procedure called to validate FRAMELOCK
	return true
}

proc update_PARAM_VALUE.ALLOW_ASYM_MEM { PARAM_VALUE.ALLOW_ASYM_MEM } {
	# Procedure called to update ALLOW_ASYM_MEM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ALLOW_ASYM_MEM { PARAM_VALUE.ALLOW_ASYM_MEM } {
	# Procedure called to validate ALLOW_ASYM_MEM
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_DEST_REQ { PARAM_VALUE.ASYNC_CLK_DEST_REQ } {
	# Procedure called to update ASYNC_CLK_DEST_REQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_DEST_REQ { PARAM_VALUE.ASYNC_CLK_DEST_REQ } {
	# Procedure called to validate ASYNC_CLK_DEST_REQ
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_DEST_SG { PARAM_VALUE.ASYNC_CLK_DEST_SG } {
	# Procedure called to update ASYNC_CLK_DEST_SG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_DEST_SG { PARAM_VALUE.ASYNC_CLK_DEST_SG } {
	# Procedure called to validate ASYNC_CLK_DEST_SG
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_REQ_SG { PARAM_VALUE.ASYNC_CLK_REQ_SG } {
	# Procedure called to update ASYNC_CLK_REQ_SG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_REQ_SG { PARAM_VALUE.ASYNC_CLK_REQ_SG } {
	# Procedure called to validate ASYNC_CLK_REQ_SG
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_REQ_SRC { PARAM_VALUE.ASYNC_CLK_REQ_SRC } {
	# Procedure called to update ASYNC_CLK_REQ_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_REQ_SRC { PARAM_VALUE.ASYNC_CLK_REQ_SRC } {
	# Procedure called to validate ASYNC_CLK_REQ_SRC
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_SRC_DEST { PARAM_VALUE.ASYNC_CLK_SRC_DEST } {
	# Procedure called to update ASYNC_CLK_SRC_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_SRC_DEST { PARAM_VALUE.ASYNC_CLK_SRC_DEST } {
	# Procedure called to validate ASYNC_CLK_SRC_DEST
	return true
}

proc update_PARAM_VALUE.ASYNC_CLK_SRC_SG { PARAM_VALUE.ASYNC_CLK_SRC_SG } {
	# Procedure called to update ASYNC_CLK_SRC_SG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ASYNC_CLK_SRC_SG { PARAM_VALUE.ASYNC_CLK_SRC_SG } {
	# Procedure called to validate ASYNC_CLK_SRC_SG
	return true
}

proc update_PARAM_VALUE.AUTORUN { PARAM_VALUE.AUTORUN } {
	# Procedure called to update AUTORUN when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AUTORUN { PARAM_VALUE.AUTORUN } {
	# Procedure called to validate AUTORUN
	return true
}

proc update_PARAM_VALUE.AXI_ID_WIDTH_DEST { PARAM_VALUE.AXI_ID_WIDTH_DEST } {
	# Procedure called to update AXI_ID_WIDTH_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_WIDTH_DEST { PARAM_VALUE.AXI_ID_WIDTH_DEST } {
	# Procedure called to validate AXI_ID_WIDTH_DEST
	return true
}

proc update_PARAM_VALUE.AXI_ID_WIDTH_SG { PARAM_VALUE.AXI_ID_WIDTH_SG } {
	# Procedure called to update AXI_ID_WIDTH_SG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_WIDTH_SG { PARAM_VALUE.AXI_ID_WIDTH_SG } {
	# Procedure called to validate AXI_ID_WIDTH_SG
	return true
}

proc update_PARAM_VALUE.AXI_ID_WIDTH_SRC { PARAM_VALUE.AXI_ID_WIDTH_SRC } {
	# Procedure called to update AXI_ID_WIDTH_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ID_WIDTH_SRC { PARAM_VALUE.AXI_ID_WIDTH_SRC } {
	# Procedure called to validate AXI_ID_WIDTH_SRC
	return true
}

proc update_PARAM_VALUE.AXI_SLICE_DEST { PARAM_VALUE.AXI_SLICE_DEST } {
	# Procedure called to update AXI_SLICE_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_SLICE_DEST { PARAM_VALUE.AXI_SLICE_DEST } {
	# Procedure called to validate AXI_SLICE_DEST
	return true
}

proc update_PARAM_VALUE.AXI_SLICE_SRC { PARAM_VALUE.AXI_SLICE_SRC } {
	# Procedure called to update AXI_SLICE_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_SLICE_SRC { PARAM_VALUE.AXI_SLICE_SRC } {
	# Procedure called to validate AXI_SLICE_SRC
	return true
}

proc update_PARAM_VALUE.CYCLIC { PARAM_VALUE.CYCLIC } {
	# Procedure called to update CYCLIC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CYCLIC { PARAM_VALUE.CYCLIC } {
	# Procedure called to validate CYCLIC
	return true
}

proc update_PARAM_VALUE.DISABLE_DEBUG_REGISTERS { PARAM_VALUE.DISABLE_DEBUG_REGISTERS } {
	# Procedure called to update DISABLE_DEBUG_REGISTERS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DISABLE_DEBUG_REGISTERS { PARAM_VALUE.DISABLE_DEBUG_REGISTERS } {
	# Procedure called to validate DISABLE_DEBUG_REGISTERS
	return true
}

proc update_PARAM_VALUE.DMA_2D_TRANSFER { PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to update DMA_2D_TRANSFER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_2D_TRANSFER { PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to validate DMA_2D_TRANSFER
	return true
}

proc update_PARAM_VALUE.DMA_AXIS_DEST_W { PARAM_VALUE.DMA_AXIS_DEST_W } {
	# Procedure called to update DMA_AXIS_DEST_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_AXIS_DEST_W { PARAM_VALUE.DMA_AXIS_DEST_W } {
	# Procedure called to validate DMA_AXIS_DEST_W
	return true
}

proc update_PARAM_VALUE.DMA_AXIS_ID_W { PARAM_VALUE.DMA_AXIS_ID_W } {
	# Procedure called to update DMA_AXIS_ID_W when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_AXIS_ID_W { PARAM_VALUE.DMA_AXIS_ID_W } {
	# Procedure called to validate DMA_AXIS_ID_W
	return true
}

proc update_PARAM_VALUE.DMA_AXI_ADDR_WIDTH { PARAM_VALUE.DMA_AXI_ADDR_WIDTH } {
	# Procedure called to update DMA_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_AXI_ADDR_WIDTH { PARAM_VALUE.DMA_AXI_ADDR_WIDTH } {
	# Procedure called to validate DMA_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.DMA_DATA_WIDTH_DEST { PARAM_VALUE.DMA_DATA_WIDTH_DEST } {
	# Procedure called to update DMA_DATA_WIDTH_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_DATA_WIDTH_DEST { PARAM_VALUE.DMA_DATA_WIDTH_DEST } {
	# Procedure called to validate DMA_DATA_WIDTH_DEST
	return true
}

proc update_PARAM_VALUE.DMA_DATA_WIDTH_SRC { PARAM_VALUE.DMA_DATA_WIDTH_SRC } {
	# Procedure called to update DMA_DATA_WIDTH_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_DATA_WIDTH_SRC { PARAM_VALUE.DMA_DATA_WIDTH_SRC } {
	# Procedure called to validate DMA_DATA_WIDTH_SRC
	return true
}

proc update_PARAM_VALUE.DMA_LENGTH_WIDTH { PARAM_VALUE.DMA_LENGTH_WIDTH } {
	# Procedure called to update DMA_LENGTH_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_LENGTH_WIDTH { PARAM_VALUE.DMA_LENGTH_WIDTH } {
	# Procedure called to validate DMA_LENGTH_WIDTH
	return true
}

proc update_PARAM_VALUE.DMA_SG_TRANSFER { PARAM_VALUE.DMA_SG_TRANSFER } {
	# Procedure called to update DMA_SG_TRANSFER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_SG_TRANSFER { PARAM_VALUE.DMA_SG_TRANSFER } {
	# Procedure called to validate DMA_SG_TRANSFER
	return true
}

proc update_PARAM_VALUE.DMA_TYPE_DEST { PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to update DMA_TYPE_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_TYPE_DEST { PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to validate DMA_TYPE_DEST
	return true
}

proc update_PARAM_VALUE.DMA_TYPE_SRC { PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to update DMA_TYPE_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_TYPE_SRC { PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to validate DMA_TYPE_SRC
	return true
}

proc update_PARAM_VALUE.ENABLE_DIAGNOSTICS_IF { PARAM_VALUE.ENABLE_DIAGNOSTICS_IF } {
	# Procedure called to update ENABLE_DIAGNOSTICS_IF when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ENABLE_DIAGNOSTICS_IF { PARAM_VALUE.ENABLE_DIAGNOSTICS_IF } {
	# Procedure called to validate ENABLE_DIAGNOSTICS_IF
	return true
}

proc update_PARAM_VALUE.FIFO_SIZE { PARAM_VALUE.FIFO_SIZE } {
	# Procedure called to update FIFO_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FIFO_SIZE { PARAM_VALUE.FIFO_SIZE } {
	# Procedure called to validate FIFO_SIZE
	return true
}

proc update_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to update ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID { PARAM_VALUE.ID } {
	# Procedure called to validate ID
	return true
}

proc update_PARAM_VALUE.MAX_BYTES_PER_BURST { PARAM_VALUE.MAX_BYTES_PER_BURST } {
	# Procedure called to update MAX_BYTES_PER_BURST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_BYTES_PER_BURST { PARAM_VALUE.MAX_BYTES_PER_BURST } {
	# Procedure called to validate MAX_BYTES_PER_BURST
	return true
}

proc update_PARAM_VALUE.MAX_NUM_FRAMES_WIDTH { PARAM_VALUE.MAX_NUM_FRAMES_WIDTH } {
	# Procedure called to update MAX_NUM_FRAMES_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_NUM_FRAMES_WIDTH { PARAM_VALUE.MAX_NUM_FRAMES_WIDTH } {
	# Procedure called to validate MAX_NUM_FRAMES_WIDTH
	return true
}

proc update_PARAM_VALUE.SYNC_TRANSFER_START { PARAM_VALUE.SYNC_TRANSFER_START } {
	# Procedure called to update SYNC_TRANSFER_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SYNC_TRANSFER_START { PARAM_VALUE.SYNC_TRANSFER_START } {
	# Procedure called to validate SYNC_TRANSFER_START
	return true
}

proc update_PARAM_VALUE.USE_EXT_SYNC { PARAM_VALUE.USE_EXT_SYNC } {
	# Procedure called to update USE_EXT_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.USE_EXT_SYNC { PARAM_VALUE.USE_EXT_SYNC } {
	# Procedure called to validate USE_EXT_SYNC
	return true
}


proc update_MODELPARAM_VALUE.ID { MODELPARAM_VALUE.ID PARAM_VALUE.ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID}] ${MODELPARAM_VALUE.ID}
}

proc update_MODELPARAM_VALUE.DMA_DATA_WIDTH_SRC { MODELPARAM_VALUE.DMA_DATA_WIDTH_SRC PARAM_VALUE.DMA_DATA_WIDTH_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_DATA_WIDTH_SRC}] ${MODELPARAM_VALUE.DMA_DATA_WIDTH_SRC}
}

proc update_MODELPARAM_VALUE.DMA_DATA_WIDTH_DEST { MODELPARAM_VALUE.DMA_DATA_WIDTH_DEST PARAM_VALUE.DMA_DATA_WIDTH_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_DATA_WIDTH_DEST}] ${MODELPARAM_VALUE.DMA_DATA_WIDTH_DEST}
}

proc update_MODELPARAM_VALUE.DMA_DATA_WIDTH_SG { MODELPARAM_VALUE.DMA_DATA_WIDTH_SG PARAM_VALUE.DMA_DATA_WIDTH_SG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_DATA_WIDTH_SG}] ${MODELPARAM_VALUE.DMA_DATA_WIDTH_SG}
}

proc update_MODELPARAM_VALUE.DMA_LENGTH_WIDTH { MODELPARAM_VALUE.DMA_LENGTH_WIDTH PARAM_VALUE.DMA_LENGTH_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_LENGTH_WIDTH}] ${MODELPARAM_VALUE.DMA_LENGTH_WIDTH}
}

proc update_MODELPARAM_VALUE.DMA_2D_TRANSFER { MODELPARAM_VALUE.DMA_2D_TRANSFER PARAM_VALUE.DMA_2D_TRANSFER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_2D_TRANSFER}] ${MODELPARAM_VALUE.DMA_2D_TRANSFER}
}

proc update_MODELPARAM_VALUE.DMA_SG_TRANSFER { MODELPARAM_VALUE.DMA_SG_TRANSFER PARAM_VALUE.DMA_SG_TRANSFER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_SG_TRANSFER}] ${MODELPARAM_VALUE.DMA_SG_TRANSFER}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_REQ_SRC { MODELPARAM_VALUE.ASYNC_CLK_REQ_SRC PARAM_VALUE.ASYNC_CLK_REQ_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_REQ_SRC}] ${MODELPARAM_VALUE.ASYNC_CLK_REQ_SRC}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_SRC_DEST { MODELPARAM_VALUE.ASYNC_CLK_SRC_DEST PARAM_VALUE.ASYNC_CLK_SRC_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_SRC_DEST}] ${MODELPARAM_VALUE.ASYNC_CLK_SRC_DEST}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_DEST_REQ { MODELPARAM_VALUE.ASYNC_CLK_DEST_REQ PARAM_VALUE.ASYNC_CLK_DEST_REQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_DEST_REQ}] ${MODELPARAM_VALUE.ASYNC_CLK_DEST_REQ}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_REQ_SG { MODELPARAM_VALUE.ASYNC_CLK_REQ_SG PARAM_VALUE.ASYNC_CLK_REQ_SG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_REQ_SG}] ${MODELPARAM_VALUE.ASYNC_CLK_REQ_SG}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_SRC_SG { MODELPARAM_VALUE.ASYNC_CLK_SRC_SG PARAM_VALUE.ASYNC_CLK_SRC_SG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_SRC_SG}] ${MODELPARAM_VALUE.ASYNC_CLK_SRC_SG}
}

proc update_MODELPARAM_VALUE.ASYNC_CLK_DEST_SG { MODELPARAM_VALUE.ASYNC_CLK_DEST_SG PARAM_VALUE.ASYNC_CLK_DEST_SG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ASYNC_CLK_DEST_SG}] ${MODELPARAM_VALUE.ASYNC_CLK_DEST_SG}
}

proc update_MODELPARAM_VALUE.AXI_SLICE_DEST { MODELPARAM_VALUE.AXI_SLICE_DEST PARAM_VALUE.AXI_SLICE_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_SLICE_DEST}] ${MODELPARAM_VALUE.AXI_SLICE_DEST}
}

proc update_MODELPARAM_VALUE.AXI_SLICE_SRC { MODELPARAM_VALUE.AXI_SLICE_SRC PARAM_VALUE.AXI_SLICE_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_SLICE_SRC}] ${MODELPARAM_VALUE.AXI_SLICE_SRC}
}

proc update_MODELPARAM_VALUE.AXIS_TUSER_SYNC { MODELPARAM_VALUE.AXIS_TUSER_SYNC PARAM_VALUE.AXIS_TUSER_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXIS_TUSER_SYNC}] ${MODELPARAM_VALUE.AXIS_TUSER_SYNC}
}

proc update_MODELPARAM_VALUE.SYNC_TRANSFER_START { MODELPARAM_VALUE.SYNC_TRANSFER_START PARAM_VALUE.SYNC_TRANSFER_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SYNC_TRANSFER_START}] ${MODELPARAM_VALUE.SYNC_TRANSFER_START}
}

proc update_MODELPARAM_VALUE.CYCLIC { MODELPARAM_VALUE.CYCLIC PARAM_VALUE.CYCLIC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CYCLIC}] ${MODELPARAM_VALUE.CYCLIC}
}

proc update_MODELPARAM_VALUE.DMA_AXI_PROTOCOL_DEST { MODELPARAM_VALUE.DMA_AXI_PROTOCOL_DEST PARAM_VALUE.DMA_AXI_PROTOCOL_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXI_PROTOCOL_DEST}] ${MODELPARAM_VALUE.DMA_AXI_PROTOCOL_DEST}
}

proc update_MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SRC { MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SRC PARAM_VALUE.DMA_AXI_PROTOCOL_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXI_PROTOCOL_SRC}] ${MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SRC}
}

proc update_MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SG { MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SG PARAM_VALUE.DMA_AXI_PROTOCOL_SG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXI_PROTOCOL_SG}] ${MODELPARAM_VALUE.DMA_AXI_PROTOCOL_SG}
}

proc update_MODELPARAM_VALUE.DMA_TYPE_DEST { MODELPARAM_VALUE.DMA_TYPE_DEST PARAM_VALUE.DMA_TYPE_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_TYPE_DEST}] ${MODELPARAM_VALUE.DMA_TYPE_DEST}
}

proc update_MODELPARAM_VALUE.DMA_TYPE_SRC { MODELPARAM_VALUE.DMA_TYPE_SRC PARAM_VALUE.DMA_TYPE_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_TYPE_SRC}] ${MODELPARAM_VALUE.DMA_TYPE_SRC}
}

proc update_MODELPARAM_VALUE.DMA_AXI_ADDR_WIDTH { MODELPARAM_VALUE.DMA_AXI_ADDR_WIDTH PARAM_VALUE.DMA_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.DMA_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.MAX_BYTES_PER_BURST { MODELPARAM_VALUE.MAX_BYTES_PER_BURST PARAM_VALUE.MAX_BYTES_PER_BURST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_BYTES_PER_BURST}] ${MODELPARAM_VALUE.MAX_BYTES_PER_BURST}
}

proc update_MODELPARAM_VALUE.FIFO_SIZE { MODELPARAM_VALUE.FIFO_SIZE PARAM_VALUE.FIFO_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FIFO_SIZE}] ${MODELPARAM_VALUE.FIFO_SIZE}
}

proc update_MODELPARAM_VALUE.AXI_ID_WIDTH_SRC { MODELPARAM_VALUE.AXI_ID_WIDTH_SRC PARAM_VALUE.AXI_ID_WIDTH_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_WIDTH_SRC}] ${MODELPARAM_VALUE.AXI_ID_WIDTH_SRC}
}

proc update_MODELPARAM_VALUE.AXI_ID_WIDTH_DEST { MODELPARAM_VALUE.AXI_ID_WIDTH_DEST PARAM_VALUE.AXI_ID_WIDTH_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_WIDTH_DEST}] ${MODELPARAM_VALUE.AXI_ID_WIDTH_DEST}
}

proc update_MODELPARAM_VALUE.AXI_ID_WIDTH_SG { MODELPARAM_VALUE.AXI_ID_WIDTH_SG PARAM_VALUE.AXI_ID_WIDTH_SG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ID_WIDTH_SG}] ${MODELPARAM_VALUE.AXI_ID_WIDTH_SG}
}

proc update_MODELPARAM_VALUE.DMA_AXIS_ID_W { MODELPARAM_VALUE.DMA_AXIS_ID_W PARAM_VALUE.DMA_AXIS_ID_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXIS_ID_W}] ${MODELPARAM_VALUE.DMA_AXIS_ID_W}
}

proc update_MODELPARAM_VALUE.DMA_AXIS_DEST_W { MODELPARAM_VALUE.DMA_AXIS_DEST_W PARAM_VALUE.DMA_AXIS_DEST_W } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_AXIS_DEST_W}] ${MODELPARAM_VALUE.DMA_AXIS_DEST_W}
}

proc update_MODELPARAM_VALUE.DISABLE_DEBUG_REGISTERS { MODELPARAM_VALUE.DISABLE_DEBUG_REGISTERS PARAM_VALUE.DISABLE_DEBUG_REGISTERS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DISABLE_DEBUG_REGISTERS}] ${MODELPARAM_VALUE.DISABLE_DEBUG_REGISTERS}
}

proc update_MODELPARAM_VALUE.ENABLE_DIAGNOSTICS_IF { MODELPARAM_VALUE.ENABLE_DIAGNOSTICS_IF PARAM_VALUE.ENABLE_DIAGNOSTICS_IF } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ENABLE_DIAGNOSTICS_IF}] ${MODELPARAM_VALUE.ENABLE_DIAGNOSTICS_IF}
}

proc update_MODELPARAM_VALUE.ALLOW_ASYM_MEM { MODELPARAM_VALUE.ALLOW_ASYM_MEM PARAM_VALUE.ALLOW_ASYM_MEM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ALLOW_ASYM_MEM}] ${MODELPARAM_VALUE.ALLOW_ASYM_MEM}
}

proc update_MODELPARAM_VALUE.CACHE_COHERENT { MODELPARAM_VALUE.CACHE_COHERENT PARAM_VALUE.CACHE_COHERENT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CACHE_COHERENT}] ${MODELPARAM_VALUE.CACHE_COHERENT}
}

proc update_MODELPARAM_VALUE.AXI_AXCACHE { MODELPARAM_VALUE.AXI_AXCACHE PARAM_VALUE.AXI_AXCACHE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_AXCACHE}] ${MODELPARAM_VALUE.AXI_AXCACHE}
}

proc update_MODELPARAM_VALUE.AXI_AXPROT { MODELPARAM_VALUE.AXI_AXPROT PARAM_VALUE.AXI_AXPROT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_AXPROT}] ${MODELPARAM_VALUE.AXI_AXPROT}
}

proc update_MODELPARAM_VALUE.DMA_2D_TLAST_MODE { MODELPARAM_VALUE.DMA_2D_TLAST_MODE PARAM_VALUE.DMA_2D_TLAST_MODE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_2D_TLAST_MODE}] ${MODELPARAM_VALUE.DMA_2D_TLAST_MODE}
}

proc update_MODELPARAM_VALUE.FRAMELOCK { MODELPARAM_VALUE.FRAMELOCK PARAM_VALUE.FRAMELOCK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FRAMELOCK}] ${MODELPARAM_VALUE.FRAMELOCK}
}

proc update_MODELPARAM_VALUE.MAX_NUM_FRAMES_WIDTH { MODELPARAM_VALUE.MAX_NUM_FRAMES_WIDTH PARAM_VALUE.MAX_NUM_FRAMES_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_NUM_FRAMES_WIDTH}] ${MODELPARAM_VALUE.MAX_NUM_FRAMES_WIDTH}
}

proc update_MODELPARAM_VALUE.USE_EXT_SYNC { MODELPARAM_VALUE.USE_EXT_SYNC PARAM_VALUE.USE_EXT_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.USE_EXT_SYNC}] ${MODELPARAM_VALUE.USE_EXT_SYNC}
}

proc update_MODELPARAM_VALUE.AUTORUN { MODELPARAM_VALUE.AUTORUN PARAM_VALUE.AUTORUN } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN}] ${MODELPARAM_VALUE.AUTORUN}
}

proc update_MODELPARAM_VALUE.AUTORUN_FLAGS { MODELPARAM_VALUE.AUTORUN_FLAGS PARAM_VALUE.AUTORUN_FLAGS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_FLAGS}] ${MODELPARAM_VALUE.AUTORUN_FLAGS}
}

proc update_MODELPARAM_VALUE.AUTORUN_SRC_ADDR { MODELPARAM_VALUE.AUTORUN_SRC_ADDR PARAM_VALUE.AUTORUN_SRC_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_SRC_ADDR}] ${MODELPARAM_VALUE.AUTORUN_SRC_ADDR}
}

proc update_MODELPARAM_VALUE.AUTORUN_DEST_ADDR { MODELPARAM_VALUE.AUTORUN_DEST_ADDR PARAM_VALUE.AUTORUN_DEST_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_DEST_ADDR}] ${MODELPARAM_VALUE.AUTORUN_DEST_ADDR}
}

proc update_MODELPARAM_VALUE.AUTORUN_X_LENGTH { MODELPARAM_VALUE.AUTORUN_X_LENGTH PARAM_VALUE.AUTORUN_X_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_X_LENGTH}] ${MODELPARAM_VALUE.AUTORUN_X_LENGTH}
}

proc update_MODELPARAM_VALUE.AUTORUN_Y_LENGTH { MODELPARAM_VALUE.AUTORUN_Y_LENGTH PARAM_VALUE.AUTORUN_Y_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_Y_LENGTH}] ${MODELPARAM_VALUE.AUTORUN_Y_LENGTH}
}

proc update_MODELPARAM_VALUE.AUTORUN_SRC_STRIDE { MODELPARAM_VALUE.AUTORUN_SRC_STRIDE PARAM_VALUE.AUTORUN_SRC_STRIDE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_SRC_STRIDE}] ${MODELPARAM_VALUE.AUTORUN_SRC_STRIDE}
}

proc update_MODELPARAM_VALUE.AUTORUN_DEST_STRIDE { MODELPARAM_VALUE.AUTORUN_DEST_STRIDE PARAM_VALUE.AUTORUN_DEST_STRIDE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_DEST_STRIDE}] ${MODELPARAM_VALUE.AUTORUN_DEST_STRIDE}
}

proc update_MODELPARAM_VALUE.AUTORUN_SG_ADDRESS { MODELPARAM_VALUE.AUTORUN_SG_ADDRESS PARAM_VALUE.AUTORUN_SG_ADDRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_SG_ADDRESS}] ${MODELPARAM_VALUE.AUTORUN_SG_ADDRESS}
}

proc update_MODELPARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG { MODELPARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG PARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG}] ${MODELPARAM_VALUE.AUTORUN_FRAMELOCK_CONFIG}
}

proc update_MODELPARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE { MODELPARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE PARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE}] ${MODELPARAM_VALUE.AUTORUN_FRAMELOCK_STRIDE}
}

