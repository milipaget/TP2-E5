`timescale 1ns / 1ps

module latch_A #(parameter WIDTHPC = 8, parameter WIDTHINST=32)(
    input wire clk, reset, stop, branch_reset, 
    input wire [WIDTHPC-1:0] current_pc, 
	 input wire [WIDTHINST-1:0] current_inst, 
    output reg [WIDTHPC-1:0] next_pc,
	 output reg [WIDTHINST-1:0] next_inst
);

    always @(posedge clk)// or negedge reset)
    begin
        if(!reset || branch_reset)
			begin
            next_pc <= 'b0; //arranco el programa de nuevo
				next_inst <= 'b0;
			end
		  else
			begin
				if(!stop)
					next_pc <= current_pc;
					next_inst <= current_inst;//sigo el flujo, el current pc lo puede 
			end								//manejar branch
    end

endmodule