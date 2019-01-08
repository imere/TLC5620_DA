`timescale 1ns/1ps

module DA_test;

	reg clk;

	wire data;
	wire ldac;
	wire load;
	wire [10:0] data_tmp;

	DA_TCL5620
		#(.DAC_OUT(2'b10), .RNG(1'b1), .CODE(8'b01_010_101))
		dut (.clk(clk), .data(data), .load(load), .ldac(ldac), .data_tmp(data_tmp));

	initial
		begin
			clk = 1;
			#10000 $stop;
		end

	always #10 clk = ~clk;

endmodule
