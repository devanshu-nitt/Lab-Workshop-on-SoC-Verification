`timescale 1ns/1ps

module decade_counter_tb;

	parameter COUNT = 10;
	parameter WIDTH = $clog2(COUNT);

	reg clk, rst, en;
	wire	[WIDTH-1:0]	out;

	decade_counter #(.COUNT(COUNT)) uut (
		.clk(clk),
		.rst(rst),
		.en(en),
		.out(out)
	);
	
	initial clk = 0;

	always #10 clk = ~clk;

	initial begin
		rst = 0; en = 0;

		#10 rst = 1;
		
		#20 rst = 0; en = 1;

		#120 en = 0;
	
		#10 rst = 1;

		#10 rst = 0; en = 1;

		#1200 en = 0;

		$finish;
	end

	initial begin
		$monitor("Time = %0t | Reset = %b | Enable = %b | OUT = %d", $time, rst, en, out);
	end
endmodule