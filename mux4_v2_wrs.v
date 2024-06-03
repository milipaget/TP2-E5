module mux4_v2_wrs
    #(parameter WIDTH = 32)
    (
     input [WIDTH-1:0] d00,
	  input [7:0] d01, 
	  input [WIDTH-1:0] d10,
	  input [7:0]d11,
     input [1:0] s,
     output [WIDTH-1:0] y
    );

    assign y = (s == 2'b11) ? {24'b0,d11} : 
               (s == 2'b10) ? d10 : 
               (s == 2'b01) ? {24'b0,d01} : 
               d00;

endmodule