# HDL Workflow

!!! warning This content is meant for developers or advanced users and is not meant for general consumption.

This page discusses the HDL targeting support from the perspective of the HDL source repo and HDL-Coder itself. It is not necessary for users to understand these details but for those managing the toolbox or developers extending support to new platforms this information is valuable.

This page assumes a basic understanding of MathWork's [HDL Workflow Advisor (HWA)](https://www.mathworks.com/help/hdlcoder/ug/overview-of-workflows-in-hdl-workflow-advisor.html) and its different steps for creating IP, creating a HDL project, and generating a bitstream. 

## HDL Repo Preparation

When the toolbox is built it will clone a specific branch of the [ADI HDL repo](github.com/analogdevicesinc/hdl) and apply certain changes to support the [IP-Core Generation HDL-Coder](https://www.mathworks.com/discovery/ip-core-generation.html) workflow. However, with the current flow there are minimal changes required which makes moving between release simpler. This is currently done by simply replacing certain TCL scripts within the HDL repo. 

Creation of the toolbox, cloning of the HDL source, and applying the necessary update is driven through a Makefile in the **CI/scripts** folder. The toolbox is built in source form with the **build** as follows:

```bash
make -C CI/scripts build
```
After the above command completes the HDL source will be in place with necessary changes.

The changes primarily required of the HDL source are interceptions of the build functions (procs) to skip synthesis when building a project. This is done by inserting environmental variable checks into the [adi_project_xilinx.tcl](https://github.com/analogdevicesinc/TransceiverToolbox/blob/master/CI/scripts/adi_project_xilinx.tcl#L138) script. At build time these environmental variables are set and will prevent synthesis. This way an HDL project can be built, then handed off to HDL-Coder for IP insertion and eventual synthesis.

HDL-Coder is limited to only interact with Vivado or Quartus. Therefore, it cannot leverage the makefiles as traditionally used to build HDL projects in the HDL repo. HDL-Coder and the authored scripts in the toolbox use the [TCL flow](https://wiki.analog.com/resources/fpga/docs/build#xilinx_auto_tcl_build) normally recommended for just Windows users. This is used on all platforms (Windows and Linux) to support HDL code-generation and integration with ADI toolboxes.

## HDL-Coder IP Core Generation Flow

The orchestration of Vivado and calling of specific TCL scripts is managed through MathWork's [HWA](https://www.mathworks.com/help/hdlcoder/ug/overview-of-workflows-in-hdl-workflow-advisor.html). HWA generates HDL (Verilog is currently the only supported language) for specific Simulink blocks, calls a number of TCL scripts maintained by ADI to build a project and make room for IP, then inserts that IP and calls synthesis. This will be discussed from HWA and the generated scripts it creates. This is detailed from the scripting perspective first in the figure below:

``` mermaid
graph LR
A[Generate Verilog<br/>From Simulink IP]-->B[Optional: Pre-Build</br>Project Script];
subgraph SS[vivado_create_prj.tcl]
subgraph vivado_custom_block_design.tcl
B --> C[Build Standard</br>Project</br><i>system_project.tcl</i>];
C --> D[Prune Preprocessor</br>Script</br><i>matlab_processors.tcl</i>];
D --> E[Optional: Post-Build</br>Project Script</br>];
end
end
E --> F[Insert and Connect</br>Generate IP</br><i>vivado_insert_ip.tcl</i>];

style B fill:#f9f,stroke:#333,stroke-width:4px
style E fill:#f9f,stroke:#333,stroke-width:4px
style C fill:#FF0,stroke:#333,stroke-width:4px,stroke-dasharray: 5 5
style D fill:#FF0,stroke:#333,stroke-width:4px,stroke-dasharray: 5 5
```
<center>Details IP-Core Generation flow with Toolbox</center>

At a high-level there are six main steps, two of which are optional. From the far left stage "Generate Verilog From Simulink IP" occurs in Stage 3 "HDL Code Generation" within HWA as outlined in red below. This will create Verilog within the defined project folder and then be copied into the full HDL project later on.

<figure markdown>
![](../HWA_verilog_gen.png){ width=80% }
  <figcaption>Image caption</figcaption>
</figure>

Within the largest central block of the flowchart labeled **vivado_create_prj.tcl** are all the core steps related the HWA Step 4.1, where the reference HDL project folder is built and necessary cores and nets removed to make room for IP from Simulink generated in HWA Step 3. This stage is highlighed in the figure below. The purple boxes are optional stages that are used in certain customized examples when additional work is required to prepare a reference design. The [Frequency Hopping example](https://github.com/analogdevicesinc/TransceiverToolbox/tree/master/trx_examples/targeting/frequency-hopping) leverages these stages. Once the project is prepared the IP is inserted and bitstream generated, which occurs through HWA Step 4.3.

<figure markdown>
![](../HWA_project_gen.png){ width=80% }
  <figcaption>Image caption</figcaption>
</figure>

### Generated TCL Scripts


The following scripts outlined in the figure above have certain purposes:

- **vivado_create_prj.tcl**: This is the first TCL scripted called in Stage 4 of HWA and is responsible for setting up a standard reference design and trimming nets and IPs to make room for IP from Simulink
- **vivado_custom_block_design.tcl**: This is a carbon copy of the **system_project_rxtx.tcl** script and is called by **vivado_create_prj.tcl**. This script will call [adi_make.tcl](https://wiki.analog.com/resources/fpga/docs/build#xilinx_auto_tcl_build), the correct system_project.tcl file, and finally matlab_processor.tcl. It will optionally call the pre/post processor TCL scripts.
- **vivado_insert_ip.tcl**: This script is fully generated by MATLAB based on the [add_io](https://github.com/analogdevicesinc/TransceiverToolbox/blob/master/hdl/vendor/AnalogDevices/+AnalogDevices/add_io.m) definitions in MATLAB to insert the custom IP into the prepared reference design.