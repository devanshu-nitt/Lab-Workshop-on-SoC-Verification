`timescale 1ns/1ps

module full_sub_tb;

	reg	a,b,c;
	wire	out1, diff1;
	wire	out2, diff2;
	wire	out3, diff3;

	integer	i;

	full_subtractor_df FS1(.a(a), .b(b), .c(c), .out(out1), .diff(diff1));
	full_subtractor_b FS2 (.a(a), .b(b), .c(c), .out(out2), .diff(diff2));
	full_subtractor_s FS3 (.a(a), .b(b), .c(c), .out(out3), .diff(diff3));

	initial begin
		for (i=0; i<8; i= i+1) begin
			#10 {a,b,c} = i;
		end
	end
		
	initial begin
		$monitor (" A = %b | B = %b | C = %b || OUT1 = %b | CARRY1 = %b || OUT2 = %b | CARRY2 = %b || OUT3 = %b | CARRY3 = %b", a,b,c,out1,diff1,out2,diff2,out3,diff3);
	end
endmodule

		
