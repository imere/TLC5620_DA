`timescale 1ns/1ps

module b2bcd_99_test;

	reg [19:0] din;
	wire [19:0] dout;

	b2bcd_99 dut (.din(din), .dout(dout));

	initial
		begin
			din = 20'd23;
			#500000 $stop;
		end

endmodule
