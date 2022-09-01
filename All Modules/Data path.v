module data_path #(parameter data_width1=5,data_width2=32,data_width3=28)
(input clk,
input reset,
input [31:0] instr,
input [31:0] data,
input mem_reg,
input mem_write,
input reg_dest,
input reg_write,
input ALU_SRC,
input jump,
input [2:0] ALU_control,
input PCSRC,
output zero,
output [31:0] PC,
output [31:0] ALU_OUT,
output [31:0] write_data 
);
wire [31:0] SRC_A;
wire [31:0] SRC_B;
wire [31:0] signimm;
wire [4:0] write_reg;
wire [31:0] PC_PLUS4;
wire [27:0] PCJump;
wire [31:0] PC_branch;
wire [31:0] adder_in;
wire [31:0] PC_in;
wire [31:0] out1;
wire [31:0] out2;

/**************************register file MUX**********************/
MUX #(.data_width(data_width1)) MUX1 (.in1(instr[20:16]),.in2(instr[15:11]),.sel(reg_dest),.out(write_reg));


/**************************Data Memory MUX**********************/

MUX #(.data_width(data_width2)) MUX2 (.in1(ALU_OUT),.in2(data),.sel(mem_reg),.out(out2));



/**************************ALU  MUX**********************/

MUX #(.data_width(data_width2)) MUX3 (.in1(write_data),.in2(signimm),.sel(ALU_SRC),.out(SRC_B));

/*************************sign extend Block*************************/

sign_extend SIGN_EXTEND (.instr(instr[15:0]),.extend_instr(signimm));

/**************************ALU module**********************/

ALU_mod ALU (.SRC_A(SRC_A),.SRC_B(SRC_B),.ALU_control(ALU_control),.ALU_result(ALU_OUT),.zero_flag(zero));

/**************************1st shifter (sign extend output shift)**********************/

shifter_to_left_twice #(.input_width(data_width2)) SHIFTER1 (.data(signimm),.shifted_data(adder_in));


/**************************1st ADDER(1st shifter output is input to it) **********************/

simple_Adder Adder1(.A(adder_in),.B(PC_PLUS4),.C(PC_branch));


/**************************2nd ADER (program counter plus 4)**********************/

simple_Adder Adder2(.A(PC),.B(32'd4),.C(PC_PLUS4));


/**************************2nd shifter **********************/

shifter_to_left_twice #(.input_width(data_width3)) SHIFTER2 (.data({2'b00,instr[25:0]}),.shifted_data(PCJump));


/**************************Program Counter**********************/

program_counter PROGRAM_COUNTER (.clk(clk),.inst_Address(PC_in),.rst(reset),.fetched_inst(PC));



/**************************1st MUX before PC**********************/

MUX #(.data_width(data_width2)) MUX4 (.in1(PC_PLUS4),.in2(PC_branch),.sel(PCSRC),.out(out1));


/**************************2nd MUX before PC**********************/

MUX #(.data_width(data_width2)) MUX5 (.in1(out1),.in2({PC_PLUS4[31:28],PCJump}),.sel(jump),.out(PC_in));

/**************************register file module**********************/

register_file REGISTER_FILE (.clk(clk),.rst(reset),.WE3(reg_write),.WD3(out2),.A1(instr[25:21]),.A2(instr[20:16]), 
.A3(write_reg),.RD1(SRC_A),.RD2(write_data));


endmodule
