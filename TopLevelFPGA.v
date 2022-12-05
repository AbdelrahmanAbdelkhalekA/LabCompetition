`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2022 13:00:37
// Design Name: 
// Module Name: TopLevelFPGA
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


module TopLevelFPGA(Clk, Reset, out7, en_out);
    input Clk, Reset;
    output [6:0]out7;
    output [7:0]en_out;
    wire [31:0] CoordinateX, CoordinateY, valueDisplay, PCDisplay;
    wire ClkOut;
   
    //ClkDiv(Clk, Rst, ClkOut)
    ClkDiv this_clock(Clk, Reset, ClkOut);
    //TopLevel(clk, rst, CoordinateX_ID, CoordinateY_ID, valueDisplay, PCDisplay);
    TopLevel Display(ClkOut, Reset, CoordinateX, CoordinateY, valueDisplay, PCDisplay);
    //Two4DigitDisplay(Clk, NumberA (right), NumberB (left), out7, en_out)
    Two4DigitDisplay DD(Clk, CoordinateY[15:0], CoordinateX[15:0], out7, en_out);
endmodule
