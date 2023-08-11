


# fmcomms8 Reference Design Integration

This page outlines the HDL reference design integration for the *fmcomms8* reference design for the Analog Devices
ADRV9009 component. The IP-Core Generation follow is available on the based on the following base HDL reference design for the following board and design variants: 

- [Base reference design documentation]()
- Supported FPGA carriers:
    - ZCU102
- Supported design variants:
    - RX
    - TX
    - RX & TX

## Reference Design

<figure markdown>
  
  ![Reference Design](../assets/rd_jesd_custom.svg)
  
  <figcaption>HDL Reference Design with Custom IP from HDL-Coder. Click on sub-blocks for more documentation.</figcaption>
</figure>
The IP-Core generation flow will integrate IP generated from Simulink subsystem into an ADI authored reference design. Depending on the FPGA carrier and FMC card or SoM, this will support different IP locations based on the diagram above.

## HDL Worflow Advisor Port Mappings

When using the HDL Worflow Advisor, the following port mappings are used to connect the reference design to the HDL-Coder generated IP-Core:

| Type | Target Platform Interface (MATLAB) | Reference Design Connection (Vivado) | Width | Reference Design Variant |
| ---- | ------------------------ | --------------------------- | ----- | ----------- |
| VALID-OUT | IP Data Valid OUT | util_fmc_rx_cpack/fifo_wr_en | 1 | RX |
| VALID-OUT | IP Valid Rx Data IN | rx_adrv9009_fmc_tpl_core/adc_valid_0 | 1 | RX |
| DATA-OUT | IP Data 0 OUT | util_fmc_rx_cpack/fifo_wr_data_0 | 16 | RX |
| DATA-OUT | IP Data 1 OUT | util_fmc_rx_cpack/fifo_wr_data_1 | 16 | RX |
| DATA-OUT | IP Data 2 OUT | util_fmc_rx_cpack/fifo_wr_data_2 | 16 | RX |
| DATA-OUT | IP Data 3 OUT | util_fmc_rx_cpack/fifo_wr_data_3 | 16 | RX |
| DATA-OUT | IP Data 4 OUT | util_fmc_rx_cpack/fifo_wr_data_4 | 16 | RX |
| DATA-OUT | IP Data 5 OUT | util_fmc_rx_cpack/fifo_wr_data_5 | 16 | RX |
| DATA-OUT | IP Data 6 OUT | util_fmc_rx_cpack/fifo_wr_data_6 | 16 | RX |
| DATA-OUT | IP Data 7 OUT | util_fmc_rx_cpack/fifo_wr_data_7 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data I0 | rx_adrv9009_fmc_tpl_core/adc_data_0 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data Q0 | rx_adrv9009_fmc_tpl_core/adc_data_1 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data I1 | rx_adrv9009_fmc_tpl_core/adc_data_2 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data Q1 | rx_adrv9009_fmc_tpl_core/adc_data_3 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data I2 | rx_adrv9009_fmc_tpl_core/adc_data_4 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data Q2 | rx_adrv9009_fmc_tpl_core/adc_data_5 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data I3 | rx_adrv9009_fmc_tpl_core/adc_data_6 | 16 | RX |
| DATA-OUT | ADRV9009 ADC Data Q3 | rx_adrv9009_fmc_tpl_core/adc_data_7 | 16 | RX |
| VALID-OUT | IP Valid Tx Data IN | util_fmc_tx_upack/fifo_rd_valid | 1 | TX |
| DATA-OUT | ADRV9009 DAC Data I0 | tx_adrv9009_fmc_tpl_core/dac_data_0 | 32 | TX |
| DATA-OUT | ADRV9009 DAC Data Q0 | tx_adrv9009_fmc_tpl_core/dac_data_1 | 32 | TX |
| DATA-OUT | ADRV9009 DAC Data I1 | tx_adrv9009_fmc_tpl_core/dac_data_2 | 32 | TX |
| DATA-OUT | ADRV9009 DAC Data Q1 | tx_adrv9009_fmc_tpl_core/dac_data_3 | 32 | TX |
| DATA-OUT | ADRV9009 DAC Data I2 | tx_adrv9009_fmc_tpl_core/dac_data_4 | 32 | TX |
| DATA-OUT | ADRV9009 DAC Data Q2 | tx_adrv9009_fmc_tpl_core/dac_data_5 | 32 | TX |
| DATA-OUT | ADRV9009 DAC Data I3 | tx_adrv9009_fmc_tpl_core/dac_data_6 | 32 | TX |
| DATA-OUT | ADRV9009 DAC Data Q3 | tx_adrv9009_fmc_tpl_core/dac_data_7 | 32 | TX |
| DATA-OUT | IP Data 0 IN | util_fmc_tx_upack/fifo_rd_data_0 | 32 | TX |
| DATA-OUT | IP Data 1 IN | util_fmc_tx_upack/fifo_rd_data_1 | 32 | TX |
| DATA-OUT | IP Data 2 IN | util_fmc_tx_upack/fifo_rd_data_2 | 32 | TX |
| DATA-OUT | IP Data 3 IN | util_fmc_tx_upack/fifo_rd_data_3 | 32 | TX |
| DATA-OUT | IP Data 4 IN | util_fmc_tx_upack/fifo_rd_data_4 | 32 | TX |
| DATA-OUT | IP Data 5 IN | util_fmc_tx_upack/fifo_rd_data_5 | 32 | TX |
| DATA-OUT | IP Data 6 IN | util_fmc_tx_upack/fifo_rd_data_6 | 32 | TX |
| DATA-OUT | IP Data 7 IN | util_fmc_tx_upack/fifo_rd_data_7 | 32 | TX |

