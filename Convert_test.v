`timescale 1ns/1ps

module Convert_test;

	reg clk;
	reg [3:0] i = 0;
	wire [7:0] o;

	Convert dut (.clk(clk), .i(i), .o(o));

	initial
		begin
			clk = 1;
			#5000 $stop;
		end

	always #10 clk = ~clk;

	always @ (posedge clk)
		begin
			i = i + 1;
			if (i > 10)
				begin
					i = 0;
				end
		end

endmodule
