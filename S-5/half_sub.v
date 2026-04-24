module half_subtractor_df (
	input wire	a, b,
	output wire	out, diff
);

	assign	out = a^b;
	assign	diff = (~a)&b;
endmodule

module half_subtractor_b(
	input wire	a, b,
	output reg	out, diff
);

	always @(*) begin
		out = a^b;
		diff = (~a)&b;
	end
endmodule

module half_subtractor_s(
	input wire	a, b,
	output wire	out, diff
);

	xor xor1(out, a, b);
	not not1(net1, a);
	and and1(diff, net1, b);
endmodule