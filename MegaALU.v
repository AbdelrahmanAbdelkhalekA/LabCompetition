`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 22:50:26
// Design Name: 
// Module Name: MegaALU
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

module MegaALU(frameValueIN0, frameValueIN1, frameValueIN2, frameValueIN3, frameValueIN4, frameValueIN5, frameValueIN6, frameValueIN7, frameValueIN8, frameValueIN9, frameValueIN10, frameValueIN11, frameValueIN12, frameValueIN13, frameValueIN14, frameValueIN15,
            windowValueIN0, windowValueIN1, windowValueIN2, windowValueIN3, windowValueIN4, windowValueIN5, windowValueIN6, windowValueIN7, windowValueIN8, windowValueIN9, windowValueIN10, windowValueIN11, windowValueIN12, windowValueIN13, windowValueIN14, windowValueIN15,
            sadResult);
    
	input [31:0] frameValueIN0,windowValueIN0,frameValueIN1,windowValueIN1,
    windowValueIN2,
    frameValueIN2,
    windowValueIN3,
    frameValueIN3,
    windowValueIN4,
    frameValueIN4,
    windowValueIN5,
    frameValueIN5,
    windowValueIN6,
    frameValueIN6,
    windowValueIN7,
    frameValueIN7,
    windowValueIN8,
    frameValueIN8,
    windowValueIN9,
    frameValueIN9,
    windowValueIN10,
    frameValueIN10,
    windowValueIN11,
    frameValueIN11,
    windowValueIN12,
    frameValueIN12,
    windowValueIN13,
    frameValueIN13,
    windowValueIN14,
    frameValueIN14,
    windowValueIN15,
    frameValueIN15;
    
output reg [31:0] sadResult;
reg [31:0] absoluteValue;

always @ (*) begin 
sadResult = 32'b0;

        absoluteValue = frameValueIN0 - windowValueIN0;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end

        absoluteValue = frameValueIN1 - windowValueIN1;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN2 - windowValueIN2;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end else begin
            sadResult = sadResult - absoluteValue;
        end
            
        absoluteValue = frameValueIN3 - windowValueIN3;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN4 - windowValueIN4;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN5 - windowValueIN5;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN6 - windowValueIN6;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN7 - windowValueIN7;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN8 - windowValueIN8;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN9 - windowValueIN9;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN10 - windowValueIN10;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN11 - windowValueIN11;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
           
        absoluteValue = frameValueIN12 - windowValueIN12;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN13 - windowValueIN13;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN14 - windowValueIN14;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end
        
        absoluteValue = frameValueIN15 - windowValueIN15;
	if(absoluteValue[31] == 1'b0) begin
            sadResult = sadResult + absoluteValue;
        end
        else begin
            sadResult = sadResult - absoluteValue;
        end

end


endmodule