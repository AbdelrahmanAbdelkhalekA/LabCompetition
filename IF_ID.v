`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 12:23:50
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(clk, rst, Instruction_in, Instruction_out, PCplus4_in, PCplus4_out, IF_ID_Write, Flush);
      
input [31:0] Instruction_in, PCplus4_in;
input clk, rst, IF_ID_Write, Flush;

output [31:0] Instruction_out, PCplus4_out;

reg [31:0] Instruction_out, PCplus4_out;


always@(posedge clk or posedge rst) begin
	if (rst == 1) begin
	   Instruction_out <= 0;               
       PCplus4_out     <= 0;
	end else begin
	   if (IF_ID_Write) begin
           Instruction_out <= Instruction_in;               
           PCplus4_out     <= PCplus4_in; 
       end 
       if (Flush) begin
           Instruction_out <= 0;               
           PCplus4_out     <= 4;
       end
    end
end




endmodule
