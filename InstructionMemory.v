`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2022 14:36:03
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(Address, Instruction); 
    
    input [31:0] Address;            // Input Address 
    output reg [31:0] Instruction;    // Instruction at memory location Address
    
    reg [31:0] memory [0:511]; //128 words of 32 bits 
    integer i = 0;
    
    initial 
    begin
        for(i = 0; i < 512; i = i + 1)  
            $readmemh("instruction_memory.mem", memory);
    end    
    
    always @(*) begin
        Instruction <= memory[Address >> 2];
    end      
    
endmodule