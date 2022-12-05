`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 19:37:34
// Design Name: 
// Module Name: set_on_less_than_unit
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


module set_on_less_than_unit(A,B,LessThanX);
input [31:0] A, B;
output LessThanX;
reg LessThanX;
   
always @(A, B) begin
    if (A[31] == 1) begin
        LessThanX <= B < A ? 1 : 0;
	end else begin
        LessThanX <= A < B ? 1 : 0;			
    end
end

endmodule
