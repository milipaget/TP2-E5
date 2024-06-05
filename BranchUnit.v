`timescale 1ns / 1ps

module BranchUnit
    #(parameter PC_W = 8)
    (input [PC_W-1:0] Cur_PC,
     input [31:0] Imm,
     input JalrSel,
     input Branch,
     input [31:0] AluResult,
     output [7:0] PC_Imm,
     output [7:0] PC_Four,
     output [7:0] BrPC,
     output PcSel);

    reg Branch_Sel;
    reg [7:0] PC_Full;

    always @(*) begin
        PC_Full = Cur_PC;//{24'b0, Cur_PC};
    end
    
    assign PC_Imm = PC_Full + Imm;
    assign PC_Four = PC_Full + 8'b0001;

    always @(*) begin
        Branch_Sel = Branch && AluResult[0]; // 0:Branch is taken; 1:Branch is not taken
    end
    
    assign BrPC = (JalrSel) ? AluResult[7:0] :     // Jalr -> AluResult
                  (Branch_Sel) ? PC_Imm : 8'b0;  // Branch/Jal -> PC+Imm   // Otherwise, BrPC value is not important
    assign PcSel = JalrSel || Branch_Sel;  // 1:branch (b/jal/jalr) is taken; 0:branch is not taken(choose pc+4)

endmodule
