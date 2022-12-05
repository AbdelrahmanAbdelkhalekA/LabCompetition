`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2022 21:19:11
// Design Name: 
// Module Name: Small_Address_tb
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


module Small_Address_tb();
reg [31:0] current_address;
wire [31:0]  address_0, address_1, address_2, address_3, address_4, address_5, address_6, 
                    address_7, address_8, address_9, address_10, address_11, address_12, address_13, address_14, address_15, address_16, address_17, 
                    address_18, address_19, address_20, address_21, address_22, address_23, address_24, address_25, address_26, address_27, address_28, 
                    address_29, address_30, address_31;
                    
Small_Address fuck_you_Ezequiel(current_address,  address_0, address_1, address_2, address_3, address_4, address_5, address_6, 
                    address_7, address_8, address_9, address_10, address_11, address_12, address_13, address_14, address_15, address_16, address_17, 
                    address_18, address_19, address_20, address_21, address_22, address_23, address_24, address_25, address_26, address_27, address_28, 
                    address_29, address_30, address_31);
                    
initial begin 
        current_address <= 0;
end  


endmodule
