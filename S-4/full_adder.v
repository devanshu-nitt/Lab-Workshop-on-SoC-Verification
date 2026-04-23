module full_adder_df(
	input wire	a, b, c,
	output	wire	out, carry
);
	
	assign out = a^b^c;
	assign carry = (a&b) | (b&c) | (c&a);

endmodule

module full_adder_b (
	input wire	a, b, c,
	output	reg	out, carry
);
	
	always @(*) begin
		out = a^b^c;
		carry = (a&b) | (b&c) | (c&a);
	end

endmodule

module full_adder_s (
	input wire	a, b, c,
	output	wire	out, carry
);

	xor xor1(out, a, b, c);
	and and1(net1, a,b);
	and and2(net2, b,c);
	and and3(net3, c,a);
	or or1(carry, net1, net2, net3);
endmodule