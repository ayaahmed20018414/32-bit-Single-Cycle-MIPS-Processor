module control_unit(input [5:0] op_code,
input [5:0] funct, 
output mem_reg,
output mem_write,
output branch,
output reg_dest,
output reg_write,
output ALU_SRC,
output jump,
output [2:0] ALU_control);
wire [1:0] ALU_OP;
main_decoder MAIN_DECODER (.op_code(op_code),.mem_reg(mem_reg),.mem_write(mem_write),.branch(branch),
.reg_dest(reg_dest),.reg_write(reg_write),.ALU_SRC(ALU_SRC),.jump(jump),.ALU_OP(ALU_OP));
ALU_decoder ALU_DECODER (.ALU_OP(ALU_OP),.funct(funct),.ALU_control(ALU_control));
endmodule
