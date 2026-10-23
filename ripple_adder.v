`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 10:48:03 AM
// Design Name: 
// Module Name: ripple_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ripple_adder(

    input c_in,
    input [3:0] a,
    input [3:0] b,
    output [3:0] sum,
    output c_out
    
    );
    
    wire c1;
    wire c2;
    wire c3;	
    
    full_adder f1(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .sum(sum[0]),
        .c_out(c1));
        
    full_adder f2(
        .a(a[1]),
        .b(b[1]),
        .c_in(c1),
        .sum(sum[1]),
        .c_out(c2));
        
    full_adder f3(
        .a(a[2]),
        .b(b[2]),
        .c_in(c2),
        .c_out(c3),
        .sum(sum[2]));

    full_adder f4(
        .a(a[3]),
        .b(b[3]),
        .c_in(c3),
        .c_out(c_out),
        .sum(sum[3]));

endmodule
