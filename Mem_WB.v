`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 13:21:37
// Design Name: 
// Module Name: Mem_WB
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


module Mem_WB(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, ALUResult_in, ALUResult_out,
            MemContent_in, MemContent_out, RdAddress_in, RdAddress_out, PCplus4_in, PCplus4_out,
            Data_Memory_Wire_0_in, Data_Memory_Wire_1_in, Data_Memory_Wire_2_in, Data_Memory_Wire_3_in, Data_Memory_Wire_4_in, Data_Memory_Wire_5_in, Data_Memory_Wire_6_in, Data_Memory_Wire_7_in, Data_Memory_Wire_8_in, Data_Memory_Wire_9_in, Data_Memory_Wire_10_in, Data_Memory_Wire_11_in, Data_Memory_Wire_12_in, Data_Memory_Wire_13_in, Data_Memory_Wire_14_in, Data_Memory_Wire_15_in, Data_Memory_Wire_16_in, Data_Memory_Wire_17_in, Data_Memory_Wire_18_in, Data_Memory_Wire_19_in, Data_Memory_Wire_20_in, Data_Memory_Wire_21_in, Data_Memory_Wire_22_in, Data_Memory_Wire_23_in, Data_Memory_Wire_24_in, Data_Memory_Wire_25_in, Data_Memory_Wire_26_in, Data_Memory_Wire_27_in, Data_Memory_Wire_28_in, Data_Memory_Wire_29_in, Data_Memory_Wire_30_in, Data_Memory_Wire_31_in,
            Data_Memory_Wire_0_out, Data_Memory_Wire_1_out, Data_Memory_Wire_2_out, Data_Memory_Wire_3_out, Data_Memory_Wire_4_out, Data_Memory_Wire_5_out, Data_Memory_Wire_6_out, Data_Memory_Wire_7_out, Data_Memory_Wire_8_out, Data_Memory_Wire_9_out, Data_Memory_Wire_10_out, Data_Memory_Wire_11_out, Data_Memory_Wire_12_out, Data_Memory_Wire_13_out, Data_Memory_Wire_14_out, Data_Memory_Wire_15_out, Data_Memory_Wire_16_out, Data_Memory_Wire_17_out, Data_Memory_Wire_18_out, Data_Memory_Wire_19_out, Data_Memory_Wire_20_out, Data_Memory_Wire_21_out, Data_Memory_Wire_22_out, Data_Memory_Wire_23_out, Data_Memory_Wire_24_out, Data_Memory_Wire_25_out, Data_Memory_Wire_26_out, Data_Memory_Wire_27_out, Data_Memory_Wire_28_out, Data_Memory_Wire_29_out, Data_Memory_Wire_30_out, Data_Memory_Wire_31_out,
            small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in, small_big_regFile_out, SAD_RegFile_write_out, small_big_find_out, read_min_out, write_min_out,
            sadResult_wire_1_in, sadResult_wire_2_in, sadResult_wire_3_in, sadResult_wire_4_in, sadResult_wire_5_in, sadResult_wire_6_in, sadResult_wire_7_in, sadResult_wire_8_in,
            sadResult_wire_1_out, sadResult_wire_2_out, sadResult_wire_3_out, sadResult_wire_4_out, sadResult_wire_5_out, sadResult_wire_6_out, sadResult_wire_7_out, sadResult_wire_8_out,
            Rs_in, Rs_out);
       
input [1:0]LoadMux_in, MemToReg_in;         //WB control signals
input RegWrite_in;                          //WB control signals
input [31:0] ALUResult_in, MemContent_in, PCplus4_in, Rs_in;
input [4:0] RdAddress_in;
input clk, rst;
input [31:0] Data_Memory_Wire_0_in, Data_Memory_Wire_1_in, Data_Memory_Wire_2_in, Data_Memory_Wire_3_in, Data_Memory_Wire_4_in, Data_Memory_Wire_5_in, Data_Memory_Wire_6_in, Data_Memory_Wire_7_in, Data_Memory_Wire_8_in, Data_Memory_Wire_9_in, Data_Memory_Wire_10_in, Data_Memory_Wire_11_in, Data_Memory_Wire_12_in, Data_Memory_Wire_13_in, Data_Memory_Wire_14_in, Data_Memory_Wire_15_in, Data_Memory_Wire_16_in, Data_Memory_Wire_17_in, Data_Memory_Wire_18_in, Data_Memory_Wire_19_in, Data_Memory_Wire_20_in, Data_Memory_Wire_21_in, Data_Memory_Wire_22_in, Data_Memory_Wire_23_in, Data_Memory_Wire_24_in, Data_Memory_Wire_25_in, Data_Memory_Wire_26_in, Data_Memory_Wire_27_in, Data_Memory_Wire_28_in, Data_Memory_Wire_29_in, Data_Memory_Wire_30_in, Data_Memory_Wire_31_in;
input small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in;   //WB competition signals
input [31:0] sadResult_wire_1_in, sadResult_wire_2_in, sadResult_wire_3_in, sadResult_wire_4_in, sadResult_wire_5_in, sadResult_wire_6_in, sadResult_wire_7_in, sadResult_wire_8_in;



output reg [1:0]LoadMux_out, MemToReg_out;        //WB control signals
output reg RegWrite_out;                          //WB control signals
output reg [31:0] ALUResult_out, MemContent_out, PCplus4_out, Rs_out;
output reg [4:0] RdAddress_out;
output reg Data_Memory_Wire_0_out, Data_Memory_Wire_1_out, Data_Memory_Wire_2_out, Data_Memory_Wire_3_out, Data_Memory_Wire_4_out, Data_Memory_Wire_5_out, Data_Memory_Wire_6_out, Data_Memory_Wire_7_out, Data_Memory_Wire_8_out, Data_Memory_Wire_9_out, Data_Memory_Wire_10_out, Data_Memory_Wire_11_out, Data_Memory_Wire_12_out, Data_Memory_Wire_13_out, Data_Memory_Wire_14_out, Data_Memory_Wire_15_out, Data_Memory_Wire_16_out, Data_Memory_Wire_17_out, Data_Memory_Wire_18_out, Data_Memory_Wire_19_out, Data_Memory_Wire_20_out, Data_Memory_Wire_21_out, Data_Memory_Wire_22_out, Data_Memory_Wire_23_out, Data_Memory_Wire_24_out, Data_Memory_Wire_25_out, Data_Memory_Wire_26_out, Data_Memory_Wire_27_out, Data_Memory_Wire_28_out, Data_Memory_Wire_29_out, Data_Memory_Wire_30_out, Data_Memory_Wire_31_out;
output reg small_big_regFile_out, SAD_RegFile_write_out, small_big_find_out, read_min_out, write_min_out;   //WB competition signals
output reg sadResult_wire_1_out, sadResult_wire_2_out, sadResult_wire_3_out, sadResult_wire_4_out, sadResult_wire_5_out, sadResult_wire_6_out, sadResult_wire_7_out, sadResult_wire_8_out;


always@(posedge clk or posedge rst) begin
	if (rst == 1) begin
	   LoadMux_out     <= 0;
	   MemToReg_out    <= 0;
       RegWrite_out    <= 0;
       ALUResult_out   <= 0;  
       MemContent_out  <= 0;                    
       PCplus4_out     <= 0;
       RdAddress_out   <= 0;
        Data_Memory_Wire_0_out <= 0;
        Data_Memory_Wire_1_out <= 0;
        Data_Memory_Wire_2_out <= 0;
        Data_Memory_Wire_3_out <= 0;
        Data_Memory_Wire_4_out <= 0;
        Data_Memory_Wire_5_out <= 0;
        Data_Memory_Wire_6_out <= 0;
        Data_Memory_Wire_7_out <= 0;
        Data_Memory_Wire_8_out <= 0;
        Data_Memory_Wire_9_out <= 0;
        Data_Memory_Wire_10_out <= 0;
        Data_Memory_Wire_11_out <= 0;
        Data_Memory_Wire_12_out <= 0;
        Data_Memory_Wire_13_out <= 0;
        Data_Memory_Wire_14_out <= 0;
        Data_Memory_Wire_15_out <= 0;
        Data_Memory_Wire_16_out <= 0;
        Data_Memory_Wire_17_out <= 0;
        Data_Memory_Wire_18_out <= 0;
        Data_Memory_Wire_19_out <= 0;
        Data_Memory_Wire_20_out <= 0;
        Data_Memory_Wire_21_out <= 0;
        Data_Memory_Wire_22_out <= 0;
        Data_Memory_Wire_23_out <= 0;
        Data_Memory_Wire_24_out <= 0;
        Data_Memory_Wire_25_out <= 0;
        Data_Memory_Wire_26_out <= 0;
        Data_Memory_Wire_27_out <= 0;
        Data_Memory_Wire_28_out <= 0;
        Data_Memory_Wire_29_out <= 0;
        Data_Memory_Wire_30_out <= 0;
        Data_Memory_Wire_31_out <= 0;
        small_big_regFile_out  <= 0;
        SAD_RegFile_write_out  <= 0; 
        small_big_find_out     <= 0; 
        read_min_out           <= 0; 
        write_min_out          <= 0;
        sadResult_wire_1_out <= 0;
        sadResult_wire_2_out <= 0;
        sadResult_wire_3_out <= 0;
        sadResult_wire_4_out <= 0;
        sadResult_wire_5_out <= 0;
        sadResult_wire_6_out <= 0;
        sadResult_wire_7_out <= 0;
        sadResult_wire_8_out <= 0;
        Rs_out <= 0;
	end else begin
       LoadMux_out     <= LoadMux_in;
	   MemToReg_out    <= MemToReg_in;
       RegWrite_out    <= RegWrite_in;    
       ALUResult_out   <= ALUResult_in; 
       MemContent_out  <= MemContent_in;                     
       PCplus4_out     <= PCplus4_in;
       RdAddress_out   <= RdAddress_in;  
        Data_Memory_Wire_0_out <= Data_Memory_Wire_0_in;
        Data_Memory_Wire_1_out <= Data_Memory_Wire_1_in;
        Data_Memory_Wire_2_out <= Data_Memory_Wire_2_in;
        Data_Memory_Wire_3_out <= Data_Memory_Wire_3_in;
        Data_Memory_Wire_4_out <= Data_Memory_Wire_4_in;
        Data_Memory_Wire_5_out <= Data_Memory_Wire_5_in;
        Data_Memory_Wire_6_out <= Data_Memory_Wire_6_in;
        Data_Memory_Wire_7_out <= Data_Memory_Wire_7_in;
        Data_Memory_Wire_8_out <= Data_Memory_Wire_8_in;
        Data_Memory_Wire_9_out <= Data_Memory_Wire_9_in;
        Data_Memory_Wire_10_out <= Data_Memory_Wire_10_in;
        Data_Memory_Wire_11_out <= Data_Memory_Wire_11_in;
        Data_Memory_Wire_12_out <= Data_Memory_Wire_12_in;
        Data_Memory_Wire_13_out <= Data_Memory_Wire_13_in;
        Data_Memory_Wire_14_out <= Data_Memory_Wire_14_in;
        Data_Memory_Wire_15_out <= Data_Memory_Wire_15_in;
        Data_Memory_Wire_16_out <= Data_Memory_Wire_16_in;
        Data_Memory_Wire_17_out <= Data_Memory_Wire_17_in;
        Data_Memory_Wire_18_out <= Data_Memory_Wire_18_in;
        Data_Memory_Wire_19_out <= Data_Memory_Wire_19_in;
        Data_Memory_Wire_20_out <= Data_Memory_Wire_20_in;
        Data_Memory_Wire_21_out <= Data_Memory_Wire_21_in;
        Data_Memory_Wire_22_out <= Data_Memory_Wire_22_in;
        Data_Memory_Wire_23_out <= Data_Memory_Wire_23_in;
        Data_Memory_Wire_24_out <= Data_Memory_Wire_24_in;
        Data_Memory_Wire_25_out <= Data_Memory_Wire_25_in;
        Data_Memory_Wire_26_out <= Data_Memory_Wire_26_in;
        Data_Memory_Wire_27_out <= Data_Memory_Wire_27_in;
        Data_Memory_Wire_28_out <= Data_Memory_Wire_28_in;
        Data_Memory_Wire_29_out <= Data_Memory_Wire_29_in;
        Data_Memory_Wire_30_out <= Data_Memory_Wire_30_in;
        Data_Memory_Wire_31_out <= Data_Memory_Wire_31_in;
        small_big_regFile_out  <= small_big_regFile_in;
        SAD_RegFile_write_out  <= SAD_RegFile_write_in; 
        small_big_find_out     <= small_big_find_in; 
        read_min_out           <= read_min_in; 
        write_min_out          <= write_min_in;
        sadResult_wire_1_out <= sadResult_wire_1_in;
        sadResult_wire_2_out <= sadResult_wire_2_in;
        sadResult_wire_3_out <= sadResult_wire_3_in;
        sadResult_wire_4_out <= sadResult_wire_4_in;
        sadResult_wire_5_out <= sadResult_wire_5_in;
        sadResult_wire_6_out <= sadResult_wire_6_in;
        sadResult_wire_7_out <= sadResult_wire_7_in;
        sadResult_wire_8_out <= sadResult_wire_8_in;
        Rs_out <= Rs_in;

    end   
end
    
endmodule
