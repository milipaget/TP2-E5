`timescale 1ns / 1ps

module add4
    #(parameter WIDTH = 8)
    (input wire [WIDTH-1:0] a,
     output wire [WIDTH-1:0] out);


assign out = a + 1;

endmodule