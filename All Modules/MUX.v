module MUX #(parameter data_width=32)
(input [data_width-1:0] in1,
input [data_width-1:0] in2,
input sel,
output [data_width-1:0] out);

wire [data_width-1:0] sel1;

assign sel1[data_width-1:0]={data_width{sel}};

assign out=(in1&(~sel1))|(in2 & sel1);

endmodule
