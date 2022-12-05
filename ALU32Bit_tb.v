`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - ALU32Bit_tb.v
// Description - Test the 'ALU32Bit.v' module.
////////////////////////////////////////////////////////////////////////////////

module ALU32Bit_tb(); 

	reg [3:0] ALUControl;   // control bits for ALU operation
	reg [31:0] A, B;	        // inputs

	wire [31:0] ALUResult;	// answer
	wire Zero;	        // Zero=1 if ALUResult == 0

    ALU32Bit u0(.ALUControl(ALUControl), .A(A), .B(B), .ALUResult(ALUResult), .Zero(Zero));

initial 
	begin
	   A <= -5; B <= 0; ALUControl <= 7;  // bgez (-5). Output = 1 --> Will be negated
	   #200
	   A <= 0; B <= 0; ALUControl <= 7;  // bgez (0). Output = 0 --> Will be negated
	   #200
	   A <= 3; B <= 0; ALUControl <= 7;  // bgez (3). Output = 0 --> Will be negated
	   #200
	   A <= -5; B <= 0; ALUControl <= 7;  // bltz (-5). Output = 1
	   #200
	   A <= 0; B <= 0; ALUControl <= 7;  // bltz (0). Output = 0
	   #200
	   A <= 3; B <= 0; ALUControl <= 7;  // bltz (3). Output = 0
	   #200
	   A <= -5; B <= 0; ALUControl <= 9;  // bgtz (-5). Output = 1 --> Will be negated
	   #200
	   A <= 0; B <= 0; ALUControl <= 9;  // bgtz (0). Output = 1 --> Will be negated
	   #200
	   A <= 3; B <= 0; ALUControl <= 9;  // bgtz (3). Output = 0 --> Will be negated
	   #200
	   A <= -5; B <= 0; ALUControl <= 9;  // blez (-5). Output = 1
	   #200
	   A <= 0; B <= 0; ALUControl <= 9;  // blez (0). Output = 1
	   #200
	   A <= 3; B <= 0; ALUControl <= 9;  // blez (3). Output = 0
	end

endmodule

