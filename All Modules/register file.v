module register_file(input clk,
input rst,
input WE3,
input wire [31:0] WD3, 
input wire [4:0] A1,
input wire [4:0] A2,
input wire [4:0] A3,
output wire [31:0] RD1,
output wire [31:0] RD2);

reg [31:0] reg_file [0:99];

integer i;

always @(posedge clk or negedge rst)
begin 
if(!rst)
for(i=0;i<100;i=i+1)
reg_file[i] <= 32'b0;
else if(WE3)
reg_file[A3] <= WD3;
end
assign RD1= reg_file[A1];
assign RD2= reg_file[A2];
endmodule

