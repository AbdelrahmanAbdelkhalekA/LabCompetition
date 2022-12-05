`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.11.2022 01:20:23
// Design Name: 
// Module Name: Forwarding_Unit
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

module Forwarding_Unit(RegWrite_MEM, RsAddress_EX, RdAddress_MEM, RtAddress_EX, RegWrite_WB, RdAddress_WB, muxVal_1, muxVal_2, RsAddress_ID, RtAddress_ID, selMux_RsID, selMux_RtID);
	
	input [4:0] RsAddress_EX, RdAddress_MEM, RtAddress_EX, RdAddress_WB, RsAddress_ID, RtAddress_ID;
	input RegWrite_MEM, RegWrite_WB;
	output reg [1:0] muxVal_1, muxVal_2, selMux_RsID, selMux_RtID;	
  
  always @(*) begin
	   //default settings
	  muxVal_1 <= 0;
	  muxVal_2 <= 0;
	       //Rs register (normal case)
	       if (RegWrite_MEM && (RsAddress_EX == RdAddress_MEM) && (RdAddress_MEM != 0)) begin 
		      muxVal_1 <= 2;
           end else if (RegWrite_WB && (RdAddress_WB != 0) && (RdAddress_WB == RsAddress_EX))begin 
              muxVal_1 <= 1;
           end else begin
              muxVal_1 <= 0;
           end           
	       //Rt register (normal case)
	       if (RegWrite_MEM && (RtAddress_EX == RdAddress_MEM) && (RdAddress_MEM != 0)) begin
		      muxVal_2 <= 2;
           end else if (RegWrite_WB && (RdAddress_WB != 0) && (RdAddress_WB == RtAddress_EX))begin 
              muxVal_2 <= 1;
           end else begin
              muxVal_2 <= 0;
           end
           //Rs register (branches)
           if (RegWrite_MEM && (RsAddress_ID == RdAddress_MEM) && (RdAddress_MEM != 0)) begin 
		      selMux_RsID <= 2;
           end else if (RegWrite_WB && (RdAddress_WB != 0) && (RdAddress_WB == RsAddress_ID))begin 
              selMux_RsID <= 1;
           end else begin
              selMux_RsID <= 0;
           end
           //Rt register (branches)
           if (RegWrite_MEM && (RtAddress_ID == RdAddress_MEM) && (RdAddress_MEM != 0)) begin
		      selMux_RtID <= 2;
           end else if (RegWrite_WB && (RdAddress_WB != 0) && (RdAddress_WB == RtAddress_ID))begin 
              selMux_RtID <= 1;
           end else begin
              selMux_RtID <= 0;
           end
                  
end	
	
endmodule