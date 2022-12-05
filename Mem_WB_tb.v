`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2022 18:55:22
// Design Name: 
// Module Name: Mem_WB_tb
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


module Mem_WB_tb();
reg [1:0]LoadMux_in, MemToReg_in;         //WB control signals
reg RegWrite_in;                          //WB control signals
reg [31:0] ALUResult_in, MemContent_in, PCplus4_in;
reg [4:0] RdAddress_in;
reg clk, rst;

wire [1:0]LoadMux_out, MemToReg_out;        //WB control signals
wire RegWrite_out;                          //WB control signals
wire [31:0] ALUResult_out, MemContent_out, PCplus4_out;
wire [4:0] RdAddress_out;

Mem_WB aaa(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, ALUResult_in, ALUResult_out,
            MemContent_in, MemContent_out, RdAddress_in, RdAddress_out, PCplus4_in, PCplus4_out);
            
 always begin
		clk <= 0;
        #100;
        clk <= 1;
        #100;
	end
    
    initial begin
        rst <= 1;
        #50 
        rst <= 0; LoadMux_in <= 0; MemToReg_in <= 0; RegWrite_in <= 0; ALUResult_in <= 0; MemContent_in <= 0; PCplus4_in <= 0; RdAddress_in <= 0;
        #300 
        LoadMux_in <= 1; MemToReg_in <= 1; RegWrite_in <= 1; ALUResult_in <= 1; MemContent_in <= 1; PCplus4_in <= 1; RdAddress_in <= 1;
        #300 
        LoadMux_in <= 0; MemToReg_in <= 0; RegWrite_in <= 0; ALUResult_in <= 0; MemContent_in <= 0; PCplus4_in <= 0; RdAddress_in <= 0;
        #300 
        LoadMux_in <= 1; MemToReg_in <= 1; RegWrite_in <= 1; ALUResult_in <= 1000; MemContent_in <= 1000; PCplus4_in <= 1000; RdAddress_in <= 1;
    end

endmodule
