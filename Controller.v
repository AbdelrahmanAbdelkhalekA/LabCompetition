`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2022 22:20:35
// Design Name: 
// Module Name: Controller
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


module Controller(Instruction, LessThanZero, LessThanOne, Equal, ALUSrc, RegDst, ALUOp, MemRead, MemWrite, StoreMux, RegWrite, 
                MemToReg, LoadMux, PCSource, Jump, Shift, clk, Stall, small_big_32_MUX, small_big_16_MUX, readSAD, small_big_regFile, 
                SAD_RegFile_write, small_big_find, read_min, write_min);

    input [31:0] Instruction;
    input LessThanZero;
    input  LessThanOne;
    input  Equal, clk, Stall;

    output reg ALUSrc, Shift; //EX control signals
    output reg [1:0] RegDst;  //EX control signals
    output reg [3:0] ALUOp;   //EX control signal
    output reg MemRead;       //Mem control signals
    output reg MemWrite;      //Mem control signals
    output reg [1:0] StoreMux;//Mem control signals
    output reg RegWrite;      //WB control signals
    output reg [1:0] MemToReg;//WB control signals 
    output reg [1:0] LoadMux; //WB control signals    
    output reg PCSource;      //Branch control signal
    output reg [1:0] Jump;    //Jump control signal
    
    output reg small_big_32_MUX;                                                            //EX competition signals
    output reg readSAD, small_big_16_MUX;                                                   //Mem competition signals
    output reg small_big_regFile, SAD_RegFile_write, small_big_find, read_min, write_min;   //WB competition signals

   always @(*) begin
       ALUSrc <= 0;
       RegDst <= 0;
       ALUOp <= 0;
       MemRead <= 0;
       MemWrite <= 0;
       StoreMux <= 0;
       RegWrite <= 0;
       MemToReg <= 0; 
       LoadMux <= 0;
       PCSource <= 0; 
       Jump <= 0; 
       Shift <= 0;
    
    //if(~Stall) begin //if stall == 1, every signal is set to 0. Otherwise, we decode Instruction
         case (Instruction[31:26])
            ////////////////////////////////R-type, load, store//////////////////////////////////////////////////
            //R-type
            6'b000000: begin
                if (Instruction != 0) begin //This is for the NOP Instructions
                    if (Instruction[5:0] == 6'b001000) begin  //jr instruction
                        Jump <= 2;   
                    end else if (Instruction[10:6] != 0) begin //sll and srl
                        if (Instruction[5:0] == 6'b000000) begin //sll
                            RegDst <= 1;      
                            ALUOp <= 9;       
                            RegWrite <= 1;
                            Shift <= 1;
                        end else begin                            //srl
                            RegDst <= 1;      
                            ALUOp <= 10;       
                            RegWrite <= 1;
                            Shift <= 1;
                        end
                    end else begin                         //everything else
                        RegDst <= 1;      
                        ALUOp <= 2;       
                        RegWrite <= 1;
                    end
               end
            end
            6'b011100: begin
                RegDst <= 1;      
                ALUOp <= 2;       
                RegWrite <= 1;
            end
            //addi
            6'b001000: begin
              ALUSrc <= 1;
              ALUOp <= 0;
              RegWrite <= 1;
            end
            //sw
            6'b101011: begin 
              ALUSrc <= 1;
              ALUOp <= 0;
              MemWrite <= 1;
            end
            //sb
            6'b101000: begin
              ALUSrc <= 1;
              ALUOp <= 0;
              MemWrite <= 1;
              StoreMux <= 2;
            end
            //sh
            6'b101001:begin
              ALUSrc <= 1;
              ALUOp <= 0;
              MemWrite <= 1;
              StoreMux <= 1;
            end
           //lw
            6'b100011: begin 
              ALUSrc <= 1;
              ALUOp <= 0;
              MemRead <= 1;
              MemToReg <= 2'b01;
              RegWrite <= 1;
            end    
            //lh
            6'b100001: begin 
              ALUSrc <= 1;
              ALUOp <= 0;
              MemRead <= 1;
              MemToReg <= 1;
              RegWrite <= 1;
              LoadMux <= 1;
            end
            //lbv
            6'b100000: begin
              ALUSrc <= 1;
              ALUOp <= 0;
              MemRead <= 1;
              MemToReg <= 1;
              RegWrite <= 1;
              LoadMux <= 2;
            end       
    
    /////////////////////////////////////branch and jump//////////////////////////////////////////////////
              6'b000001: begin
                if (Instruction[20:16] == 1) begin  //bgez (check rt bits to see the difference) 
                  if (LessThanZero == 0) begin    
                    PCSource <= 1;
                    Jump <= 0;
                  end
                end else begin                      //bltz
                  if (LessThanZero == 1) begin     
                    PCSource <= 1;
                    Jump <= 0;
                  end
                end
              end
        
            //beq
            6'b000100: begin
              if (Equal == 1) begin
                PCSource <= 1;
                Jump <= 0;
              end 
            end
            //bne
            6'b000101: begin
              if (Equal == 0) begin
                PCSource <= 1;
                Jump <= 0;
              end
            end
            //bgtz
            6'b000111: begin
              if (LessThanOne == 0) begin
                PCSource <= 1;
                Jump <= 0;
              end
            end
            //blez
            6'b000110: begin 
              if (LessThanOne == 1) begin
                PCSource <= 1;
                Jump <= 0;
              end
            end
            //j  
            6'b000010: begin
              Jump <= 1;
            end
            //jal
            6'b000011: begin 
              RegDst <= 2;
              MemToReg <= 2;
              RegWrite <= 1;
              Jump <= 1;
            end
    /////////////////////////////////////immediate//////////////////////////////////////////////////
    
            //logical
            6'b001100: begin //andi
                ALUSrc <= 1;
                ALUOp <= 4;
                RegWrite <= 1;
            end
    
            6'b001101: begin //ori
                ALUSrc <= 1;
                ALUOp <= 5;
                RegWrite <= 1;
            end
    
            6'b001110: begin //xori
                ALUSrc <= 1;
                ALUOp <= 6;
                RegWrite <= 1;
            end
    
            6'b001010: begin //slti
                ALUSrc <= 1;
                ALUOp <= 7;
                RegWrite <= 1;  
            end
            
            default: begin
            RegWrite <= 0;
            end
   /////////////////////////////////////competition//////////////////////////////////////////////////
            //Big_SAD
            6'b111111: begin
                small_big_32_MUX  <= 0;
                readSAD           <= 1;
                small_big_regFile <= 0;
                SAD_RegFile_write <= 1;
            end
            //Small_SAD
            6'b111110: begin
                small_big_32_MUX  <= 1;
                readSAD           <= 1;
                small_big_regFile <= 1;
                SAD_RegFile_write <= 1;
            end
            //FindMin_Big
            6'b111101: begin
                small_big_16_MUX  <= 0;
                small_big_find    <= 0;
            end
            //FinMin_Small
            6'b111101: begin
                small_big_16_MUX  <= 1;
                small_big_find    <= 1;                
            end
            //Read_Min
            6'b111101: begin
                read_min          <= 1;
                write_min         <= 1;
            end
    
         endcase
      end  
endmodule