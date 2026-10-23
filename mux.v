`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 12:10:36 PM
// Design Name: 
// Module Name: mux
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


module mux(
    input x,
    input s,
    output out
    );
    
    wire w1, w2, s_n, x_n;
    
    not n1(s_n, s);
    not n2(x_n, x);
    
    and a1(w1, x, s_n);
    and a2(w2, x_n, s);
    
    or f(out, w1, w2);
    
endmodule
