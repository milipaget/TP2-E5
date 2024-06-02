`timescale 1ns / 1ps

module instruction_mem #(parameter ADDRESS = 8, parameter INST = 32)(
    input wire [ADDRESS-1:0] addr,
    output wire [INST-1:0] instr
);

    reg [31:0] rom [0:255];

    initial
    begin
        $readmemh("test_program.mem", rom);
    end

    assign instr = rom[addr]; //LOS ULTIMOS DOS SON SIEMPRE 11
                   

endmodule
