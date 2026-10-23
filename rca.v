`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 09:36:57 AM
// Design Name: 
// Module Name: rca
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


module rca(
    input [1:0] a,
    input [1:0] b,
    input c_in,
    output c_out,
    output [1:0] sum
    );
    wire w0;
    full_adder f_1(
        .a(a[0]),
        .b(b[0]),
        .c_in(c_in),
        .c_out(w0),
        .s(sum[0]));
        
     full_adder f_12(
        .a(a[1]),
        .b(b[1]),
        .c_in(w0),
        .c_out(c_out),
        .s(sum[1]));
        
endmodule
