module tt_um_garage(
	input rst, btn, ob, SA, SAB, clk, 
	output MS, MB
	);
	wire b;
	
	prst U1 (.rst(rst), .bt(btn), .clk(clk), .push(b));
	
	garage U2 (.rst(rst), .clk(clk), .SA(SA), .SAB(SAB), .ob(ob), .MS(MS), .MB(MB), .b(b));			
	
endmodule
