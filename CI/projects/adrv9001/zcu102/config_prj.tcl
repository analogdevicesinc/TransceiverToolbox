# Add 1 extra AXI master ports to the interconnect
set_property -dict [list CONFIG.NUM_MI {7}] [get_bd_cells axi_cpu_interconnect]
# Connect clock and reset
connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ACLK] [get_bd_pins sys_ps8/pl_clk0]
connect_bd_net [get_bd_pins axi_cpu_interconnect/M06_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]
