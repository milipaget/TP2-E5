// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"
// CREATED		"Sun Jun  2 17:20:05 2024"

module fetch_unit(
	CLK,
	RESET,
	STOP,
	BRANCH_RESET,
	PC_SEL,
	BRANCH_PC,
	CURR_PC,
	INSTRUCCION
);


input wire	CLK;
input wire	RESET;
input wire	STOP;
input wire	BRANCH_RESET;
input wire	PC_SEL;
input wire	[7:0] BRANCH_PC;
output wire	[7:0] CURR_PC;
output wire	[31:0] INSTRUCCION;

wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_3;

assign	CURR_PC = SYNTHESIZED_WIRE_4;




instruction_mem	b2v_inst(
	.addr(SYNTHESIZED_WIRE_4),
	.instr(INSTRUCCION));
	defparam	b2v_inst.ADDRESS = 8;
	defparam	b2v_inst.INST = 32;


add4	b2v_inst1(
	.a(SYNTHESIZED_WIRE_4),
	.out(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst1.WIDTH = 8;


muxpc	b2v_inst2(
	.sel(PC_SEL),
	.s0(SYNTHESIZED_WIRE_2),
	.s1(BRANCH_PC),
	.out(SYNTHESIZED_WIRE_3));
	defparam	b2v_inst2.WIDTH = 8;


prog_counter	b2v_inst3(
	.clk(CLK),
	.reset(RESET),
	.stop(STOP),
	.branch_reset(BRANCH_RESET),
	.current_pc(SYNTHESIZED_WIRE_3),
	.next_pc(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst3.WIDTH = 8;


endmodule
