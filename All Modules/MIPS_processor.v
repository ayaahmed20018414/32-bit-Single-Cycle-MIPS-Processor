module MIPS #(parameter Data_Width1=5,Data_Width2=32,Data_Width3=28) 
(input clk,
input reset,
input [31:0] DATA,
input [31:0] INSTR,
output [31:0] PC,
output [31:0] ALU_result,
output [31:0] Write_Data,
output MEM_WRITE_WE
);
wire Zero;
wire MEM_REG;
wire BRANCH;
wire REG_DEST;
wire REG_WRITE;
wire ALU_src;
wire JUMP;
wire [2:0] ALU_CONTROL;
wire PC_SRC;

 controller CONTROLLER(.instr(INSTR),.zero(Zero),.mem_reg(MEM_REG),.mem_write(MEM_WRITE_WE),.branch(BRANCH),
.reg_dest(REG_DEST),.reg_write(REG_WRITE),.ALU_SRC(ALU_src),.jump(JUMP),.ALU_control(ALU_CONTROL),.PCSRC(PC_SRC));

data_path #(.data_width1(Data_Width1),.data_width2(Data_Width2),.data_width3(Data_Width3)) DATA_PATH
(.clk(clk),.reset(reset),.instr(INSTR),.data(DATA),.mem_reg(MEM_REG),.mem_write(MEM_WRITE_WE),.reg_dest(REG_DEST),
.reg_write(REG_WRITE),.ALU_SRC(ALU_src),.jump(JUMP),.ALU_control(ALU_CONTROL),
.PCSRC(PC_SRC),.zero(Zero),.PC(PC),.ALU_OUT(ALU_result),.write_data(Write_Data));



endmodule
