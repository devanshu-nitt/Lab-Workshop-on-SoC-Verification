`timescale 1ns/1ps

module half_adder_tb;
	
	reg a,b;
	wire out1, out2, out3, carry1, carry2, carry3;
 
	half_adder_df HA1(.a(a), .b(b), .out(out1), .carry(carry1));
	half_adder_b  HA2(.a(a), .b(b), .out(out2), .carry(carry2));
	half_adder_s  HA3(.a(a), .b(b), .out(out3), .carry(carry3));

	integer i;

	initial begin
		for (i=0; i<4; i = i+1) begin
			#10 {a,b} = i;
		end
	end

	initial begin
		$monitor (" A = %b | B = %b || Out1 = %b | Carry1 = %b || Out2 = %b | Carry2 = %b || Out3 = %b | Carry3 = %b", a,b,out1, carry1, out2, carry2, out3, carry3);
	end
endmodule
