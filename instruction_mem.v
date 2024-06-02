`timescale 1ns / 1ps

module instruction_mem #(parameter ADDRESS = 32, parameter INST = 32)(
    input wire [ADDRESS-1:0] addr,
    output wire [INST-1:0] instr
);

    reg [31:0] rom [0:100];

    initial
    begin
        $readmemh("test_program.mem", rom);
    end

    assign instr = rom[addr[31:2]]; //LOS ULTIMOS DOS SON SIEMPRE 11
                   

endmodule
