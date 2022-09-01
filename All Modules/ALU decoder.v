module ALU_decoder(
input [1:0] ALU_OP,
input [5:0] funct,
output reg [2:0] ALU_control);
always @(*)
begin
case(ALU_OP)
2'b00:
begin
ALU_control=3'b010;
end
2'b01:
begin
ALU_control=3'b100;
end
2'b10:
begin
 case(funct)
 6'b10_0000:
 begin
 ALU_control=3'b010;
 end
 6'b10_0010:
 begin
 ALU_control=3'b100;
 end
 6'b10_1010:
 begin
 ALU_control=3'b110;
 end
 6'b01_1100:
 begin
 ALU_control=3'b101;
 end
endcase
end
default:
begin
ALU_control=3'b010;
end
endcase
end
endmodule
