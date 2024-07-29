`timescale 1ns / 1ps
module ALU(
   input [7:0] a,
	input [7:0] b,
   input [3:0] select,
	input clk,
	input rst,
	output wire [7:0] final
);
reg [7:0] result;
reg one = 8'b00000001;
assign final = result;
always @(posedge clk) begin
   if(rst)
	  result = 8'b00000000;
	else begin
     case(select)
	    4'b0000: result = a + b;
		 4'b0001: result = a - b;
		 4'b0010: result = a & b;
		 4'b0011: result = a | b;
		 4'b0100: result = a ^ b;
		 4'b0101: result = a >> 1;
		 4'b0110: result = a << 1;
		 4'b0111: result = {a[0] , a[7:1]};
		 4'b1000: result = {a[6:0] , a[7]};
		 4'b1001: result = a + one;
		 4'b1010: result = a - one;
		 default result = 8'b00000000;
	  endcase
  end
end
endmodule
