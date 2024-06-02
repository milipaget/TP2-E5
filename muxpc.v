`timescale 1ns / 1ps


module muxpc
    #(parameter WIDTH = 32)
    (input wire [WIDTH-1:0] s0, s1,
     input wire sel,
     output wire [WIDTH-1:0] out);

assign out = sel? s1 : s0;

endmodule