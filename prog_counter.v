`timescale 1ns / 1ps

module prog_counter #(parameter WIDTH = 8)(
    input wire clk, reset, stop, branch_reset, 
    input wire [WIDTH-1:0] current_pc, 
    output reg [WIDTH-1:0] next_pc
);

 
	 always @(posedge clk)// or negedge reset)
    begin
        if(!reset)
            next_pc <= 8'b0; //arranco el programa de nuevo
        else
			begin
				if(!stop)
					next_pc <= current_pc; //sigo el flujo, el current pc lo puede 
			end								//manejar branch
    end

endmodule
