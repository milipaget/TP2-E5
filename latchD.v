`timescale 1ns / 1ps

module LatchD (
    input clk,
    input reset,
    input RegWrite,
    input MemtoReg,
    input [1:0] RWSel,
    input [31:0] Pc_Imm,
    input [31:0] Pc_Four,
    input [31:0] Imm_Out,
    input [31:0] Alu_Result,
    input [31:0] MemReadData,
    input [4:0] rd,
    input [31:0] Curr_Instr,
    output reg RegWrite_out,
    output reg MemtoReg_out,
    output reg [1:0] RWSel_out,
    output reg [31:0] Pc_Imm_out,
    output reg [31:0] Pc_Four_out,
    output reg [31:0] Imm_Out_out,
    output reg [31:0] Alu_Result_out,
    output reg [31:0] MemReadData_out,
    output reg [4:0] rd_out,
    output reg [31:0] Curr_Instr_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Initialize outputs to zero when reset is asserted
            RegWrite_out <= 0;
            MemtoReg_out <= 0;
            RWSel_out <= 0;
            Pc_Imm_out <= 0;
            Pc_Four_out <= 0;
            Imm_Out_out <= 0;
            Alu_Result_out <= 0;
            MemReadData_out <= 0;
            rd_out <= 0;
            Curr_Instr_out <= 0;
        end else begin
            // Update outputs on the positive edge of the clock
            RegWrite_out <= RegWrite;
            MemtoReg_out <= MemtoReg;
            RWSel_out <= RWSel;
            Pc_Imm_out <= Pc_Imm;
            Pc_Four_out <= Pc_Four;
            Imm_Out_out <= Imm_Out;
            Alu_Result_out <= Alu_Result;
            MemReadData_out <= MemReadData;
            rd_out <= rd;
            Curr_Instr_out <= Curr_Instr;
        end
    end

endmodule
