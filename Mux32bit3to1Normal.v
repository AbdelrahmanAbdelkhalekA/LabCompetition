`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit3To1Normal(out, inA, inB, inC, sel, inD);

    output reg [31:0] out;
    
    input [31:0] inA;
    input [31:0] inB;
    input [31:0] inC;
    input [31:0] inD;
    input [1:0] sel;

    always@(*) begin 
    if (sel == 0)begin 
     out <= inA;
    end else if (sel == 1)begin 
     out <= inB;
    end else if (sel == 2)begin
     out <= inC;
    end else if (sel == 33)begin
     out <= inD;
    end else begin 
     out <= 0;
    end
    
    end

endmodule
