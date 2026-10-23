`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2026 010:57:41 PM
// Design Name: 
// Module Name: csa_testbench
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

module csa_testbench(

);

    reg [3:0] a;
    reg [3:0] b;
    reg c_in;
    wire [3:0] sum;
    wire c_out;

    csa csa0 (
        .a(a), 
        .b(b), 
        .c_in(c_in), 
        .sum(sum), 
        .c_out(c_out)
    );

    initial begin

        a = 4'b0000;
        b = 4'b0000;
        c_in = 1'b0;

        #10;
        
        //add 3 + 1 + 0 = 4
        a = 4'b0011; b = 4'b0001; c_in = 1'b0; #10;
        
        //add 4 + 2 + 1 = 7
        a = 4'b0100; b = 4'b0010; c_in = 1'b1; #10;
        
        //add 15 + 1 = 16 (carry out should be 1)
        a = 4'b1111; b = 4'b0001; c_in = 1'b0; #10;
                
        //add 10 + 5 + 0 = 15
        a = 4'b1010; b = 4'b0101; c_in = 1'b0; #10;
	//add 8 + 3 + 1 = 12
        a = 4'b1000; b = 4'b0011; c_in = 1'b1; #10;
        $finish;
    end

endmodule