`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2022 23:15:22
// Design Name: 
// Module Name: StoreMux_tb
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


module StoreMux_tb();

reg	[31:0] inA; //input have reg
reg	[1:0] sel;
wire [31:0]	out;

	Mux32Bit3To1StoreMux u0( .out(out), .inA(inA), .sel(sel) );
        
	initial begin

        //#20 $display("sel=%h, out=%h", sel, out);

        #100 
        inA <= 32'hffffffff;  sel <= 0;
        //#20 $display("sel=%h, out=%h", sel, out);
        #100 
        inA <= 32'hffffffff;  sel <= 1;
        //#20 $display("sel=%h, out=%h", sel, out);
        #100 
        inA <= 32'hffffffff; sel <= 2;
        //#20 $display("sel=%h, out=%h", sel, out);
        
	end
endmodule
