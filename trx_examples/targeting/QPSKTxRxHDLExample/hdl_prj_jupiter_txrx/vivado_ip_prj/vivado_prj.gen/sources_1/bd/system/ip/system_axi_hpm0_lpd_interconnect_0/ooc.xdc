# aclk {FREQ_HZ 99999001 CLK_DOMAIN system_sys_ps8_0_pl_clk0 PHASE 0.0} aclk1 {FREQ_HZ 100000000 CLK_DOMAIN system_axi_adrv9001_0_dac_1_clk PHASE 0.0}
# Clock Domain: system_sys_ps8_0_pl_clk0
create_clock -name aclk -period 10.000 [get_ports aclk]
# Clock Domain: system_axi_adrv9001_0_dac_1_clk
create_clock -name aclk1 -period 10.000 [get_ports aclk1]
# Generated clocks
