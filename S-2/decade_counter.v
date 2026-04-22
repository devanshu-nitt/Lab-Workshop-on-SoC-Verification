//Decade up counter with Asynchronous reset.
module decade_counter #(	parameter COUNT = 10,
				parameter WIDTH = $clog2(COUNT)) (
	
	input wire	clk,
	input wire	en,
	input wire	rst,

	output wire	[WIDTH-1:0]	out
);

	reg	[WIDTH-1:0]	count;

	initial count =0;

	always @(posedge clk, posedge rst) begin
		if(rst) begin
			count <= 0;
		end
		else begin
			if(en) begin
				if(count == COUNT -1) begin
					count <= 0;
				end
				else begin
					count <= count + 1;
				end
			end
		end
	end
	assign out = count;

endmodule
