`timescale 1ns / 1ps

module reg_file
	 #(parameter WIDTH = 32,
		parameter WIDTH_ADD = 5,
		parameter NUM_REGISTERS = 32)
    (input wire clk, reset, write_enable,
	  input wire [WIDTH_ADD-1:0] read_Reg1_add,
	  input wire [WIDTH_ADD-1:0] read_Reg2_add,
	  input wire [WIDTH_ADD-1:0] write_Reg,	
	  input wire [WIDTH-1:0] write_data,	//lo que escribo en el registro
	  output wire [WIDTH-1:0] read_data1,	//Lo q tiene read_reg2_add
	  output wire [WIDTH-1:0] read_data2); //Lo q tiene read_reg2_add
	  
integer i;
reg [WIDTH-1:0] registers[NUM_REGISTERS-1:0];

always @(negedge clk) 

begin
    if(reset != 1'b1) begin
         registers[0] <= 32'b0;		//Si reset esta prendido, pongo todos los registros en cero
			registers[1] <= 32'b0;
			registers[2] <= 32'b0;
			registers[3] <= 32'b0;
			registers[4] <= 32'b0;
			registers[5] <= 32'b0;
			registers[6] <= 32'b0;
			registers[7] <= 32'b0;
			registers[8] <= 32'b0;
			registers[9] <= 32'b0;
			registers[10] <= 32'b0;
			registers[11] <= 32'b0;
			registers[12] <= 32'b0;
			registers[13] <= 32'b0;
			registers[14] <= 32'b0;
			registers[15] <= 32'b0;
			registers[16] <= 32'b0;
			registers[17] <= 32'b0;
			registers[18] <= 32'b0;
			registers[19] <= 32'b0;
			registers[20] <= 32'b0;
			registers[21] <= 32'b0;
			registers[22] <= 32'b0;
			registers[23] <= 32'b0;
			registers[24] <= 32'b0;
			registers[25] <= 32'b0;
			registers[26] <= 32'b0;
			registers[27] <= 32'b0;
			registers[28] <= 32'b0;
			registers[29] <= 32'b0;
			registers[30] <= 32'b0;
			registers[31] <= 32'b0;
		end
	 else if(reset ==1'b1 && write_enable ==1'b1)
        registers[write_Reg] <= write_data;		//Escribo en el registro indicado 
end

assign read_data1 = registers[read_Reg1_add];
assign read_data2 = registers[read_Reg2_add];
	  
endmodule
