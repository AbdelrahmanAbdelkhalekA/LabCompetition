`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2022 19:57:51
// Design Name: 
// Module Name: MultiplyBy4
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


module MultiplyBy4(in, out);
input [31:0] in;
output reg [31:0] out;

always @(in) begin
    out <= 4 * in;
end

endmodule
