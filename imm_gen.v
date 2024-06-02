`timescale 1ns / 1ps

module imm_gen(
    input [31:0] instruction_code,
    output reg [31:0] imm_out);


always @(*) begin
    case(instruction_code[6:0])

        7'b0000011: //I-type load part      
            imm_out = {instruction_code[31]? 20'hFFFFF:20'b0 , instruction_code[31:20]};
        7'b0010011: /*I-type*/     
            imm_out = ((instruction_code[31:25] == 7'b0100000) && (instruction_code[14:12] == 3'b101)) ? {7'b0, instruction_code[24:20]} : /*SRAI*/ 
                        {instruction_code[31]? 20'hFFFFF:20'b0 , instruction_code[31:20]};    /*rest addi part*/ 
        7'b1100111: /*I-type jalr*/      
            imm_out = {instruction_code[31]? 20'hFFFFF:20'b0 , instruction_code[31:20]};

        7'b0100011: /*S-type*/     
            imm_out = {instruction_code[31]? 20'hFFFFF:20'b0 , instruction_code[31:25], instruction_code[11:7]};

        7'b1100011:  /*B-type*/         
            imm_out = {instruction_code[31]? 19'h7FFFF:19'b0 , instruction_code[31], instruction_code[7], instruction_code[30:25], instruction_code[11:8], 1'b0};
        7'b1101111:  /*J-type, JAL*/    
            imm_out = {instruction_code[31]? 11'h7FF:11'b0 , instruction_code[31], instruction_code[19:12], instruction_code[20], instruction_code[30:21], 1'b0};

        7'b0110111:  /*U-type, LUI*/     
            imm_out = {instruction_code[31:12], 12'b0};
        7'b0010111:  /*U-type, AUIPC*/   
            imm_out = {instruction_code[31:12], 12'b0};
        default:                     
            imm_out = {32'b0};

    endcase

end
    
endmodule