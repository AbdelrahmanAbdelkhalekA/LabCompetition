`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2022 00:41:26
// Design Name: 
// Module Name: FindMininum
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


module FindMininum(megaALUResult1, megaALUResult2, megaALUResult3, megaALUResult4, megaALUResult5, megaALUResult6, megaALUResult7,megaALUResult8, newAddress, minimuim, small_big, currentAddress, read);

input [31:0] small_big, currentAddress,megaALUResult1, megaALUResult2, megaALUResult3, megaALUResult4, megaALUResult5, megaALUResult6, megaALUResult7,megaALUResult8;
input read;
output reg [31:0] newAddress, minimuim;
reg [31:0] matchAddress, CurrentMininum;



initial begin
    CurrentMininum <= 1000;
    matchAddress <= 0;
end

always @(*) begin
  
    if (megaALUResult1 < CurrentMininum) begin
        if (small_big == 0) begin 
         matchAddress <= currentAddress;
        end else begin 
         matchAddress <= currentAddress + 1; 
        end
        CurrentMininum <= megaALUResult1;
    end
    
    if (small_big == 1) begin
        if (megaALUResult2 < CurrentMininum) begin
           matchAddress <= currentAddress+1;
           CurrentMininum <= megaALUResult2;
        end
        
        if (megaALUResult3 < CurrentMininum) begin
           matchAddress <= currentAddress+2;
           CurrentMininum <= megaALUResult3;
        end
        
        if (megaALUResult4 < CurrentMininum) begin
           matchAddress <= currentAddress+3;
           CurrentMininum <= megaALUResult4;
        end
        
        if (megaALUResult5 < CurrentMininum) begin
           matchAddress <= currentAddress+4;
           CurrentMininum <= megaALUResult5;
        end
        
        if (megaALUResult6 < CurrentMininum) begin
           matchAddress <= currentAddress+5;
           CurrentMininum <= megaALUResult6;
        end
        
        if (megaALUResult7 < CurrentMininum) begin
           matchAddress <= currentAddress+6;
           CurrentMininum <= megaALUResult7;
        end
        
        if (megaALUResult8 < CurrentMininum) begin
           matchAddress <= currentAddress+7;
           CurrentMininum <= megaALUResult8;
        end
    end
    
    if (read) begin
        newAddress <= matchAddress;
        minimuim   <= CurrentMininum;
    end

end

endmodule
