`timescale 1ns / 1ps

module instruction_mem #(parameter ADDRESS = 8, parameter INST = 32)(
    input wire [ADDRESS-1:0] addr,
    output wire [INST-1:0] instr
);

    reg [7:0] rom [0:255]; // Each location holds a byte (8 bits)

    initial begin
        $readmemh("test_program.mem", rom);
    end
	 
	 assign instr[31:24] = rom[addr];
	 assign instr[23:16] = rom[addr+1];
    assign instr[15:8]  = rom[addr+2];
    assign instr[7:0]   = rom[addr+3];
    

endmodule