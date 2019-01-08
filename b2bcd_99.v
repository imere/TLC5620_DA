module b2bcd_99 (
	input [19:0] din,
	output [19:0] dout
);

	assign dout = din + (din / 8'd10) * 8'd6;

endmodule
