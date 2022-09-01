module program_counter(input clk, 
input [31:0] inst_Address,
input rst,
output reg [31:0] fetched_inst);
always @(posedge clk or negedge rst)
begin
if(!rst)
fetched_inst<=0;
else
fetched_inst<=inst_Address;
end
endmodule 
