`timescale 1ns / 1ps

module instruction_mem #(parameter ADDRESS = 8, parameter INST = 32)(
    input wire [ADDRESS-1:0] addr,
    output wire [INST-1:0] instr
);

    reg [31:0] rom [0:63];
	
    initial begin
        $readmemh("test_program.mem", rom);
    end

    // Asignar la instrucción combinada a la salida
    assign instr = rom[addr];

endmodule