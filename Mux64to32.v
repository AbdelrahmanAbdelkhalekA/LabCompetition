`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2022 13:46:56
// Design Name: 
// Module Name: Mux64to32
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


module Mux64to32(inputf32IN0, inputf32IN1, inputf32IN2, inputf32IN3, inputf32IN4, inputf32IN5, inputf32IN6, inputf32IN7, inputf32IN8, inputf32IN9, inputf32IN10, inputf32IN11, inputf32IN12, inputf32IN13, inputf32IN14, inputf32IN15, inputf32IN16, inputf32IN17, inputf32IN18, inputf32IN19, inputf32IN20, inputf32IN21, inputf32IN22, inputf32IN23, inputf32IN24, inputf32IN25, inputf32IN26, inputf32IN27, inputf32IN28, inputf32IN29, inputf32IN30, inputf32IN31, inputs32IN0, inputs32IN1, inputs32IN2, inputs32IN3, inputs32IN4, inputs32IN5, inputs32IN6, inputs32IN7, inputs32IN8, inputs32IN9, inputs32IN10, inputs32IN11, inputs32IN12, inputs32IN13, inputs32IN14, inputs32IN15, inputs32IN16, inputs32IN17, inputs32IN18, inputs32IN19, inputs32IN20, inputs32IN21, inputs32IN22, inputs32IN23, inputs32IN24, inputs32IN25, inputs32IN26, inputs32IN27, inputs32IN28, inputs32IN29, inputs32IN30, inputs32IN31
,inputOUT32IN0, inputOUT32IN1, inputOUT32IN2, inputOUT32IN3, inputOUT32IN4, inputOUT32IN5, inputOUT32IN6, inputOUT32IN7, inputOUT32IN8, inputOUT32IN9, inputOUT32IN10, inputOUT32IN11, inputOUT32IN12, inputOUT32IN13, inputOUT32IN14, inputOUT32IN15, inputOUT32IN16, inputOUT32IN17, inputOUT32IN18, inputOUT32IN19, inputOUT32IN20, inputOUT32IN21, inputOUT32IN22, inputOUT32IN23, inputOUT32IN24, inputOUT32IN25, inputOUT32IN26, inputOUT32IN27, inputOUT32IN28, inputOUT32IN29, inputOUT32IN30, inputOUT32IN31, sel);

input sel;
input [31:0] inputf32IN0, inputf32IN1, inputf32IN2, inputf32IN3, inputf32IN4, inputf32IN5, inputf32IN6, inputf32IN7, inputf32IN8, inputf32IN9, inputf32IN10, inputf32IN11, inputf32IN12, inputf32IN13, inputf32IN14, inputf32IN15, inputf32IN16, inputf32IN17, inputf32IN18, inputf32IN19, inputf32IN20, inputf32IN21, inputf32IN22, inputf32IN23, inputf32IN24, inputf32IN25, inputf32IN26, inputf32IN27, inputf32IN28, inputf32IN29, inputf32IN30, inputf32IN31, inputs32IN0, inputs32IN1, inputs32IN2, inputs32IN3, inputs32IN4, inputs32IN5, inputs32IN6, inputs32IN7, inputs32IN8, inputs32IN9, inputs32IN10, inputs32IN11, inputs32IN12, inputs32IN13, inputs32IN14, inputs32IN15, inputs32IN16, inputs32IN17, inputs32IN18, inputs32IN19, inputs32IN20, inputs32IN21, inputs32IN22, inputs32IN23, inputs32IN24, inputs32IN25, inputs32IN26, inputs32IN27, inputs32IN28, inputs32IN29, inputs32IN30, inputs32IN31;
output reg [31:0] inputOUT32IN0, inputOUT32IN1, inputOUT32IN2, inputOUT32IN3, inputOUT32IN4, inputOUT32IN5, inputOUT32IN6, inputOUT32IN7, inputOUT32IN8, inputOUT32IN9, inputOUT32IN10, inputOUT32IN11, inputOUT32IN12, inputOUT32IN13, inputOUT32IN14, inputOUT32IN15, inputOUT32IN16, inputOUT32IN17, inputOUT32IN18, inputOUT32IN19, inputOUT32IN20, inputOUT32IN21, inputOUT32IN22, inputOUT32IN23, inputOUT32IN24, inputOUT32IN25, inputOUT32IN26, inputOUT32IN27, inputOUT32IN28, inputOUT32IN29, inputOUT32IN30, inputOUT32IN31;

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
        inputOUT32IN16 <= inputf32IN16;
        inputOUT32IN17 <= inputf32IN17;
        inputOUT32IN18 <= inputf32IN18;
        inputOUT32IN19 <= inputf32IN19;
        inputOUT32IN20 <= inputf32IN20;
        inputOUT32IN21 <= inputf32IN21;
        inputOUT32IN22 <= inputf32IN22;
        inputOUT32IN23 <= inputf32IN23;
        inputOUT32IN24 <= inputf32IN24;
        inputOUT32IN25 <= inputf32IN25;
        inputOUT32IN26 <= inputf32IN26;
        inputOUT32IN27 <= inputf32IN27;
        inputOUT32IN28 <= inputf32IN28;
        inputOUT32IN29 <= inputf32IN29;
        inputOUT32IN30 <= inputf32IN30;
        inputOUT32IN31 <= inputf32IN31;
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
        inputOUT32IN16 <= inputs32IN16;
        inputOUT32IN17 <= inputs32IN17;
        inputOUT32IN18 <= inputs32IN18;
        inputOUT32IN19 <= inputs32IN19;
        inputOUT32IN20 <= inputs32IN20;
        inputOUT32IN21 <= inputs32IN21;
        inputOUT32IN22 <= inputs32IN22;
        inputOUT32IN23 <= inputs32IN23;
        inputOUT32IN24 <= inputs32IN24;
        inputOUT32IN25 <= inputs32IN25;
        inputOUT32IN26 <= inputs32IN26;
        inputOUT32IN27 <= inputs32IN27;
        inputOUT32IN28 <= inputs32IN28;
        inputOUT32IN29 <= inputs32IN29;
        inputOUT32IN30 <= inputs32IN30;
        inputOUT32IN31 <= inputs32IN31;
    end

end 
endmodule
