module sign_extend(input [15:0] instr,
output [31:0] extend_instr);
assign extend_instr[15:0]=instr[15:0];
assign extend_instr[31:16]={16{instr[15]}};

endmodule
