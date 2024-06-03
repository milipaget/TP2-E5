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
// CREATED		"Sun Jun  2 19:37:22 2024"

module BlockALU(
	ALU_src,
	ALUop,
	ALURES_C,
	f3,
	f7,
	Forward_A,
	Forward_B,
	ImmG,
	RD1,
	RD2,
	WB_DATA,
	BMUX_RESULT,
	ALURES_B
);


input wire	ALU_src;
input wire	[1:0] ALUop;
input wire	[31:0] ALURES_C;
input wire	[2:0] f3;
input wire	[6:0] f7;
input wire	[1:0] Forward_A;
input wire	[1:0] Forward_B;
input wire	[31:0] ImmG;
input wire	[31:0] RD1;
input wire	[31:0] RD2;
input wire	[31:0] WB_DATA;
output wire	BMUX_RESULT;
output wire	[31:0] ALURES_B;

wire	[3:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;





ALUController	b2v_inst(
	.ALUOp(ALUop),
	.Funct3(f3),
	.Funct7(f7),
	.Operation(SYNTHESIZED_WIRE_0));


alu	b2v_inst2(
	.Operation(SYNTHESIZED_WIRE_0),
	.SrcA(SYNTHESIZED_WIRE_1),
	.SrcB(SYNTHESIZED_WIRE_2),
	.ALUResult(ALURES_B));
	defparam	b2v_inst2.DATA_WIDTH = 32;
	defparam	b2v_inst2.OPCODE_LENGTH = 4;


mux2	b2v_inst5(
	.s(ALU_src),
	.d0(SYNTHESIZED_WIRE_3),
	.d1(ImmG),
	.y(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst5.WIDTH = 32;


mux4	b2v_MUXFA_(
	.d00(RD1),
	.d01(ALURES_C),
	.d10(WB_DATA),
	
	.s(Forward_A),
	.y(SYNTHESIZED_WIRE_1));
	defparam	b2v_MUXFA_.WIDTH = 32;


mux4	b2v_MUXFB_(
	.d00(RD2),
	.d01(ALURES_C),
	.d10(WB_DATA),
	
	.s(Forward_B),
	.y(SYNTHESIZED_WIRE_3));
	defparam	b2v_MUXFB_.WIDTH = 32;


endmodule
