`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 19:34:45
// Design Name: 
// Module Name: comparator_unit
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


module comparator_unit(A, B, Equal);
input [31:0] A, B;
output Equal;
reg Equal;

always @(*) begin
    if (A - B == 0) begin
        Equal <= 1;
	end else begin
        Equal <= 0;			
    end
end

endmodule
