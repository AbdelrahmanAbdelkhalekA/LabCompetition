`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2022 17:43:29
// Design Name: 
// Module Name: ID_EX_tb
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


module ID_EX_tb();

reg [1:0]LoadMux_in, MemToReg_in;         //WB control signals
reg RegWrite_in;                          //WB control signals
reg MemWrite_in, MemRead_in;              //Mem control signals
reg [1:0] StoreMux_in;                    //Mem control signals
reg ALUSrc_in;                            //Ex control signals
reg [1:0] RgDst_in;                       //Ex control signals
reg [3:0] ALUOp_in;                       //Ex control signals
reg [31:0] RsContent_in, RtContent_in, ImmediateEx_in, PCplus4_in;
reg [4:0] RtAddress_in, RdAddress_in;
reg clk, rst;

wire [1:0]LoadMux_out, MemToReg_out;         //WB control signals
wire RegWrite_out;                          //WB control signals
wire MemWrite_out, MemRead_out;              //Mem control signals
wire [1:0] StoreMux_out;                    //Mem control signals
wire ALUSrc_out;                            //Ex control signals
wire [1:0] RgDst_out;                       //Ex control signals
wire [3:0] ALUOp_out;                       //Ex control signals
wire [31:0] RsContent_out, RtContent_out, ImmediateEx_out, PCplus4_out;
wire [4:0] RtAddress_out, RdAddress_out;

ID_EX a1(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, MemWrite_in, MemWrite_out, 
            MemRead_in, MemRead_out, StoreMux_in,StoreMux_out, ALUSrc_in, ALUSrc_out, RgDst_in, RgDst_out, ALUOp_in, ALUOp_out, 
            RsContent_in, RsContent_out, RtContent_in, RtContent_out, RtAddress_in, RtAddress_out, RdAddress_in, RdAddress_out, 
            PCplus4_in, PCplus4_out, ImmediateEx_in, ImmediateEx_out);
            
always begin
		clk <= 0;
        #100;
        clk <= 1;
        #100;
	end
    
    initial begin 
        rst <= 1;
        #50 
        rst <= 0; LoadMux_in <= 0; MemToReg_in <= 0; RegWrite_in <= 0; MemWrite_in <= 0; MemRead_in <= 0; StoreMux_in <= 0; ALUSrc_in <= 0;    
        RgDst_in <= 0; ALUOp_in <= 0; RsContent_in <= 0; RtContent_in <= 0; ImmediateEx_in <= 0; PCplus4_in <= 0; RtAddress_in <= 0; 
        RdAddress_in <= 0;
        #300
        LoadMux_in <= 1; MemToReg_in <= 1; RegWrite_in <= 1; MemWrite_in <= 1; MemRead_in <= 1; StoreMux_in <= 1; ALUSrc_in <= 1; RgDst_in <= 1; 
        ALUOp_in <= 1; RsContent_in <= 1; RtContent_in <= 1; ImmediateEx_in <= 1; PCplus4_in <= 1; RtAddress_in <= 1; RdAddress_in <= 1;
        #300
        LoadMux_in <= 0; MemToReg_in <= 0; RegWrite_in <= 0; MemWrite_in <= 0; MemRead_in <= 0; StoreMux_in <= 0; ALUSrc_in <= 0; RgDst_in <= 0; 
        ALUOp_in <= 0; RsContent_in <= 0; RtContent_in <= 0; ImmediateEx_in <= 0; PCplus4_in <= 0; RtAddress_in <= 0; RdAddress_in <= 0;
        #300
        LoadMux_in <= 1; MemToReg_in <= 1; RegWrite_in <= 1; MemWrite_in <= 1; MemRead_in <= 1; StoreMux_in <= 1; ALUSrc_in <= 1; RgDst_in <= 1; 
        ALUOp_in <= 1; RsContent_in <= 1000000; RtContent_in <= 10000000; ImmediateEx_in <= 1000000; PCplus4_in <= 100000; RtAddress_in <= 1; RdAddress_in <= 1;
        
        end



endmodule
