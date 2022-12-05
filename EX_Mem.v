`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 13:08:43
// Design Name: 
// Module Name: EX_Mem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module EX_Mem(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, MemWrite_in, MemWrite_out, 
            MemRead_in, MemRead_out, StoreMux_in,StoreMux_out, ALUResult_in, ALUResult_out, RtContent_in, RtContent_out, RdAddress_in,
            RdAddress_out, PCplus4_in, PCplus4_out, Mux_Address_Wire_0_in, Mux_Address_Wire_1_in, Mux_Address_Wire_2_in, Mux_Address_Wire_3_in, Mux_Address_Wire_4_in, Mux_Address_Wire_5_in, Mux_Address_Wire_6_in, Mux_Address_Wire_7_in, Mux_Address_Wire_8_in, Mux_Address_Wire_9_in, Mux_Address_Wire_10_in, Mux_Address_Wire_11_in, Mux_Address_Wire_12_in, Mux_Address_Wire_13_in, Mux_Address_Wire_14_in, Mux_Address_Wire_15_in, Mux_Address_Wire_16_in, Mux_Address_Wire_17_in, Mux_Address_Wire_18_in, Mux_Address_Wire_19_in, Mux_Address_Wire_20_in, Mux_Address_Wire_21_in, Mux_Address_Wire_22_in, Mux_Address_Wire_23_in, Mux_Address_Wire_24_in, Mux_Address_Wire_25_in, Mux_Address_Wire_26_in, Mux_Address_Wire_27_in, Mux_Address_Wire_28_in, Mux_Address_Wire_29_in, Mux_Address_Wire_30_in, Mux_Address_Wire_31_in,
            Mux_Address_Wire_0_out, Mux_Address_Wire_1_out, Mux_Address_Wire_2_out, Mux_Address_Wire_3_out, Mux_Address_Wire_4_out, Mux_Address_Wire_5_out, Mux_Address_Wire_6_out, Mux_Address_Wire_7_out, Mux_Address_Wire_8_out, Mux_Address_Wire_9_out, Mux_Address_Wire_10_out, Mux_Address_Wire_11_out, Mux_Address_Wire_12_out, Mux_Address_Wire_13_out, Mux_Address_Wire_14_out, Mux_Address_Wire_15_out, Mux_Address_Wire_16_out, Mux_Address_Wire_17_out, Mux_Address_Wire_18_out, Mux_Address_Wire_19_out, Mux_Address_Wire_20_out, Mux_Address_Wire_21_out, Mux_Address_Wire_22_out, Mux_Address_Wire_23_out, Mux_Address_Wire_24_out, Mux_Address_Wire_25_out, Mux_Address_Wire_26_out, Mux_Address_Wire_27_out, Mux_Address_Wire_28_out, Mux_Address_Wire_29_out, Mux_Address_Wire_30_out, Mux_Address_Wire_31_out,
            readSAD_in, small_big_16_MUX_in, small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in,
            readSAD_out, small_big_16_MUX_out, small_big_regFile_out, SAD_RegFile_write_out, small_big_find_out, read_min_out, write_min_out,
            Window_Wire_0_in, Window_Wire_1_in, Window_Wire_2_in, Window_Wire_3_in, Window_Wire_4_in, Window_Wire_5_in, Window_Wire_6_in, Window_Wire_7_in, Window_Wire_8_in, Window_Wire_9_in, Window_Wire_10_in, Window_Wire_11_in, Window_Wire_12_in, Window_Wire_13_in, Window_Wire_14_in, Window_Wire_15_in,
            RegFile0_Wire_0_in, RegFile0_Wire_1_in, RegFile0_Wire_2_in, RegFile0_Wire_3_in, RegFile0_Wire_4_in, RegFile0_Wire_5_in, RegFile0_Wire_6_in, RegFile0_Wire_7_in, RegFile0_Wire_8_in, RegFile0_Wire_9_in, RegFile0_Wire_10_in, RegFile0_Wire_11_in, RegFile0_Wire_12_in, RegFile0_Wire_13_in, RegFile0_Wire_14_in, RegFile0_Wire_15_in,
            RegFile1_Wire_0_in, RegFile1_Wire_1_in, RegFile1_Wire_2_in, RegFile1_Wire_3_in, RegFile1_Wire_4_in, RegFile1_Wire_5_in, RegFile1_Wire_6_in, RegFile1_Wire_7_in, RegFile1_Wire_8_in, RegFile1_Wire_9_in, RegFile1_Wire_10_in, RegFile1_Wire_11_in, RegFile1_Wire_12_in, RegFile1_Wire_13_in, RegFile1_Wire_14_in, RegFile1_Wire_15_in,
            RegFile2_Wire_0_in, RegFile2_Wire_1_in, RegFile2_Wire_2_in, RegFile2_Wire_3_in, RegFile2_Wire_4_in, RegFile2_Wire_5_in, RegFile2_Wire_6_in, RegFile2_Wire_7_in, RegFile2_Wire_8_in, RegFile2_Wire_9_in, RegFile2_Wire_10_in, RegFile2_Wire_11_in, RegFile2_Wire_12_in, RegFile2_Wire_13_in, RegFile2_Wire_14_in, RegFile2_Wire_15_in,
            RegFile3_Wire_0_in, RegFile3_Wire_1_in, RegFile3_Wire_2_in, RegFile3_Wire_3_in, RegFile3_Wire_4_in, RegFile3_Wire_5_in, RegFile3_Wire_6_in, RegFile3_Wire_7_in, RegFile3_Wire_8_in, RegFile3_Wire_9_in, RegFile3_Wire_10_in, RegFile3_Wire_11_in, RegFile3_Wire_12_in, RegFile3_Wire_13_in, RegFile3_Wire_14_in, RegFile3_Wire_15_in,
            RegFile4_Wire_0_in, RegFile4_Wire_1_in, RegFile4_Wire_2_in, RegFile4_Wire_3_in, RegFile4_Wire_4_in, RegFile4_Wire_5_in, RegFile4_Wire_6_in, RegFile4_Wire_7_in, RegFile4_Wire_8_in, RegFile4_Wire_9_in, RegFile4_Wire_10_in, RegFile4_Wire_11_in, RegFile4_Wire_12_in, RegFile4_Wire_13_in, RegFile4_Wire_14_in, RegFile4_Wire_15_in,
            RegFile5_Wire_0_in, RegFile5_Wire_1_in, RegFile5_Wire_2_in, RegFile5_Wire_3_in, RegFile5_Wire_4_in, RegFile5_Wire_5_in, RegFile5_Wire_6_in, RegFile5_Wire_7_in, RegFile5_Wire_8_in, RegFile5_Wire_9_in, RegFile5_Wire_10_in, RegFile5_Wire_11_in, RegFile5_Wire_12_in, RegFile5_Wire_13_in, RegFile5_Wire_14_in, RegFile5_Wire_15_in,
            RegFile6_Wire_0_in, RegFile6_Wire_1_in, RegFile6_Wire_2_in, RegFile6_Wire_3_in, RegFile6_Wire_4_in, RegFile6_Wire_5_in, RegFile6_Wire_6_in, RegFile6_Wire_7_in, RegFile6_Wire_8_in, RegFile6_Wire_9_in, RegFile6_Wire_10_in, RegFile6_Wire_11_in, RegFile6_Wire_12_in, RegFile6_Wire_13_in, RegFile6_Wire_14_in, RegFile6_Wire_15_in,
            RegFile7_Wire_0_in, RegFile7_Wire_1_in, RegFile7_Wire_2_in, RegFile7_Wire_3_in, RegFile7_Wire_4_in, RegFile7_Wire_5_in, RegFile7_Wire_6_in, RegFile7_Wire_7_in, RegFile7_Wire_8_in, RegFile7_Wire_9_in, RegFile7_Wire_10_in, RegFile7_Wire_11_in, RegFile7_Wire_12_in, RegFile7_Wire_13_in, RegFile7_Wire_14_in, RegFile7_Wire_15_in,
            RegFile8_Wire_0_in, RegFile8_Wire_1_in, RegFile8_Wire_2_in, RegFile8_Wire_3_in, RegFile8_Wire_4_in, RegFile8_Wire_5_in, RegFile8_Wire_6_in, RegFile8_Wire_7_in, RegFile8_Wire_8_in, RegFile8_Wire_9_in, RegFile8_Wire_10_in, RegFile8_Wire_11_in, RegFile8_Wire_12_in, RegFile8_Wire_13_in, RegFile8_Wire_14_in, RegFile8_Wire_15_in,            
            Window_Wire_0_out, Window_Wire_1_out, Window_Wire_2_out, Window_Wire_3_out, Window_Wire_4_out, Window_Wire_5_out, Window_Wire_6_out, Window_Wire_7_out, Window_Wire_8_out, Window_Wire_9_out, Window_Wire_10_out, Window_Wire_11_out, Window_Wire_12_out, Window_Wire_13_out, Window_Wire_14_out, Window_Wire_15_out,
            RegFile0_Wire_0_out, RegFile0_Wire_1_out, RegFile0_Wire_2_out, RegFile0_Wire_3_out, RegFile0_Wire_4_out, RegFile0_Wire_5_out, RegFile0_Wire_6_out, RegFile0_Wire_7_out, RegFile0_Wire_8_out, RegFile0_Wire_9_out, RegFile0_Wire_10_out, RegFile0_Wire_11_out, RegFile0_Wire_12_out, RegFile0_Wire_13_out, RegFile0_Wire_14_out, RegFile0_Wire_15_out,
            RegFile1_Wire_0_out, RegFile1_Wire_1_out, RegFile1_Wire_2_out, RegFile1_Wire_3_out, RegFile1_Wire_4_out, RegFile1_Wire_5_out, RegFile1_Wire_6_out, RegFile1_Wire_7_out, RegFile1_Wire_8_out, RegFile1_Wire_9_out, RegFile1_Wire_10_out, RegFile1_Wire_11_out, RegFile1_Wire_12_out, RegFile1_Wire_13_out, RegFile1_Wire_14_out, RegFile1_Wire_15_out,
            RegFile2_Wire_0_out, RegFile2_Wire_1_out, RegFile2_Wire_2_out, RegFile2_Wire_3_out, RegFile2_Wire_4_out, RegFile2_Wire_5_out, RegFile2_Wire_6_out, RegFile2_Wire_7_out, RegFile2_Wire_8_out, RegFile2_Wire_9_out, RegFile2_Wire_10_out, RegFile2_Wire_11_out, RegFile2_Wire_12_out, RegFile2_Wire_13_out, RegFile2_Wire_14_out, RegFile2_Wire_15_out,
            RegFile3_Wire_0_out, RegFile3_Wire_1_out, RegFile3_Wire_2_out, RegFile3_Wire_3_out, RegFile3_Wire_4_out, RegFile3_Wire_5_out, RegFile3_Wire_6_out, RegFile3_Wire_7_out, RegFile3_Wire_8_out, RegFile3_Wire_9_out, RegFile3_Wire_10_out, RegFile3_Wire_11_out, RegFile3_Wire_12_out, RegFile3_Wire_13_out, RegFile3_Wire_14_out, RegFile3_Wire_15_out,
            RegFile4_Wire_0_out, RegFile4_Wire_1_out, RegFile4_Wire_2_out, RegFile4_Wire_3_out, RegFile4_Wire_4_out, RegFile4_Wire_5_out, RegFile4_Wire_6_out, RegFile4_Wire_7_out, RegFile4_Wire_8_out, RegFile4_Wire_9_out, RegFile4_Wire_10_out, RegFile4_Wire_11_out, RegFile4_Wire_12_out, RegFile4_Wire_13_out, RegFile4_Wire_14_out, RegFile4_Wire_15_out,
            RegFile5_Wire_0_out, RegFile5_Wire_1_out, RegFile5_Wire_2_out, RegFile5_Wire_3_out, RegFile5_Wire_4_out, RegFile5_Wire_5_out, RegFile5_Wire_6_out, RegFile5_Wire_7_out, RegFile5_Wire_8_out, RegFile5_Wire_9_out, RegFile5_Wire_10_out, RegFile5_Wire_11_out, RegFile5_Wire_12_out, RegFile5_Wire_13_out, RegFile5_Wire_14_out, RegFile5_Wire_15_out,
            RegFile6_Wire_0_out, RegFile6_Wire_1_out, RegFile6_Wire_2_out, RegFile6_Wire_3_out, RegFile6_Wire_4_out, RegFile6_Wire_5_out, RegFile6_Wire_6_out, RegFile6_Wire_7_out, RegFile6_Wire_8_out, RegFile6_Wire_9_out, RegFile6_Wire_10_out, RegFile6_Wire_11_out, RegFile6_Wire_12_out, RegFile6_Wire_13_out, RegFile6_Wire_14_out, RegFile6_Wire_15_out,
            RegFile7_Wire_0_out, RegFile7_Wire_1_out, RegFile7_Wire_2_out, RegFile7_Wire_3_out, RegFile7_Wire_4_out, RegFile7_Wire_5_out, RegFile7_Wire_6_out, RegFile7_Wire_7_out, RegFile7_Wire_8_out, RegFile7_Wire_9_out, RegFile7_Wire_10_out, RegFile7_Wire_11_out, RegFile7_Wire_12_out, RegFile7_Wire_13_out, RegFile7_Wire_14_out, RegFile7_Wire_15_out,
            RegFile8_Wire_0_out, RegFile8_Wire_1_out, RegFile8_Wire_2_out, RegFile8_Wire_3_out, RegFile8_Wire_4_out, RegFile8_Wire_5_out, RegFile8_Wire_6_out, RegFile8_Wire_7_out, RegFile8_Wire_8_out, RegFile8_Wire_9_out, RegFile8_Wire_10_out, RegFile8_Wire_11_out, RegFile8_Wire_12_out, RegFile8_Wire_13_out, RegFile8_Wire_14_out, RegFile8_Wire_15_out,
            Rs_in, Rs_out, allow_find_in, allow_find_out);
    
input [1:0]LoadMux_in, MemToReg_in;         //WB control signals
input RegWrite_in;                          //WB control signals
input MemWrite_in, MemRead_in;              //Mem control signals
input [1:0] StoreMux_in;                    //Mem control signals
input [31:0] ALUResult_in, RtContent_in, PCplus4_in, Rs_in;
input [4:0] RdAddress_in;
input clk, rst;

input [31:0] Mux_Address_Wire_0_in, Mux_Address_Wire_1_in, Mux_Address_Wire_2_in, Mux_Address_Wire_3_in, Mux_Address_Wire_4_in, Mux_Address_Wire_5_in, Mux_Address_Wire_6_in, Mux_Address_Wire_7_in, Mux_Address_Wire_8_in, Mux_Address_Wire_9_in, Mux_Address_Wire_10_in, Mux_Address_Wire_11_in, Mux_Address_Wire_12_in, Mux_Address_Wire_13_in, Mux_Address_Wire_14_in, Mux_Address_Wire_15_in, Mux_Address_Wire_16_in, Mux_Address_Wire_17_in, Mux_Address_Wire_18_in, Mux_Address_Wire_19_in, Mux_Address_Wire_20_in, Mux_Address_Wire_21_in, Mux_Address_Wire_22_in, Mux_Address_Wire_23_in, Mux_Address_Wire_24_in, Mux_Address_Wire_25_in, Mux_Address_Wire_26_in, Mux_Address_Wire_27_in, Mux_Address_Wire_28_in, Mux_Address_Wire_29_in, Mux_Address_Wire_30_in, Mux_Address_Wire_31_in;
input readSAD_in, small_big_16_MUX_in;                                                   //Mem competition signals
input small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in, allow_find_in;   //WB competition signals

input [31:0] Window_Wire_0_in, Window_Wire_1_in, Window_Wire_2_in, Window_Wire_3_in, Window_Wire_4_in, Window_Wire_5_in, Window_Wire_6_in, Window_Wire_7_in, Window_Wire_8_in, Window_Wire_9_in, Window_Wire_10_in, Window_Wire_11_in, Window_Wire_12_in, Window_Wire_13_in, Window_Wire_14_in, Window_Wire_15_in;
input [31:0] RegFile0_Wire_0_in, RegFile0_Wire_1_in, RegFile0_Wire_2_in, RegFile0_Wire_3_in, RegFile0_Wire_4_in, RegFile0_Wire_5_in, RegFile0_Wire_6_in, RegFile0_Wire_7_in, RegFile0_Wire_8_in, RegFile0_Wire_9_in, RegFile0_Wire_10_in, RegFile0_Wire_11_in, RegFile0_Wire_12_in, RegFile0_Wire_13_in, RegFile0_Wire_14_in, RegFile0_Wire_15_in; 
input [31:0] RegFile1_Wire_0_in, RegFile1_Wire_1_in, RegFile1_Wire_2_in, RegFile1_Wire_3_in, RegFile1_Wire_4_in, RegFile1_Wire_5_in, RegFile1_Wire_6_in, RegFile1_Wire_7_in, RegFile1_Wire_8_in, RegFile1_Wire_9_in, RegFile1_Wire_10_in, RegFile1_Wire_11_in, RegFile1_Wire_12_in, RegFile1_Wire_13_in, RegFile1_Wire_14_in, RegFile1_Wire_15_in;
input [31:0] RegFile2_Wire_0_in, RegFile2_Wire_1_in, RegFile2_Wire_2_in, RegFile2_Wire_3_in, RegFile2_Wire_4_in, RegFile2_Wire_5_in, RegFile2_Wire_6_in, RegFile2_Wire_7_in, RegFile2_Wire_8_in, RegFile2_Wire_9_in, RegFile2_Wire_10_in, RegFile2_Wire_11_in, RegFile2_Wire_12_in, RegFile2_Wire_13_in, RegFile2_Wire_14_in, RegFile2_Wire_15_in;
input [31:0] RegFile3_Wire_0_in, RegFile3_Wire_1_in, RegFile3_Wire_2_in, RegFile3_Wire_3_in, RegFile3_Wire_4_in, RegFile3_Wire_5_in, RegFile3_Wire_6_in, RegFile3_Wire_7_in, RegFile3_Wire_8_in, RegFile3_Wire_9_in, RegFile3_Wire_10_in, RegFile3_Wire_11_in, RegFile3_Wire_12_in, RegFile3_Wire_13_in, RegFile3_Wire_14_in, RegFile3_Wire_15_in;
input [31:0] RegFile4_Wire_0_in, RegFile4_Wire_1_in, RegFile4_Wire_2_in, RegFile4_Wire_3_in, RegFile4_Wire_4_in, RegFile4_Wire_5_in, RegFile4_Wire_6_in, RegFile4_Wire_7_in, RegFile4_Wire_8_in, RegFile4_Wire_9_in, RegFile4_Wire_10_in, RegFile4_Wire_11_in, RegFile4_Wire_12_in, RegFile4_Wire_13_in, RegFile4_Wire_14_in, RegFile4_Wire_15_in;
input [31:0] RegFile5_Wire_0_in, RegFile5_Wire_1_in, RegFile5_Wire_2_in, RegFile5_Wire_3_in, RegFile5_Wire_4_in, RegFile5_Wire_5_in, RegFile5_Wire_6_in, RegFile5_Wire_7_in, RegFile5_Wire_8_in, RegFile5_Wire_9_in, RegFile5_Wire_10_in, RegFile5_Wire_11_in, RegFile5_Wire_12_in, RegFile5_Wire_13_in, RegFile5_Wire_14_in, RegFile5_Wire_15_in;
input [31:0] RegFile6_Wire_0_in, RegFile6_Wire_1_in, RegFile6_Wire_2_in, RegFile6_Wire_3_in, RegFile6_Wire_4_in, RegFile6_Wire_5_in, RegFile6_Wire_6_in, RegFile6_Wire_7_in, RegFile6_Wire_8_in, RegFile6_Wire_9_in, RegFile6_Wire_10_in, RegFile6_Wire_11_in, RegFile6_Wire_12_in, RegFile6_Wire_13_in, RegFile6_Wire_14_in, RegFile6_Wire_15_in;
input [31:0] RegFile7_Wire_0_in, RegFile7_Wire_1_in, RegFile7_Wire_2_in, RegFile7_Wire_3_in, RegFile7_Wire_4_in, RegFile7_Wire_5_in, RegFile7_Wire_6_in, RegFile7_Wire_7_in, RegFile7_Wire_8_in, RegFile7_Wire_9_in, RegFile7_Wire_10_in, RegFile7_Wire_11_in, RegFile7_Wire_12_in, RegFile7_Wire_13_in, RegFile7_Wire_14_in, RegFile7_Wire_15_in;
input [31:0] RegFile8_Wire_0_in, RegFile8_Wire_1_in, RegFile8_Wire_2_in, RegFile8_Wire_3_in, RegFile8_Wire_4_in, RegFile8_Wire_5_in, RegFile8_Wire_6_in, RegFile8_Wire_7_in, RegFile8_Wire_8_in, RegFile8_Wire_9_in, RegFile8_Wire_10_in, RegFile8_Wire_11_in, RegFile8_Wire_12_in, RegFile8_Wire_13_in, RegFile8_Wire_14_in, RegFile8_Wire_15_in;

output reg [1:0]LoadMux_out, MemToReg_out;         //WB control signals
output reg RegWrite_out;                          //WB control signals
output reg MemWrite_out, MemRead_out;              //Mem control signals
output reg [1:0] StoreMux_out;                    //Mem control signals
output reg [31:0] ALUResult_out, RtContent_out, PCplus4_out, Rs_out;
output reg [4:0] RdAddress_out;

output reg [31:0] Mux_Address_Wire_0_out, Mux_Address_Wire_1_out, Mux_Address_Wire_2_out, Mux_Address_Wire_3_out, Mux_Address_Wire_4_out, Mux_Address_Wire_5_out, Mux_Address_Wire_6_out, Mux_Address_Wire_7_out, Mux_Address_Wire_8_out, Mux_Address_Wire_9_out, Mux_Address_Wire_10_out, Mux_Address_Wire_11_out, Mux_Address_Wire_12_out, Mux_Address_Wire_13_out, Mux_Address_Wire_14_out, Mux_Address_Wire_15_out, Mux_Address_Wire_16_out, Mux_Address_Wire_17_out, Mux_Address_Wire_18_out, Mux_Address_Wire_19_out, Mux_Address_Wire_20_out, Mux_Address_Wire_21_out, Mux_Address_Wire_22_out, Mux_Address_Wire_23_out, Mux_Address_Wire_24_out, Mux_Address_Wire_25_out, Mux_Address_Wire_26_out, Mux_Address_Wire_27_out, Mux_Address_Wire_28_out, Mux_Address_Wire_29_out, Mux_Address_Wire_30_out, Mux_Address_Wire_31_out;
output reg readSAD_out, small_big_16_MUX_out;                                                   //Mem competition signals
output reg small_big_regFile_out, SAD_RegFile_write_out, small_big_find_out, read_min_out, write_min_out, allow_find_out;   //WB competition signals

output reg [31:0] Window_Wire_0_out, Window_Wire_1_out, Window_Wire_2_out, Window_Wire_3_out, Window_Wire_4_out, Window_Wire_5_out, Window_Wire_6_out, Window_Wire_7_out, Window_Wire_8_out, Window_Wire_9_out, Window_Wire_10_out, Window_Wire_11_out, Window_Wire_12_out, Window_Wire_13_out, Window_Wire_14_out, Window_Wire_15_out;
output reg [31:0] RegFile0_Wire_0_out, RegFile0_Wire_1_out, RegFile0_Wire_2_out, RegFile0_Wire_3_out, RegFile0_Wire_4_out, RegFile0_Wire_5_out, RegFile0_Wire_6_out, RegFile0_Wire_7_out, RegFile0_Wire_8_out, RegFile0_Wire_9_out, RegFile0_Wire_10_out, RegFile0_Wire_11_out, RegFile0_Wire_12_out, RegFile0_Wire_13_out, RegFile0_Wire_14_out, RegFile0_Wire_15_out; 
output reg [31:0] RegFile1_Wire_0_out, RegFile1_Wire_1_out, RegFile1_Wire_2_out, RegFile1_Wire_3_out, RegFile1_Wire_4_out, RegFile1_Wire_5_out, RegFile1_Wire_6_out, RegFile1_Wire_7_out, RegFile1_Wire_8_out, RegFile1_Wire_9_out, RegFile1_Wire_10_out, RegFile1_Wire_11_out, RegFile1_Wire_12_out, RegFile1_Wire_13_out, RegFile1_Wire_14_out, RegFile1_Wire_15_out;
output reg [31:0] RegFile2_Wire_0_out, RegFile2_Wire_1_out, RegFile2_Wire_2_out, RegFile2_Wire_3_out, RegFile2_Wire_4_out, RegFile2_Wire_5_out, RegFile2_Wire_6_out, RegFile2_Wire_7_out, RegFile2_Wire_8_out, RegFile2_Wire_9_out, RegFile2_Wire_10_out, RegFile2_Wire_11_out, RegFile2_Wire_12_out, RegFile2_Wire_13_out, RegFile2_Wire_14_out, RegFile2_Wire_15_out;
output reg [31:0] RegFile3_Wire_0_out, RegFile3_Wire_1_out, RegFile3_Wire_2_out, RegFile3_Wire_3_out, RegFile3_Wire_4_out, RegFile3_Wire_5_out, RegFile3_Wire_6_out, RegFile3_Wire_7_out, RegFile3_Wire_8_out, RegFile3_Wire_9_out, RegFile3_Wire_10_out, RegFile3_Wire_11_out, RegFile3_Wire_12_out, RegFile3_Wire_13_out, RegFile3_Wire_14_out, RegFile3_Wire_15_out;
output reg [31:0] RegFile4_Wire_0_out, RegFile4_Wire_1_out, RegFile4_Wire_2_out, RegFile4_Wire_3_out, RegFile4_Wire_4_out, RegFile4_Wire_5_out, RegFile4_Wire_6_out, RegFile4_Wire_7_out, RegFile4_Wire_8_out, RegFile4_Wire_9_out, RegFile4_Wire_10_out, RegFile4_Wire_11_out, RegFile4_Wire_12_out, RegFile4_Wire_13_out, RegFile4_Wire_14_out, RegFile4_Wire_15_out;
output reg [31:0] RegFile5_Wire_0_out, RegFile5_Wire_1_out, RegFile5_Wire_2_out, RegFile5_Wire_3_out, RegFile5_Wire_4_out, RegFile5_Wire_5_out, RegFile5_Wire_6_out, RegFile5_Wire_7_out, RegFile5_Wire_8_out, RegFile5_Wire_9_out, RegFile5_Wire_10_out, RegFile5_Wire_11_out, RegFile5_Wire_12_out, RegFile5_Wire_13_out, RegFile5_Wire_14_out, RegFile5_Wire_15_out;
output reg [31:0] RegFile6_Wire_0_out, RegFile6_Wire_1_out, RegFile6_Wire_2_out, RegFile6_Wire_3_out, RegFile6_Wire_4_out, RegFile6_Wire_5_out, RegFile6_Wire_6_out, RegFile6_Wire_7_out, RegFile6_Wire_8_out, RegFile6_Wire_9_out, RegFile6_Wire_10_out, RegFile6_Wire_11_out, RegFile6_Wire_12_out, RegFile6_Wire_13_out, RegFile6_Wire_14_out, RegFile6_Wire_15_out;
output reg [31:0] RegFile7_Wire_0_out, RegFile7_Wire_1_out, RegFile7_Wire_2_out, RegFile7_Wire_3_out, RegFile7_Wire_4_out, RegFile7_Wire_5_out, RegFile7_Wire_6_out, RegFile7_Wire_7_out, RegFile7_Wire_8_out, RegFile7_Wire_9_out, RegFile7_Wire_10_out, RegFile7_Wire_11_out, RegFile7_Wire_12_out, RegFile7_Wire_13_out, RegFile7_Wire_14_out, RegFile7_Wire_15_out;
output reg [31:0] RegFile8_Wire_0_out, RegFile8_Wire_1_out, RegFile8_Wire_2_out, RegFile8_Wire_3_out, RegFile8_Wire_4_out, RegFile8_Wire_5_out, RegFile8_Wire_6_out, RegFile8_Wire_7_out, RegFile8_Wire_8_out, RegFile8_Wire_9_out, RegFile8_Wire_10_out, RegFile8_Wire_11_out, RegFile8_Wire_12_out, RegFile8_Wire_13_out, RegFile8_Wire_14_out, RegFile8_Wire_15_out;

always@(posedge clk or posedge rst) begin
	if (rst == 1) begin
	   LoadMux_out     <= 0;
	   MemToReg_out    <= 0;
       RegWrite_out    <= 0;
       MemWrite_out    <= 0;
       MemRead_out     <= 0;
       StoreMux_out    <= 0;  
       ALUResult_out   <= 0;                              
       RtContent_out   <= 0;
       PCplus4_out     <= 0;
       RdAddress_out   <= 0;
        Mux_Address_Wire_0_out <= 0;
        Mux_Address_Wire_1_out <= 0;
        Mux_Address_Wire_2_out <= 0;
        Mux_Address_Wire_3_out <= 0;
        Mux_Address_Wire_4_out <= 0;
        Mux_Address_Wire_5_out <= 0;
        Mux_Address_Wire_6_out <= 0;
        Mux_Address_Wire_7_out <= 0;
        Mux_Address_Wire_8_out <= 0;
        Mux_Address_Wire_9_out <= 0;
        Mux_Address_Wire_10_out <= 0;
        Mux_Address_Wire_11_out <= 0;
        Mux_Address_Wire_12_out <= 0;
        Mux_Address_Wire_13_out <= 0;
        Mux_Address_Wire_14_out <= 0;
        Mux_Address_Wire_15_out <= 0;
        Mux_Address_Wire_16_out <= 0;
        Mux_Address_Wire_17_out <= 0;
        Mux_Address_Wire_18_out <= 0;
        Mux_Address_Wire_19_out <= 0;
        Mux_Address_Wire_20_out <= 0;
        Mux_Address_Wire_21_out <= 0;
        Mux_Address_Wire_22_out <= 0;
        Mux_Address_Wire_23_out <= 0;
        Mux_Address_Wire_24_out <= 0;
        Mux_Address_Wire_25_out <= 0;
        Mux_Address_Wire_26_out <= 0;
        Mux_Address_Wire_27_out <= 0;
        Mux_Address_Wire_28_out <= 0;
        Mux_Address_Wire_29_out <= 0;
        Mux_Address_Wire_30_out <= 0;
        Mux_Address_Wire_31_out <= 0;
        readSAD_out            <= 0;
        small_big_16_MUX_out   <= 0;       
        small_big_regFile_out  <= 0;
        SAD_RegFile_write_out  <= 0; 
        small_big_find_out     <= 0; 
        read_min_out           <= 0; 
        write_min_out          <= 0; 
        Window_Wire_0_out<= 0; Window_Wire_1_out<= 0; Window_Wire_2_out<= 0; Window_Wire_3_out<= 0; Window_Wire_4_out<= 0; Window_Wire_5_out<= 0; Window_Wire_6_out<= 0; Window_Wire_7_out<= 0; Window_Wire_8_out<= 0; Window_Wire_9_out<= 0; Window_Wire_10_out<= 0; Window_Wire_11_out<= 0; Window_Wire_12_out<= 0; Window_Wire_13_out<= 0; Window_Wire_14_out<= 0; Window_Wire_15_out<= 0;
        RegFile0_Wire_0_out<= 0; RegFile0_Wire_1_out<= 0; RegFile0_Wire_2_out<= 0; RegFile0_Wire_3_out<= 0; RegFile0_Wire_4_out<= 0; RegFile0_Wire_5_out<= 0; RegFile0_Wire_6_out<= 0; RegFile0_Wire_7_out<= 0; RegFile0_Wire_8_out<= 0; RegFile0_Wire_9_out<= 0; RegFile0_Wire_10_out<= 0; RegFile0_Wire_11_out<= 0; RegFile0_Wire_12_out<= 0; RegFile0_Wire_13_out<= 0; RegFile0_Wire_14_out<= 0; RegFile0_Wire_15_out<= 0;
        RegFile1_Wire_0_out<= 0; RegFile1_Wire_1_out<= 0; RegFile1_Wire_2_out<= 0; RegFile1_Wire_3_out<= 0; RegFile1_Wire_4_out<= 0; RegFile1_Wire_5_out<= 0; RegFile1_Wire_6_out<= 0; RegFile1_Wire_7_out<= 0; RegFile1_Wire_8_out<= 0; RegFile1_Wire_9_out<= 0; RegFile1_Wire_10_out<= 0; RegFile1_Wire_11_out<= 0; RegFile1_Wire_12_out<= 0; RegFile1_Wire_13_out<= 0; RegFile1_Wire_14_out<= 0; RegFile1_Wire_15_out<= 0;
        RegFile2_Wire_0_out<= 0; RegFile2_Wire_1_out<= 0; RegFile2_Wire_2_out<= 0; RegFile2_Wire_3_out<= 0; RegFile2_Wire_4_out<= 0; RegFile2_Wire_5_out<= 0; RegFile2_Wire_6_out<= 0; RegFile2_Wire_7_out<= 0; RegFile2_Wire_8_out<= 0; RegFile2_Wire_9_out<= 0; RegFile2_Wire_10_out<= 0; RegFile2_Wire_11_out<= 0; RegFile2_Wire_12_out<= 0; RegFile2_Wire_13_out<= 0; RegFile2_Wire_14_out<= 0; RegFile2_Wire_15_out<= 0;
        RegFile3_Wire_0_out<= 0; RegFile3_Wire_1_out<= 0; RegFile3_Wire_2_out<= 0; RegFile3_Wire_3_out<= 0; RegFile3_Wire_4_out<= 0; RegFile3_Wire_5_out<= 0; RegFile3_Wire_6_out<= 0; RegFile3_Wire_7_out<= 0; RegFile3_Wire_8_out<= 0; RegFile3_Wire_9_out<= 0; RegFile3_Wire_10_out<= 0; RegFile3_Wire_11_out<= 0; RegFile3_Wire_12_out<= 0; RegFile3_Wire_13_out<= 0; RegFile3_Wire_14_out<= 0; RegFile3_Wire_15_out<= 0;
        RegFile4_Wire_0_out<= 0; RegFile4_Wire_1_out<= 0; RegFile4_Wire_2_out<= 0; RegFile4_Wire_3_out<= 0; RegFile4_Wire_4_out<= 0; RegFile4_Wire_5_out<= 0; RegFile4_Wire_6_out<= 0; RegFile4_Wire_7_out<= 0; RegFile4_Wire_8_out<= 0; RegFile4_Wire_9_out<= 0; RegFile4_Wire_10_out<= 0; RegFile4_Wire_11_out<= 0; RegFile4_Wire_12_out<= 0; RegFile4_Wire_13_out<= 0; RegFile4_Wire_14_out<= 0; RegFile4_Wire_15_out<= 0;
        RegFile5_Wire_0_out<= 0; RegFile5_Wire_1_out<= 0; RegFile5_Wire_2_out<= 0; RegFile5_Wire_3_out<= 0; RegFile5_Wire_4_out<= 0; RegFile5_Wire_5_out<= 0; RegFile5_Wire_6_out<= 0; RegFile5_Wire_7_out<= 0; RegFile5_Wire_8_out<= 0; RegFile5_Wire_9_out<= 0; RegFile5_Wire_10_out<= 0; RegFile5_Wire_11_out<= 0; RegFile5_Wire_12_out<= 0; RegFile5_Wire_13_out<= 0; RegFile5_Wire_14_out<= 0; RegFile5_Wire_15_out<= 0;
        RegFile6_Wire_0_out<= 0; RegFile6_Wire_1_out<= 0; RegFile6_Wire_2_out<= 0; RegFile6_Wire_3_out<= 0; RegFile6_Wire_4_out<= 0; RegFile6_Wire_5_out<= 0; RegFile6_Wire_6_out<= 0; RegFile6_Wire_7_out<= 0; RegFile6_Wire_8_out<= 0; RegFile6_Wire_9_out<= 0; RegFile6_Wire_10_out<= 0; RegFile6_Wire_11_out<= 0; RegFile6_Wire_12_out<= 0; RegFile6_Wire_13_out<= 0; RegFile6_Wire_14_out<= 0; RegFile6_Wire_15_out<= 0;
        RegFile7_Wire_0_out<= 0; RegFile7_Wire_1_out<= 0; RegFile7_Wire_2_out<= 0; RegFile7_Wire_3_out<= 0; RegFile7_Wire_4_out<= 0; RegFile7_Wire_5_out<= 0; RegFile7_Wire_6_out<= 0; RegFile7_Wire_7_out<= 0; RegFile7_Wire_8_out<= 0; RegFile7_Wire_9_out<= 0; RegFile7_Wire_10_out<= 0; RegFile7_Wire_11_out<= 0; RegFile7_Wire_12_out<= 0; RegFile7_Wire_13_out<= 0; RegFile7_Wire_14_out<= 0; RegFile7_Wire_15_out<= 0;
        RegFile8_Wire_0_out<= 0; RegFile8_Wire_1_out<= 0; RegFile8_Wire_2_out<= 0; RegFile8_Wire_3_out<= 0; RegFile8_Wire_4_out<= 0; RegFile8_Wire_5_out<= 0; RegFile8_Wire_6_out<= 0; RegFile8_Wire_7_out<= 0; RegFile8_Wire_8_out<= 0; RegFile8_Wire_9_out<= 0; RegFile8_Wire_10_out<= 0; RegFile8_Wire_11_out<= 0; RegFile8_Wire_12_out<= 0; RegFile8_Wire_13_out<= 0; RegFile8_Wire_14_out<= 0; RegFile8_Wire_15_out<= 0;
        Rs_out <= 0;
                    allow_find_out <= 0;

	end else begin
       LoadMux_out     <= LoadMux_in;
	   MemToReg_out    <= MemToReg_in;
       RegWrite_out    <= RegWrite_in;
       MemWrite_out    <= MemWrite_in;
       MemRead_out     <= MemRead_in;
       StoreMux_out    <= StoreMux_in;  
       ALUResult_out   <= ALUResult_in;                     
       RtContent_out   <= RtContent_in;
       PCplus4_out     <= PCplus4_in;
       RdAddress_out   <= RdAddress_in;
        Mux_Address_Wire_0_out <= Mux_Address_Wire_0_in;
        Mux_Address_Wire_1_out <= Mux_Address_Wire_1_in;
        Mux_Address_Wire_2_out <= Mux_Address_Wire_2_in;
        Mux_Address_Wire_3_out <= Mux_Address_Wire_3_in;
        Mux_Address_Wire_4_out <= Mux_Address_Wire_4_in;
        Mux_Address_Wire_5_out <= Mux_Address_Wire_5_in;
        Mux_Address_Wire_6_out <= Mux_Address_Wire_6_in;
        Mux_Address_Wire_7_out <= Mux_Address_Wire_7_in;
        Mux_Address_Wire_8_out <= Mux_Address_Wire_8_in;
        Mux_Address_Wire_9_out <= Mux_Address_Wire_9_in;
        Mux_Address_Wire_10_out <= Mux_Address_Wire_10_in;
        Mux_Address_Wire_11_out <= Mux_Address_Wire_11_in;
        Mux_Address_Wire_12_out <= Mux_Address_Wire_12_in;
        Mux_Address_Wire_13_out <= Mux_Address_Wire_13_in;
        Mux_Address_Wire_14_out <= Mux_Address_Wire_14_in;
        Mux_Address_Wire_15_out <= Mux_Address_Wire_15_in;
        Mux_Address_Wire_16_out <= Mux_Address_Wire_16_in;
        Mux_Address_Wire_17_out <= Mux_Address_Wire_17_in;
        Mux_Address_Wire_18_out <= Mux_Address_Wire_18_in;
        Mux_Address_Wire_19_out <= Mux_Address_Wire_19_in;
        Mux_Address_Wire_20_out <= Mux_Address_Wire_20_in;
        Mux_Address_Wire_21_out <= Mux_Address_Wire_21_in;
        Mux_Address_Wire_22_out <= Mux_Address_Wire_22_in;
        Mux_Address_Wire_23_out <= Mux_Address_Wire_23_in;
        Mux_Address_Wire_24_out <= Mux_Address_Wire_24_in;
        Mux_Address_Wire_25_out <= Mux_Address_Wire_25_in;
        Mux_Address_Wire_26_out <= Mux_Address_Wire_26_in;
        Mux_Address_Wire_27_out <= Mux_Address_Wire_27_in;
        Mux_Address_Wire_28_out <= Mux_Address_Wire_28_in;
        Mux_Address_Wire_29_out <= Mux_Address_Wire_29_in;
        Mux_Address_Wire_30_out <= Mux_Address_Wire_30_in;
        Mux_Address_Wire_31_out <= Mux_Address_Wire_31_in;   
        readSAD_out            <= readSAD_in;
        small_big_16_MUX_out   <= small_big_16_MUX_in;       
        small_big_regFile_out  <= small_big_regFile_in;
        SAD_RegFile_write_out  <= SAD_RegFile_write_in; 
        small_big_find_out     <= small_big_find_in; 
        read_min_out           <= read_min_in; 
        write_min_out          <= write_min_in;  
        RegFile0_Wire_0_out <= RegFile0_Wire_0_in;
        RegFile0_Wire_1_out <= RegFile0_Wire_1_in;
        RegFile0_Wire_2_out <= RegFile0_Wire_2_in;
        RegFile0_Wire_3_out <= RegFile0_Wire_3_in;
        RegFile0_Wire_4_out <= RegFile0_Wire_4_in;
        RegFile0_Wire_5_out <= RegFile0_Wire_5_in;
        RegFile0_Wire_6_out <= RegFile0_Wire_6_in;
        RegFile0_Wire_7_out <= RegFile0_Wire_7_in;
        RegFile0_Wire_8_out <= RegFile0_Wire_8_in;
        RegFile0_Wire_9_out <= RegFile0_Wire_9_in;
        RegFile0_Wire_10_out <= RegFile0_Wire_10_in;
        RegFile0_Wire_11_out <= RegFile0_Wire_11_in;
        RegFile0_Wire_12_out <= RegFile0_Wire_12_in;
        RegFile0_Wire_13_out <= RegFile0_Wire_13_in;
        RegFile0_Wire_14_out <= RegFile0_Wire_14_in;
        RegFile0_Wire_15_out <= RegFile0_Wire_15_in;
        RegFile1_Wire_0_out <= RegFile1_Wire_0_in;
        RegFile1_Wire_1_out <= RegFile1_Wire_1_in;
        RegFile1_Wire_2_out <= RegFile1_Wire_2_in;
        RegFile1_Wire_3_out <= RegFile1_Wire_3_in;
        RegFile1_Wire_4_out <= RegFile1_Wire_4_in;
        RegFile1_Wire_5_out <= RegFile1_Wire_5_in;
        RegFile1_Wire_6_out <= RegFile1_Wire_6_in;
        RegFile1_Wire_7_out <= RegFile1_Wire_7_in;
        RegFile1_Wire_8_out <= RegFile1_Wire_8_in;
        RegFile1_Wire_9_out <= RegFile1_Wire_9_in;
        RegFile1_Wire_10_out <= RegFile1_Wire_10_in;
        RegFile1_Wire_11_out <= RegFile1_Wire_11_in;
        RegFile1_Wire_12_out <= RegFile1_Wire_12_in;
        RegFile1_Wire_13_out <= RegFile1_Wire_13_in;
        RegFile1_Wire_14_out <= RegFile1_Wire_14_in;
        RegFile1_Wire_15_out <= RegFile1_Wire_15_in;
        RegFile2_Wire_0_out <= RegFile2_Wire_0_in;
        RegFile2_Wire_1_out <= RegFile2_Wire_1_in;
        RegFile2_Wire_2_out <= RegFile2_Wire_2_in;
        RegFile2_Wire_3_out <= RegFile2_Wire_3_in;
        RegFile2_Wire_4_out <= RegFile2_Wire_4_in;
        RegFile2_Wire_5_out <= RegFile2_Wire_5_in;
        RegFile2_Wire_6_out <= RegFile2_Wire_6_in;
        RegFile2_Wire_7_out <= RegFile2_Wire_7_in;
        RegFile2_Wire_8_out <= RegFile2_Wire_8_in;
        RegFile2_Wire_9_out <= RegFile2_Wire_9_in;
        RegFile2_Wire_10_out <= RegFile2_Wire_10_in;
        RegFile2_Wire_11_out <= RegFile2_Wire_11_in;
        RegFile2_Wire_12_out <= RegFile2_Wire_12_in;
        RegFile2_Wire_13_out <= RegFile2_Wire_13_in;
        RegFile2_Wire_14_out <= RegFile2_Wire_14_in;
        RegFile2_Wire_15_out <= RegFile2_Wire_15_in;
        RegFile3_Wire_0_out <= RegFile3_Wire_0_in;
        RegFile3_Wire_1_out <= RegFile3_Wire_1_in;
        RegFile3_Wire_2_out <= RegFile3_Wire_2_in;
        RegFile3_Wire_3_out <= RegFile3_Wire_3_in;
        RegFile3_Wire_4_out <= RegFile3_Wire_4_in;
        RegFile3_Wire_5_out <= RegFile3_Wire_5_in;
        RegFile3_Wire_6_out <= RegFile3_Wire_6_in;
        RegFile3_Wire_7_out <= RegFile3_Wire_7_in;
        RegFile3_Wire_8_out <= RegFile3_Wire_8_in;
        RegFile3_Wire_9_out <= RegFile3_Wire_9_in;
        RegFile3_Wire_10_out <= RegFile3_Wire_10_in;
        RegFile3_Wire_11_out <= RegFile3_Wire_11_in;
        RegFile3_Wire_12_out <= RegFile3_Wire_12_in;
        RegFile3_Wire_13_out <= RegFile3_Wire_13_in;
        RegFile3_Wire_14_out <= RegFile3_Wire_14_in;
        RegFile3_Wire_15_out <= RegFile3_Wire_15_in;
        RegFile4_Wire_0_out <= RegFile4_Wire_0_in;
        RegFile4_Wire_1_out <= RegFile4_Wire_1_in;
        RegFile4_Wire_2_out <= RegFile4_Wire_2_in;
        RegFile4_Wire_3_out <= RegFile4_Wire_3_in;
        RegFile4_Wire_4_out <= RegFile4_Wire_4_in;
        RegFile4_Wire_5_out <= RegFile4_Wire_5_in;
        RegFile4_Wire_6_out <= RegFile4_Wire_6_in;
        RegFile4_Wire_7_out <= RegFile4_Wire_7_in;
        RegFile4_Wire_8_out <= RegFile4_Wire_8_in;
        RegFile4_Wire_9_out <= RegFile4_Wire_9_in;
        RegFile4_Wire_10_out <= RegFile4_Wire_10_in;
        RegFile4_Wire_11_out <= RegFile4_Wire_11_in;
        RegFile4_Wire_12_out <= RegFile4_Wire_12_in;
        RegFile4_Wire_13_out <= RegFile4_Wire_13_in;
        RegFile4_Wire_14_out <= RegFile4_Wire_14_in;
        RegFile4_Wire_15_out <= RegFile4_Wire_15_in;
        RegFile5_Wire_0_out <= RegFile5_Wire_0_in;
        RegFile5_Wire_1_out <= RegFile5_Wire_1_in;
        RegFile5_Wire_2_out <= RegFile5_Wire_2_in;
        RegFile5_Wire_3_out <= RegFile5_Wire_3_in;
        RegFile5_Wire_4_out <= RegFile5_Wire_4_in;
        RegFile5_Wire_5_out <= RegFile5_Wire_5_in;
        RegFile5_Wire_6_out <= RegFile5_Wire_6_in;
        RegFile5_Wire_7_out <= RegFile5_Wire_7_in;
        RegFile5_Wire_8_out <= RegFile5_Wire_8_in;
        RegFile5_Wire_9_out <= RegFile5_Wire_9_in;
        RegFile5_Wire_10_out <= RegFile5_Wire_10_in;
        RegFile5_Wire_11_out <= RegFile5_Wire_11_in;
        RegFile5_Wire_12_out <= RegFile5_Wire_12_in;
        RegFile5_Wire_13_out <= RegFile5_Wire_13_in;
        RegFile5_Wire_14_out <= RegFile5_Wire_14_in;
        RegFile5_Wire_15_out <= RegFile5_Wire_15_in;
        RegFile6_Wire_0_out <= RegFile6_Wire_0_in;
        RegFile6_Wire_1_out <= RegFile6_Wire_1_in;
        RegFile6_Wire_2_out <= RegFile6_Wire_2_in;
        RegFile6_Wire_3_out <= RegFile6_Wire_3_in;
        RegFile6_Wire_4_out <= RegFile6_Wire_4_in;
        RegFile6_Wire_5_out <= RegFile6_Wire_5_in;
        RegFile6_Wire_6_out <= RegFile6_Wire_6_in;
        RegFile6_Wire_7_out <= RegFile6_Wire_7_in;
        RegFile6_Wire_8_out <= RegFile6_Wire_8_in;
        RegFile6_Wire_9_out <= RegFile6_Wire_9_in;
        RegFile6_Wire_10_out <= RegFile6_Wire_10_in;
        RegFile6_Wire_11_out <= RegFile6_Wire_11_in;
        RegFile6_Wire_12_out <= RegFile6_Wire_12_in;
        RegFile6_Wire_13_out <= RegFile6_Wire_13_in;
        RegFile6_Wire_14_out <= RegFile6_Wire_14_in;
        RegFile6_Wire_15_out <= RegFile6_Wire_15_in;
        RegFile7_Wire_0_out <= RegFile7_Wire_0_in;
        RegFile7_Wire_1_out <= RegFile7_Wire_1_in;
        RegFile7_Wire_2_out <= RegFile7_Wire_2_in;
        RegFile7_Wire_3_out <= RegFile7_Wire_3_in;
        RegFile7_Wire_4_out <= RegFile7_Wire_4_in;
        RegFile7_Wire_5_out <= RegFile7_Wire_5_in;
        RegFile7_Wire_6_out <= RegFile7_Wire_6_in;
        RegFile7_Wire_7_out <= RegFile7_Wire_7_in;
        RegFile7_Wire_8_out <= RegFile7_Wire_8_in;
        RegFile7_Wire_9_out <= RegFile7_Wire_9_in;
        RegFile7_Wire_10_out <= RegFile7_Wire_10_in;
        RegFile7_Wire_11_out <= RegFile7_Wire_11_in;
        RegFile7_Wire_12_out <= RegFile7_Wire_12_in;
        RegFile7_Wire_13_out <= RegFile7_Wire_13_in;
        RegFile7_Wire_14_out <= RegFile7_Wire_14_in;
        RegFile7_Wire_15_out <= RegFile7_Wire_15_in;
        RegFile8_Wire_0_out <= RegFile8_Wire_0_in;
        RegFile8_Wire_1_out <= RegFile8_Wire_1_in;
        RegFile8_Wire_2_out <= RegFile8_Wire_2_in;
        RegFile8_Wire_3_out <= RegFile8_Wire_3_in;
        RegFile8_Wire_4_out <= RegFile8_Wire_4_in;
        RegFile8_Wire_5_out <= RegFile8_Wire_5_in;
        RegFile8_Wire_6_out <= RegFile8_Wire_6_in;
        RegFile8_Wire_7_out <= RegFile8_Wire_7_in;
        RegFile8_Wire_8_out <= RegFile8_Wire_8_in;
        RegFile8_Wire_9_out <= RegFile8_Wire_9_in;
        RegFile8_Wire_10_out <= RegFile8_Wire_10_in;
        RegFile8_Wire_11_out <= RegFile8_Wire_11_in;
        RegFile8_Wire_12_out <= RegFile8_Wire_12_in;
        RegFile8_Wire_13_out <= RegFile8_Wire_13_in;
        RegFile8_Wire_14_out <= RegFile8_Wire_14_in;
        RegFile8_Wire_15_out <= RegFile8_Wire_15_in;    
        Window_Wire_0_out <= Window_Wire_0_in;
        Window_Wire_1_out <= Window_Wire_1_in;
        Window_Wire_2_out <= Window_Wire_2_in;
        Window_Wire_3_out <= Window_Wire_3_in;
        Window_Wire_4_out <= Window_Wire_4_in;
        Window_Wire_5_out <= Window_Wire_5_in;
        Window_Wire_6_out <= Window_Wire_6_in;
        Window_Wire_7_out <= Window_Wire_7_in;
        Window_Wire_8_out <= Window_Wire_8_in;
        Window_Wire_9_out <= Window_Wire_9_in;
        Window_Wire_10_out <= Window_Wire_10_in;
        Window_Wire_11_out <= Window_Wire_11_in;
        Window_Wire_12_out <= Window_Wire_12_in;
        Window_Wire_13_out <= Window_Wire_13_in;
        Window_Wire_14_out <= Window_Wire_14_in;
        Window_Wire_15_out <= Window_Wire_15_in;
        Rs_out <= Rs_in;
        allow_find_out <= allow_find_in;


   end
end

endmodule
