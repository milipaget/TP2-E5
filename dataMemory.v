`timescale 1ns / 1ps

module datamemory (
    input clk, 			// señal de CLOCK
    input MemRead, 		// señal de lectura de memoria -> control unit
    input MemWrite, 		// señal de escritura de memoria -> control unit
    input [8:0] a , 		// address de lectura/escritura: 9 bits menos significativos de la salida de ALU
    input [31:0] wd ,	// Write Data
    input [2:0] Funct3, // bits 12 to 14 of the instruction (?)
    output reg[31:0] rd 	// Read Data
    );
    
    parameter DM_ADDRESS = 9;	// tamaño de la dirección de memoria
    parameter DATA_W = 32;		// tamaño de palabra

	 
	 // // Definición de la memoria como una matriz de 32 bits
     reg[31:0] mem [31:0];
    
	 // Bloque para leer datos de memoria
    always @* begin
       if(MemRead) begin
            case(Funct3)
            3'b000: //LB (Load Byte): Lee un byte (8 bits) y lo extiende con signo a 32 bits.
                rd = {mem[a][7]? 24'hFFFFFF:24'b0, mem[a][7:0]};
            3'b001: //LH (Load Halfword): Lee un byte (16 bits) y lo extiende con signo a 32 bits.
                rd = {mem[a][15]? 16'hFFFF:16'b0, mem[a][15:0]};
            3'b010: //LW (Load Word): Lee una palabra (32 bits)
                rd = mem[a];
            3'b100: //LBU (Load Byte Unsigned): Lee un byte (8 bits) y lo extiende sin signo a 32 bits.
                rd = {24'b0, mem[a][7:0]};
            3'b101: //LHU (Load Halfword Unsigned):Lee una media palabra (16 bits) y la extiende sin signo a 32 bits.
                rd = {16'b0, mem[a][15:0]};
            default:
                rd = mem[a];
            endcase
        end
    end
    
	 // Bloque para escribir datos en memoria
    always @(posedge clk) begin
       if (MemWrite) begin
            case(Funct3)
            3'b000: //SB - Store Byte (escritura de un byte)
                mem[a][7:0] =  wd[7:0];
            3'b001: //SH - Store Halfword (escritura de media palabra)
                mem[a][15:0] = wd[15:0];
            3'b010: // SW - Store Word (escritura de una palabra completa)
                mem[a] = wd;
            default:
                mem[a] = wd;
            endcase
        end
    end
    
endmodule
