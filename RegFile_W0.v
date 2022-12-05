`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2022 23:52:07
// Design Name: 
// Module Name: RegFile_W0
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


module RegFile_W0(clk, Small_or_Big, frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in, frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out, write);
                
input Small_or_Big, clk, write;
input [31:0] frame_0_in, frame_1_in, frame_2_in, frame_3_in, frame_4_in, frame_5_in, frame_6_in, frame_7_in, frame_8_in, frame_9_in, frame_10_in, frame_11_in, frame_12_in, frame_13_in, 
                frame_14_in, frame_15_in;
output reg [31:0]  frame_0_out, frame_1_out, frame_2_out, frame_3_out, frame_4_out, frame_5_out, frame_6_out, frame_7_out, frame_8_out, frame_9_out, frame_10_out, frame_11_out, frame_12_out, frame_13_out, 
                frame_14_out, frame_15_out;
reg [31:0] registerFrame [0:15];
integer i;

initial begin
    //set all the registers to zero
    for(i = 0; i <= 15; i = i + 1) begin
       registerFrame[i] <= 32'b0;
    end
end

always @(*) begin
    if (write) begin
        if (Small_or_Big == 0) begin 
            //write at Big (Small_or_Big == 0)
            registerFrame[0] <= frame_0_in; registerFrame[1] <= frame_1_in; registerFrame[2] <= frame_2_in; registerFrame[3] <= frame_3_in; 
            registerFrame[4] <= frame_4_in; registerFrame[5] <= frame_5_in; registerFrame[6] <= frame_6_in; registerFrame[7] <= frame_7_in; 
            registerFrame[8] <= frame_8_in; registerFrame[9] <= frame_9_in; registerFrame[10] <= frame_10_in; registerFrame[11] <= frame_11_in; 
            registerFrame[12] <= frame_12_in; registerFrame[13] <= frame_13_in; registerFrame[14] <= frame_14_in; registerFrame[15] <= frame_15_in;
        end 
    end
end

always @(negedge clk) begin
    //send all frame content
    frame_0_out <= registerFrame[0]; frame_1_out <= registerFrame[1]; frame_2_out <= registerFrame[2]; frame_3_out <= registerFrame[3]; 
    frame_4_out <= registerFrame[4]; frame_5_out <= registerFrame[5]; frame_6_out <= registerFrame[6]; frame_7_out <= registerFrame[7];
    frame_8_out <= registerFrame[8]; frame_9_out <= registerFrame[9]; frame_10_out <= registerFrame[10]; frame_11_out <= registerFrame[11]; 
    frame_12_out <= registerFrame[12]; frame_13_out <= registerFrame[13]; frame_14_out <= registerFrame[14]; frame_15_out <= registerFrame[15];
		
end    

endmodule
