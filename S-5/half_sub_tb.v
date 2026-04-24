`timescale 1ns/1ps

module half_sub_tb;

	reg	a,b;
	wire	out1, diff1;
	wire	out2, diff2;
	wire	out3, diff3;

	integer	i;

	half_subtractor_df HS1(.a(a), .b(b), .out(out1), .diff(diff1));
	half_subtractor_b HS2 (.a(a), .b(b), .out(out2), .diff(diff2));
	half_subtractor_s HS3 (.a(a), .b(b), .out(out3), .diff(diff3));

	initial begin
		for (i=0; i<4; i= i+1) begin
			#10 {a,b} = i;
		end
	end
		
	initial begin
		$monitor (" A = %b | B = %b || OUT1 = %b | CARRY1 = %b || OUT2 = %b | CARRY2 = %b || OUT3 = %b | CARRY3 = %b", a,b,out1,diff1,out2,diff2,out3,diff3);
	end
endmodule

		