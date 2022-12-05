`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2022 13:47:29
// Design Name: 
// Module Name: Mux32to16
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


module Mux32to16(inputf32IN0, inputf32IN1, inputf32IN2, inputf32IN3, inputf32IN4, inputf32IN5, inputf32IN6, inputf32IN7, inputf32IN8, inputf32IN9, inputf32IN10, inputf32IN11, inputf32IN12, inputf32IN13, inputf32IN14, inputf32IN15, inputs32IN0, inputs32IN1, inputs32IN2, inputs32IN3, inputs32IN4, inputs32IN5, inputs32IN6, inputs32IN7, inputs32IN8, inputs32IN9, inputs32IN10, inputs32IN11, inputs32IN12, inputs32IN13, inputs32IN14, inputs32IN15
,inputOUT32IN0, inputOUT32IN1, inputOUT32IN2, inputOUT32IN3, inputOUT32IN4, inputOUT32IN5, inputOUT32IN6, inputOUT32IN7, inputOUT32IN8, inputOUT32IN9, inputOUT32IN10, inputOUT32IN11, inputOUT32IN12, inputOUT32IN13, inputOUT32IN14, inputOUT32IN15, sel);

input sel;
input [31:0] inputf32IN0, inputf32IN1, inputf32IN2, inputf32IN3, inputf32IN4, inputf32IN5, inputf32IN6, inputf32IN7, inputf32IN8, inputf32IN9, inputf32IN10, inputf32IN11, inputf32IN12, inputf32IN13, inputf32IN14, inputf32IN15, inputs32IN0, inputs32IN1, inputs32IN2, inputs32IN3, inputs32IN4, inputs32IN5, inputs32IN6, inputs32IN7, inputs32IN8, inputs32IN9, inputs32IN10, inputs32IN11, inputs32IN12, inputs32IN13, inputs32IN14, inputs32IN15;
output reg [31:0] inputOUT32IN0, inputOUT32IN1, inputOUT32IN2, inputOUT32IN3, inputOUT32IN4, inputOUT32IN5, inputOUT32IN6, inputOUT32IN7, inputOUT32IN8, inputOUT32IN9, inputOUT32IN10, inputOUT32IN11, inputOUT32IN12, inputOUT32IN13, inputOUT32IN14, inputOUT32IN15;

always @(*) begin 

    if (sel == 0) begin 
        inputOUT32IN0 <= inputf32IN0;
        inputOUT32IN1 <= inputf32IN1;
        inputOUT32IN2 <= inputf32IN2;
        inputOUT32IN3 <= inputf32IN3;
        inputOUT32IN4 <= inputf32IN4;
        inputOUT32IN5 <= inputf32IN5;
        inputOUT32IN6 <= inputf32IN6;
        inputOUT32IN7 <= inputf32IN7;
        inputOUT32IN8 <= inputf32IN8;
        inputOUT32IN9 <= inputf32IN9;
        inputOUT32IN10 <= inputf32IN10;
        inputOUT32IN11 <= inputf32IN11;
        inputOUT32IN12 <= inputf32IN12;
        inputOUT32IN13 <= inputf32IN13;
        inputOUT32IN14 <= inputf32IN14;
        inputOUT32IN15 <= inputf32IN15;
    end else if (sel == 1) begin 
        inputOUT32IN0 <= inputs32IN0;
        inputOUT32IN1 <= inputs32IN1;
        inputOUT32IN2 <= inputs32IN2;
        inputOUT32IN3 <= inputs32IN3;
        inputOUT32IN4 <= inputs32IN4;
        inputOUT32IN5 <= inputs32IN5;
        inputOUT32IN6 <= inputs32IN6;
        inputOUT32IN7 <= inputs32IN7;
        inputOUT32IN8 <= inputs32IN8;
        inputOUT32IN9 <= inputs32IN9;
        inputOUT32IN10 <= inputs32IN10;
        inputOUT32IN11 <= inputs32IN11;
        inputOUT32IN12 <= inputs32IN12;
        inputOUT32IN13 <= inputs32IN13;
        inputOUT32IN14 <= inputs32IN14;
        inputOUT32IN15 <= inputs32IN15;
    end

end 
endmodule
