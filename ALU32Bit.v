`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit.v
// Description - 32-Bit wide arithmetic logic unit (ALU).
//
// INPUTS:-
// ALUControl: N-Bit input control bits to select an ALU operation.
// A: 32-Bit input port A.
// B: 32-Bit input port B.
//
// OUTPUTS:-
// ALUResult: 32-Bit ALU result output.
// ZERO: 1-Bit output flag. 
//
// FUNCTIONALITY:-
// Design a 32-Bit ALU, so that it supports all arithmetic operations 
// needed by the MIPS instructions given in Labs5-8.docx document. 
//   The 'ALUResult' will output the corresponding result of the operation 
//   based on the 32-Bit inputs, 'A', and 'B'. 
//   The 'Zero' flag is high when 'ALUResult' is '0'. 
//   The 'ALUControl' signal should determine the function of the ALU 
//   You need to determine the bitwidth of the ALUControl signal based on the number of 
//   operations needed to support. 
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit(ALUControl, A, B, ALUResult, Zero);

	input [3:0] ALUControl; // control bits for ALU operation
                                // you need to adjust the bitwidth as needed
	input [31:0] A, B;	    // inputs

	output reg [31:0] ALUResult;	// answer
	output reg Zero;	            // Zero=1 if ALUResult == 0

always @(ALUControl, A, B) begin
    case (ALUControl)
        0: ALUResult <= A & B;          //AND
        1: ALUResult <= A | B;          //OR
        2: ALUResult <= A + B;          //add
        3: ALUResult <= A * B;          //mul 
        4: ALUResult <= A ^ B;          //XOR
        5: ALUResult <= B << A;         //Shift Left
        6: ALUResult <= A - B;          //substract
        //7: ALUResult <= A < B ? 1 : 0;  //set on less than ---> unsigned
        7: begin                        //set on less than ---> signed
            if (A[31] == 1) begin
                ALUResult <= B < A ? 1 : 0;
			end else begin
                ALUResult <= A < B ? 1 : 0;			
            end
        end
        8: ALUResult <= B >> A;         //Shift Right
        //9: ALUResult <= A <= B ? 1 : 0; //set on less than or equal to ---> unsigned
        9: begin                        //set on less than or equal to ---> signed
            if (A[31] == 1) begin
                ALUResult <= B <= A ? 1 : 0;
			end else begin
                ALUResult <= A <= B ? 1 : 0;			
            end
        end
        12: ALUResult <= ~(A | B);      //NOR
        default: ALUResult <= 0;
    endcase
end

always @(ALUResult) begin
	if (ALUResult == 0) begin
		Zero <= 1;
	end else begin
		Zero <= 0;
	end
end


endmodule

