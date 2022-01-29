

# fmcomms2 Reference Design Integration

This page outlines the HDL reference design integration for the *fmcomms2* reference design for the Analog Devices
AD9361 component. The IP-Core Generation follow is available on the based on the following base HDL reference design for the following board and design variants: 

- [Base reference design documentation](https://wiki.analog.com/resources/eval/user-guides/ad-fmcomms2-ebz/reference_hdl)
- Supported FPGA carriers:
    - ZED
    - ZC706
    - ZC702
- Supported design variants:
    - RX
    - TX
    - RX & TX

## Reference Design

<figure markdown>
  
  ![Reference Design](../assets/rd_ad9361_custom.svg)
  
  <figcaption>HDL Reference Design with Custom IP from HDL-Coder. Click on sub-blocks for more documentation.</figcaption>
</figure>
The IP-Core generation flow will integrate IP generated from Simulink subsystem into an ADI authored reference design. Depending on the FPGA carrier and FMC card or SoM, this will support different IP locations based on the diagram above.

## HDL Worflow Advisor Port Mappings

When using the HDL Worflow Advisor, the following port mappings are used to connect the reference design to the HDL-Coder generated IP-Core:

| Type | Target Platform Interface (MATLAB) | Reference Design Connection (Vivado) | Width | Reference Design Variant |
| ---- | ------------------------ | --------------------------- | ----- | ----------- |
| VALID-OUT | IP Data Valid OUT | util_ad9361_adc_pack/fifo_wr_en | 1 | RX |
| VALID-IN | IP Valid Rx Data IN | util_ad9361_adc_fifo/dout_valid_0 | 1 | RX |
| DATA-OUT | IP Data 0 OUT | util_ad9361_adc_pack/fifo_wr_data_0 | 16 | RX |
| DATA-OUT | IP Data 1 OUT | util_ad9361_adc_pack/fifo_wr_data_1 | 16 | RX |
| DATA-OUT | IP Data 2 OUT | util_ad9361_adc_pack/fifo_wr_data_2 | 16 | RX |
| DATA-OUT | IP Data 3 OUT | util_ad9361_adc_pack/fifo_wr_data_3 | 16 | RX |
| DATA-IN | AD9361 ADC Data Q0 | util_ad9361_adc_fifo/dout_data_0 | 16 | RX |
| DATA-IN | AD9361 ADC Data I0 | util_ad9361_adc_fifo/dout_data_1 | 16 | RX |
| DATA-IN | AD9361 ADC Data Q1 | util_ad9361_adc_fifo/dout_data_2 | 16 | RX |
| DATA-IN | AD9361 ADC Data I1 | util_ad9361_adc_fifo/dout_data_3 | 16 | RX |
| VALID-IN | IP Valid Tx Data IN | util_ad9361_dac_upack/fifo_rd_valid | 1 | TX |
| VALID-OUT | IP Load Tx Data OUT | axi_ad9361_dac_fifo/din_valid_in_0 | 1 | TX |
| DATA-OUT | AD9361 DAC Data Q0 | axi_ad9361_dac_fifo/din_data_0 | 16 | TX |
| DATA-OUT | AD9361 DAC Data I0 | axi_ad9361_dac_fifo/din_data_1 | 16 | TX |
| DATA-OUT | AD9361 DAC Data Q1 | axi_ad9361_dac_fifo/din_data_2 | 16 | TX |
| DATA-OUT | AD9361 DAC Data I1 | axi_ad9361_dac_fifo/din_data_3 | 16 | TX |
| DATA-IN | IP Data 0 IN | util_ad9361_dac_upack/fifo_rd_data_0 | 16 | TX |
| DATA-IN | IP Data 1 IN | util_ad9361_dac_upack/fifo_rd_data_1 | 16 | TX |
| DATA-IN | IP Data 2 IN | util_ad9361_dac_upack/fifo_rd_data_2 | 16 | TX |
| DATA-IN | IP Data 3 IN | util_ad9361_dac_upack/fifo_rd_data_3 | 16 | TX |

