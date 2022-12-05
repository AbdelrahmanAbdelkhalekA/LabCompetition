`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - Mux32Bit2To1.v
// Description - Performs signal multiplexing between 2 32-Bit words.
////////////////////////////////////////////////////////////////////////////////

module Mux32Bit3To1StoreMux(out, inA, sel);

    output reg [31:0] out;
    
    input [31:0] inA;
    //reg [31:0] out1;
    input [1:0] sel;

    always@(*) begin 
        if (sel == 0) begin 
            out <= inA;
        end else if (sel == 1) begin 
            out <= {{16'b0000}, inA[15:0]};
        end else if (sel == 2)begin 
            out <= {{24'b0000}, inA[7:0]};
        end else begin
            out <= 0;
        end
       
    
    end

endmodule
