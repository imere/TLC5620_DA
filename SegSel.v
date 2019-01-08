module SegSel (
	input clk,
	input rst,
	input [19:0] data_tmp,
	output reg [2:0] sel = 0,
	output reg [3:0] seg_tmp
);

	reg ck;
	integer cnt = 0;

	always @ (posedge clk)
		begin
			if (cnt < 80_000)
				begin
					cnt = cnt + 1;
				end
			else
				begin
					cnt = 0;
					ck = ~ck;
				end
		end

	always @ (posedge ck)
		begin

				if (sel < 3'd5)
					begin
						sel <= sel + 3'd1;
					end
				else
					begin
						sel <= 0;
					end

				case (sel)
					0:
						begin
							seg_tmp <= data_tmp[19:16];
							sel <= 3'd1;
						end
					1:
						begin
							seg_tmp <= data_tmp[15:12];
							sel <= 3'd2;
						end
					2:
						begin
							seg_tmp <= data_tmp[11:8];
							sel <= 3'd3;
						end
					3:
						begin
							seg_tmp <= data_tmp[7:4];
							sel <= 3'd4;
						end
					4:
						begin
							seg_tmp <= data_tmp[3:0];
							sel <= 3'd5;
						end
					default:
						begin
							sel <= 3'd0;
							seg_tmp <= 4'd0;
						end
				endcase

		end

endmodule
