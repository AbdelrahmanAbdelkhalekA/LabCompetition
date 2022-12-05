`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2022 18:43:00
// Design Name: 
// Module Name: Big_Address
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


module Big_Address(current_address, address_0, address_1, address_2, address_3, address_4, address_5, address_6, 
                        address_7, address_8, address_9, address_10, address_11, address_12, address_13, address_14, address_15,  w_address_0, w_address_1, w_address_2, w_address_3, w_address_4, w_address_5, w_address_6, w_address_7, w_address_8, w_address_9, w_address_10, 
                    w_address_11, w_address_12, w_address_13, w_address_14, w_address_15);
input [31:0] current_address;
output reg [31:0] address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8, address_9, address_10, 
                    address_11, address_12, address_13, address_14, address_15 , w_address_0, w_address_1, w_address_2, w_address_3, w_address_4, w_address_5, w_address_6, w_address_7, w_address_8, w_address_9, w_address_10, 
                    w_address_11, w_address_12, w_address_13, w_address_14, w_address_15;
 
reg [31:0]  base_address_w, base_address_f, frameColumn_size, windowColumn_size;            
                            
initial begin
    base_address_f      <= 16;    // 16 / 4 = 4 --------> index = 4
    base_address_w      <= 16400; // 16400 / 4 = 4100 --> index = 4100
    frameColumn_size    <= 64;
    windowColumn_size   <= 4;
end
                    
always@ (*) begin
    // since we know the fixed values of both the frame and the window, we can hardcode the addresses for both the window and the frame        
    //window addresses
        // w_address_k = base_address + 4 *( (i_k * windowcolumns) + j_k )
    w_address_0  <= base_address_w + 4 * ((0 * windowColumn_size) + 0); //column 1
    w_address_1  <= base_address_w + 4 * ((0 * windowColumn_size) + 1); //column 2
    w_address_2  <= base_address_w + 4 * ((0 * windowColumn_size) + 2); //column 3
    w_address_3  <= base_address_w + 4 * ((0 * windowColumn_size) + 3); //column 4
    w_address_4  <= base_address_w + 4 * ((1 * windowColumn_size) + 0); //column 1
    w_address_5  <= base_address_w + 4 * ((1 * windowColumn_size) + 1); //column 2
    w_address_6  <= base_address_w + 4 * ((1 * windowColumn_size) + 2); //column 3
    w_address_7  <= base_address_w + 4 * ((1 * windowColumn_size) + 3); //column 4
    w_address_8  <= base_address_w + 4 * ((2 * windowColumn_size) + 0); //column 1
    w_address_9  <= base_address_w + 4 * ((2 * windowColumn_size) + 1); //column 2
    w_address_10 <= base_address_w + 4 * ((2 * windowColumn_size) + 2); //column 3
    w_address_11 <= base_address_w + 4 * ((2 * windowColumn_size) + 3); //column 4
    w_address_12 <= base_address_w + 4 * ((3 * windowColumn_size) + 0); //column 1
    w_address_13 <= base_address_w + 4 * ((3 * windowColumn_size) + 1); //column 2
    w_address_14 <= base_address_w + 4 * ((3 * windowColumn_size) + 2); //column 3
    w_address_15 <= base_address_w + 4 * ((3 * windowColumn_size) + 3); //column 4    
    //frame addresses      
        // address_k = base_address + 4 *( (i_k * framecolumns) + j_k + current_address )
    address_0  <= base_address_f + 4 * ((0 * frameColumn_size) + 0 + current_address); //column 5
    address_1  <= base_address_f + 4 * ((0 * frameColumn_size) + 1 + current_address); //column 6
    address_2  <= base_address_f + 4 * ((0 * frameColumn_size) + 2 + current_address); //column 7
    address_3  <= base_address_f + 4 * ((0 * frameColumn_size) + 3 + current_address); //column 8
    address_4  <= base_address_f + 4 * ((1 * frameColumn_size) + 0 + current_address); //column 5
    address_5  <= base_address_f + 4 * ((1 * frameColumn_size) + 1 + current_address); //column 6
    address_6  <= base_address_f + 4 * ((1 * frameColumn_size) + 2 + current_address); //column 7
    address_7  <= base_address_f + 4 * ((1 * frameColumn_size) + 3 + current_address); //column 8
    address_8  <= base_address_f + 4 * ((2 * frameColumn_size) + 0 + current_address); //column 5
    address_9  <= base_address_f + 4 * ((2 * frameColumn_size) + 1 + current_address); //column 6
    address_10 <= base_address_f + 4 * ((2 * frameColumn_size) + 2 + current_address); //column 7
    address_11 <= base_address_f + 4 * ((2 * frameColumn_size) + 3 + current_address); //column 8
    address_12 <= base_address_f + 4 * ((3 * frameColumn_size) + 0 + current_address); //column 5
    address_13 <= base_address_f + 4 * ((3 * frameColumn_size) + 1 + current_address); //column 6
    address_14 <= base_address_f + 4 * ((3 * frameColumn_size) + 2 + current_address); //column 7
    address_15 <= base_address_f + 4 * ((3 * frameColumn_size) + 3 + current_address); //column 8
    
end                   
                                   
endmodule

