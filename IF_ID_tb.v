`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2022 17:26:38
// Design Name: 
// Module Name: IF_ID_tb
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


module IF_ID_tb();
	reg rst, clk;
    reg [31:0] Instruction_in, PCplus4_in;
    reg clk, rst;

    wire [31:0] Instruction_out, PCplus4_out;
	
    IF_ID aa(.clk(clk), .rst(rst), .Instruction_in(Instruction_in), .Instruction_out(Instruction_out), .PCplus4_in(PCplus4_in), .PCplus4_out(PCplus4_out));
    
    
    always begin
		clk <= 0;
        #100;
        clk <= 1;
        #100;
	end

    initial begin 
        rst <= 1;
        #50 
        rst <= 0; Instruction_in = 32'b0; PCplus4_in = 0;
        #300
        Instruction_in = 32'b11111111111111111111111111111111 ; PCplus4_in = 0;
        #300
        Instruction_in = 32'b11111111111111110000000000000000 ; PCplus4_in = 4;
        #300
        Instruction_in = 32'b10000000000000000000000000000000 ; PCplus4_in = 8;    
    end
 	
endmodule
