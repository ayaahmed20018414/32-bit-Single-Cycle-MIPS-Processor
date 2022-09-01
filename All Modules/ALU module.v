module ALU_mod(input [31:0] SRC_A,
input [31:0] SRC_B,
input [2:0] ALU_control,
output reg [31:0] ALU_result, 
output reg zero_flag);
always @(*)
begin 
case (ALU_control)
3'b000: 
begin
ALU_result=SRC_A & SRC_B;
end 
3'b001:
begin
ALU_result=SRC_A | SRC_B;
end 
3'b010:
begin
ALU_result=SRC_A + SRC_B;
end 
3'b011:
begin
ALU_result='b0;
end 
3'b100:
begin
ALU_result=SRC_A - SRC_B;
end 
3'b101:
begin
ALU_result=SRC_A * SRC_B;
end 
3'b110:
begin
ALU_result=(SRC_A<SRC_B) ? 32'h0000_0001:32'h0000_0000;
end 
3'b111:
begin
ALU_result='b0;
end
default:
begin 
ALU_result='b0;
end
endcase
end
always @(*)
begin
if(!ALU_result)
zero_flag=1'b1;
else
zero_flag=1'b0;
end
endmodule

