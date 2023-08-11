
# HDL Targeting with HDL-Coder

Transceiver Toolbox supports the IP Core generation flow from MathWorks which allows for automated integration of DSP into HDL reference designs from Analog Devices. This workflow will take Simulink subsystems, run HDL-Coder to generate source Verilog, and then integrate that into a larger reference design. The figure below is a simplified block diagram of a SoC (Fabric+ARM) device, where specialized IP are inserted into the receive and transmit datapaths. This is supported on specific FPGA families and transceiver based reference designs. This support is based on the Zynq HDL-Coder and support

<img src="../assets/MATLAB_HDL_Ref_Design.png">

## Recommended Review

- [Getting started with Zynq](https://www.mathworks.com/support/search.html/videos/getting-started-with-zynq-80338.html?fq%5B%5D=asset_type_name:video&fq%5B%5D=category:hdlcoder/index&page=1)

## Getting Started
