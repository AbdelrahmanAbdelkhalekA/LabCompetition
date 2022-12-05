`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.12.2022 19:12:02
// Design Name: 
// Module Name: Small_Address
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


module Small_Address(current_address, address_0, address_1, address_2, address_3, address_4, address_5, address_6, 
                    address_7, address_8, address_9, address_10, address_11, address_12, address_13, address_14, address_15, address_16, address_17, 
                    address_18, address_19, address_20, address_21, address_22, address_23, address_24, address_25, address_26, address_27, address_28, 
                    address_29, address_30, address_31);
                    
input [31:0] current_address;
output reg [31:0]  address_0, address_1, address_2, address_3, address_4, address_5, address_6, address_7, address_8, address_9, address_10, 
                    address_11, address_12, address_13, address_14, address_15, address_16, address_17, address_18, address_19, address_20, address_21, address_22, address_23, address_24, address_25, address_26, 
                    address_27, address_28, address_29, address_30, address_31;
                    
reg [31:0]  base_address_f, frameColumn_size;
                            
initial begin
    base_address_f      <= 16;    // 16 / 4 = 4
    frameColumn_size    <= 64;
end
                    
always@ (*) begin
    // since we know the fixed values of both the frame and the window, we can hardcode the addresses for both the window and the frame        
    //frame addresses      
        // address_k = base_address + 4 *( (i_k * framecolumns) + j_k + current_address )
    address_0   <= base_address_f + 4 * ((0 * frameColumn_size) + 4 + current_address); //column 1 (1)
    address_1   <= base_address_f + 4 * ((0 * frameColumn_size) + 5 + current_address); //column 2 (1)
    address_2   <= base_address_f + 4 * ((0 * frameColumn_size) + 6 + current_address); //column 3 (1)
    address_3   <= base_address_f + 4 * ((0 * frameColumn_size) + 7 + current_address); //column 4 (1)
    address_4   <= base_address_f + 4 * ((1 * frameColumn_size) + 4 + current_address); //column 1 (2)
    address_5   <= base_address_f + 4 * ((1 * frameColumn_size) + 5 + current_address); //column 2 (2)
    address_6   <= base_address_f + 4 * ((1 * frameColumn_size) + 6 + current_address); //column 3 (2)
    address_7   <= base_address_f + 4 * ((1 * frameColumn_size) + 7 + current_address); //column 4 (2)
    address_8   <= base_address_f + 4 * ((2 * frameColumn_size) + 4 + current_address); //column 1 (3)
    address_9   <= base_address_f + 4 * ((2 * frameColumn_size) + 5 + current_address); //column 2 (3)
    address_10  <= base_address_f + 4 * ((2 * frameColumn_size) + 6 + current_address); //column 3 (3)
    address_11  <= base_address_f + 4 * ((2 * frameColumn_size) + 7 + current_address); //column 4 (3)
    address_12  <= base_address_f + 4 * ((3 * frameColumn_size) + 4 + current_address); //column 1 (4)    
    address_13  <= base_address_f + 4 * ((3 * frameColumn_size) + 5 + current_address); //column 2 (4)   
    address_14  <= base_address_f + 4 * ((3 * frameColumn_size) + 6 + current_address); //column 3 (4)
    address_15  <= base_address_f + 4 * ((3 * frameColumn_size) + 7 + current_address); //column 4 (4)   
    address_16  <= base_address_f + 4 * ((0 * frameColumn_size) + 8 + current_address); //column 5 (1)
    address_17  <= base_address_f + 4 * ((0 * frameColumn_size) + 9 + current_address); //column 6 (1)
    address_18  <= base_address_f + 4 * ((0 * frameColumn_size) + 10 + current_address); //column 7 (1)
    address_19  <= base_address_f + 4 * ((0 * frameColumn_size) + 11 + current_address); //column 8 (1)
    address_20  <= base_address_f + 4 * ((1 * frameColumn_size) + 8 + current_address); //column 5 (2)
    address_21  <= base_address_f + 4 * ((1 * frameColumn_size) + 9 + current_address); //column 6 (2)
    address_22  <= base_address_f + 4 * ((1 * frameColumn_size) + 10 + current_address); //column 7 (2)
    address_23  <= base_address_f + 4 * ((1 * frameColumn_size) + 11 + current_address); //column 8 (2)    
    address_24  <= base_address_f + 4 * ((2 * frameColumn_size) + 8 + current_address); //column 5 (3)
    address_25  <= base_address_f + 4 * ((2 * frameColumn_size) + 9 + current_address); //column 6 (3)
    address_26  <= base_address_f + 4 * ((2 * frameColumn_size) + 10 + current_address); //column 7 (3)
    address_27  <= base_address_f + 4 * ((2 * frameColumn_size) + 11 + current_address); //column 8 (3)  
    address_28  <= base_address_f + 4 * ((3 * frameColumn_size) + 8 + current_address); //column 5 (4)    
    address_29  <= base_address_f + 4 * ((3 * frameColumn_size) + 9 + current_address); //column 6 (4)    
    address_30  <= base_address_f + 4 * ((3 * frameColumn_size) + 10 + current_address); //column 7 (4)    
    address_31  <= base_address_f + 4 * ((3 * frameColumn_size) + 11 + current_address); //column 8 (4)
    
    /*
     address_0   <= base_address_f + 4 * ((0 * frameColumn_size) + 4 + current_address); //column 1 (1)
    address_4   <= base_address_f + 4 * ((1 * frameColumn_size) + 4 + current_address); //column 1 (2)
    address_8   <= base_address_f + 4 * ((2 * frameColumn_size) + 4 + current_address); //column 1 (3)
    address_12  <= base_address_f + 4 * ((3 * frameColumn_size) + 4 + current_address); //column 1 (4)
    
    address_1   <= base_address_f + 4 * ((0 * frameColumn_size) + 5 + current_address); //column 2 (1)
    address_5   <= base_address_f + 4 * ((1 * frameColumn_size) + 5 + current_address); //column 2 (2)
    address_9   <= base_address_f + 4 * ((2 * frameColumn_size) + 5 + current_address); //column 2 (3)
    address_13  <= base_address_f + 4 * ((3 * frameColumn_size) + 5 + current_address); //column 2 (4)
   
    address_2   <= base_address_f + 4 * ((0 * frameColumn_size) + 6 + current_address); //column 3 (1)
    address_6   <= base_address_f + 4 * ((1 * frameColumn_size) + 6 + current_address); //column 3 (2)
    address_10  <= base_address_f + 4 * ((2 * frameColumn_size) + 6 + current_address); //column 3 (3)
    address_14  <= base_address_f + 4 * ((3 * frameColumn_size) + 6 + current_address); //column 3 (4)
    
    address_3   <= base_address_f + 4 * ((0 * frameColumn_size) + 7 + current_address); //column 4 (1)
    address_7   <= base_address_f + 4 * ((1 * frameColumn_size) + 7 + current_address); //column 4 (2)
    address_11  <= base_address_f + 4 * ((2 * frameColumn_size) + 7 + current_address); //column 4 (3)
    address_15  <= base_address_f + 4 * ((3 * frameColumn_size) + 7 + current_address); //column 4 (4) 
    
    address_16  <= base_address_f + 4 * ((0 * frameColumn_size) + 8 + current_address); //column 5 (1)
    address_20  <= base_address_f + 4 * ((1 * frameColumn_size) + 8 + current_address); //column 5 (2)
    address_24  <= base_address_f + 4 * ((2 * frameColumn_size) + 8 + current_address); //column 5 (3)
    address_28  <= base_address_f + 4 * ((3 * frameColumn_size) + 8 + current_address); //column 5 (4)
    
    address_17  <= base_address_f + 4 * ((0 * frameColumn_size) + 9 + current_address); //column 6 (1)
    address_21  <= base_address_f + 4 * ((1 * frameColumn_size) + 9 + current_address); //column 6 (2)
    address_25  <= base_address_f + 4 * ((2 * frameColumn_size) + 9 + current_address); //column 6 (3)
    address_29  <= base_address_f + 4 * ((3 * frameColumn_size) + 9 + current_address); //column 6 (4)
    
    address_18  <= base_address_f + 4 * ((0 * frameColumn_size) + 10 + current_address); //column 7 (1)
    address_22  <= base_address_f + 4 * ((1 * frameColumn_size) + 10 + current_address); //column 7 (2)
    address_26  <= base_address_f + 4 * ((2 * frameColumn_size) + 10 + current_address); //column 7 (3)
    address_30  <= base_address_f + 4 * ((3 * frameColumn_size) + 10 + current_address); //column 7 (4)
    
    address_19  <= base_address_f + 4 * ((0 * frameColumn_size) + 11 + current_address); //column 8 (1)
    address_23  <= base_address_f + 4 * ((1 * frameColumn_size) + 11 + current_address); //column 8 (2)
    address_27  <= base_address_f + 4 * ((2 * frameColumn_size) + 11 + current_address); //column 8 (3)
    address_31  <= base_address_f + 4 * ((3 * frameColumn_size) + 11 + current_address); //column 8 (4)
    
    
    */
        
      
    
end                   
                                   
endmodule