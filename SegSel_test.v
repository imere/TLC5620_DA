`timescale 1ns/1ps

module SegSel_test;

	reg clk;
	reg rst;
	reg [19:0] data_tmp;
	wire [2:0] sel;
	wire [3:0] seg_tmp;

	SegSel dut (.clk(clk), .rst(rst), .data_tmp(data_tmp), .sel(sel), .seg_tmp(seg_tmp));

	initial
		begin
			clk = 1;
			rst = 1;
			data_tmp = 20'd230;
			#50000000 $stop;
		end

	always #10 clk = ~clk;

endmodule
