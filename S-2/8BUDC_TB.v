`timescale 1ns/1ps

module up_down_counter_tb;
	
	parameter	WIDTH = 8;

	reg	clk, up, down;
	wire	[WIDTH-1:0]	out;
	
	up_down_counter #(.WIDTH(WIDTH)) uut (
		.clk(clk),
		.up(up),
		.down(down),
		.out(out)
	);

	initial	clk = 0;
	always #10 clk = ~clk;

	initial begin
		up = 0; down = 0;

		#10 up = 1;

		#1000 up = 0;

		#10 down = 1;
		
		#500 down = 0;
	
		#10 up = 1;
		
		#2500 up = 0;

		#10 down = 1;

		#3000 down = 0;
	
		#10 up = 1; down = 1;

		#6000 up = 0; down = 0;
	
		$finish;
	end
	
	initial begin
		$monitor (" Time = %0t | UP = %b | DOWN = %b | OUT = %d", $time, up, down, out);
	end
endmodule
