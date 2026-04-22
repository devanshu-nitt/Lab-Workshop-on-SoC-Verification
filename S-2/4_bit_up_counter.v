module up_counter #(	parameter WIDTH = 4)(
	input wire	clk,
	input wire	en,
	output wire	[WIDTH-1:0]	out
);
	reg	[WIDTH-1:0]	count;

	initial count =0;

	always @(posedge clk) begin
		if(en) begin
			if(count == 2**WIDTH - 1) begin
				count <= 0;
			end
			else begin
				count <= count + 1;
			end
		end
	end
	assign out = count;

endmodule
