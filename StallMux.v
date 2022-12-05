`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.11.2022 00:35:00
// Design Name: 
// Module Name: StallMux
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


module StallMux( ALUSrc_in, Shift_in, RegDst_in, ALUOp_in, MemRead_in, MemWrite_in,StoreMux_in, RegWrite_in, MemToReg_in, LoadMux_in,
              ALUSrc_out, Shift_out, RegDst_out, ALUOp_out, MemRead_out, MemWrite_out,StoreMux_out, RegWrite_out, MemToReg_out, LoadMux_out,
              stall, small_big_32_MUX_in, readSAD_in, small_big_16_MUX_in, small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, 
              read_min_in, write_min_in, small_big_32_MUX_out, readSAD_out, small_big_16_MUX_out, small_big_regFile_out, SAD_RegFile_write_out, 
              small_big_find_out, read_min_out, write_min_out, allow_find_in, allow_find_out);
              
input ALUSrc_in, Shift_in; //EX control signals
input [1:0] RegDst_in;  //EX control signals
input [3:0] ALUOp_in;   //EX control signal
input MemRead_in;       //Mem control signals
input MemWrite_in;      //Mem control signals
input [1:0] StoreMux_in;//Mem control signals
input RegWrite_in;      //WB control signals
input [1:0] MemToReg_in;//WB control signals 
input [1:0] LoadMux_in; //WB control signals  

input stall;  

input small_big_32_MUX_in;                                                            //EX competition signals
input readSAD_in, small_big_16_MUX_in;                                                   //Mem competition signals
input small_big_regFile_in, SAD_RegFile_write_in, small_big_find_in, read_min_in, write_min_in, allow_find_in;   //WB competition signals


output reg ALUSrc_out, Shift_out; //EX control signals
output reg [1:0] RegDst_out;  //EX control signals
output reg [3:0] ALUOp_out;   //EX control signal
output reg MemRead_out;       //Mem control signals
output reg MemWrite_out;      //Mem control signals
output reg [1:0] StoreMux_out;//Mem control signals
output reg RegWrite_out;      //WB control signals
output reg [1:0] MemToReg_out;//WB control signals 
output reg [1:0] LoadMux_out; //WB control signals  


output reg small_big_32_MUX_out;                                                            //EX competition signals
output reg readSAD_out, small_big_16_MUX_out;                                                   //Mem competition signals
output reg small_big_regFile_out, SAD_RegFile_write_out, small_big_find_out, read_min_out, write_min_out, allow_find_out;   //WB competition signals


always@(*) begin 
        if (stall == 1) begin 
            ALUSrc_out      <= 0;
            Shift_out       <= 0;
            RegDst_out      <= 0;
            ALUOp_out       <= 0;
            MemRead_out     <= 0; 
            MemWrite_out    <= 0;
            StoreMux_out    <= 0;
            RegWrite_out    <= 0;
            MemToReg_out    <= 0;
            LoadMux_out     <= 0;
            small_big_32_MUX_out  <= 0;
            readSAD_out           <= 0;
            small_big_16_MUX_out  <= 0;
            small_big_regFile_out <= 0;
            SAD_RegFile_write_out <= 0;
            small_big_find_out    <= 0;
            read_min_out          <= 0;
            write_min_out         <= 0;
            allow_find_out <= 0;
            
        end else begin 
            ALUSrc_out      <= ALUSrc_in;
            Shift_out       <= Shift_in;
            RegDst_out      <= RegDst_in;
            ALUOp_out       <= ALUOp_in;
            MemRead_out     <= MemRead_in; 
            MemWrite_out    <= MemWrite_in;
            StoreMux_out    <= StoreMux_in;
            RegWrite_out    <= RegWrite_in;
            MemToReg_out    <= MemToReg_in;
            LoadMux_out     <= LoadMux_in;
            small_big_32_MUX_out  <= small_big_32_MUX_in;
            readSAD_out           <= readSAD_in;
            small_big_16_MUX_out  <= small_big_16_MUX_in;
            small_big_regFile_out <= small_big_regFile_in;
            SAD_RegFile_write_out <= SAD_RegFile_write_in;
            small_big_find_out    <= small_big_find_in;
            read_min_out          <= read_min_in;
            write_min_out         <= write_min_in;
            allow_find_out <= allow_find_in;


        end 
    end

 
endmodule
