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
// CREATED		"Sun Jun  2 17:57:07 2024"

module decode(
	write_enable,
	reset,
	clk,
	instruction,
	opcode,
	read_Reg1_add,
	read_Reg2_add,
	write_data,
	write_Reg,
	ALUSrc,
	Memory2Register,
	Register_Write,
	Memory_Read,
	Memory_Write,
	Branch,
	JalrSel,
	ALUOp,
	imm_out,
	read_data1,
	read_data2,
	RWSel
);


input wire	write_enable;
input wire	reset;
input wire	clk;
input wire	[31:0] instruction;
input wire	[6:0] opcode;
input wire	[4:0] read_Reg1_add;
input wire	[4:0] read_Reg2_add;
input wire	[31:0] write_data;
input wire	[4:0] write_Reg;
output wire	ALUSrc;
output wire	Memory2Register;
output wire	Register_Write;
output wire	Memory_Read;
output wire	Memory_Write;
output wire	Branch;
output wire	JalrSel;
output wire	[1:0] ALUOp;
output wire	[31:0] imm_out;
output wire	[31:0] read_data1;
output wire	[31:0] read_data2;
output wire	[1:0] RWSel;






reg_file	b2v_inst(
	.clk(clk),
	.reset(reset),
	.write_enable(write_enable),
	.read_Reg1_add(read_Reg1_add),
	.read_Reg2_add(read_Reg2_add),
	.write_data(write_data),
	.write_Reg(write_Reg),
	.read_data1(read_data1),
	.read_data2(read_data2));
	defparam	b2v_inst.NUM_REGISTERS = 32;
	defparam	b2v_inst.WIDTH = 32;
	defparam	b2v_inst.WIDTH_ADD = 5;


imm_gen	b2v_inst4(
	.instruction_code(instruction),
	.imm_out(imm_out));


Control	b2v_inst5(
	.Opcode(opcode),
	.ALUSrc(ALUSrc),
	.Memory2Register(Memory2Register),
	.Register_Write(Register_Write),
	.Memory_Read(Memory_Read),
	.Memory_Write(Memory_Write),
	.Branch(Branch),
	.JalrSel(JalrSel),
	.ALUOp(ALUOp),
	.RWSel(RWSel));
	defparam	b2v_inst5.AUIPC = 7'b0010111;
	defparam	b2v_inst5.BR = 7'b1100011;
	defparam	b2v_inst5.JAL = 7'b1101111;
	defparam	b2v_inst5.JALR = 7'b1100111;
	defparam	b2v_inst5.LUI = 7'b0110111;
	defparam	b2v_inst5.LW = 7'b0000011;
	defparam	b2v_inst5.R_TYPE = 7'b0110011;
	defparam	b2v_inst5.RTypeI = 7'b0010011;
	defparam	b2v_inst5.SW = 7'b0100011;


endmodule
