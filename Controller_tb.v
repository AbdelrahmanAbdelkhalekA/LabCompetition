`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 22:20:53
// Design Name: 
// Module Name: Controller_tb
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


module Controller_tb();
    reg [31:0] Instruction;
    reg LessThanZero, LessThanOne, Equal;
    
    wire  ALUSrc;        //EX control signals
    wire [1:0] RegDst;  //EX control signals
    wire [3:0] ALUOp;   //EX control signal
    wire MemRead;       //Mem control signals
    wire MemWrite;      //Mem control signals
    wire [1:0] StoreMux;//Mem control signals
    wire RegWrite;      //WB control signals
    wire [1:0] MemToReg;//WB control signals 
    wire [1:0] LoadMux; //WB control signals    
    wire PCSource;      //Branch control signal
    wire [1:0] Jump;    //Jump control signal
    
    Controller a1( .Instruction(Instruction), .LessThanZero(LessThanZero), .LessThanOne(LessThanOne), .Equal(Equal), .ALUSrc(ALUSrc), .RegDst(RegDst), .ALUOp(ALUOp), .MemRead(MemRead), .MemWrite(MemWrite), .StoreMux(StoreMux), .RegWrite(RegWrite), .MemToReg(MemToReg), .LoadMux(LoadMux), .PCSource(PCSource), .Jump(Jump) );

initial begin
        //testing R-Type
       #200
       Instruction <= 0'b00100000000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0;  //Addi
       #200
       Instruction <= 0'b10001100000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //lw
       #200
       Instruction <= 0'b10101100000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //sw
       #200
       Instruction <= 0'b10100000000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //sb
       
       #200
       Instruction <= 0'b10000100000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //lh
       #200
       Instruction <= 0'b10000000000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //lb
       #200
       Instruction <= 0'b10100100000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //sh
       #200
       Instruction <= 0'b00110000000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //andi
       #200
       Instruction <= 0'b00110100000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //ori
       #200
       Instruction <= 0'b00111000000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 0; //xori
       #200
       Instruction <= 0'b00010000000000000000000000000000; LessThanZero <= 0; LessThanOne <= 0; Equal <= 1; //beq
       #200
       Instruction <= 0'b00000100000000010000000000000000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //bgez
       #200
       Instruction <= 0'b00000100000000000000000000000000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //bltz
       #200
       Instruction <= 0'b00011100000000000000000000000000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //bgtz
       #200
       Instruction <= 0'b00011000000000000000000000000000; LessThanZero <= 1; LessThanOne <= 1; Equal <= 1; //blez
       #200
       Instruction <= 0'b00011100000000000000000000000000; LessThanZero <= 1; LessThanOne <= 1; Equal <= 1; //bgtz
       #200
       Instruction <= 0'b00011000000000000000000000000000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //blez
       #200
       Instruction <= 0'b00000000000000000000000000001000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //jr
       #200
       Instruction <= 0'b00001000000000000000000000000000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //j
       #200
       Instruction <= 0'b00001100000000000000000000000000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //jal
       #200
       Instruction <= 0'b00000000000000000000000000000000; LessThanZero <= 1; LessThanOne <= 0; Equal <= 1; //r-type
      
       
	end

endmodule
