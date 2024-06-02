`timescale 1ns / 1ps

module alu#(
        parameter DATA_WIDTH = 32,
        parameter OPCODE_LENGTH = 4
        )
        (
        input [31:0]    SrcA,
        input [31:0]    SrcB,
        input [OPCODE_LENGTH-1:0] Operation,
        output reg [DATA_WIDTH-1:0] ALUResult
        );
    
    always @(*)
    begin
        case(Operation)
            4'b0000:        // AND
                ALUResult = SrcA & SrcB;
            4'b0001:        // OR
                ALUResult = SrcA | SrcB;
            4'b0010:        // ADD
                ALUResult = SrcA + SrcB;
            4'b0011:        // XOR
                ALUResult = SrcA ^ SrcB;
            4'b0100:        // Left Shift
                ALUResult = SrcA << SrcB[4:0];
            4'b0101:        // Right Shift
                ALUResult = SrcA >> SrcB[4:0];
            4'b0110:        // Subtract
                ALUResult = $signed(SrcA) - $signed(SrcB);
            4'b0111:        // Right Shift Arithmetic
                ALUResult = $signed(SrcA) >>> SrcB[4:0];
            4'b1000:        // Equal
                ALUResult = (SrcA == SrcB) ? 1 : 0;
            4'b1001:        // Not Equal
                ALUResult = (SrcA != SrcB) ? 1 : 0;
            4'b1100:        // Less Than
                ALUResult = ($signed(SrcA) < $signed(SrcB)) ? 1 : 0;
            4'b1101:        // Greater Than
                ALUResult = ($signed(SrcA) > $signed(SrcB)) ? 1 : 0;
            4'b1110:        // Unsigned Less Than
                ALUResult = ($unsigned(SrcA) < $unsigned(SrcB)) ? 1 : 0;
            4'b1111:        // Unsigned Greater Than
                ALUResult = ($unsigned(SrcA) > $unsigned(SrcB)) ? 1 : 0;
            4'b1010:        // Always True, for jal
                ALUResult = 1;
            default:
                ALUResult = 0;
        endcase
    end
endmodule
