`timescale 1ns / 1ps

module ForwardingUnit
    (
     input [4:0] RS1,
     input [4:0] RS2,
     input [4:0] EX_MEM_rd,
     input [4:0] MEM_WB_rd,
     input EX_MEM_RegWrite,
     input MEM_WB_RegWrite,
     output [1:0] Forward_A,
     output [1:0] Forward_B
    );

    assign Forward_A = ((EX_MEM_RegWrite) && (EX_MEM_rd != 0) && (EX_MEM_rd == RS1)) ? 2'b10 :
                       ((MEM_WB_RegWrite) && (MEM_WB_rd != 0) && (MEM_WB_rd == RS1)) ? 2'b01 : 2'b00;

    assign Forward_B = ((EX_MEM_RegWrite) && (EX_MEM_rd != 0) && (EX_MEM_rd == RS2)) ? 2'b10 :
                       ((MEM_WB_RegWrite) && (MEM_WB_rd != 0) && (MEM_WB_rd == RS2)) ? 2'b01 : 2'b00;

endmodule
