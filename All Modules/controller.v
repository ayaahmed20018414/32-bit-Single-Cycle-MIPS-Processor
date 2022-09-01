module controller(input [31:0] instr,
input zero, 
output mem_reg,
output mem_write,
output branch,
output reg_dest,
output reg_write,
output ALU_SRC,
output jump,
output [2:0] ALU_control,
output PCSRC);
wire [5:0] funct=instr[5:0];
wire [5:0] op_code=instr[31:26];
control_unit COUNTROL_UNIT(.op_code(op_code),.funct(funct),.mem_reg(mem_reg),.mem_write(mem_write),.branch(branch),.reg_dest(reg_dest),
.reg_write(reg_write),.ALU_SRC(ALU_SRC),.jump(jump),.ALU_control(ALU_control));
and_gate gate1 (.IN1(branch),.IN2(zero),.OUT(PCSRC));

endmodule
