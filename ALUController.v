`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2022 21:00:08
// Design Name: 
// Module Name: ALUController
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


module ALUController(ALUOp, Instruction, ALUControl);
     input [3:0] ALUOp;
    input [31:0]Instruction;
    output reg [3:0] ALUControl;
        
always @(ALUOp, Instruction) begin
    case (ALUOp)
         0: ALUControl <= 2;          //ADD immediate (addi, sw, lw)           
         1: ALUControl <= 6;          //SUB immediate (subi, beq)
         2: begin
            case (Instruction[5:0])   //R-type
                6'b100000: ALUControl <= 2;         //add
                6'b000010: ALUControl <= 3;         //mul
                6'b100100: ALUControl <= 0;         //and
                6'b100101: ALUControl <= 1;         //or
                6'b100110: ALUControl <= 4;         //xor
                6'b000000: ALUControl <= 5;         //shift left
                6'b100010: ALUControl <= 6;         //sub
                6'b101010: ALUControl <= 7;         //set on less than
                6'b100111: ALUControl <= 12;        //nor      
                 default: ALUControl <= 0;          
             endcase
         end
         3: ALUControl <= 3;          //MUL immediate (muli)
         4: ALUControl <= 0;          //AND inmmediate (andi)
         5: ALUControl <= 1;          //OR immediate (ori)
         6: ALUControl <= 4;          //XOR immediate (xor)
         7: ALUControl <= 7;          //SLT immediate (slti, bgez-greater than or equal to 0, bltz-lower than zero)
         8: ALUControl <= 9;          //Set on lesser than or equal to immediate (slti,  bgtz-greater than 0, blez-lower than or equal to zero)
         9: ALUControl <= 5;          //shift left
         10: ALUControl <= 8;          //shift right
         default: ALUControl <= 0;
    endcase
end
endmodule
