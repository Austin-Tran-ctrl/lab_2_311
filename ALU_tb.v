`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 02:57:41 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(

);

    reg  [2:0] a;
    reg  [2:0] b;
    reg  [1:0] mode;
    reg        c_in;
    
    wire [2:0] result;
    wire       c_out;
    
    ALU ALU_Test (
        .a(a),
        .b(b),
        .mode(mode),
        .c_in(c_in),
        .result(result),
        .c_out(c_out)
    );
    
initial begin
        a = 3'b000;
        b = 3'b000;
        mode = 2'b00;
        c_in = 1'b0;
        #50;
        
        // Adding: 3 + 2 = 5 
        a = 3'b011; b = 3'd2; c_in = 1'b0; #10;
        
        // Adding 5 + 4 = 9 so the sum should be 1 with Carryout 1
        a = 3'd5; b = 3'd4; c_in = 1'b0; #10;
        
        // Adding 2 + 1 + 1 (from carry in) = 4
        a = 3'd2; b = 3'd1; c_in = 1'b1; #10;

        //subtracting 
        mode = 2'b01; c_in = 1'b0; //in the ALU it changes c_in to 1 for subtracting
        
        a = 3'd5; b = 3'd2; #10; // Subtracting: 5 - 2 = 3
        
        a = 3'd7; b = 3'd3; #10;// Subtracting: 7 - 3 = 4


        mode = 2'b10; //XOR
        
        // XOR: 3'b101 ^ 3'b011 = 3'b110
        a = 3'b101; b = 3'b011; #10;
        
        // XOR: 3'b111 ^ 3'b111 = 3'b000
        a = 3'b111; b = 3'b111; #10;

        mode = 2'b11; // AND
        
        // AND: 3'b101 & 3'b011 = 3'b001
        a = 3'b101; b = 3'b011; #10;
        
        // AND: 3'b110 & 3'b100 = 3'b100
        a = 3'b110; b = 3'b100; #10;
        #10;
        $finish;
    end

endmodule

