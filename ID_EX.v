`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 12:46:59
// Design Name: 
// Module Name: ID_EX
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

//module IF_ID(,);

module ID_EX(clk, rst, LoadMux_in, LoadMux_out, MemToReg_in, MemToReg_out, RegWrite_in, RegWrite_out, MemWrite_in, MemWrite_out, 
            MemRead_in, MemRead_out, StoreMux_in,StoreMux_out, ALUSrc_in, ALUSrc_out, RgDst_in, RgDst_out, ALUOp_in, ALUOp_out, 
            RsContent_in, RsContent_out, RtContent_in, RtContent_out, RtAddress_in, RtAddress_out, RdAddress_in, RdAddress_out, 
            PCplus4_in, PCplus4_out, ImmediateEx_in, ImmediateEx_out, Shift_in, Shift_out, RsAddress_in, RsAddress_out,small_big_32_MUX_in, 
            readSAD_in, small_big_16_MUX_in, small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in, 
            small_big_32_MUX_out, readSAD_out, small_big_16_MUX_out, small_big_regFile_out, SAD_RegFile_write_out, 
            small_big_find_out, read_min_out, write_min_out);

input [1:0]LoadMux_in, MemToReg_in;         //WB control signals
input RegWrite_in;                          //WB control signals
input MemWrite_in, MemRead_in;              //Mem control signals
input [1:0] StoreMux_in;                    //Mem control signals
input ALUSrc_in, Shift_in;                            //Ex control signals
input [1:0] RgDst_in;                       //Ex control signals
input [3:0] ALUOp_in;                       //Ex control signals
input [31:0] RsContent_in, RtContent_in, ImmediateEx_in, PCplus4_in;
input [4:0] RsAddress_in, RtAddress_in, RdAddress_in;
input clk, rst;

input small_big_32_MUX_in;                                                            //EX competition signals
input readSAD_in, small_big_16_MUX_in;                                                   //Mem competition signals
input small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in;   //WB competition signals

output reg [1:0]LoadMux_out, MemToReg_out;         //WB control signals
output reg RegWrite_out;                          //WB control signals
output reg MemWrite_out, MemRead_out;              //Mem control signals
output reg [1:0] StoreMux_out;                    //Mem control signals
output reg ALUSrc_out, Shift_out;                            //Ex control signals
output reg [1:0] RgDst_out;                       //Ex control signals
output reg [3:0] ALUOp_out;                       //Ex control signals
output reg [31:0] RsContent_out, RtContent_out, ImmediateEx_out, PCplus4_out;
output reg [4:0] RsAddress_out, RtAddress_out, RdAddress_out;

output reg small_big_32_MUX_out;                                                            //EX competition signals
output reg readSAD_out, small_big_16_MUX_out;                                                   //Mem competition signals
output reg small_big_regFile_out, SAD_RegFile_write_out, small_big_find_out, read_min_out, write_min_out;   //WB competition signals



always@(posedge clk or posedge rst) begin
	if (rst == 1) begin
	   LoadMux_out     <= 0;
	   MemToReg_out    <= 0;
       RegWrite_out    <= 0;
       MemWrite_out    <= 0;
       MemRead_out     <= 0;
       StoreMux_out    <= 0;                    
       ALUSrc_out      <= 0;                           
       RgDst_out       <= 0;                       
       ALUOp_out       <= 0;                       
       RsContent_out   <= 0;
       RtContent_out   <= 0;
       ImmediateEx_out <= 0;
       PCplus4_out     <= 0;
       RsAddress_out   <= 0;
       RtAddress_out   <= 0; 
       RdAddress_out   <= 0;
       Shift_out       <= 0;
            small_big_32_MUX_out  <= 0;
            readSAD_out           <= 0;
            small_big_16_MUX_out  <= 0;
            small_big_regFile_out <= 0;
            SAD_RegFile_write_out <= 0;
            small_big_find_out    <= 0;
            read_min_out          <= 0;
            write_min_out         <= 0;       

	end else begin
           LoadMux_out     <= LoadMux_in;
           MemToReg_out    <= MemToReg_in;
           RegWrite_out    <= RegWrite_in;
           MemWrite_out    <= MemWrite_in;
           MemRead_out     <= MemRead_in;
           StoreMux_out    <= StoreMux_in;                    
           ALUSrc_out      <= ALUSrc_in;                           
           RgDst_out       <= RgDst_in;                       
           ALUOp_out       <= ALUOp_in;                       
           RsContent_out   <= RsContent_in;
           RtContent_out   <= RtContent_in;
           ImmediateEx_out <= ImmediateEx_in;
           PCplus4_out     <= PCplus4_in;
           RsAddress_out   <= RsAddress_in;
           RtAddress_out   <= RtAddress_in; 
           RdAddress_out   <= RdAddress_in;   
           Shift_out       <= Shift_in; 
            small_big_32_MUX_out  <= small_big_32_MUX_in;
            readSAD_out           <= readSAD_in;
            small_big_16_MUX_out  <= small_big_16_MUX_in;
            small_big_regFile_out <= small_big_regFile_in;
            SAD_RegFile_write_out <= SAD_RegFile_write_in;
            small_big_find_out    <= small_big_find_in;
            read_min_out          <= read_min_in;
            write_min_out         <= write_min_in;


    end    
   
end


endmodule
