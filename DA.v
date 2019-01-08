module DA_TCL5620 (
	input clk,
	output reg data,
	output reg load = 1,
	output reg ldac = 0,
	output reg [19:0] data_tmp
);

	localparam _DACA = 2'b00;
	localparam _DACB = 2'b01;
	localparam _DACC = 2'b10;
	localparam _DACD = 2'b11;

	parameter [1:0] DAC_OUT = _DACA;
	parameter RNG = 1'b0;
	parameter [7:0] CODE = 8'b10_000_000;
	localparam [10:0] _D = { DAC_OUT, RNG, CODE };

	reg [4:0] count = 0;
	localparam _DATA_COUNT = 5'd11;

	always @ (posedge clk)
		begin

			if (count < _DATA_COUNT + 1)
				begin

					case (count)
						0:
							begin
								data <= _D[10];
							end
						1:
							begin
								data <= _D[9];
							end
						2:
							begin
								data <= _D[8];
							end
						3:
							begin
								data <= _D[7];
							end
						4:
							begin
								data <= _D[6];
							end
						5:
							begin
								data <= _D[5];
							end
						6:
							begin
								data <= _D[4];
							end
						7:
							begin
								data <= _D[3];
							end
						8:
							begin
								data <= _D[2];
							end
						9:
							begin
								data <= _D[1];
							end
						10:
							begin
								data <= _D[0];
							end
						default: data <= 0;
					endcase

					count = count + 5'd1;
					data_tmp <= 25 * (RNG + 1) * CODE / 256;

				end
			else
				begin

					count = 0;
					data <= 0;

				end

		end

	always @ (posedge clk)
		begin

			if (count < _DATA_COUNT + 1)
				begin
					load <= 1;
				end
			else
				begin
					load <= 0;
				end

		end

endmodule
