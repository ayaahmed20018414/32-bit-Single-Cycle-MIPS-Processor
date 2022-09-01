module shifter_to_left_twice #(parameter input_width= 32)
(input [input_width-1:0] data,
output [input_width-1:0] shifted_data);

assign shifted_data=data<<2;

endmodule 
