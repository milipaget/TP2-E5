`timescale 1ns / 1ps

module latch2(
		  input clk, reset, stop, branch_reset,
        input ALUSrc,
        input MemtoReg,
        input RegWrite,
        input MemRead,
        input MemWrite,
        input [1:0] ALUOp,
        input Branch,
        input JalrSel,
        input [1:0] RWSel,
        input [7:0] Curr_Pc,
        input [31:0] RD_One,
        input [31:0] RD_Two,
        input [4:0] RS_One,
        input [4:0] RS_Two,
        input [4:0] rd,
        input [31:0] ExtImm,
        input [2:0] func3,
        input [6:0] func7,
        input [31:0] Curr_Instr,
		  
		  output reg ALUSrc_out,
        output reg MemtoReg_out,
        output reg RegWrite_out,
        output reg MemRead_out,
        output reg MemWrite_out,
        output reg [1:0] ALUOp_out,
        output reg Branch_out,
        output reg JalrSel_out,
        output reg [1:0] RWSel_out,
        output reg [7:0] Curr_Pc_out,
        output reg [31:0] RD_One_out,
        output reg [31:0] RD_Two_out,
        output reg [4:0] RS_One_out,
        output reg [4:0] RS_Two_out,
        output reg [4:0] rd_out,
        output reg [31:0] ImmG_out,
        output reg [2:0] func3_out,
        output reg [6:0] func7_out,
        output reg [31:0] Curr_Instr_out);
		  
always @(posedge clk) 
    begin
        if ((reset) || (stop) || (branch_reset))   //inicialización o stalleo
        begin
            ALUSrc_out <= 0;
            MemtoReg_out <= 0;
            RegWrite_out <= 0;
            MemRead_out <= 0;
            MemWrite_out <= 0;
            ALUOp_out <= 0;
            Branch_out <= 0;
            JalrSel_out <= 0;
            RWSel_out <= 0;
            Curr_Pc_out <= 0;
            RD_One_out <= 0;
            RD_Two_out <= 0;
            RS_One_out <= 0;
            RS_Two_out <= 0;
            rd_out <= 0;
            ImmG_out <= 0;
            func3_out <= 0;
            func7_out <= 0;
            Curr_Instr_out <= Curr_Instr;  //esto viene del latch A
        end
        else
        begin
            ALUSrc_out <= ALUSrc;
            MemtoReg_out <= MemtoReg;
            RegWrite_out <= RegWrite;
            MemRead_out <= MemRead;
            MemWrite_out <= MemWrite;
            ALUOp_out <= ALUOp;
            Branch_out <= Branch;
            JalrSel_out <= JalrSel;
            RWSel_out <= RWSel;
            Curr_Pc_out <= Curr_Pc;
            RD_One_out <= RD_One;
            RD_Two_out <= RD_Two;
            RS_One_out <= Curr_Instr[19:15];
            RS_Two_out <= Curr_Instr[24:20];
            rd_out <= Curr_Instr[11:7];
            ImmG_out <= ExtImm;
            func3_out <= Curr_Instr[14:12];
            func7_out <= Curr_Instr[31:25];
            Curr_Instr_out <= Curr_Instr;  
        end
    end

endmodule 