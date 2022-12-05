`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Abdelrahman Abdelkhalek ----> 45%
//	         Daniel Campana -------------> 45%
//      	 Osman Syed -----------------> 10%
// 
// Create Date: 20.10.2022 19:06:39
// Design Name: 
// Module Name: TopLevel
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

module TopLevel(clk, rst, CoordinateX_ID, CoordinateY_ID, valueDisplay, PCDisplay, matchAddress_WB, Minimum_WB);
input clk, rst;
output [31:0] CoordinateX_ID, CoordinateY_ID, valueDisplay, PCDisplay;

/////////////////////////////////////IF stage////////////////////////////////
wire [31:0] ControlMuxOutput_ID, Instruction_IF, PC_plus_4_IF, PCRes_IF, GoToPC_IF, FromPCSrcToJump_IF;

/////////////////////////////////////ID stage////////////////////////////////
wire [31:0] Instruction_ID, PC_plus_4_ID, ImmediateExtended_ID, BranchImmediate_ID, Rs_ID, Rt_ID, BranchWire_ID, JumpWire_ID, ExtraRs_ID, ExtraRt_ID;
wire LessThanZeroWire_ID, LessThanOneWire_ID, EqualWire_ID;
wire ALUSrc_ID, Shift_ID; //EX control signals
wire [1:0] RegDst_ID;  //EX control signals
wire [3:0] ALUOp_ID;   //EX control signal
wire MemRead_ID;       //Mem control signals
wire MemWrite_ID;      //Mem control signals
wire [1:0] StoreMux_ID;//Mem control signals
wire RegWrite_ID;      //WB control signals
wire [1:0] MemToReg_ID;//WB control signals 
wire [1:0] LoadMux_ID; //WB control signals    

wire small_big_32_MUX_ID;                                                            //EX competition signals
wire readSAD_ID, small_big_16_MUX_ID;                                                   //Mem competition signals
wire small_big_regFile_ID, SAD_RegFile_write_ID, small_big_find_ID, read_min_ID, write_min_ID;   //WB competition signals

wire ALUSrc_extra, Shift_extra; //EX control signals
wire [1:0] RegDst_extra;  //EX control signals
wire [3:0] ALUOp_extra;   //EX control signal
wire MemRead_extra;       //Mem control signals
wire MemWrite_extra;      //Mem control signals
wire [1:0] StoreMux_extra;//Mem control signals
wire RegWrite_extra;      //WB control signals
wire [1:0] MemToReg_extra;//WB control signals 
wire [1:0] LoadMux_extra; //WB control signals   

wire small_big_32_MUX_extra;                                                            //EX competition signals
wire readSAD_extra, small_big_16_MUX_extra;                                                   //Mem competition signals
wire small_big_regFile_extra, SAD_RegFile_write_extra, small_big_find_extra, read_min_extra, write_min_extra;   //WB competition signals

wire PCSource_ID, Flush, Stall, PC_Write;      //Branch control signal
wire [1:0] Jump_ID;  

/////////////////////////////////////EX stage////////////////////////////////
wire [31:0] Wire1_EX, Wire2_EX, Rs_EX, Rt_EX, ALURes_EX, ImmediateExtended_EX, PC_plus_4_EX, ALUSrcWire_EX, ALUShiftWire_EX;
wire [4:0]  RsAddress_EX, RtAddress_EX, RdAddress_EX, NewRdAddress_EX;
wire [3:0] ALUControl_EX;
wire Zero_EX, IF_ID_Write;
wire [31:0] Big_Address_Wire_0_EX, Big_Address_Wire_1_EX, Big_Address_Wire_2_EX, Big_Address_Wire_3_EX, Big_Address_Wire_4_EX, Big_Address_Wire_5_EX, Big_Address_Wire_6_EX, Big_Address_Wire_7_EX, Big_Address_Wire_8_EX, Big_Address_Wire_9_EX, Big_Address_Wire_10_EX, Big_Address_Wire_11_EX, Big_Address_Wire_12_EX, Big_Address_Wire_13_EX, Big_Address_Wire_14_EX, Big_Address_Wire_15_EX, Big_Address_Wire_16_EX, Big_Address_Wire_17_EX, Big_Address_Wire_18_EX, Big_Address_Wire_19_EX, Big_Address_Wire_20_EX, Big_Address_Wire_21_EX, Big_Address_Wire_22_EX, Big_Address_Wire_23_EX, Big_Address_Wire_24_EX, Big_Address_Wire_25_EX, Big_Address_Wire_26_EX, Big_Address_Wire_27_EX, Big_Address_Wire_28_EX, Big_Address_Wire_29_EX, Big_Address_Wire_30_EX, Big_Address_Wire_31_EX;
wire [31:0] Small_Address_Wire_0_EX, Small_Address_Wire_1_EX, Small_Address_Wire_2_EX, Small_Address_Wire_3_EX, Small_Address_Wire_4_EX, Small_Address_Wire_5_EX, Small_Address_Wire_6_EX, Small_Address_Wire_7_EX, Small_Address_Wire_8_EX, Small_Address_Wire_9_EX, Small_Address_Wire_10_EX, Small_Address_Wire_11_EX, Small_Address_Wire_12_EX, Small_Address_Wire_13_EX, Small_Address_Wire_14_EX, Small_Address_Wire_15_EX, Small_Address_Wire_16_EX, Small_Address_Wire_17_EX, Small_Address_Wire_18_EX, Small_Address_Wire_19_EX, Small_Address_Wire_20_EX, Small_Address_Wire_21_EX, Small_Address_Wire_22_EX, Small_Address_Wire_23_EX, Small_Address_Wire_24_EX, Small_Address_Wire_25_EX, Small_Address_Wire_26_EX, Small_Address_Wire_27_EX, Small_Address_Wire_28_EX, Small_Address_Wire_29_EX, Small_Address_Wire_30_EX, Small_Address_Wire_31_EX;
wire [31:0] Mux_Address_Wire_0_EX, Mux_Address_Wire_1_EX, Mux_Address_Wire_2_EX, Mux_Address_Wire_3_EX, Mux_Address_Wire_4_EX, Mux_Address_Wire_5_EX, Mux_Address_Wire_6_EX, Mux_Address_Wire_7_EX, Mux_Address_Wire_8_EX, Mux_Address_Wire_9_EX, Mux_Address_Wire_10_EX, Mux_Address_Wire_11_EX, Mux_Address_Wire_12_EX, Mux_Address_Wire_13_EX, Mux_Address_Wire_14_EX, Mux_Address_Wire_15_EX, Mux_Address_Wire_16_EX, Mux_Address_Wire_17_EX, Mux_Address_Wire_18_EX, Mux_Address_Wire_19_EX, Mux_Address_Wire_20_EX, Mux_Address_Wire_21_EX, Mux_Address_Wire_22_EX, Mux_Address_Wire_23_EX, Mux_Address_Wire_24_EX, Mux_Address_Wire_25_EX, Mux_Address_Wire_26_EX, Mux_Address_Wire_27_EX, Mux_Address_Wire_28_EX, Mux_Address_Wire_29_EX, Mux_Address_Wire_30_EX, Mux_Address_Wire_31_EX;
wire ALUSrc_EX, Shift_EX;      //EX control signals
wire [1:0] selSrc1_EX, selSrc2_EX, selMux_RsID, selMux_RtID; 
wire [1:0] RegDst_EX;  //EX control signals
wire [3:0] ALUOp_EX;   //EX control signal
wire MemRead_EX;       //Mem control signals
wire MemWrite_EX;      //Mem control signals
wire [1:0] StoreMux_EX;//Mem control signals
wire RegWrite_EX;      //WB control signals
wire [1:0] MemToReg_EX;//WB control signals 
wire [1:0] LoadMux_EX; //WB control signals   

wire small_big_32_MUX_EX;                                                            //EX competition signals
wire readSAD_EX, small_big_16_MUX_EX;                                                   //Mem competition signals
wire small_big_regFile_EX, SAD_RegFile_write_EX, small_big_find_EX, read_min_EX, write_min_EX;   //WB competition signals

wire [31:0] Window_Wire_0_EX, Window_Wire_1_EX, Window_Wire_2_EX, Window_Wire_3_EX, Window_Wire_4_EX, Window_Wire_5_EX, Window_Wire_6_EX, Window_Wire_7_EX, Window_Wire_8_EX, Window_Wire_9_EX, Window_Wire_10_EX, Window_Wire_11_EX, Window_Wire_12_EX, Window_Wire_13_EX, Window_Wire_14_EX, Window_Wire_15_EX;
wire [31:0] RegFile0_Wire_0_EX, RegFile0_Wire_1_EX, RegFile0_Wire_2_EX, RegFile0_Wire_3_EX, RegFile0_Wire_4_EX, RegFile0_Wire_5_EX, RegFile0_Wire_6_EX, RegFile0_Wire_7_EX, RegFile0_Wire_8_EX, RegFile0_Wire_9_EX, RegFile0_Wire_10_EX, RegFile0_Wire_11_EX, RegFile0_Wire_12_EX, RegFile0_Wire_13_EX, RegFile0_Wire_14_EX, RegFile0_Wire_15_EX; 
wire [31:0] RegFile1_Wire_0_EX, RegFile1_Wire_1_EX, RegFile1_Wire_2_EX, RegFile1_Wire_3_EX, RegFile1_Wire_4_EX, RegFile1_Wire_5_EX, RegFile1_Wire_6_EX, RegFile1_Wire_7_EX, RegFile1_Wire_8_EX, RegFile1_Wire_9_EX, RegFile1_Wire_10_EX, RegFile1_Wire_11_EX, RegFile1_Wire_12_EX, RegFile1_Wire_13_EX, RegFile1_Wire_14_EX, RegFile1_Wire_15_EX;
wire [31:0] RegFile2_Wire_0_EX, RegFile2_Wire_1_EX, RegFile2_Wire_2_EX, RegFile2_Wire_3_EX, RegFile2_Wire_4_EX, RegFile2_Wire_5_EX, RegFile2_Wire_6_EX, RegFile2_Wire_7_EX, RegFile2_Wire_8_EX, RegFile2_Wire_9_EX, RegFile2_Wire_10_EX, RegFile2_Wire_11_EX, RegFile2_Wire_12_EX, RegFile2_Wire_13_EX, RegFile2_Wire_14_EX, RegFile2_Wire_15_EX;
wire [31:0] RegFile3_Wire_0_EX, RegFile3_Wire_1_EX, RegFile3_Wire_2_EX, RegFile3_Wire_3_EX, RegFile3_Wire_4_EX, RegFile3_Wire_5_EX, RegFile3_Wire_6_EX, RegFile3_Wire_7_EX, RegFile3_Wire_8_EX, RegFile3_Wire_9_EX, RegFile3_Wire_10_EX, RegFile3_Wire_11_EX, RegFile3_Wire_12_EX, RegFile3_Wire_13_EX, RegFile3_Wire_14_EX, RegFile3_Wire_15_EX;
wire [31:0] RegFile4_Wire_0_EX, RegFile4_Wire_1_EX, RegFile4_Wire_2_EX, RegFile4_Wire_3_EX, RegFile4_Wire_4_EX, RegFile4_Wire_5_EX, RegFile4_Wire_6_EX, RegFile4_Wire_7_EX, RegFile4_Wire_8_EX, RegFile4_Wire_9_EX, RegFile4_Wire_10_EX, RegFile4_Wire_11_EX, RegFile4_Wire_12_EX, RegFile4_Wire_13_EX, RegFile4_Wire_14_EX, RegFile4_Wire_15_EX;
wire [31:0] RegFile5_Wire_0_EX, RegFile5_Wire_1_EX, RegFile5_Wire_2_EX, RegFile5_Wire_3_EX, RegFile5_Wire_4_EX, RegFile5_Wire_5_EX, RegFile5_Wire_6_EX, RegFile5_Wire_7_EX, RegFile5_Wire_8_EX, RegFile5_Wire_9_EX, RegFile5_Wire_10_EX, RegFile5_Wire_11_EX, RegFile5_Wire_12_EX, RegFile5_Wire_13_EX, RegFile5_Wire_14_EX, RegFile5_Wire_15_EX;
wire [31:0] RegFile6_Wire_0_EX, RegFile6_Wire_1_EX, RegFile6_Wire_2_EX, RegFile6_Wire_3_EX, RegFile6_Wire_4_EX, RegFile6_Wire_5_EX, RegFile6_Wire_6_EX, RegFile6_Wire_7_EX, RegFile6_Wire_8_EX, RegFile6_Wire_9_EX, RegFile6_Wire_10_EX, RegFile6_Wire_11_EX, RegFile6_Wire_12_EX, RegFile6_Wire_13_EX, RegFile6_Wire_14_EX, RegFile6_Wire_15_EX;
wire [31:0] RegFile7_Wire_0_EX, RegFile7_Wire_1_EX, RegFile7_Wire_2_EX, RegFile7_Wire_3_EX, RegFile7_Wire_4_EX, RegFile7_Wire_5_EX, RegFile7_Wire_6_EX, RegFile7_Wire_7_EX, RegFile7_Wire_8_EX, RegFile7_Wire_9_EX, RegFile7_Wire_10_EX, RegFile7_Wire_11_EX, RegFile7_Wire_12_EX, RegFile7_Wire_13_EX, RegFile7_Wire_14_EX, RegFile7_Wire_15_EX;
wire [31:0] RegFile8_Wire_0_EX, RegFile8_Wire_1_EX, RegFile8_Wire_2_EX, RegFile8_Wire_3_EX, RegFile8_Wire_4_EX, RegFile8_Wire_5_EX, RegFile8_Wire_6_EX, RegFile8_Wire_7_EX, RegFile8_Wire_8_EX, RegFile8_Wire_9_EX, RegFile8_Wire_10_EX, RegFile8_Wire_11_EX, RegFile8_Wire_12_EX, RegFile8_Wire_13_EX, RegFile8_Wire_14_EX, RegFile8_Wire_15_EX;
 
/////////////////////////////////////Mem stage////////////////////////////////
wire [31:0] Rt_Mem, ALURes_Mem, PC_plus_4_Mem, WriteData_Mem, MemoryReadContent_Mem, Rs_Mem;
wire [31:0] Mux_Address_Wire_0_MEM, Mux_Address_Wire_1_MEM, Mux_Address_Wire_2_MEM, Mux_Address_Wire_3_MEM, Mux_Address_Wire_4_MEM, Mux_Address_Wire_5_MEM, Mux_Address_Wire_6_MEM, Mux_Address_Wire_7_MEM, Mux_Address_Wire_8_MEM, Mux_Address_Wire_9_MEM, Mux_Address_Wire_10_MEM, Mux_Address_Wire_11_MEM, Mux_Address_Wire_12_MEM, Mux_Address_Wire_13_MEM, Mux_Address_Wire_14_MEM, Mux_Address_Wire_15_MEM, Mux_Address_Wire_16_MEM, Mux_Address_Wire_17_MEM, Mux_Address_Wire_18_MEM, Mux_Address_Wire_19_MEM, Mux_Address_Wire_20_MEM, Mux_Address_Wire_21_MEM, Mux_Address_Wire_22_MEM, Mux_Address_Wire_23_MEM, Mux_Address_Wire_24_MEM, Mux_Address_Wire_25_MEM, Mux_Address_Wire_26_MEM, Mux_Address_Wire_27_MEM, Mux_Address_Wire_28_MEM, Mux_Address_Wire_29_MEM, Mux_Address_Wire_30_MEM, Mux_Address_Wire_31_MEM;
wire [31:0] Data_Memory_Wire_0_MEM, Data_Memory_Wire_1_MEM, Data_Memory_Wire_2_MEM, Data_Memory_Wire_3_MEM, Data_Memory_Wire_4_MEM, Data_Memory_Wire_5_MEM, Data_Memory_Wire_6_MEM, Data_Memory_Wire_7_MEM, Data_Memory_Wire_8_MEM, Data_Memory_Wire_9_MEM, Data_Memory_Wire_10_MEM, Data_Memory_Wire_11_MEM, Data_Memory_Wire_12_MEM, Data_Memory_Wire_13_MEM, Data_Memory_Wire_14_MEM, Data_Memory_Wire_15_MEM, Data_Memory_Wire_16_MEM, Data_Memory_Wire_17_MEM, Data_Memory_Wire_18_MEM, Data_Memory_Wire_19_MEM, Data_Memory_Wire_20_MEM, Data_Memory_Wire_21_MEM, Data_Memory_Wire_22_MEM, Data_Memory_Wire_23_MEM, Data_Memory_Wire_24_MEM, Data_Memory_Wire_25_MEM, Data_Memory_Wire_26_MEM, Data_Memory_Wire_27_MEM, Data_Memory_Wire_28_MEM, Data_Memory_Wire_29_MEM, Data_Memory_Wire_30_MEM, Data_Memory_Wire_31_MEM;
wire [4:0]  RdAddress_Mem;
wire MemRead_Mem;       //Mem control signals
wire MemWrite_Mem;      //Mem control signals
wire [1:0] StoreMux_Mem;//Mem control signals
wire RegWrite_Mem;      //WB control signals
wire [1:0] MemToReg_Mem;//WB control signals 
wire [1:0] LoadMux_Mem; //WB control signals    

wire readSAD_Mem, small_big_16_MUX_Mem;                                                   //Mem competition signals
wire small_big_regFile_Mem, SAD_RegFile_write_Mem, small_big_find_Mem, read_min_Mem, write_min_Mem;   //WB competition signals

wire [31:0] Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem;
wire [31:0] RegFile0_Wire_0_Mem, RegFile0_Wire_1_Mem, RegFile0_Wire_2_Mem, RegFile0_Wire_3_Mem, RegFile0_Wire_4_Mem, RegFile0_Wire_5_Mem, RegFile0_Wire_6_Mem, RegFile0_Wire_7_Mem, RegFile0_Wire_8_Mem, RegFile0_Wire_9_Mem, RegFile0_Wire_10_Mem, RegFile0_Wire_11_Mem, RegFile0_Wire_12_Mem, RegFile0_Wire_13_Mem, RegFile0_Wire_14_Mem, RegFile0_Wire_15_Mem; 
wire [31:0] RegFile1_Wire_0_Mem, RegFile1_Wire_1_Mem, RegFile1_Wire_2_Mem, RegFile1_Wire_3_Mem, RegFile1_Wire_4_Mem, RegFile1_Wire_5_Mem, RegFile1_Wire_6_Mem, RegFile1_Wire_7_Mem, RegFile1_Wire_8_Mem, RegFile1_Wire_9_Mem, RegFile1_Wire_10_Mem, RegFile1_Wire_11_Mem, RegFile1_Wire_12_Mem, RegFile1_Wire_13_Mem, RegFile1_Wire_14_Mem, RegFile1_Wire_15_Mem;
wire [31:0] RegFile2_Wire_0_Mem, RegFile2_Wire_1_Mem, RegFile2_Wire_2_Mem, RegFile2_Wire_3_Mem, RegFile2_Wire_4_Mem, RegFile2_Wire_5_Mem, RegFile2_Wire_6_Mem, RegFile2_Wire_7_Mem, RegFile2_Wire_8_Mem, RegFile2_Wire_9_Mem, RegFile2_Wire_10_Mem, RegFile2_Wire_11_Mem, RegFile2_Wire_12_Mem, RegFile2_Wire_13_Mem, RegFile2_Wire_14_Mem, RegFile2_Wire_15_Mem;
wire [31:0] RegFile3_Wire_0_Mem, RegFile3_Wire_1_Mem, RegFile3_Wire_2_Mem, RegFile3_Wire_3_Mem, RegFile3_Wire_4_Mem, RegFile3_Wire_5_Mem, RegFile3_Wire_6_Mem, RegFile3_Wire_7_Mem, RegFile3_Wire_8_Mem, RegFile3_Wire_9_Mem, RegFile3_Wire_10_Mem, RegFile3_Wire_11_Mem, RegFile3_Wire_12_Mem, RegFile3_Wire_13_Mem, RegFile3_Wire_14_Mem, RegFile3_Wire_15_Mem;
wire [31:0] RegFile4_Wire_0_Mem, RegFile4_Wire_1_Mem, RegFile4_Wire_2_Mem, RegFile4_Wire_3_Mem, RegFile4_Wire_4_Mem, RegFile4_Wire_5_Mem, RegFile4_Wire_6_Mem, RegFile4_Wire_7_Mem, RegFile4_Wire_8_Mem, RegFile4_Wire_9_Mem, RegFile4_Wire_10_Mem, RegFile4_Wire_11_Mem, RegFile4_Wire_12_Mem, RegFile4_Wire_13_Mem, RegFile4_Wire_14_Mem, RegFile4_Wire_15_Mem;
wire [31:0] RegFile5_Wire_0_Mem, RegFile5_Wire_1_Mem, RegFile5_Wire_2_Mem, RegFile5_Wire_3_Mem, RegFile5_Wire_4_Mem, RegFile5_Wire_5_Mem, RegFile5_Wire_6_Mem, RegFile5_Wire_7_Mem, RegFile5_Wire_8_Mem, RegFile5_Wire_9_Mem, RegFile5_Wire_10_Mem, RegFile5_Wire_11_Mem, RegFile5_Wire_12_Mem, RegFile5_Wire_13_Mem, RegFile5_Wire_14_Mem, RegFile5_Wire_15_Mem;
wire [31:0] RegFile6_Wire_0_Mem, RegFile6_Wire_1_Mem, RegFile6_Wire_2_Mem, RegFile6_Wire_3_Mem, RegFile6_Wire_4_Mem, RegFile6_Wire_5_Mem, RegFile6_Wire_6_Mem, RegFile6_Wire_7_Mem, RegFile6_Wire_8_Mem, RegFile6_Wire_9_Mem, RegFile6_Wire_10_Mem, RegFile6_Wire_11_Mem, RegFile6_Wire_12_Mem, RegFile6_Wire_13_Mem, RegFile6_Wire_14_Mem, RegFile6_Wire_15_Mem;
wire [31:0] RegFile7_Wire_0_Mem, RegFile7_Wire_1_Mem, RegFile7_Wire_2_Mem, RegFile7_Wire_3_Mem, RegFile7_Wire_4_Mem, RegFile7_Wire_5_Mem, RegFile7_Wire_6_Mem, RegFile7_Wire_7_Mem, RegFile7_Wire_8_Mem, RegFile7_Wire_9_Mem, RegFile7_Wire_10_Mem, RegFile7_Wire_11_Mem, RegFile7_Wire_12_Mem, RegFile7_Wire_13_Mem, RegFile7_Wire_14_Mem, RegFile7_Wire_15_Mem;
wire [31:0] RegFile8_Wire_0_Mem, RegFile8_Wire_1_Mem, RegFile8_Wire_2_Mem, RegFile8_Wire_3_Mem, RegFile8_Wire_4_Mem, RegFile8_Wire_5_Mem, RegFile8_Wire_6_Mem, RegFile8_Wire_7_Mem, RegFile8_Wire_8_Mem, RegFile8_Wire_9_Mem, RegFile8_Wire_10_Mem, RegFile8_Wire_11_Mem, RegFile8_Wire_12_Mem, RegFile8_Wire_13_Mem, RegFile8_Wire_14_Mem, RegFile8_Wire_15_Mem;

wire [31:0] mux_frame_0_Mem, mux_frame_1_Mem, mux_frame_2_Mem, mux_frame_3_Mem, mux_frame_4_Mem, mux_frame_5_Mem, mux_frame_6_Mem, mux_frame_7_Mem, mux_frame_8_Mem, mux_frame_9_Mem, mux_frame_10_Mem, mux_frame_11_Mem, mux_frame_12_Mem, mux_frame_13_Mem, mux_frame_14_Mem, mux_frame_15_Mem;
wire [31:0] sadResult_Wire_1_Mem, sadResult_Wire_2_Mem, sadResult_Wire_3_Mem, sadResult_Wire_4_Mem, sadResult_Wire_5_Mem, sadResult_Wire_6_Mem, sadResult_Wire_7_Mem, sadResult_Wire_8_Mem;

/////////////////////////////////////WB stage////////////////////////////////
wire [31:0] MemoryReadContent_WB, GoToMemToReg_WB, ALURes_WB, PC_plus_4_WB, MemToRegWire_WB, Rs_WB;
wire [31:0] Data_Memory_Wire_0_WB, Data_Memory_Wire_1_WB, Data_Memory_Wire_2_WB, Data_Memory_Wire_3_WB, Data_Memory_Wire_4_WB, Data_Memory_Wire_5_WB, Data_Memory_Wire_6_WB, Data_Memory_Wire_7_WB, Data_Memory_Wire_8_WB, Data_Memory_Wire_9_WB, Data_Memory_Wire_10_WB, Data_Memory_Wire_11_WB, Data_Memory_Wire_12_WB, Data_Memory_Wire_13_WB, Data_Memory_Wire_14_WB, Data_Memory_Wire_15_WB, Data_Memory_Wire_16_WB, Data_Memory_Wire_17_WB, Data_Memory_Wire_18_WB, Data_Memory_Wire_19_WB, Data_Memory_Wire_20_WB, Data_Memory_Wire_21_WB, Data_Memory_Wire_22_WB, Data_Memory_Wire_23_WB, Data_Memory_Wire_24_WB, Data_Memory_Wire_25_WB, Data_Memory_Wire_26_WB, Data_Memory_Wire_27_WB, Data_Memory_Wire_28_WB, Data_Memory_Wire_29_WB, Data_Memory_Wire_30_WB, Data_Memory_Wire_31_WB;
wire [4:0]  RdAddress_WB;
wire RegWrite_WB;      //WB control signals
wire [1:0] MemToReg_WB;//WB control signals 
wire [1:0] LoadMux_WB; //WB control signals   
wire small_big_regFile_WB, SAD_RegFile_write_WB, small_big_find_WB, read_min_WB, write_min_WB;   //WB competition signals
wire [31:0] sadResult_wire_1_WB, sadResult_wire_2_WB, sadResult_wire_3_WB, sadResult_wire_4_WB, sadResult_wire_5_WB, sadResult_wire_6_WB, sadResult_wire_7_WB, sadResult_wire_8_WB;
output [31:0] matchAddress_WB, Minimum_WB;




/////////////////////////////////////IF stage////////////////////////////////
//Mux32Bit2To1(out, inA, inB, sel);
Mux32Bit2To1 IFPCSource(FromPCSrcToJump_IF, PC_plus_4_IF, BranchWire_ID, PCSource_ID);
//Mux32Bit3To1Normal(out, inA, inB, inC, sel);
Mux32Bit3To1Normal IFJumpMux(GoToPC_IF, FromPCSrcToJump_IF, {PC_plus_4_ID[31:28],JumpWire_ID[27:0]}, Rs_ID, Jump_ID);
//ProgramCounter(Address, PCResult, Reset, Clk, PC_Write);
ProgramCounter IF0(GoToPC_IF, PCRes_IF, rst, clk, PC_Write);
//InstructionMemory(Address, Instruction); 
InstructionMemory IF1(PCRes_IF, Instruction_IF);
//PCAdder(PCResult, Operand, PCAddResult);
PCAdder IF2(PCRes_IF, 4, PC_plus_4_IF);
//IF_ID(clk, rst, Instruction_in, Instruction_out, PCplus4_in, PCplus4_out, IF_ID_Write, Flush);
IF_ID IF3(clk, rst, Instruction_IF, Instruction_ID, PC_plus_4_IF, PC_plus_4_ID, IF_ID_Write, Flush);

/////////////////////////////////////ID stage////////////////////////////////
//module HazardUnit(PC_Write, IF_ID_Write, Flush, Stall, MemRead_EX, RtAddress_EX, RsAddress_ID, RtAddress_ID, Jump, PCSource, Instruction, RegWrite_EX);
HazardUnit Hazardthis(PC_Write, IF_ID_Write, Flush, Stall, MemRead_EX, NewRdAddress_EX, Instruction_ID[25:21], Instruction_ID[20:16], Jump_ID, PCSource_ID, Instruction_ID, RegWrite_EX);
/*RegisterFile(ReadRegister1, ReadRegister2, WriteRegister, WriteData, RegWrite, Clk, ReadData1, ReadData2, CoordinateX, CoordinateY,
                    write_min, match_address, minimum);*/
RegisterFile ID0(Instruction_ID[25:21], Instruction_ID[20:16], RdAddress_WB, MemToRegWire_WB, RegWrite_WB, clk, Rs_ID, Rt_ID, CoordinateX_ID, CoordinateY_ID,
                    write_min_WB, matchAddress_WB, Minimum_WB);
//SignExtension(in, out);
SignExtension ID1(Instruction_ID[15:0], ImmediateExtended_ID);
//MultiplyBy4(in, out);s`1w
MultiplyBy4 ID2(ImmediateExtended_ID, BranchImmediate_ID);
//PCAdder(PCResult, Operand, PCAddResult);
PCAdder ID3(BranchImmediate_ID, PC_plus_4_ID, BranchWire_ID);
//MultiplyBy4(in, out);
MultiplyBy4 ID4({6'b000000,Instruction_ID[25:0]}, JumpWire_ID);
//Mux32Bit3To1Normal(out, inA, inB, inC, sel);
Mux32Bit3To1Normal ForwardBranchRs(ExtraRs_ID, Rs_ID, MemToRegWire_WB, ALURes_Mem , selMux_RsID);
//Mux32Bit3To1Normal(out, inA, inB, inC, sel);
Mux32Bit3To1Normal ForwardBranchRt(ExtraRt_ID, Rt_ID, MemToRegWire_WB, ALURes_Mem , selMux_RtID);
//comparator_unit(A,B,Equal);
comparator_unit ID5(ExtraRs_ID,ExtraRt_ID,EqualWire_ID);
//set_on_less_than_unit(A,B,LessThanX);
set_on_less_than_unit ID6(ExtraRs_ID,0,LessThanZeroWire_ID);
//set_on_less_than_unit(A,B,LessThanX);
set_on_less_than_unit ID7(ExtraRs_ID,1,LessThanOneWire_ID);
/*module Controller(Instruction, LessThanZero, LessThanOne, Equal, ALUSrc, RegDst, ALUOp, MemRead, MemWrite, StoreMux, RegWrite, 
                MemToReg, LoadMux, PCSource, Jump, Shift, clk, Stall, small_big_32_MUX, small_big_16_MUX, readSAD, small_big_regFile, 
                SAD_RegFile_write, small_big_find, read_min, write_min);*/
Controller ID8(Instruction_ID, LessThanZeroWire_ID, LessThanOneWire_ID, EqualWire_ID, ALUSrc_ID, RegDst_ID, ALUOp_ID, MemRead_ID, MemWrite_ID,
                StoreMux_ID, RegWrite_ID, MemToReg_ID, LoadMux_ID, PCSource_ID, Jump_ID, Shift_ID,clk, Stall, small_big_32_MUX_ID, small_big_16_MUX_ID,
                readSAD_ID, small_big_regFile_ID, SAD_RegFile_write_ID, small_big_find_ID, read_min_ID, write_min_ID);
/*StallMux( ALUSrc_in, Shift_in, RegDst_in, ALUOp_in, MemRead_in, MemWrite_in,StoreMux_in, RegWrite_in, MemToReg_in, LoadMux_in,
              ALUSrc_out, Shift_out, RegDst_out, ALUOp_out, MemRead_out, MemWrite_out,StoreMux_out, RegWrite_out, MemToReg_out, LoadMux_out, stall, 
              small_big_32_MUX_in, readSAD_in, small_big_16_MUX_in, small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, 
              read_min_in, write_min_in, small_big_32_MUX_out, readSAD_out, small_big_16_MUX_out, small_big_regFile_out, SAD_RegFile_write_out, 
              small_big_find_out, read_min_out, write_min_out)*/
StallMux StallThis( ALUSrc_ID, Shift_ID, RegDst_ID, ALUOp_ID, MemRead_ID, MemWrite_ID,StoreMux_ID, RegWrite_ID, MemToReg_ID, LoadMux_ID,
              ALUSrc_extra, Shift_extra, RegDst_extra, ALUOp_extra, MemRead_extra, MemWrite_extra,StoreMux_extra, RegWrite_extra, MemToReg_extra, LoadMux_extra, Stall,
              small_big_32_MUX_ID, readSAD_ID, small_big_16_MUX_ID, small_big_regFile_ID, SAD_RegFile_write_ID, small_big_find_ID, 
              read_min_ID, write_min_ID, small_big_32_MUX_extra, readSAD_extra, small_big_16_MUX_extra, small_big_regFile_extra, SAD_RegFile_write_extra, 
              small_big_find_extra, read_min_extra, write_min_extra);
/*ID_EX(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, MemWrite_in, MemWrite_out, 
            MemRead_in, MemRead_out, StoreMux_in,StoreMux_out, ALUSrc_in, ALUSrc_out, RgDst_in, RgDst_out, ALUOp_in, ALUOp_out, 
            RsContent_in, RsContent_out, RtContent_in, RtContent_out, RtAddress_in, RtAddress_out, RdAddress_in, RdAddress_out, 
            PCplus4_in, PCplus4_out, ImmediateEx_in, ImmediateEx_out, Shift_in, Shift_out, RsAddress_in, RsAddress_out,
            small_big_32_MUX_in, readSAD_in, small_big_16_MUX_in, small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in, 
            small_big_32_MUX_out, readSAD_out, small_big_16_MUX_out, small_big_regFile_out, SAD_RegFile_write_out, 
            small_big_find_out, read_min_out, write_min_out);*/
ID_EX ID9(clk, rst, LoadMux_extra, LoadMux_EX, MemToReg_extra, MemToReg_EX, RegWrite_extra, RegWrite_EX, MemWrite_extra, MemWrite_EX, 
            MemRead_extra, MemRead_EX, StoreMux_extra, StoreMux_EX, ALUSrc_extra, ALUSrc_EX, RegDst_extra, RegDst_EX, ALUOp_extra, ALUOp_EX, 
            Rs_ID, Rs_EX, Rt_ID, Rt_EX, Instruction_ID[20:16], RtAddress_EX, Instruction_ID[15:11], RdAddress_EX, 
            PC_plus_4_ID, PC_plus_4_EX, ImmediateExtended_ID, ImmediateExtended_EX, Shift_extra, Shift_EX, Instruction_ID[25:21], RsAddress_EX,
            small_big_32_MUX_extra, readSAD_extra, small_big_16_MUX_extra, small_big_regFile_extra, SAD_RegFile_write_extra, small_big_find_extra, read_min_extra, write_min_extra, 
            small_big_32_MUX_EX, readSAD_EX, small_big_16_MUX_EX, small_big_regFile_EX, SAD_RegFile_write_EX, 
            small_big_find_EX, read_min_EX, write_min_EX);
            
/////////////////////////////////////EX stage////////////////////////////////
//module Forwarding_Unit(RegWrite_MEM, RsAddress_EX, RdAddress_MEM, RtAddress_EX, RegWrite_WB, RdAddress_WB, muxVal_1, muxVal_2, RsAddress_ID, RtAddress_ID, selMux_RsID, selMux_RtID);
Forwarding_Unit Forwardthis(RegWrite_Mem, RsAddress_EX, RdAddress_Mem, RtAddress_EX, RegWrite_WB, RdAddress_WB, selSrc1_EX, selSrc2_EX, Instruction_ID[25:21], Instruction_ID[20:16], selMux_RsID, selMux_RtID);
//Mux32Bit3To1Normal(out, inA, inB, inC, sel);
Mux32Bit3To1Normal Forwardngselect1(Wire1_EX, Rs_EX, MemToRegWire_WB, ALURes_Mem , selSrc1_EX);
//Mux32Bit3To1Normal(out, inA, inB, inC, sel);
Mux32Bit3To1Normal Forwardngselect2(Wire2_EX, Rt_EX, MemToRegWire_WB, ALURes_Mem , selSrc2_EX);
//Mux32Bit2To1(out, inA, inB, sel);
Mux32Bit2To1 EX0(ALUSrcWire_EX, Wire2_EX, ImmediateExtended_EX, ALUSrc_EX); // Rt_EX change it to Wire2_EX to activate FU
//Mux32Bit2To1(out, inA, inB, sel);
Mux32Bit2To1 EXShift(ALUShiftWire_EX, Wire1_EX, {27'b0,ImmediateExtended_EX[10:6]}, Shift_EX); // Rs_EX change it to Wire1_EX to activate FU
//ALUController(ALUOp, Instruction, ALUControl);
ALUController EX1(ALUOp_EX, ImmediateExtended_EX, ALUControl_EX);
//ALU32Bit(ALUControl, A, B, ALUResult, Zero)
ALU32Bit EX2(ALUControl_EX, ALUShiftWire_EX, ALUSrcWire_EX, ALURes_EX, Zero_EX);
//Mux32Bit3To1RegDst(out, inA, inB, sel)
Mux32Bit3To1RegDst EX3(NewRdAddress_EX, RtAddress_EX, RdAddress_EX, RegDst_EX, RdAddress_EX);
/* Big_Address(current_address, address_0, address_1, address_2, address_3, address_4, address_5, address_6, 
                        address_7, address_8, address_9, address_10, address_11, address_12, address_13, address_14, address_15,  w_address_0, w_address_1, w_address_2, w_address_3, w_address_4, w_address_5, w_address_6, w_address_7, w_address_8, w_address_9, w_address_10, 
                    w_address_11, w_address_12, w_address_13, w_address_14, w_address_15);*/
Big_Address Competition1(Wire1_EX, Big_Address_Wire_16_EX, Big_Address_Wire_17_EX, Big_Address_Wire_18_EX, Big_Address_Wire_19_EX, Big_Address_Wire_20_EX, Big_Address_Wire_21_EX, Big_Address_Wire_22_EX, Big_Address_Wire_23_EX, Big_Address_Wire_24_EX, Big_Address_Wire_25_EX, Big_Address_Wire_26_EX, Big_Address_Wire_27_EX, Big_Address_Wire_28_EX, Big_Address_Wire_29_EX, Big_Address_Wire_30_EX, Big_Address_Wire_31_EX, Big_Address_Wire_0_EX, Big_Address_Wire_1_EX, Big_Address_Wire_2_EX, Big_Address_Wire_3_EX, Big_Address_Wire_4_EX, Big_Address_Wire_5_EX, Big_Address_Wire_6_EX, Big_Address_Wire_7_EX, Big_Address_Wire_8_EX, Big_Address_Wire_9_EX, Big_Address_Wire_10_EX, Big_Address_Wire_11_EX, Big_Address_Wire_12_EX, Big_Address_Wire_13_EX, Big_Address_Wire_14_EX, Big_Address_Wire_15_EX );
/*module Small_Address(current_address, address_0, address_1, address_2, address_3, address_4, address_5, address_6, 
                    address_7, address_8, address_9, address_10, address_11, address_12, address_13, address_14, address_15, address_16, address_17, 
                    address_18, address_19, address_20, address_21, address_22, address_23, address_24, address_25, address_26, address_27, address_28, 
                    address_29, address_30, address_31);*/
Small_Address Competition2(Wire1_EX, Small_Address_Wire_0_EX, Small_Address_Wire_1_EX, Small_Address_Wire_2_EX, Small_Address_Wire_3_EX, Small_Address_Wire_4_EX, Small_Address_Wire_5_EX, Small_Address_Wire_6_EX, Small_Address_Wire_7_EX, Small_Address_Wire_8_EX, Small_Address_Wire_9_EX, Small_Address_Wire_10_EX, Small_Address_Wire_11_EX, Small_Address_Wire_12_EX, Small_Address_Wire_13_EX, Small_Address_Wire_14_EX, Small_Address_Wire_15_EX, Small_Address_Wire_16_EX, Small_Address_Wire_17_EX, Small_Address_Wire_18_EX, Small_Address_Wire_19_EX, Small_Address_Wire_20_EX, Small_Address_Wire_21_EX, Small_Address_Wire_22_EX, Small_Address_Wire_23_EX, Small_Address_Wire_24_EX, Small_Address_Wire_25_EX, Small_Address_Wire_26_EX, Small_Address_Wire_27_EX, Small_Address_Wire_28_EX, Small_Address_Wire_29_EX, Small_Address_Wire_30_EX, Small_Address_Wire_31_EX);
/*module Mux64to32(inputf32IN0, inputf32IN1, inputf32IN2, inputf32IN3, inputf32IN4, inputf32IN5, inputf32IN6, inputf32IN7, inputf32IN8, inputf32IN9, inputf32IN10, inputf32IN11, inputf32IN12, inputf32IN13, inputf32IN14, inputf32IN15, inputf32IN16, inputf32IN17, inputf32IN18, inputf32IN19, inputf32IN20, inputf32IN21, inputf32IN22, inputf32IN23, inputf32IN24, inputf32IN25, inputf32IN26, inputf32IN27, inputf32IN28, inputf32IN29, inputf32IN30, inputf32IN31, inputs32IN0, inputs32IN1, inputs32IN2, inputs32IN3, inputs32IN4, inputs32IN5, inputs32IN6, inputs32IN7, inputs32IN8, inputs32IN9, inputs32IN10, inputs32IN11, inputs32IN12, inputs32IN13, inputs32IN14, inputs32IN15, inputs32IN16, inputs32IN17, inputs32IN18, inputs32IN19, inputs32IN20, inputs32IN21, inputs32IN22, inputs32IN23, inputs32IN24, inputs32IN25, inputs32IN26, inputs32IN27, inputs32IN28, inputs32IN29, inputs32IN30, inputs32IN31
,inputOUT32IN0, inputOUT32IN1, inputOUT32IN2, inputOUT32IN3, inputOUT32IN4, inputOUT32IN5, inputOUT32IN6, inputOUT32IN7, inputOUT32IN8, inputOUT32IN9, inputOUT32IN10, inputOUT32IN11, inputOUT32IN12, inputOUT32IN13, inputOUT32IN14, inputOUT32IN15, inputOUT32IN16, inputOUT32IN17, inputOUT32IN18, inputOUT32IN19, inputOUT32IN20, inputOUT32IN21, inputOUT32IN22, inputOUT32IN23, inputOUT32IN24, inputOUT32IN25, inputOUT32IN26, inputOUT32IN27, inputOUT32IN28, inputOUT32IN29, inputOUT32IN30, inputOUT32IN31, sel);
*/
Mux64to32 Competition3(Big_Address_Wire_0_EX, Big_Address_Wire_1_EX, Big_Address_Wire_2_EX, Big_Address_Wire_3_EX, Big_Address_Wire_4_EX, Big_Address_Wire_5_EX, Big_Address_Wire_6_EX, Big_Address_Wire_7_EX, Big_Address_Wire_8_EX, Big_Address_Wire_9_EX, Big_Address_Wire_10_EX, Big_Address_Wire_11_EX, Big_Address_Wire_12_EX, Big_Address_Wire_13_EX, Big_Address_Wire_14_EX, Big_Address_Wire_15_EX, Big_Address_Wire_16_EX, Big_Address_Wire_17_EX, Big_Address_Wire_18_EX, Big_Address_Wire_19_EX, Big_Address_Wire_20_EX, Big_Address_Wire_21_EX, Big_Address_Wire_22_EX, Big_Address_Wire_23_EX, Big_Address_Wire_24_EX, Big_Address_Wire_25_EX, Big_Address_Wire_26_EX, Big_Address_Wire_27_EX, Big_Address_Wire_28_EX, Big_Address_Wire_29_EX, Big_Address_Wire_30_EX, Big_Address_Wire_31_EX,Small_Address_Wire_0_EX, Small_Address_Wire_1_EX, Small_Address_Wire_2_EX, Small_Address_Wire_3_EX, Small_Address_Wire_4_EX, Small_Address_Wire_5_EX, Small_Address_Wire_6_EX, Small_Address_Wire_7_EX, Small_Address_Wire_8_EX, Small_Address_Wire_9_EX, Small_Address_Wire_10_EX, Small_Address_Wire_11_EX, Small_Address_Wire_12_EX, Small_Address_Wire_13_EX, Small_Address_Wire_14_EX, Small_Address_Wire_15_EX, Small_Address_Wire_16_EX, Small_Address_Wire_17_EX, Small_Address_Wire_18_EX, Small_Address_Wire_19_EX, Small_Address_Wire_20_EX, Small_Address_Wire_21_EX, Small_Address_Wire_22_EX, Small_Address_Wire_23_EX, Small_Address_Wire_24_EX, Small_Address_Wire_25_EX, Small_Address_Wire_26_EX, Small_Address_Wire_27_EX, Small_Address_Wire_28_EX, Small_Address_Wire_29_EX, Small_Address_Wire_30_EX, Small_Address_Wire_31_EX, Mux_Address_Wire_0_EX, Mux_Address_Wire_1_EX, Mux_Address_Wire_2_EX, Mux_Address_Wire_3_EX, Mux_Address_Wire_4_EX, Mux_Address_Wire_5_EX, Mux_Address_Wire_6_EX, Mux_Address_Wire_7_EX, Mux_Address_Wire_8_EX, Mux_Address_Wire_9_EX, Mux_Address_Wire_10_EX, Mux_Address_Wire_11_EX, Mux_Address_Wire_12_EX, Mux_Address_Wire_13_EX, Mux_Address_Wire_14_EX, Mux_Address_Wire_15_EX, Mux_Address_Wire_16_EX, Mux_Address_Wire_17_EX, Mux_Address_Wire_18_EX, Mux_Address_Wire_19_EX, Mux_Address_Wire_20_EX, Mux_Address_Wire_21_EX, Mux_Address_Wire_22_EX, Mux_Address_Wire_23_EX, Mux_Address_Wire_24_EX, Mux_Address_Wire_25_EX, Mux_Address_Wire_26_EX, Mux_Address_Wire_27_EX, Mux_Address_Wire_28_EX, Mux_Address_Wire_29_EX, Mux_Address_Wire_30_EX, Mux_Address_Wire_31_EX, small_big_32_MUX_EX);
/*module RegFile_W0(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/
RegFile_W0 CompetitionRegFileWindow(clk, small_big_regFile_WB, Data_Memory_Wire_0_WB, Data_Memory_Wire_1_WB, Data_Memory_Wire_2_WB, Data_Memory_Wire_3_WB, Data_Memory_Wire_4_WB, Data_Memory_Wire_5_WB, Data_Memory_Wire_6_WB, Data_Memory_Wire_7_WB, Data_Memory_Wire_8_WB, Data_Memory_Wire_9_WB, Data_Memory_Wire_10_WB, Data_Memory_Wire_11_WB, Data_Memory_Wire_12_WB, Data_Memory_Wire_13_WB, Data_Memory_Wire_14_WB, Data_Memory_Wire_15_WB,
            Window_Wire_0_EX, Window_Wire_1_EX, Window_Wire_2_EX, Window_Wire_3_EX, Window_Wire_4_EX, Window_Wire_5_EX, Window_Wire_6_EX, Window_Wire_7_EX, Window_Wire_8_EX, Window_Wire_9_EX, Window_Wire_10_EX, Window_Wire_11_EX, Window_Wire_12_EX, Window_Wire_13_EX, Window_Wire_14_EX, Window_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module RegFile_W0(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/
RegFile_W0 CompetitionRegFile0(clk, small_big_regFile_WB, Data_Memory_Wire_16_WB, Data_Memory_Wire_17_WB, Data_Memory_Wire_18_WB, Data_Memory_Wire_19_WB, Data_Memory_Wire_20_WB, Data_Memory_Wire_21_WB, Data_Memory_Wire_22_WB, Data_Memory_Wire_23_WB, Data_Memory_Wire_24_WB, Data_Memory_Wire_25_WB, Data_Memory_Wire_26_WB, Data_Memory_Wire_27_WB, Data_Memory_Wire_28_WB, Data_Memory_Wire_29_WB, Data_Memory_Wire_30_WB, Data_Memory_Wire_31_WB,
            RegFile0_Wire_0_EX, RegFile0_Wire_1_EX, RegFile0_Wire_2_EX, RegFile0_Wire_3_EX, RegFile0_Wire_4_EX, RegFile0_Wire_5_EX, RegFile0_Wire_6_EX, RegFile0_Wire_7_EX, RegFile0_Wire_8_EX, RegFile0_Wire_9_EX, RegFile0_Wire_10_EX, RegFile0_Wire_11_EX, RegFile0_Wire_12_EX, RegFile0_Wire_13_EX, RegFile0_Wire_14_EX, RegFile0_Wire_15_EX,
            SAD_RegFile_write_WB);    
/*RegFile_1(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);     */
RegFile_1 CompetitionRegFile1(clk, small_big_regFile_WB, Data_Memory_Wire_17_WB, Data_Memory_Wire_18_WB, Data_Memory_Wire_19_WB, Data_Memory_Wire_0_WB, Data_Memory_Wire_21_WB, Data_Memory_Wire_22_WB, Data_Memory_Wire_23_WB, Data_Memory_Wire_4_WB, Data_Memory_Wire_25_WB, Data_Memory_Wire_26_WB, Data_Memory_Wire_27_WB, Data_Memory_Wire_8_WB,Data_Memory_Wire_29_WB, Data_Memory_Wire_30_WB, Data_Memory_Wire_31_WB,Data_Memory_Wire_12_WB,
            RegFile1_Wire_0_EX, RegFile1_Wire_1_EX, RegFile1_Wire_2_EX, RegFile1_Wire_3_EX, RegFile1_Wire_4_EX, RegFile1_Wire_5_EX, RegFile1_Wire_6_EX, RegFile1_Wire_7_EX, RegFile1_Wire_8_EX, RegFile1_Wire_9_EX, RegFile1_Wire_10_EX, RegFile1_Wire_11_EX, RegFile1_Wire_12_EX, RegFile1_Wire_13_EX, RegFile1_Wire_14_EX, RegFile1_Wire_15_EX,  
            SAD_RegFile_write_WB);  
/* module RegFile_2(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);
                */
RegFile_2 CompetitionRegFile2(clk, small_big_regFile_WB, Data_Memory_Wire_18_WB, Data_Memory_Wire_19_WB, Data_Memory_Wire_0_WB, Data_Memory_Wire_1_WB, Data_Memory_Wire_22_WB, Data_Memory_Wire_23_WB, Data_Memory_Wire_4_WB, Data_Memory_Wire_5_WB, Data_Memory_Wire_26_WB, Data_Memory_Wire_27_WB, Data_Memory_Wire_8_WB, Data_Memory_Wire_9_WB,Data_Memory_Wire_30_WB, Data_Memory_Wire_31_WB, Data_Memory_Wire_12_WB,Data_Memory_Wire_13_WB,
            RegFile2_Wire_0_EX, RegFile2_Wire_1_EX, RegFile2_Wire_2_EX, RegFile2_Wire_3_EX, RegFile2_Wire_4_EX, RegFile2_Wire_5_EX, RegFile2_Wire_6_EX, RegFile2_Wire_7_EX, RegFile2_Wire_8_EX, RegFile2_Wire_9_EX, RegFile2_Wire_10_EX, RegFile2_Wire_11_EX, RegFile2_Wire_12_EX, RegFile2_Wire_13_EX, RegFile2_Wire_14_EX, RegFile2_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module RegFile_3(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/            
RegFile_3 CompetitionRegFile3(clk, small_big_regFile_WB, Data_Memory_Wire_19_WB, Data_Memory_Wire_0_WB, Data_Memory_Wire_1_WB, Data_Memory_Wire_2_WB, Data_Memory_Wire_23_WB, Data_Memory_Wire_4_WB, Data_Memory_Wire_5_WB, Data_Memory_Wire_6_WB, Data_Memory_Wire_27_WB, Data_Memory_Wire_8_WB, Data_Memory_Wire_9_WB, Data_Memory_Wire_10_WB,Data_Memory_Wire_31_WB, Data_Memory_Wire_12_WB, Data_Memory_Wire_13_WB,Data_Memory_Wire_14_WB,
            RegFile3_Wire_0_EX, RegFile3_Wire_1_EX, RegFile3_Wire_2_EX, RegFile3_Wire_3_EX, RegFile3_Wire_4_EX, RegFile3_Wire_5_EX, RegFile3_Wire_6_EX, RegFile3_Wire_7_EX, RegFile3_Wire_8_EX, RegFile3_Wire_9_EX, RegFile3_Wire_10_EX, RegFile3_Wire_11_EX, RegFile3_Wire_12_EX, RegFile3_Wire_13_EX, RegFile3_Wire_14_EX, RegFile3_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module RegFile_45678(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/
RegFile_45678 CompetitionRegFile4(clk, small_big_regFile_WB, Data_Memory_Wire_0_WB, Data_Memory_Wire_1_WB, Data_Memory_Wire_2_WB, Data_Memory_Wire_3_WB, Data_Memory_Wire_4_WB, Data_Memory_Wire_5_WB, Data_Memory_Wire_6_WB, Data_Memory_Wire_7_WB, Data_Memory_Wire_8_WB, Data_Memory_Wire_9_WB, Data_Memory_Wire_10_WB, Data_Memory_Wire_11_WB, Data_Memory_Wire_12_WB, Data_Memory_Wire_13_WB, Data_Memory_Wire_14_WB, Data_Memory_Wire_15_WB,
            RegFile4_Wire_0_EX, RegFile4_Wire_1_EX, RegFile4_Wire_2_EX, RegFile4_Wire_3_EX, RegFile4_Wire_4_EX, RegFile4_Wire_5_EX, RegFile4_Wire_6_EX, RegFile4_Wire_7_EX, RegFile4_Wire_8_EX, RegFile4_Wire_9_EX, RegFile4_Wire_10_EX, RegFile4_Wire_11_EX, RegFile4_Wire_12_EX, RegFile4_Wire_13_EX, RegFile4_Wire_14_EX, RegFile4_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module RegFile_45678(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/
RegFile_45678 CompetitionRegFile5(clk, small_big_regFile_WB, Data_Memory_Wire_1_WB, Data_Memory_Wire_2_WB, Data_Memory_Wire_3_WB, Data_Memory_Wire_16_WB, Data_Memory_Wire_5_WB, Data_Memory_Wire_6_WB, Data_Memory_Wire_7_WB, Data_Memory_Wire_20_WB, Data_Memory_Wire_9_WB, Data_Memory_Wire_10_WB, Data_Memory_Wire_11_WB, Data_Memory_Wire_24_WB, Data_Memory_Wire_13_WB, Data_Memory_Wire_14_WB, Data_Memory_Wire_15_WB, Data_Memory_Wire_28_WB,
            RegFile5_Wire_0_EX, RegFile5_Wire_1_EX, RegFile5_Wire_2_EX, RegFile5_Wire_3_EX, RegFile5_Wire_4_EX, RegFile5_Wire_5_EX, RegFile5_Wire_6_EX, RegFile5_Wire_7_EX, RegFile5_Wire_8_EX, RegFile5_Wire_9_EX, RegFile5_Wire_10_EX, RegFile5_Wire_11_EX, RegFile5_Wire_12_EX, RegFile5_Wire_13_EX, RegFile5_Wire_14_EX, RegFile5_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module RegFile_45678(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/
RegFile_45678 CompetitionRegFile6(clk, small_big_regFile_WB, Data_Memory_Wire_2_WB, Data_Memory_Wire_3_WB, Data_Memory_Wire_16_WB, Data_Memory_Wire_17_WB, Data_Memory_Wire_6_WB, Data_Memory_Wire_7_WB, Data_Memory_Wire_20_WB, Data_Memory_Wire_21_WB, Data_Memory_Wire_10_WB, Data_Memory_Wire_11_WB, Data_Memory_Wire_24_WB, Data_Memory_Wire_25_WB, Data_Memory_Wire_14_WB, Data_Memory_Wire_15_WB, Data_Memory_Wire_28_WB, Data_Memory_Wire_29_WB,
            RegFile6_Wire_0_EX, RegFile6_Wire_1_EX, RegFile6_Wire_2_EX, RegFile6_Wire_3_EX, RegFile6_Wire_4_EX, RegFile6_Wire_5_EX, RegFile6_Wire_6_EX, RegFile6_Wire_7_EX, RegFile6_Wire_8_EX, RegFile6_Wire_9_EX, RegFile6_Wire_10_EX, RegFile6_Wire_11_EX, RegFile6_Wire_12_EX, RegFile6_Wire_13_EX, RegFile6_Wire_14_EX, RegFile6_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module RegFile_45678(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/
RegFile_45678 CompetitionRegFile7(clk, small_big_regFile_WB, Data_Memory_Wire_3_WB, Data_Memory_Wire_16_WB, Data_Memory_Wire_17_WB, Data_Memory_Wire_18_WB, Data_Memory_Wire_7_WB, Data_Memory_Wire_20_WB, Data_Memory_Wire_21_WB, Data_Memory_Wire_22_WB, Data_Memory_Wire_11_WB, Data_Memory_Wire_24_WB, Data_Memory_Wire_25_WB, Data_Memory_Wire_26_WB, Data_Memory_Wire_15_WB, Data_Memory_Wire_28_WB, Data_Memory_Wire_29_WB, Data_Memory_Wire_30_WB,
            RegFile7_Wire_0_EX, RegFile7_Wire_1_EX, RegFile7_Wire_2_EX, RegFile7_Wire_3_EX, RegFile7_Wire_4_EX, RegFile7_Wire_5_EX, RegFile7_Wire_6_EX, RegFile7_Wire_7_EX, RegFile7_Wire_8_EX, RegFile7_Wire_9_EX, RegFile7_Wire_10_EX, RegFile7_Wire_11_EX, RegFile7_Wire_12_EX, RegFile7_Wire_13_EX, RegFile7_Wire_14_EX, RegFile7_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module RegFile_45678(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);*/
RegFile_45678 CompetitionRegFile8(clk, small_big_regFile_WB, Data_Memory_Wire_16_WB, Data_Memory_Wire_17_WB, Data_Memory_Wire_18_WB, Data_Memory_Wire_19_WB, Data_Memory_Wire_20_WB, Data_Memory_Wire_21_WB, Data_Memory_Wire_22_WB, Data_Memory_Wire_23_WB, Data_Memory_Wire_24_WB, Data_Memory_Wire_25_WB, Data_Memory_Wire_26_WB, Data_Memory_Wire_27_WB, Data_Memory_Wire_28_WB, Data_Memory_Wire_29_WB, Data_Memory_Wire_30_WB, Data_Memory_Wire_31_WB,
            RegFile8_Wire_0_EX, RegFile8_Wire_1_EX, RegFile8_Wire_2_EX, RegFile8_Wire_3_EX, RegFile8_Wire_4_EX, RegFile8_Wire_5_EX, RegFile8_Wire_6_EX, RegFile8_Wire_7_EX, RegFile8_Wire_8_EX, RegFile8_Wire_9_EX, RegFile8_Wire_10_EX, RegFile8_Wire_11_EX, RegFile8_Wire_12_EX, RegFile8_Wire_13_EX, RegFile8_Wire_14_EX, RegFile8_Wire_15_EX,
            SAD_RegFile_write_WB);
/*module EX_Mem(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, MemWrite_in, MemWrite_out, 
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
            RegFile8_Wire_0_out, RegFile8_Wire_1_out, RegFile8_Wire_2_out, RegFile8_Wire_3_out, RegFile8_Wire_4_out, RegFile8_Wire_5_out, RegFile8_Wire_6_out, RegFile8_Wire_7_out, RegFile8_Wire_8_out, RegFile8_Wire_9_out, RegFile8_Wire_10_out, RegFile8_Wire_11_out, RegFile8_Wire_12_out, RegFile8_Wire_13_out, RegFile8_Wire_14_out, RegFile8_Wire_15_out
            Rs_in, Rs_out);*/
EX_Mem EX4(clk, rst, LoadMux_EX, LoadMux_Mem, MemToReg_EX, MemToReg_Mem, RegWrite_EX, RegWrite_Mem, MemWrite_EX, MemWrite_Mem, 
            MemRead_EX, MemRead_Mem, StoreMux_EX,StoreMux_Mem, ALURes_EX, ALURes_Mem, Wire2_EX, Rt_Mem, NewRdAddress_EX,
            RdAddress_Mem, PC_plus_4_EX, PC_plus_4_Mem, Mux_Address_Wire_0_EX, Mux_Address_Wire_1_EX, Mux_Address_Wire_2_EX, Mux_Address_Wire_3_EX, Mux_Address_Wire_4_EX, Mux_Address_Wire_5_EX, Mux_Address_Wire_6_EX, Mux_Address_Wire_7_EX, Mux_Address_Wire_8_EX, Mux_Address_Wire_9_EX, Mux_Address_Wire_10_EX, Mux_Address_Wire_11_EX, Mux_Address_Wire_12_EX, Mux_Address_Wire_13_EX, Mux_Address_Wire_14_EX, Mux_Address_Wire_15_EX, Mux_Address_Wire_16_EX, Mux_Address_Wire_17_EX, Mux_Address_Wire_18_EX, Mux_Address_Wire_19_EX, Mux_Address_Wire_20_EX, Mux_Address_Wire_21_EX, Mux_Address_Wire_22_EX, Mux_Address_Wire_23_EX, Mux_Address_Wire_24_EX, Mux_Address_Wire_25_EX, Mux_Address_Wire_26_EX, Mux_Address_Wire_27_EX, Mux_Address_Wire_28_EX, Mux_Address_Wire_29_EX, Mux_Address_Wire_30_EX, Mux_Address_Wire_31_EX,
            Mux_Address_Wire_0_MEM, Mux_Address_Wire_1_MEM, Mux_Address_Wire_2_MEM, Mux_Address_Wire_3_MEM, Mux_Address_Wire_4_MEM, Mux_Address_Wire_5_MEM, Mux_Address_Wire_6_MEM, Mux_Address_Wire_7_MEM, Mux_Address_Wire_8_MEM, Mux_Address_Wire_9_MEM, Mux_Address_Wire_10_MEM, Mux_Address_Wire_11_MEM, Mux_Address_Wire_12_MEM, Mux_Address_Wire_13_MEM, Mux_Address_Wire_14_MEM, Mux_Address_Wire_15_MEM, Mux_Address_Wire_16_MEM, Mux_Address_Wire_17_MEM, Mux_Address_Wire_18_MEM, Mux_Address_Wire_19_MEM, Mux_Address_Wire_20_MEM, Mux_Address_Wire_21_MEM, Mux_Address_Wire_22_MEM, Mux_Address_Wire_23_MEM, Mux_Address_Wire_24_MEM, Mux_Address_Wire_25_MEM, Mux_Address_Wire_26_MEM, Mux_Address_Wire_27_MEM, Mux_Address_Wire_28_MEM, Mux_Address_Wire_29_MEM, Mux_Address_Wire_30_MEM, Mux_Address_Wire_31_MEM,
            readSAD_EX, small_big_16_MUX_EX, small_big_regFile_EX, SAD_RegFile_write_EX, small_big_find_EX, read_min_EX, write_min_EX,
            readSAD_Mem, small_big_16_MUX_Mem, small_big_regFile_Mem, SAD_RegFile_write_Mem, small_big_find_Mem, read_min_Mem, write_min_Mem,
            Window_Wire_0_EX, Window_Wire_1_EX, Window_Wire_2_EX, Window_Wire_3_EX, Window_Wire_4_EX, Window_Wire_5_EX, Window_Wire_6_EX, Window_Wire_7_EX, Window_Wire_8_EX, Window_Wire_9_EX, Window_Wire_10_EX, Window_Wire_11_EX, Window_Wire_12_EX, Window_Wire_13_EX, Window_Wire_14_EX, Window_Wire_15_EX,
            RegFile0_Wire_0_EX, RegFile0_Wire_1_EX, RegFile0_Wire_2_EX, RegFile0_Wire_3_EX, RegFile0_Wire_4_EX, RegFile0_Wire_5_EX, RegFile0_Wire_6_EX, RegFile0_Wire_7_EX, RegFile0_Wire_8_EX, RegFile0_Wire_9_EX, RegFile0_Wire_10_EX, RegFile0_Wire_11_EX, RegFile0_Wire_12_EX, RegFile0_Wire_13_EX, RegFile0_Wire_14_EX, RegFile0_Wire_15_EX,
            RegFile1_Wire_0_EX, RegFile1_Wire_1_EX, RegFile1_Wire_2_EX, RegFile1_Wire_3_EX, RegFile1_Wire_4_EX, RegFile1_Wire_5_EX, RegFile1_Wire_6_EX, RegFile1_Wire_7_EX, RegFile1_Wire_8_EX, RegFile1_Wire_9_EX, RegFile1_Wire_10_EX, RegFile1_Wire_11_EX, RegFile1_Wire_12_EX, RegFile1_Wire_13_EX, RegFile1_Wire_14_EX, RegFile1_Wire_15_EX,  
            RegFile2_Wire_0_EX, RegFile2_Wire_1_EX, RegFile2_Wire_2_EX, RegFile2_Wire_3_EX, RegFile2_Wire_4_EX, RegFile2_Wire_5_EX, RegFile2_Wire_6_EX, RegFile2_Wire_7_EX, RegFile2_Wire_8_EX, RegFile2_Wire_9_EX, RegFile2_Wire_10_EX, RegFile2_Wire_11_EX, RegFile2_Wire_12_EX, RegFile2_Wire_13_EX, RegFile2_Wire_14_EX, RegFile2_Wire_15_EX,
            RegFile3_Wire_0_EX, RegFile3_Wire_1_EX, RegFile3_Wire_2_EX, RegFile3_Wire_3_EX, RegFile3_Wire_4_EX, RegFile3_Wire_5_EX, RegFile3_Wire_6_EX, RegFile3_Wire_7_EX, RegFile3_Wire_8_EX, RegFile3_Wire_9_EX, RegFile3_Wire_10_EX, RegFile3_Wire_11_EX, RegFile3_Wire_12_EX, RegFile3_Wire_13_EX, RegFile3_Wire_14_EX, RegFile3_Wire_15_EX,
            RegFile4_Wire_0_EX, RegFile4_Wire_1_EX, RegFile4_Wire_2_EX, RegFile4_Wire_3_EX, RegFile4_Wire_4_EX, RegFile4_Wire_5_EX, RegFile4_Wire_6_EX, RegFile4_Wire_7_EX, RegFile4_Wire_8_EX, RegFile4_Wire_9_EX, RegFile4_Wire_10_EX, RegFile4_Wire_11_EX, RegFile4_Wire_12_EX, RegFile4_Wire_13_EX, RegFile4_Wire_14_EX, RegFile4_Wire_15_EX,
            RegFile5_Wire_0_EX, RegFile5_Wire_1_EX, RegFile5_Wire_2_EX, RegFile5_Wire_3_EX, RegFile5_Wire_4_EX, RegFile5_Wire_5_EX, RegFile5_Wire_6_EX, RegFile5_Wire_7_EX, RegFile5_Wire_8_EX, RegFile5_Wire_9_EX, RegFile5_Wire_10_EX, RegFile5_Wire_11_EX, RegFile5_Wire_12_EX, RegFile5_Wire_13_EX, RegFile5_Wire_14_EX, RegFile5_Wire_15_EX,
            RegFile6_Wire_0_EX, RegFile6_Wire_1_EX, RegFile6_Wire_2_EX, RegFile6_Wire_3_EX, RegFile6_Wire_4_EX, RegFile6_Wire_5_EX, RegFile6_Wire_6_EX, RegFile6_Wire_7_EX, RegFile6_Wire_8_EX, RegFile6_Wire_9_EX, RegFile6_Wire_10_EX, RegFile6_Wire_11_EX, RegFile6_Wire_12_EX, RegFile6_Wire_13_EX, RegFile6_Wire_14_EX, RegFile6_Wire_15_EX,
            RegFile7_Wire_0_EX, RegFile7_Wire_1_EX, RegFile7_Wire_2_EX, RegFile7_Wire_3_EX, RegFile7_Wire_4_EX, RegFile7_Wire_5_EX, RegFile7_Wire_6_EX, RegFile7_Wire_7_EX, RegFile7_Wire_8_EX, RegFile7_Wire_9_EX, RegFile7_Wire_10_EX, RegFile7_Wire_11_EX, RegFile7_Wire_12_EX, RegFile7_Wire_13_EX, RegFile7_Wire_14_EX, RegFile7_Wire_15_EX,
            RegFile8_Wire_0_EX, RegFile8_Wire_1_EX, RegFile8_Wire_2_EX, RegFile8_Wire_3_EX, RegFile8_Wire_4_EX, RegFile8_Wire_5_EX, RegFile8_Wire_6_EX, RegFile8_Wire_7_EX, RegFile8_Wire_8_EX, RegFile8_Wire_9_EX, RegFile8_Wire_10_EX, RegFile8_Wire_11_EX, RegFile8_Wire_12_EX, RegFile8_Wire_13_EX, RegFile8_Wire_14_EX, RegFile8_Wire_15_EX,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            RegFile0_Wire_0_Mem, RegFile0_Wire_1_Mem, RegFile0_Wire_2_Mem, RegFile0_Wire_3_Mem, RegFile0_Wire_4_Mem, RegFile0_Wire_5_Mem, RegFile0_Wire_6_Mem, RegFile0_Wire_7_Mem, RegFile0_Wire_8_Mem, RegFile0_Wire_9_Mem, RegFile0_Wire_10_Mem, RegFile0_Wire_11_Mem, RegFile0_Wire_12_Mem, RegFile0_Wire_13_Mem, RegFile0_Wire_14_Mem, RegFile0_Wire_15_Mem, 
            RegFile1_Wire_0_Mem, RegFile1_Wire_1_Mem, RegFile1_Wire_2_Mem, RegFile1_Wire_3_Mem, RegFile1_Wire_4_Mem, RegFile1_Wire_5_Mem, RegFile1_Wire_6_Mem, RegFile1_Wire_7_Mem, RegFile1_Wire_8_Mem, RegFile1_Wire_9_Mem, RegFile1_Wire_10_Mem, RegFile1_Wire_11_Mem, RegFile1_Wire_12_Mem, RegFile1_Wire_13_Mem, RegFile1_Wire_14_Mem, RegFile1_Wire_15_Mem,
            RegFile2_Wire_0_Mem, RegFile2_Wire_1_Mem, RegFile2_Wire_2_Mem, RegFile2_Wire_3_Mem, RegFile2_Wire_4_Mem, RegFile2_Wire_5_Mem, RegFile2_Wire_6_Mem, RegFile2_Wire_7_Mem, RegFile2_Wire_8_Mem, RegFile2_Wire_9_Mem, RegFile2_Wire_10_Mem, RegFile2_Wire_11_Mem, RegFile2_Wire_12_Mem, RegFile2_Wire_13_Mem, RegFile2_Wire_14_Mem, RegFile2_Wire_15_Mem,
            RegFile3_Wire_0_Mem, RegFile3_Wire_1_Mem, RegFile3_Wire_2_Mem, RegFile3_Wire_3_Mem, RegFile3_Wire_4_Mem, RegFile3_Wire_5_Mem, RegFile3_Wire_6_Mem, RegFile3_Wire_7_Mem, RegFile3_Wire_8_Mem, RegFile3_Wire_9_Mem, RegFile3_Wire_10_Mem, RegFile3_Wire_11_Mem, RegFile3_Wire_12_Mem, RegFile3_Wire_13_Mem, RegFile3_Wire_14_Mem, RegFile3_Wire_15_Mem,
            RegFile4_Wire_0_Mem, RegFile4_Wire_1_Mem, RegFile4_Wire_2_Mem, RegFile4_Wire_3_Mem, RegFile4_Wire_4_Mem, RegFile4_Wire_5_Mem, RegFile4_Wire_6_Mem, RegFile4_Wire_7_Mem, RegFile4_Wire_8_Mem, RegFile4_Wire_9_Mem, RegFile4_Wire_10_Mem, RegFile4_Wire_11_Mem, RegFile4_Wire_12_Mem, RegFile4_Wire_13_Mem, RegFile4_Wire_14_Mem, RegFile4_Wire_15_Mem,
            RegFile5_Wire_0_Mem, RegFile5_Wire_1_Mem, RegFile5_Wire_2_Mem, RegFile5_Wire_3_Mem, RegFile5_Wire_4_Mem, RegFile5_Wire_5_Mem, RegFile5_Wire_6_Mem, RegFile5_Wire_7_Mem, RegFile5_Wire_8_Mem, RegFile5_Wire_9_Mem, RegFile5_Wire_10_Mem, RegFile5_Wire_11_Mem, RegFile5_Wire_12_Mem, RegFile5_Wire_13_Mem, RegFile5_Wire_14_Mem, RegFile5_Wire_15_Mem,
            RegFile6_Wire_0_Mem, RegFile6_Wire_1_Mem, RegFile6_Wire_2_Mem, RegFile6_Wire_3_Mem, RegFile6_Wire_4_Mem, RegFile6_Wire_5_Mem, RegFile6_Wire_6_Mem, RegFile6_Wire_7_Mem, RegFile6_Wire_8_Mem, RegFile6_Wire_9_Mem, RegFile6_Wire_10_Mem, RegFile6_Wire_11_Mem, RegFile6_Wire_12_Mem, RegFile6_Wire_13_Mem, RegFile6_Wire_14_Mem, RegFile6_Wire_15_Mem,
            RegFile7_Wire_0_Mem, RegFile7_Wire_1_Mem, RegFile7_Wire_2_Mem, RegFile7_Wire_3_Mem, RegFile7_Wire_4_Mem, RegFile7_Wire_5_Mem, RegFile7_Wire_6_Mem, RegFile7_Wire_7_Mem, RegFile7_Wire_8_Mem, RegFile7_Wire_9_Mem, RegFile7_Wire_10_Mem, RegFile7_Wire_11_Mem, RegFile7_Wire_12_Mem, RegFile7_Wire_13_Mem, RegFile7_Wire_14_Mem, RegFile7_Wire_15_Mem,
            RegFile8_Wire_0_Mem, RegFile8_Wire_1_Mem, RegFile8_Wire_2_Mem, RegFile8_Wire_3_Mem, RegFile8_Wire_4_Mem, RegFile8_Wire_5_Mem, RegFile8_Wire_6_Mem, RegFile8_Wire_7_Mem, RegFile8_Wire_8_Mem, RegFile8_Wire_9_Mem, RegFile8_Wire_10_Mem, RegFile8_Wire_11_Mem, RegFile8_Wire_12_Mem, RegFile8_Wire_13_Mem, RegFile8_Wire_14_Mem, RegFile8_Wire_15_Mem,
            Wire1_EX, Rs_Mem);
            
/////////////////////////////////////Mem stage////////////////////////////////
//Mux32Bit3To1StoreMux(out, inA, sel)
Mux32Bit3To1StoreMux Mem0( WriteData_Mem, Rt_Mem, StoreMux_Mem);
/*module DataMemory(readSAD, address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7,
          address_OUT_0, address_OUT_1, address_OUT_2, address_OUT_3, address_OUT_4, address_OUT_5, address_OUT_6, address_OUT_7, 
          Address, WriteData, MemWrite, MemRead, ReadData, clk); 
    */
DataMemory Mem1Data1(readSAD_Mem, Mux_Address_Wire_0_MEM, Mux_Address_Wire_1_MEM, Mux_Address_Wire_2_MEM, Mux_Address_Wire_3_MEM, 
            Mux_Address_Wire_4_MEM, Mux_Address_Wire_5_MEM, Mux_Address_Wire_6_MEM, Mux_Address_Wire_7_MEM,
            Data_Memory_Wire_0_MEM, Data_Memory_Wire_1_MEM, Data_Memory_Wire_2_MEM, Data_Memory_Wire_3_MEM, Data_Memory_Wire_4_MEM, 
            Data_Memory_Wire_5_MEM, Data_Memory_Wire_6_MEM, Data_Memory_Wire_7_MEM, 
            ALURes_Mem, WriteData_Mem, MemWrite_Mem,  MemRead_Mem, MemoryReadContent_Mem, clk);
/*module SmallDataMemory(readSAD, address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7,
          address_OUT_0, address_OUT_1, address_OUT_2, address_OUT_3, address_OUT_4, address_OUT_5, address_OUT_6, address_OUT_7, 
          Address, WriteData, MemWrite, MemRead, clk); 
    */
SmallDataMemory Mem1Data2(readSAD_Mem, Mux_Address_Wire_8_MEM, 
            Mux_Address_Wire_9_MEM, Mux_Address_Wire_10_MEM, Mux_Address_Wire_11_MEM, Mux_Address_Wire_12_MEM, Mux_Address_Wire_13_MEM, 
            Mux_Address_Wire_14_MEM, Mux_Address_Wire_15_MEM,
            Data_Memory_Wire_8_MEM, Data_Memory_Wire_9_MEM, 
            Data_Memory_Wire_10_MEM, Data_Memory_Wire_11_MEM, Data_Memory_Wire_12_MEM, Data_Memory_Wire_13_MEM, Data_Memory_Wire_14_MEM, 
            Data_Memory_Wire_15_MEM, 
            ALURes_Mem, WriteData_Mem, MemWrite_Mem,  MemRead_Mem, clk);      
/*module SmallDataMemory(readSAD, address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7,
          address_OUT_0, address_OUT_1, address_OUT_2, address_OUT_3, address_OUT_4, address_OUT_5, address_OUT_6, address_OUT_7, 
          Address, WriteData, MemWrite, MemRead, clk); 
    */
SmallDataMemory Mem1Data3(readSAD_Mem, Mux_Address_Wire_16_MEM, Mux_Address_Wire_17_MEM, Mux_Address_Wire_18_MEM, 
            Mux_Address_Wire_19_MEM, Mux_Address_Wire_20_MEM, Mux_Address_Wire_21_MEM, Mux_Address_Wire_22_MEM, Mux_Address_Wire_23_MEM,
            Data_Memory_Wire_16_MEM, Data_Memory_Wire_17_MEM, Data_Memory_Wire_18_MEM, Data_Memory_Wire_19_MEM, 
            Data_Memory_Wire_20_MEM, Data_Memory_Wire_21_MEM, Data_Memory_Wire_22_MEM, Data_Memory_Wire_23_MEM,
            ALURes_Mem, WriteData_Mem, MemWrite_Mem,  MemRead_Mem, clk);
/*module SmallDataMemory(readSAD, address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7,
          address_OUT_0, address_OUT_1, address_OUT_2, address_OUT_3, address_OUT_4, address_OUT_5, address_OUT_6, address_OUT_7, 
          Address, WriteData, MemWrite, MemRead, clk); 
    */
SmallDataMemory Mem1Data4(readSAD_Mem, 
            Mux_Address_Wire_24_MEM, Mux_Address_Wire_25_MEM, Mux_Address_Wire_26_MEM, Mux_Address_Wire_27_MEM, Mux_Address_Wire_28_MEM, 
            Mux_Address_Wire_29_MEM, Mux_Address_Wire_30_MEM, Mux_Address_Wire_31_MEM,
            Data_Memory_Wire_24_MEM, 
            Data_Memory_Wire_25_MEM, Data_Memory_Wire_26_MEM, Data_Memory_Wire_27_MEM, Data_Memory_Wire_28_MEM, Data_Memory_Wire_29_MEM, 
            Data_Memory_Wire_30_MEM, Data_Memory_Wire_31_MEM,
            ALURes_Mem, WriteData_Mem, MemWrite_Mem,  MemRead_Mem, clk);
/*module Mux32to16(inputf32IN0, inputf32IN1, inputf32IN2, inputf32IN3, inputf32IN4, inputf32IN5, inputf32IN6, inputf32IN7, inputf32IN8, inputf32IN9, inputf32IN10, inputf32IN11, inputf32IN12, inputf32IN13, inputf32IN14, inputf32IN15, inputs32IN0, inputs32IN1, inputs32IN2, inputs32IN3, inputs32IN4, inputs32IN5, inputs32IN6, inputs32IN7, inputs32IN8, inputs32IN9, inputs32IN10, inputs32IN11, inputs32IN12, inputs32IN13, inputs32IN14, inputs32IN15
,inputOUT32IN0, inputOUT32IN1, inputOUT32IN2, inputOUT32IN3, inputOUT32IN4, inputOUT32IN5, inputOUT32IN6, inputOUT32IN7, inputOUT32IN8, inputOUT32IN9, inputOUT32IN10, inputOUT32IN11, inputOUT32IN12, inputOUT32IN13, inputOUT32IN14, inputOUT32IN15, sel);*/
Mux32to16 Competition4(RegFile0_Wire_0_Mem, RegFile0_Wire_1_Mem, RegFile0_Wire_2_Mem, RegFile0_Wire_3_Mem, RegFile0_Wire_4_Mem, RegFile0_Wire_5_Mem, RegFile0_Wire_6_Mem, RegFile0_Wire_7_Mem, RegFile0_Wire_8_Mem, RegFile0_Wire_9_Mem, RegFile0_Wire_10_Mem, RegFile0_Wire_11_Mem, RegFile0_Wire_12_Mem, RegFile0_Wire_13_Mem, RegFile0_Wire_14_Mem, RegFile0_Wire_15_Mem, 
            RegFile1_Wire_0_Mem, RegFile1_Wire_1_Mem, RegFile1_Wire_2_Mem, RegFile1_Wire_3_Mem, RegFile1_Wire_4_Mem, RegFile1_Wire_5_Mem, RegFile1_Wire_6_Mem, RegFile1_Wire_7_Mem, RegFile1_Wire_8_Mem, RegFile1_Wire_9_Mem, RegFile1_Wire_10_Mem, RegFile1_Wire_11_Mem, RegFile1_Wire_12_Mem, RegFile1_Wire_13_Mem, RegFile1_Wire_14_Mem, RegFile1_Wire_15_Mem,
            mux_frame_0_Mem, mux_frame_1_Mem, mux_frame_2_Mem, mux_frame_3_Mem, mux_frame_4_Mem, mux_frame_5_Mem, mux_frame_6_Mem, mux_frame_7_Mem, mux_frame_8_Mem, mux_frame_9_Mem, mux_frame_10_Mem, mux_frame_11_Mem, mux_frame_12_Mem, mux_frame_13_Mem, mux_frame_14_Mem, mux_frame_15_Mem,
            small_big_16_MUX_Mem);
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU1(mux_frame_0_Mem, mux_frame_1_Mem, mux_frame_2_Mem, mux_frame_3_Mem, mux_frame_4_Mem, mux_frame_5_Mem, mux_frame_6_Mem, mux_frame_7_Mem, mux_frame_8_Mem, mux_frame_9_Mem, mux_frame_10_Mem, mux_frame_11_Mem, mux_frame_12_Mem, mux_frame_13_Mem, mux_frame_14_Mem, mux_frame_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_1_Mem);
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU2(RegFile2_Wire_0_Mem, RegFile2_Wire_1_Mem, RegFile2_Wire_2_Mem, RegFile2_Wire_3_Mem, RegFile2_Wire_4_Mem, RegFile2_Wire_5_Mem, RegFile2_Wire_6_Mem, RegFile2_Wire_7_Mem, RegFile2_Wire_8_Mem, RegFile2_Wire_9_Mem, RegFile2_Wire_10_Mem, RegFile2_Wire_11_Mem, RegFile2_Wire_12_Mem, RegFile2_Wire_13_Mem, RegFile2_Wire_14_Mem, RegFile2_Wire_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_2_Mem);
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU3(RegFile3_Wire_0_Mem, RegFile3_Wire_1_Mem, RegFile3_Wire_2_Mem, RegFile3_Wire_3_Mem, RegFile3_Wire_4_Mem, RegFile3_Wire_5_Mem, RegFile3_Wire_6_Mem, RegFile3_Wire_7_Mem, RegFile3_Wire_8_Mem, RegFile3_Wire_9_Mem, RegFile3_Wire_10_Mem, RegFile3_Wire_11_Mem, RegFile3_Wire_12_Mem, RegFile3_Wire_13_Mem, RegFile3_Wire_14_Mem, RegFile3_Wire_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_3_Mem);
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU4(RegFile4_Wire_0_Mem, RegFile4_Wire_1_Mem, RegFile4_Wire_2_Mem, RegFile4_Wire_3_Mem, RegFile4_Wire_4_Mem, RegFile4_Wire_5_Mem, RegFile4_Wire_6_Mem, RegFile4_Wire_7_Mem, RegFile4_Wire_8_Mem, RegFile4_Wire_9_Mem, RegFile4_Wire_10_Mem, RegFile4_Wire_11_Mem, RegFile4_Wire_12_Mem, RegFile4_Wire_13_Mem, RegFile4_Wire_14_Mem, RegFile4_Wire_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_4_Mem);
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU5(RegFile5_Wire_0_Mem, RegFile5_Wire_1_Mem, RegFile5_Wire_2_Mem, RegFile5_Wire_3_Mem, RegFile5_Wire_4_Mem, RegFile5_Wire_5_Mem, RegFile5_Wire_6_Mem, RegFile5_Wire_7_Mem, RegFile5_Wire_8_Mem, RegFile5_Wire_9_Mem, RegFile5_Wire_10_Mem, RegFile5_Wire_11_Mem, RegFile5_Wire_12_Mem, RegFile5_Wire_13_Mem, RegFile5_Wire_14_Mem, RegFile5_Wire_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_5_Mem);     
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU6(RegFile6_Wire_0_Mem, RegFile6_Wire_1_Mem, RegFile6_Wire_2_Mem, RegFile6_Wire_3_Mem, RegFile6_Wire_4_Mem, RegFile6_Wire_5_Mem, RegFile6_Wire_6_Mem, RegFile6_Wire_7_Mem, RegFile6_Wire_8_Mem, RegFile6_Wire_9_Mem, RegFile6_Wire_10_Mem, RegFile6_Wire_11_Mem, RegFile6_Wire_12_Mem, RegFile6_Wire_13_Mem, RegFile6_Wire_14_Mem, RegFile6_Wire_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_6_Mem);    
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU7(RegFile7_Wire_0_Mem, RegFile7_Wire_1_Mem, RegFile7_Wire_2_Mem, RegFile7_Wire_3_Mem, RegFile7_Wire_4_Mem, RegFile7_Wire_5_Mem, RegFile7_Wire_6_Mem, RegFile7_Wire_7_Mem, RegFile7_Wire_8_Mem, RegFile7_Wire_9_Mem, RegFile7_Wire_10_Mem, RegFile7_Wire_11_Mem, RegFile7_Wire_12_Mem, RegFile7_Wire_13_Mem, RegFile7_Wire_14_Mem, RegFile7_Wire_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_7_Mem); 
/*module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);*/
MegaALU MegaALU8(RegFile8_Wire_0_Mem, RegFile8_Wire_1_Mem, RegFile8_Wire_2_Mem, RegFile8_Wire_3_Mem, RegFile8_Wire_4_Mem, RegFile8_Wire_5_Mem, RegFile8_Wire_6_Mem, RegFile8_Wire_7_Mem, RegFile8_Wire_8_Mem, RegFile8_Wire_9_Mem, RegFile8_Wire_10_Mem, RegFile8_Wire_11_Mem, RegFile8_Wire_12_Mem, RegFile8_Wire_13_Mem, RegFile8_Wire_14_Mem, RegFile8_Wire_15_Mem,
            Window_Wire_0_Mem, Window_Wire_1_Mem, Window_Wire_2_Mem, Window_Wire_3_Mem, Window_Wire_4_Mem, Window_Wire_5_Mem, Window_Wire_6_Mem, Window_Wire_7_Mem, Window_Wire_8_Mem, Window_Wire_9_Mem, Window_Wire_10_Mem, Window_Wire_11_Mem, Window_Wire_12_Mem, Window_Wire_13_Mem, Window_Wire_14_Mem, Window_Wire_15_Mem,
            sadResult_Wire_8_Mem);                               
/*module Mem_WB(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, ALUResult_in, ALUResult_out,
            MemContent_in, MemContent_out, RdAddress_in, RdAddress_out, PCplus4_in, PCplus4_out,
            Data_Memory_Wire_0_in, Data_Memory_Wire_1_in, Data_Memory_Wire_2_in, Data_Memory_Wire_3_in, Data_Memory_Wire_4_in, Data_Memory_Wire_5_in, Data_Memory_Wire_6_in, Data_Memory_Wire_7_in, Data_Memory_Wire_8_in, Data_Memory_Wire_9_in, Data_Memory_Wire_10_in, Data_Memory_Wire_11_in, Data_Memory_Wire_12_in, Data_Memory_Wire_13_in, Data_Memory_Wire_14_in, Data_Memory_Wire_15_in, Data_Memory_Wire_16_in, Data_Memory_Wire_17_in, Data_Memory_Wire_18_in, Data_Memory_Wire_19_in, Data_Memory_Wire_20_in, Data_Memory_Wire_21_in, Data_Memory_Wire_22_in, Data_Memory_Wire_23_in, Data_Memory_Wire_24_in, Data_Memory_Wire_25_in, Data_Memory_Wire_26_in, Data_Memory_Wire_27_in, Data_Memory_Wire_28_in, Data_Memory_Wire_29_in, Data_Memory_Wire_30_in, Data_Memory_Wire_31_in,
            Data_Memory_Wire_0_out, Data_Memory_Wire_1_out, Data_Memory_Wire_2_out, Data_Memory_Wire_3_out, Data_Memory_Wire_4_out, Data_Memory_Wire_5_out, Data_Memory_Wire_6_out, Data_Memory_Wire_7_out, Data_Memory_Wire_8_out, Data_Memory_Wire_9_out, Data_Memory_Wire_10_out, Data_Memory_Wire_11_out, Data_Memory_Wire_12_out, Data_Memory_Wire_13_out, Data_Memory_Wire_14_out, Data_Memory_Wire_15_out, Data_Memory_Wire_16_out, Data_Memory_Wire_17_out, Data_Memory_Wire_18_out, Data_Memory_Wire_19_out, Data_Memory_Wire_20_out, Data_Memory_Wire_21_out, Data_Memory_Wire_22_out, Data_Memory_Wire_23_out, Data_Memory_Wire_24_out, Data_Memory_Wire_25_out, Data_Memory_Wire_26_out, Data_Memory_Wire_27_out, Data_Memory_Wire_28_out, Data_Memory_Wire_29_out, Data_Memory_Wire_30_out, Data_Memory_Wire_31_out,
            small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in, small_big_regFile_out, SAD_RegFile_write_out, small_big_find_out, read_min_out, write_min_out,
            sadResult_wire_1_in, sadResult_wire_2_in, sadResult_wire_3_in, sadResult_wire_4_in, sadResult_wire_5_in, sadResult_wire_6_in, sadResult_wire_7_in, sadResult_wire_8_in,
            sadResult_wire_1_out, sadResult_wire_2_out, sadResult_wire_3_out, sadResult_wire_4_out, sadResult_wire_5_out, sadResult_wire_6_out, sadResult_wire_7_out, sadResult_wire_8_out,
            Rs_in, Rs_out);*/
Mem_WB Mem2(clk, rst, LoadMux_Mem, LoadMux_WB, MemToReg_Mem, MemToReg_WB, RegWrite_Mem, RegWrite_WB, ALURes_Mem, ALURes_WB,
            MemoryReadContent_Mem, MemoryReadContent_WB, RdAddress_Mem, RdAddress_WB, PC_plus_4_Mem, PC_plus_4_WB,
            Data_Memory_Wire_0_MEM, Data_Memory_Wire_1_MEM, Data_Memory_Wire_2_MEM, Data_Memory_Wire_3_MEM, Data_Memory_Wire_4_MEM, Data_Memory_Wire_5_MEM, Data_Memory_Wire_6_MEM, Data_Memory_Wire_7_MEM, Data_Memory_Wire_8_MEM, Data_Memory_Wire_9_MEM, Data_Memory_Wire_10_MEM, Data_Memory_Wire_11_MEM, Data_Memory_Wire_12_MEM, Data_Memory_Wire_13_MEM, Data_Memory_Wire_14_MEM, Data_Memory_Wire_15_MEM, Data_Memory_Wire_16_MEM, Data_Memory_Wire_17_MEM, Data_Memory_Wire_18_MEM, Data_Memory_Wire_19_MEM, Data_Memory_Wire_20_MEM, Data_Memory_Wire_21_MEM, Data_Memory_Wire_22_MEM, Data_Memory_Wire_23_MEM, Data_Memory_Wire_24_MEM, Data_Memory_Wire_25_MEM, Data_Memory_Wire_26_MEM, Data_Memory_Wire_27_MEM, Data_Memory_Wire_28_MEM, Data_Memory_Wire_29_MEM, Data_Memory_Wire_30_MEM, Data_Memory_Wire_31_MEM,
            Data_Memory_Wire_0_WB, Data_Memory_Wire_1_WB, Data_Memory_Wire_2_WB, Data_Memory_Wire_3_WB, Data_Memory_Wire_4_WB, Data_Memory_Wire_5_WB, Data_Memory_Wire_6_WB, Data_Memory_Wire_7_WB, Data_Memory_Wire_8_WB, Data_Memory_Wire_9_WB, Data_Memory_Wire_10_WB, Data_Memory_Wire_11_WB, Data_Memory_Wire_12_WB, Data_Memory_Wire_13_WB, Data_Memory_Wire_14_WB, Data_Memory_Wire_15_WB, Data_Memory_Wire_16_WB, Data_Memory_Wire_17_WB, Data_Memory_Wire_18_WB, Data_Memory_Wire_19_WB, Data_Memory_Wire_20_WB, Data_Memory_Wire_21_WB, Data_Memory_Wire_22_WB, Data_Memory_Wire_23_WB, Data_Memory_Wire_24_WB, Data_Memory_Wire_25_WB, Data_Memory_Wire_26_WB, Data_Memory_Wire_27_WB, Data_Memory_Wire_28_WB, Data_Memory_Wire_29_WB, Data_Memory_Wire_30_WB, Data_Memory_Wire_31_WB,
            small_big_regFile_Mem, SAD_RegFile_write_Mem, small_big_find_Mem, read_min_Mem, write_min_Mem, small_big_regFile_WB, SAD_RegFile_write_WB, small_big_find_WB, read_min_WB, write_min_WB,
            sadResult_Wire_1_Mem, sadResult_Wire_2_Mem, sadResult_Wire_3_Mem, sadResult_Wire_4_Mem, sadResult_Wire_5_Mem, sadResult_Wire_6_Mem, sadResult_Wire_7_Mem, sadResult_Wire_8_Mem,
            sadResult_wire_1_WB, sadResult_wire_2_WB, sadResult_wire_3_WB, sadResult_wire_4_WB, sadResult_wire_5_WB, sadResult_wire_6_WB, sadResult_wire_7_WB, sadResult_wire_8_WB,
            Rs_Mem, Rs_WB);

/////////////////////////////////////WB stage////////////////////////////////
//module FindMininum(megaALUResult1, megaALUResult2, megaALUResult3, megaALUResult4, megaALUResult5, megaALUResult6, megaALUResult7,megaALUResult8, newAddress, minimuim, small_big, currentAddress, read);
FindMininum Competition5(sadResult_wire_1_WB, sadResult_wire_2_WB, sadResult_wire_3_WB, sadResult_wire_4_WB, sadResult_wire_5_WB, sadResult_wire_6_WB, sadResult_wire_7_WB, sadResult_wire_8_WB,
                       matchAddress_WB, Minimum_WB, small_big_find_Mem, Rs_WB, read_min_WB);
//Mux32Bit3To1StoreMux(out, inA, sel)
Mux32Bit3To1StoreMux WB0(GoToMemToReg_WB, MemoryReadContent_WB, LoadMux_WB);
//Mux32Bit3To1Normal(out, inA, inB, inC, sel);
Mux32Bit3To1Normal WB1(MemToRegWire_WB, ALURes_WB, GoToMemToReg_WB, PC_plus_4_WB, MemToReg_WB);
//Mux32Bit2To1(out, inA, inB, sel);
Mux32Bit2To1 RegisterValueDisplay(valueDisplay, 0, MemToRegWire_WB, RegWrite_WB);
//PCAdder(PCResult, Operand, PCAddResult);
PCAdder PCValueDisplay(PC_plus_4_WB, -4, PCDisplay);

endmodule
