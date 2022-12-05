`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2022 20:39:34
// Design Name: 
// Module Name: ALUController_tb
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


module ALUController_tb();
    reg [3:0] ALUOp;
    reg [31:0] Instruction;
    wire [3:0] ALUControl;

    ALUController u0(.ALUOp(ALUOp), .Instruction(Instruction), .ALUControl(ALUControl));

initial 
	begin
	   ALUOp <= 4'b0001; Instruction <= 32'b0011;  //SUB immediate (output = 6)
	   #200
       ALUOp <= 4'b0011; Instruction <= 32'b0011;  //MUL immediate (output = 3)
       #200
       ALUOp <= 4'b0101; Instruction <= 32'b0011;  //OR immediate (output = 1)
       #200
       ALUOp <= 4'b0111; Instruction <= 32'b0011;  //SLT immediate (output = 7)
       #200
       ALUOp <= 4'b0010; Instruction <= 32'b100000;  //R-type Add (output = 2)
       #200
       ALUOp <= 4'b0010; Instruction <= 32'b000010;  //R-type Mul (output = 3)
       #200
       ALUOp <= 4'b0010; Instruction <= 32'b100010;  //R-type Sub (output = 6)
       #200
       ALUOp <= 4'b0010; Instruction <= 32'b100100;  //R-type And (output = 0)
	end

endmodule
