module top (
	input clk,
	input rst,
	output data,
	output load,
	output ldac,
	output [2:0] sel,
	output [7:0] seg
);

	wire [3:0] seg_tmp;
	wire [19:0] data_tmp;
	wire [19:0] bcd_data_tmp;

	DA_TCL5620 da (.clk(clk), .data(data), .load(load), .ldac(ldac), .data_tmp(data_tmp));

	b2bcd_99 b2bcd (.din(data_tmp), .dout(bcd_data_tmp));

	SegSel ss (.clk(clk), .rst(rst), .data_tmp(bcd_data_tmp), .sel(sel), .seg_tmp(seg_tmp));

	Convert cvtr (.clk(clk), .i(seg_tmp), .o(seg));

endmodule
