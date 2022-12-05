`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Abdelrahman Abdelkhalek ----> 33%
//	       Daniel Campana -------------> 34%
//      	 Osman Syed -----------------> 33% 
// 
// Create Date: 21.10.2022 12:34:48
// Design Name: 
// Module Name: TopLevel_tb
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


module TopLevel_tb();

reg rst, clk;
wire [31:0] CoordinateX_ID, CoordinateY_ID, valueDisplay, PCDisplay;
  
TopLevel Im_nervous(.clk(clk), .rst(rst), .CoordinateX_ID(CoordinateX_ID), .CoordinateY_ID(CoordinateY_ID), .valueDisplay(valueDisplay), .PCDisplay(PCDisplay));    
    
    always begin
		clk <= 0;
        #10;
        clk <= 1;
        #10;
	end

    initial begin 
        rst <= 1;
        #15 
        rst <= 0; 
    end
endmodule
