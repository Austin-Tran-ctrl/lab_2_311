module csa(
    input [3:0] a, b,
    input c_in,
    output [3:0] sum,
    output c_out
    );
    
    wire [1:0] sum0, sum1;
    wire cout0, cout1,c_mid;
    
    rca low(
        .a(a[1:0]),
        .b(b[1:0]),
        .c_in(c_in),
        .sum(sum[1:0]),
        .c_out(c_mid));
        
    rca high0(
        .a(a[3:2]),
        .b(b[3:2]),
        .c_in(0),
        .sum(sum0),
        .c_out(cout0));
        
    rca high1(
        .a(a[3:2]),
        .b(b[3:2]),
        .c_in(1),
        .sum(sum1),
        .c_out(cout1));
        
    mux m0(
        .out(sum[2]),
        .sel(c_mid),
        .x0(sum0[0]),
        .x1(sum1[0]));
   
   mux m1(
        .out(sum[3]),
        .sel(c_mid),
        .x0(sum0[1]),
        .x1(sum1[1]));

    mux m2(
        .out(c_out),
        .sel(c_mid),
        .x0(cout0),
        .x1(cout1));
    
    
endmodule
