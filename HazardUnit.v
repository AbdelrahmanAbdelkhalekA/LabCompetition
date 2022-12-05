`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2022 11:37:39
// Design Name: 
// Module Name: HazardUnit
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


module HazardUnit(PC_Write, IF_ID_Write, Flush, Stall, MemRead_EX, RtAddress_EX, RsAddress_ID, RtAddress_ID, Jump, PCSource, Instruction, RegWrite_EX);
input [4:0] RtAddress_EX, RsAddress_ID, RtAddress_ID;
input MemRead_EX, RegWrite_EX;
input PCSource;      
input [1:0] Jump;  
input [31:0] Instruction;

output reg PC_Write, IF_ID_Write, Flush, Stall;

initial begin
    Stall <= 0;
    Flush <= 0;
    PC_Write <= 1;
    IF_ID_Write <= 1;
end

always @(*) begin
    Stall <= 0;
    Flush <= 0;
    PC_Write <= 1;    
    IF_ID_Write <= 1;
    //if there is a "load" dependency 
    if ( (MemRead_EX && ( (RtAddress_EX == RsAddress_ID) || (RtAddress_EX == RtAddress_ID) ) ) ) begin 
        Stall       <= 1; //Set the control signals to 0 (stall one cycle)
        PC_Write    <= 0; //Stop the loading of PC
        IF_ID_Write <= 0; //Stop the loading of ID_EX register 
    end
    //if there is a "branch" dependecy
    if ( (RegWrite_EX) && ( (RtAddress_EX == RsAddress_ID) || (RtAddress_EX == RtAddress_ID) ) && 
    ( (Instruction[31:26] == 6'b000001) || (Instruction[31:26] == 6'b000100) || (Instruction[31:26] == 6'b000101) || 
    (Instruction[31:26] == 6'b000111) || (Instruction[31:26] == 6'b000110) ) )
    begin
        Stall       <= 1; //Set the control signals to 0 (stall one cycle)
        PC_Write    <= 0; //Stop the loading of PC
        IF_ID_Write <= 0; //Stop the loading of ID_EX register           
    end
    //if we are jumping (either j-instructions or conditional branches)
    else if (PCSource == 1 || Jump == 1 || Jump == 2) begin 
        Flush       <= 1; //clean one instruction     
        IF_ID_Write <= 0; //Stop the loading of ID_EX register
    end 
end
endmodule
