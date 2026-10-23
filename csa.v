module csa ( 
	input c_in,
	input [3:0] a, 
	input [3:0] b,
	output [3:0] sum, 
	output c_out);

    wire [3:0] sum0, sum1;
    wire cout0, cout1;

    // assuming c_in = 0
    ripple_adder ripple_adder_zero(
	.c_in(1'b0),
        .a(a),
        .b(b),
        .sum(sum0),
        .c_out(cout0)
	);
    // assuming c_in = 1
    ripple_adder rca_adder_one(
	.c_in(1'b1),
        .a(a),
        .b(b),
        .sum(sum1),
        .c_out(cout1)
	);

    // if c in == 0 then choose sum0 and cout0. Otherwise sum1 and cout1
    assign sum = (cin == 1'b0) ? sum0 : sum1;
    assign cout = (cin == 1'b0) ? cout0 : cout1;
endmodule