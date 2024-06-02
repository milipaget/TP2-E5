`timescale 1ns / 1ps

module Control(
    input [6:0] Opcode, 
    output wire ALUSrc,
    output wire Memory2Register, //El valor para el register write data: 0: de la ALU, 1: de la data memory
    output wire Register_Write, //The register on the Write register input is written with the value on the Write data input 
    output wire Memory_Read,  
    output wire Memory_Write, 
    output reg [1:0] ALUOp,   
    output wire Branch,  
    output wire JalrSel,      
    output reg [1:0] RWSel);
    
	 parameter R_TYPE = 7'b0110011;    // add, sub, sll, slt, sltu, xor, srl, sra, or, and
    parameter LW     = 7'b0000011;    // lb, lh, lw
    parameter SW     = 7'b0100011;    // sb, sh, sw
    parameter RTypeI = 7'b0010011;    // addi, ori, andi
    parameter BR     = 7'b1100011;    // beq, bne, blt, bge, bltu, bgeu
    parameter JAL    = 7'b1101111;
    parameter JALR   = 7'b1100111;
    parameter LUI    = 7'b0110111; 
    parameter AUIPC  = 7'b0010111;

    // Combinational logic for control signals
    assign ALUSrc   = (Opcode == LW || Opcode == SW || Opcode == RTypeI || Opcode == JALR);
    assign Memory2Register = (Opcode == LW);
    assign Register_Write = (Opcode == R_TYPE || Opcode == LW || Opcode == RTypeI || Opcode == JAL || Opcode == JALR || Opcode == LUI || Opcode == AUIPC);
    assign Memory_Read  = (Opcode == LW);
    assign Memory_Write = (Opcode == SW);
    assign Branch   = (Opcode == BR);
    assign JalrSel  = (Opcode == JALR);

    always @(*) begin
        // Default values
        ALUOp = 2'b00;
        RWSel = 2'b00;

        case (Opcode)
            BR: begin
                ALUOp = 2'b01;           // Branch
                RWSel = 2'b00;           // Register Write Back
            end
            R_TYPE, RTypeI: begin
                ALUOp = 2'b10;           // R-type and I-type
                RWSel = 2'b00;           // Register Write Back
            end
            JAL: begin
                ALUOp = 2'b11;           // JAL
                RWSel = 2'b01;           // PC+4 write back
            end
            LUI: begin
                ALUOp = 2'b11;           // LUI
                RWSel = 2'b10;           // imm-gen write back
            end
            AUIPC: begin
                ALUOp = 2'b00;           // AUIPC
                RWSel = 2'b11;           // pc+imm-gen write back
            end
            JALR: begin
                ALUOp = 2'b00;           // JALR
                RWSel = 2'b01;           // PC+4 write back
            end
            default: begin
                ALUOp = 2'b00;           // Default
                RWSel = 2'b00;           // Register Write Back
            end
        endcase
    end
  

endmodule