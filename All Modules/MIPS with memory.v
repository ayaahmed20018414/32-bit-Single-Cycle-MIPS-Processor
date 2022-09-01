module MIPS_TOP_VIEW #(parameter Data_Width1=5,Data_Width2=32,Data_Width3=28) 
(input  CLK,
input  RESET,
output [15:0] test_value);
wire [31:0] Read_Data;
wire [31:0] Instruction;
wire [31:0] Program_Counter;
wire [31:0] ALU_RESULT;
wire [31:0] WRITE_DATA;
wire MEM_WE;
wire [31:0] MEM_RD;

 MIPS #(.Data_Width1(Data_Width1),.Data_Width2(Data_Width2),.Data_Width3(Data_Width3)) MIPS_PROCESSOR
(.clk(CLK),.reset(RESET),.DATA(Read_Data),.INSTR(Instruction),.PC(Program_Counter),.ALU_result(ALU_RESULT),
.Write_Data(WRITE_DATA),.MEM_WRITE_WE(MEM_WE));

inst_mem INSTRUCTION_MEMORY(.Add_PC(Program_Counter),.inst(Instruction));

data_mem DATA_MEMORY (.clk(CLK),.mem_WE(MEM_WE),.mem_WD(WRITE_DATA),.mem_Address(ALU_RESULT),.reset(RESET),
.mem_RD(Read_Data),.test_value(test_value));


endmodule
