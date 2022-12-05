`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2022 12:27:43
// Design Name: 
// Module Name: ProgramCounter
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

module ProgramCounter(Address, PCResult, Reset, Clk, PC_Write);

	input [31:0] Address;
	input Reset, Clk, PC_Write;
	output reg [31:0] PCResult;
    
    initial 
    begin
        PCResult <= 32'b0;
    end
    
    always @(posedge Clk or posedge Reset) begin         
        if (Reset==1)
             PCResult <= 32'b0;
        else
            if (PC_Write) begin
                PCResult <= Address; 
            end   
    end

endmodule
