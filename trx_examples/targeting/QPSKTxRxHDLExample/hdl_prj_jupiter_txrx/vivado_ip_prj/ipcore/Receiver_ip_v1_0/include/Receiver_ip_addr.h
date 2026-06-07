/*
 * File Name:         hdl_prj_jupiter_txrx/ipcore/Receiver_ip_v1_0/include/Receiver_ip_addr.h
 * Description:       C Header File
 * Created:           2026-05-26 18:51:30
*/

#ifndef RECEIVER_IP_H_
#define RECEIVER_IP_H_

#define  IPCore_Reset_Receiver_ip          0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_Receiver_ip         0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_Receiver_ip      0x8  //contains unique IP timestamp (yymmddHHMM): 2605261851
#define  count_out_Data_Receiver_ip        0x100  //data register for Outport count_out
#define  packets_out_Data_Receiver_ip      0x104  //data register for Outport packets_out
#define  bit_errors_out_Data_Receiver_ip   0x108  //data register for Outport bit_errors_out
#define  iq_debug_mux_Data_Receiver_ip     0x10C  //data register for Inport iq_debug_mux
#define  rstCS_Data_Receiver_ip            0x110  //data register for Inport rstCS

#endif /* RECEIVER_IP_H_ */
