module half_adder_df (
	input wire	a,b,
	output wire	out, carry
);
	assign out = a^b;
	assign carry = a&b;
endmodule

module half_adder_b (
	input wire	a,b,
	output reg	out, carry
);
	always @(*) begin
		out = a^b;
		carry = a&b;
	end
endmodule

module half_adder_s (
	input wire	a,b,
	output wire	out, carry
);

	xor xor1(out, a, b);	
	and and1(carry, a, b);
endmodule
