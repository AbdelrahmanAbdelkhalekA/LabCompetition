`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2022 11:32:31
// Design Name: 
// Module Name: PCAdder
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

module PCAdder(PCResult, Operand, PCAddResult);

    input [31:0] PCResult, Operand;
    output reg [31:0] PCAddResult;
    
    always @(*)
        begin  
            PCAddResult <= PCResult + Operand;
        end

endmodule
