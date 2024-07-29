`timescale 1ns / 1ps
module ALU_TB;
	reg [7:0] a;
	reg [7:0] b;
	reg [3:0] select;
	reg clk;
	reg rst;
	wire [7:0] final;
	ALU uut (
		.a(a), 
		.b(b), 
		.select(select), 
		.clk(clk), 
		.rst(rst),		
		.final(final)
	);

	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
	   rst =1;
		#20;
		rst = 0;
		#10;
		a = 8'b01010101;
		b = 8'b10110101;
		select = 4'b0000;
		#100; 
		a = 8'b11011011;
		b = 8'b10101010;
		select = 4'b0001;
		#100; 
		select = 4'b0010;
      #100; 
		select = 4'b0011;
		#100; 
		select = 4'b0100;
		#100; 
		a = 8'b00010111;
		select = 4'b0101;
		#100; 
		a = 8'b10010111;
		select = 4'b0110;
		#100;
		select = 4'b0111;
		#100;
		select = 4'b1000;
		#100;
		select = 4'b1001;
		#100;
		select = 4'b1010;
		$stop;
	end
endmodule

