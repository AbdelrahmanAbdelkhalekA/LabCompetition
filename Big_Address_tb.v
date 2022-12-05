`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2022 20:45:10
// Design Name: 
// Module Name: Big_Address_tb
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


module Big_Address_tb();
reg [31:0] current_address;
wire [31:0] address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8, address_9, address_10, 
                    address_11, address_12, address_13, address_14, address_15 , w_address_0, w_address_1, w_address_2, w_address_3, w_address_4, w_address_5, w_address_6, w_address_7, w_address_8, w_address_9, w_address_10, 
                    w_address_11, w_address_12, w_address_13, w_address_14, w_address_15;
                    
Big_Address fuck_you_tony(current_address, address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8, address_9, address_10, 
                    address_11, address_12, address_13, address_14, address_15 , w_address_0, w_address_1, w_address_2, w_address_3, w_address_4, w_address_5, w_address_6, w_address_7, w_address_8, w_address_9, w_address_10, 
                    w_address_11, w_address_12, w_address_13, w_address_14, w_address_15);
                    
initial begin 
        current_address <= 0;
end               
                    
endmodule
