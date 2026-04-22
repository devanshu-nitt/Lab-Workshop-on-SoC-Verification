`timescale 1ns/1ps

module up_counter_tb;

	parameter		WIDTH = 4;
	reg			clk, en;
	wire	[WIDTH-1:0]	out;

	up_counter #(.WIDTH(WIDTH)) uut (
		.clk(clk),
		.en(en),
		.out(out)
	);

	initial clk = 0;

	always #10 clk = ~clk;

	initial begin
		en=0;
		#10 en = 1;

		#100 en = 0;

		#50 en = 1;
	
		#1000 en = 0;
		$finish;
	end
	initial begin
		$monitor ("Time = 0%t | Enable = %b | Output = %d", $time, en, out);
	end
endmodule
