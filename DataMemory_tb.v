`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - DataMemory_tb.v
// Description - Test the 'DataMemory.v' module.
////////////////////////////////////////////////////////////////////////////////

module DataMemory_tb(); 

    reg     [31:0]  Address, address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8, address_9, 
          address_10, address_11, address_12, address_13, address_14, address_15, address_16, address_17, address_18, address_19, address_20,
          address_21, address_22, address_23, address_24, address_25, address_26, address_27, address_28, address_29, address_30, address_31;
    reg     [31:0]  WriteData;
    reg             Clk, readSAD;
    reg             MemWrite;
    reg             MemRead;

    wire [31:0] ReadData, address_OUT_0, address_OUT_1, address_OUT_2, address_OUT_3, address_OUT_4, address_OUT_5, address_OUT_6, address_OUT_7, address_OUT_8, 
          address_OUT_9, address_OUT_10, address_OUT_11, address_OUT_12, address_OUT_13, address_OUT_14, address_OUT_15, address_OUT_16, 
          address_OUT_17, address_OUT_18, address_OUT_19, address_OUT_20, address_OUT_21, address_OUT_22, address_OUT_23, address_OUT_24, address_OUT_25, 
          address_OUT_26, address_OUT_27, address_OUT_28, address_OUT_29, address_OUT_30, address_OUT_31;

    DataMemory u0(readSAD , address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8, address_9, 
          address_10, address_11, address_12, address_13, address_14, address_15, address_16, address_17, address_18, address_19, address_20,
          address_21, address_22, address_23, address_24, address_25, address_26, address_27, address_28, address_29, address_30, address_31,
          address_OUT_0, address_OUT_1, address_OUT_2, address_OUT_3, address_OUT_4, address_OUT_5, address_OUT_6, address_OUT_7, address_OUT_8, 
          address_OUT_9, address_OUT_10, address_OUT_11, address_OUT_12, address_OUT_13, address_OUT_14, address_OUT_15, address_OUT_16, 
          address_OUT_17, address_OUT_18, address_OUT_19, address_OUT_20, address_OUT_21, address_OUT_22, address_OUT_23, address_OUT_24, address_OUT_25, 
          address_OUT_26, address_OUT_27, address_OUT_28, address_OUT_29, address_OUT_30, address_OUT_31, 
          Address, WriteData, MemWrite, MemRead, ReadData, Clk); 

	initial begin
		Clk <= 1'b0;
		forever #10 Clk <= ~Clk;
	end

	initial begin
	
	readSAD <= 1;
	#500
	
	address_0 <= 32; address_1 <= 36; address_2 <= 40; address_3 <= 44;
	address_4 <= 288; address_5 <= 292; address_6 <= 296; address_7 <= 300; 
	address_8 <= 32; address_9 <= 36; address_10 <= 40; address_11 <= 44;
	address_12 <= 288; address_13 <= 292; address_14 <= 296; address_15 <= 300; 
	address_16 <= 32; address_17 <= 36; address_18 <= 40; address_19 <= 44;
	address_20 <= 288; address_21 <= 292; address_22 <= 296; address_23 <= 300; 
	address_24 <= 32; address_25 <= 36; address_26 <= 40; address_27 <= 44;
	address_28 <= 288; address_29 <= 292; address_30 <= 296; address_31 <= 300;     
	
	end

endmodule

