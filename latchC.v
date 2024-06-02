`timescale 1ns / 1ps

module latch_C(
    input wire clk, reset,
    input wire [7:0] current_pc,
    input wire current_regwrite,
    input wire current_memtoreg,
    input wire current_memread,
    input wire current_memwrite,
    input wire [1:0] current_rwsel,
    input wire [31:0] current_brimm,
    input wire [7:0] current_pc_four,
    input wire [31:0] current_immg,
    input wire [31:0] current_aluresult,
    input wire [31:0] current_bmux_result,
    input wire [4:0] current_rd,
    input wire [2:0] current_f3,
    input wire [6:0] current_f7,
    input wire [31:0] current_inst,
	 
	 output reg [7:0] next_pc,
    output reg next_regwrite,
    output reg next_memtoreg,
    output reg next_memread,
    output reg next_memwrite,
    output reg [1:0] next_rwsel,
    output reg [31:0] next_brimm,
    output reg [7:0] next_pc_four,
    output reg [31:0] next_immg,
    output reg [31:0] next_aluresult,
    output reg [31:0] next_bmux_result,
    output reg [4:0] next_rd,
    output reg [2:0] next_f3,
    output reg [6:0] next_f7,
    output reg [31:0] next_inst
);

    always @(posedge clk)// or negedge reset)
    begin
        if(!reset)
			begin
            next_pc <= 'b0; //arranco el programa de nuevo
				next_inst <= 'b0;
				next_f7 <= 'b0;
				next_f3 <= 'b0;
				next_rd <= 'b0;
				next_regwrite <= 'b0;
				next_memtoreg <= 'b0;
				next_memwrite <= 'b0;
				next_memread <= 'b0;
				next_bmux_result <= 'b0;
				next_aluresult <= 'b0;
				next_immg <= 'b0;
				next_pc_four <= 'b0;
				next_brimm <= 'b0;
				next_rwsel <= 'b0;
				
			end
		  else
			begin
            next_pc <= current_pc; 
				next_inst <= current_inst;
				next_f7 <= current_f7;
				next_f3 <= current_f3;
				next_rd <= current_rd;
				next_regwrite <= current_regwrite;
				next_memtoreg <= current_memtoreg;
				next_memwrite <= current_memwrite;
				next_memread <= current_memread;
				next_bmux_result <= current_bmux_result;
				next_aluresult <= current_aluresult;
				next_immg <= current_immg;
				next_pc_four <= current_pc_four;
				next_brimm <= current_brimm;
				next_rwsel <= current_rwsel;
			end								//manejar branch
    end

endmodule

