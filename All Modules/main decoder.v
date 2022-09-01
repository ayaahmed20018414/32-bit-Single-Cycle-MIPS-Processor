module main_decoder(input [5:0]op_code,
output reg mem_reg,
output reg mem_write,
output reg branch,
output reg reg_dest,
output reg reg_write,
output reg ALU_SRC,
output reg jump,
output reg [1:0] ALU_OP);
/*micro processor instruction set ISA*/
always @(*)
begin
case(op_code)
//load word instruction 
6'b10_0011:
begin
mem_reg=1'b1;
mem_write=1'b0;
branch=1'b0;
reg_dest=1'b0;
reg_write=1'b1;
ALU_SRC=1'b1;
jump=1'b0;
ALU_OP=2'b00;
end
//store word instruction
6'b10_1011:
begin
mem_reg=1'b1;
mem_write=1'b1;
branch=1'b0;
reg_dest=1'b0;
reg_write=1'b0;
ALU_SRC=1'b1;
jump=1'b0;
ALU_OP=2'b00;
end
//rtype
6'b00_0000:
begin
mem_reg=1'b0;
mem_write=1'b0;
branch=1'b0;
reg_dest=1'b1;
reg_write=1'b1;
ALU_SRC=1'b0;
jump=1'b0;
ALU_OP=2'b10; 
end
//add immediate instruction
6'b00_1000:
begin
mem_reg=1'b0;
mem_write=1'b0;
branch=1'b0;
reg_dest=1'b0;
reg_write=1'b1;
ALU_SRC=1'b1;
jump=1'b0;
ALU_OP=2'b00;
end
//branch if equal instruction
6'b00_0100:
begin
mem_reg=1'b0;
mem_write=1'b0;
branch=1'b1;
reg_dest=1'b0;
reg_write=1'b0;
ALU_SRC=1'b0;
jump=1'b0;
ALU_OP=2'b01;
end
//jump instruction
6'b00_0010:
begin
mem_reg=1'b0;
mem_write=1'b0;
branch=1'b0;
reg_dest=1'b0;
reg_write=1'b0;
ALU_SRC=1'b0;
jump=1'b1;
ALU_OP=2'b00;
end
default:
begin
mem_reg=1'b0;
mem_write=1'b0;
branch=1'b0;
reg_dest=1'b0;
reg_write=1'b0;
ALU_SRC=1'b0;
jump=1'b0;
ALU_OP=2'b00;
end
endcase
end

endmodule
