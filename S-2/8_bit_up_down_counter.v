module up_down_counter #(	parameter WIDTH = 8)(

	input wire	clk,
	input wire	up, down,

	output	wire	[WIDTH-1:0]	out
);
	reg	[WIDTH-1:0]	count;	
	
	initial count =0;

	always @(posedge clk) begin
		if(up) begin
			if(count < 2**WIDTH -1) begin
				count <= count +1;
			end
		end
		else if(down) begin
			if(count > 0) begin
				count <= count - 1;
			end
		end
	end
	assign out = count;
endmodule
