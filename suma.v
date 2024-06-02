`timescale 1ns / 1ps

module suma
    #(parameter WIDTH = 8)
    (input wire [WIDTH-1:0] a,b,
     output wire [WIDTH-1:0] out);


assign out = a + b;

endmodule