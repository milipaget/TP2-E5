`timescale 1ns / 1ps

/*
Este módulo se utiliza en un pipeline para detectar y manejar peligros de datos (hazards).
-> cuando una instrucción depende de los resultados de una instrucción anterior que aún no ha sido completada, el 
	módulo detecta si una instrucción en la etapa ID/EX está leyendo de la memoria y  el registro destino de esa 
	instrucción es igual a alguno de los registros fuente de la instrucción en la etapa IF/ID. 
	Si se detecta tal condición, se activa la señal stall para detener el avance del pipeline y permitir que la instrucción
	anterior complete su acceso a la memoria, evitando así un error de datos.
*/

module HazardDetection (
    input [4:0] IF_ID_RS1,     // Identificador del primer registro fuente en la etapa de instrucción fetch (IF)
    input [4:0] IF_ID_RS2,     // Identificador del segundo registro fuente en la etapa de instrucción fetch (IF)
    input [4:0] ID_EX_rd,      // Identificador del registro destino en la etapa de instrucción decode/execute (ID/EX)
    input ID_EX_MemRead,       // Señal que indica si la instrucción en la etapa ID/EX está leyendo de memoria
    output reg stall           // Señal de control que indica si se debe detener el pipeline
    );

	 // Bloque siempre activo (combinacional) que determina si se necesita un stall (detener el pipeline)
    always @(*) begin
        if (ID_EX_MemRead && ((ID_EX_rd == IF_ID_RS1) || (ID_EX_rd == IF_ID_RS2))) begin
            stall = 1;
        end else begin
            stall = 0;
        end
    end

endmodule
