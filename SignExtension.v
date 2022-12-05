`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, out);

    /* A 16-Bit input word */
    input [15:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;
    reg addi;
    
    initial begin 
    addi <= 16'b0000;
    end
    
    always@(*) begin 
        out[15:0] <= in[15:0];
        out[31:16] <= {16{in[15]}};
    end  

endmodule
