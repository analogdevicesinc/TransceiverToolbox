
//**********************************************************************
// Copyright (c) 2016-2018 Xilinx Inc.  All Rights Reserved
//**********************************************************************
//
//   TLM wrapper for CanCat IP. It 
//   This is a Dummy IP and doesn't perform any real functionality. This IP will come into picture when the design is M*N Stream 
//**********************************************************************

#ifndef _system_bit_concatenator_sync_0_core_h_
#define _system_bit_concatenator_sync_0_core_h_

#include <systemc.h>
#include "properties.h"

#define IN0_WIDTH 16
#define IN0_WIDTH 16
#define IN1_WIDTH 16
#define IN2_WIDTH 16
#define IN3_WIDTH 16
#define IN4_WIDTH 1
#define IN5_WIDTH 1
#define IN6_WIDTH 1
#define IN7_WIDTH 1
#define IN8_WIDTH 1
#define IN9_WIDTH 1
#define IN10_WIDTH 1
#define IN11_WIDTH 1
#define IN12_WIDTH 1
#define IN13_WIDTH 1
#define IN14_WIDTH 1
#define IN15_WIDTH 1
#define IN16_WIDTH 1
#define IN17_WIDTH 1
#define IN18_WIDTH 1
#define IN19_WIDTH 1
#define IN20_WIDTH 1
#define IN21_WIDTH 1
#define IN22_WIDTH 1
#define IN23_WIDTH 1
#define IN24_WIDTH 1
#define IN25_WIDTH 1
#define IN26_WIDTH 1
#define IN27_WIDTH 1
#define IN28_WIDTH 1
#define IN29_WIDTH 1
#define IN30_WIDTH 1
#define IN31_WIDTH 1
#define IN32_WIDTH 1
#define IN33_WIDTH 1
#define IN34_WIDTH 1
#define IN35_WIDTH 1
#define IN36_WIDTH 1
#define IN37_WIDTH 1
#define IN38_WIDTH 1
#define IN39_WIDTH 1
#define IN40_WIDTH 1
#define IN41_WIDTH 1
#define IN42_WIDTH 1
#define IN43_WIDTH 1
#define IN44_WIDTH 1
#define IN45_WIDTH 1
#define IN46_WIDTH 1
#define IN47_WIDTH 1
#define IN48_WIDTH 1
#define IN49_WIDTH 1
#define IN50_WIDTH 1
#define IN51_WIDTH 1
#define IN52_WIDTH 1
#define IN53_WIDTH 1
#define IN54_WIDTH 1
#define IN55_WIDTH 1
#define IN56_WIDTH 1
#define IN57_WIDTH 1
#define IN58_WIDTH 1
#define IN59_WIDTH 1
#define IN60_WIDTH 1
#define IN61_WIDTH 1
#define IN62_WIDTH 1
#define IN63_WIDTH 1
#define IN64_WIDTH 1
#define IN65_WIDTH 1
#define IN66_WIDTH 1
#define IN67_WIDTH 1
#define IN68_WIDTH 1
#define IN69_WIDTH 1
#define IN70_WIDTH 1
#define IN71_WIDTH 1
#define IN72_WIDTH 1
#define IN73_WIDTH 1
#define IN74_WIDTH 1
#define IN75_WIDTH 1
#define IN76_WIDTH 1
#define IN77_WIDTH 1
#define IN78_WIDTH 1
#define IN79_WIDTH 1
#define IN80_WIDTH 1
#define IN81_WIDTH 1
#define IN82_WIDTH 1
#define IN83_WIDTH 1
#define IN84_WIDTH 1
#define IN85_WIDTH 1
#define IN86_WIDTH 1
#define IN87_WIDTH 1
#define IN88_WIDTH 1
#define IN89_WIDTH 1
#define IN90_WIDTH 1
#define IN91_WIDTH 1
#define IN92_WIDTH 1
#define IN93_WIDTH 1
#define IN94_WIDTH 1
#define IN95_WIDTH 1
#define IN96_WIDTH 1
#define IN97_WIDTH 1
#define IN98_WIDTH 1
#define IN99_WIDTH 1
#define IN100_WIDTH 1
#define IN101_WIDTH 1
#define IN102_WIDTH 1
#define IN103_WIDTH 1
#define IN104_WIDTH 1
#define IN105_WIDTH 1
#define IN106_WIDTH 1
#define IN107_WIDTH 1
#define IN108_WIDTH 1
#define IN109_WIDTH 1
#define IN110_WIDTH 1
#define IN111_WIDTH 1
#define IN112_WIDTH 1
#define IN113_WIDTH 1
#define IN114_WIDTH 1
#define IN115_WIDTH 1
#define IN116_WIDTH 1
#define IN117_WIDTH 1
#define IN118_WIDTH 1
#define IN119_WIDTH 1
#define IN120_WIDTH 1
#define IN121_WIDTH 1
#define IN122_WIDTH 1
#define IN123_WIDTH 1
#define IN124_WIDTH 1
#define IN125_WIDTH 1
#define IN126_WIDTH 1
#define IN127_WIDTH 1


class system_bit_concatenator_sync_0_core : public sc_module 
{
    public: 
       system_bit_concatenator_sync_0_core (sc_core::sc_module_name nm, const xsc::common_cpp::properties& props)
            : sc_module(nm)
              , In0    ( "In0" )
              , In1    ( "In1" )
              , In2    ( "In2" )
              , In3    ( "In3" )
              , In4    ( "In4" )
              , dout   ( "dout" )
    {
        SC_HAS_PROCESS(system_bit_concatenator_sync_0_core);
        SC_METHOD(concate_input_port_values);
            sensitive << In0 
                      << In1 
                      << In2 
                      << In3 
                      << In4 ;
        dont_initialize();
    }

    virtual ~system_bit_concatenator_sync_0_core() = default;
   
    void concate_input_port_values()
    {
        sc_bv <65> portConcateVal;
            portConcateVal.range(0,0) =  In0.read();
            portConcateVal.range(1,1) =  In1.read();
            portConcateVal.range(2,2) =  In2.read();
            portConcateVal.range(3,3) =  In3.read();
            portConcateVal.range(4,4) =  In4.read();
        dout.write(portConcateVal);
    }
    public: 
        sc_in< sc_bv<IN0_WIDTH> >   In0;
        sc_in< sc_bv<IN1_WIDTH> >   In1;
        sc_in< sc_bv<IN2_WIDTH> >   In2;
        sc_in< sc_bv<IN3_WIDTH> >   In3;
        sc_in< sc_bv<IN4_WIDTH> >   In4;
        sc_out< sc_bv <65> >  dout;

};

#endif

