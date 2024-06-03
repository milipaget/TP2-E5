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
    if(reset != 1'b1)
        for (i = 0; i < NUM_REGISTERS ; i = i + 1)
            registers[i] <= 0;		//Si reset esta prendido, pongo todos los registros en cero
    else if(reset ==1'b0 && write_enable ==1'b1)
        registers[write_Reg] <= write_data;		//Escribo en el registro indicado 
end

assign read_data1 = registers[read_Reg1_add];
assign read_data2 = registers[read_Reg2_add];
	  
endmodule
