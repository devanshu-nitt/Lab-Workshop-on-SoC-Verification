module full_subtractor_df (
	input wire	a, b, c,
	output wire	out, diff
);
	wire	out1, diff1, diff2;

	half_subtractor_df HSDF1 (.a(a), .b(b), .out(out1), .diff(diff1));

	half_subtractor_df HSDF2 (.a(out1), .b(c), .out(out), .diff(diff2));

	assign diff = diff1 | diff2;
	
endmodule

module full_subtractor_b (
	input wire	a, b, c,
	output reg	out, diff
);
	wire	out1, diff1, diff2, out2;

	half_subtractor_b HSB1 (.a(a), .b(b), .out(out1), .diff(diff1));

	half_subtractor_b HSB2 (.a(out1), .b(c), .out(out2), .diff(diff2));

	always@(*) begin
		out = out2;
		diff = diff1 | diff2;
	end
	
endmodule

module full_subtractor_s (
	input wire	a, b, c,
	output wire	out, diff
);
	wire	out1, diff1, diff2;

	half_subtractor_df HSS1 (.a(a), .b(b), .out(out1), .diff(diff1));

	half_subtractor_df HSS2 (.a(out1), .b(c), .out(out), .diff(diff2));

	or or1 (diff, diff1, diff2);
	
endmodule