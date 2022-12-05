`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2022 13:09:09
// Design Name: 
// Module Name: TopLevelFPGA_tb
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


module TopLevelFPGA_tb();
reg Reset, Clk;
wire [6:0] out7;
wire [7:0] en_out;
    
TopLevelFPGA u0(.Clk(Clk), .Reset(Reset), .out7(out7), .en_out(en_out));    

	always begin
		Clk <= 0;
        #100;
        Clk <= 1;
        #100;
	end

    initial begin 
        Reset <= 1;
        #50 
        Reset <= 0; 
   end 	
endmodule
