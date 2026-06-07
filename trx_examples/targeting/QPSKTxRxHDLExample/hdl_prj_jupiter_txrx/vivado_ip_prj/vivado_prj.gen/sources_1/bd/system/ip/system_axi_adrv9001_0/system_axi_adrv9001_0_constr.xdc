
set ref_clk [get_clocks -of_objects [get_ports -quiet {ref_clk}]]
set rx1_clk [get_clocks -of_objects [get_ports -quiet {rx1_dclk_in_p_dclk_in}]]
set rx2_clk [get_clocks -of_objects [get_ports -quiet {rx2_dclk_in_p_dclk_in}]]
set tx1_clk [get_clocks -of_objects [get_ports -quiet {tx1_dclk_in_p_dclk_in}]]
set tx2_clk [get_clocks -of_objects [get_ports -quiet {tx2_dclk_in_p_dclk_in}]]





# async reset assertion with synchronous bringup
  # rx1 ensure max delay
  set_max_delay -quiet -datapath_only \
    -from [get_pins -hierarchical * -filter {NAME=~*i_rx_1_phy/bufdiv_clr_reg/Q}] \
    -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_rx_1_phy/i_dac_div_clk_rbuf/CLR}] \
  [get_property -min PERIOD $rx1_clk]
  #[expr [get_property -min PERIOD $rx1_clk] * 2]

    # tx1 ensure max delay
    set_max_delay -quiet -datapath_only \
      -from [get_pins -hierarchical * -filter {NAME=~*i_tx_1_phy/bufdiv_clr_reg/Q}] \
      -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_tx_1_phy/i_dac_div_clk_rbuf/CLR}] \
    [get_property -min PERIOD $tx1_clk]
    #[expr [get_property -min PERIOD $tx1_clk] * 2]

  #rx2 ensure max delay
  set_max_delay -quiet -datapath_only \
    -from [get_pins -hierarchical * -filter {NAME=~*i_rx_2_phy/bufdiv_clr_reg/Q}] \
    -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_rx_2_phy/i_dac_div_clk_rbuf/CLR}] \
  [get_property -min PERIOD $rx2_clk]
  #[expr [get_property -min PERIOD $rx2_clk] * 2]

    #tx2 ensure max delay
    set_max_delay -quiet -datapath_only \
      -from [get_pins -hierarchical * -filter {NAME=~*i_tx_2_phy/bufdiv_clr_reg/Q}] \
      -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_tx_2_phy/i_dac_div_clk_rbuf/CLR}] \
    [get_property -min PERIOD $tx2_clk]
    #[expr [get_property -min PERIOD $tx2_clk] * 2]

set_property ASYNC_REG TRUE \
  [get_cells -hier {*cdc_sync_stage1_reg*}] \
  [get_cells -hier {*cdc_sync_stage2_reg*}]

set_false_path -quiet -from [get_cells -quiet -hier *in_toggle_d1_reg* -filter {NAME =~ *i_serdes* && IS_SEQUENTIAL}]
set_false_path -quiet -from [get_cells -quiet -hier *out_toggle_d1_reg* -filter {NAME =~ *i_serdes* && IS_SEQUENTIAL}]

set_false_path -through  [get_pins -hier *i_idelay/CNTVALUEOUT]
set_false_path -through  [get_pins -hier *i_idelay/CNTVALUEIN]

# async reset assertion with synchronous bringup
set_false_path \
  -from [get_pins -hierarchical * -filter {NAME=~*i_*x_*_phy/bufdiv_clr_reg/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_*x_*_phy/reset_*reg/PRE}]

# sync bits i_txn/i_rate_sync_in
set_false_path \
  -to [get_cells -quiet -hier *cdc_sync_stage1_reg* \
    -filter {NAME =~ *i_rate_sync_in* && IS_SEQUENTIAL}]

# mssi_sync is used as an asynchronous reset signal with synchronous reset deasertion
# the serial interface clock is derived from ref_clk
set_min_delay \
  -from [get_pins -hierarchical * -filter {NAME=~*i_sync/mssi_sync_reg*/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_*_phy/mssi_sync_d1_reg/D}] 4.0

set_max_delay -datapath_only \
  -from [get_pins -hierarchical * -filter {NAME=~*i_sync/mssi_sync_reg*/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_if/i_*_phy/mssi_sync_d1_reg/D}] 6.0

## transfer sync event i_rx1/2_external_sync
set_false_path \
  -from [get_pins -hierarchical * -filter {NAME=~*i_sync/transfer_busy*/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_core/adc_*_transfer_sync_d1_reg/D}]

# transfer sync event i_tx_1/2_external_sync
set_false_path \
  -from [get_pins -hierarchical * -filter {NAME=~*i_sync/transfer_busy*/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_core/dac_*_transfer_sync_d*/D}]

# workaround
set_false_path \
  -from [get_pins -hierarchical * -filter {NAME=~*_common/up_*c_r1_mode_reg/C}] \
  -to [get_pins -hierarchical * -filter {NAME=~*i_core/*_r1_mode_d_reg*/D}]

# part of workaround - to be fixed
## sync bits i_rx1_ctrl_sync
#set_false_path \
#  -to [get_cells -quiet -hier *cdc_sync_stage1_reg* \
#    -filter {NAME =~ *i_rx1_ctrl_sync* && IS_SEQUENTIAL}]
#
## sync bits i_tx1_ctrl_sync
#set_false_path \
#  -to [get_cells -quiet -hier *cdc_sync_stage1_reg* \
#    -filter {NAME =~ *i_tx1_ctrl_sync* && IS_SEQUENTIAL}]
