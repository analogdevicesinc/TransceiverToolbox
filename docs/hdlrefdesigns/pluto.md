

# pluto Reference Design Integration

- ADI Component: AD9361
- Supported FPGA carriers:
- Supported design variants:
    - RX
    - TX

## Reference Design

## HDL Worflow Advisor Port Mappings

| Type | Target Platform Interface (MATLAB) | Reference Design Connection (Vivado) | Width | Reference Design Variant |
| ---- | ------------------------ | --------------------------- | ----- | ----------- |
| VALID-OUT | IP Data Valid OUT | cpack/fifo_wr_en | 1 | RX |
| VALID-IN | IP Valid Rx Data IN | axi_ad9361/adc_valid_i0 | 1 | RX |
| DATA-OUT | IP Data 0 OUT | cpack/fifo_wr_data_0 | 16 | RX |
| DATA-OUT | IP Data 1 OUT | cpack/fifo_wr_data_1 | 16 | RX |
| DATA-IN | AD9361 ADC Data Q0 | axi_ad9361/adc_data_i0 | 16 | RX |
| DATA-IN | AD9361 ADC Data Q0 | axi_ad9361/adc_data_q0 | 16 | RX |
| VALID-IN | IP Valid Tx Data IN | tx_upack/fifo_rd_valid | 1 | TX |
| VALID-OUT | IP Load Tx Data OUT | logic_or/Op1 | 1 | TX |
| DATA-OUT | AD9361 DAC Data Q0 | axi_ad9361/dac_data_i0 | 16 | TX |
| DATA-OUT | AD9361 DAC Data Q0 | axi_ad9361/dac_data_q0 | 16 | TX |
| DATA-IN | IP Data 0 IN | util_ad9361_dac_upack/fifo_rd_data_0 | 16 | TX |
| DATA-IN | IP Data 1 IN | util_ad9361_dac_upack/fifo_rd_data_1 | 16 | TX |

