`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 10:31:14 AM
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
    reg  [3:0] a;
    reg  [3:0] b;
    reg  [2:0] Op;
    reg  mode;
    reg  c_in;
    
    wire [3:0] result;
    wire       c_out;
    
    integer i, j, k, m, n, errors;
    ALU ALU_Test (
        .a(a),
        .b(b),
        .mode(mode),
        .c_in(c_in),
        .Op(Op),
        .result(result),
        .c_out(c_out)
    );
    
    initial begin
        a = 4'b0000;
        b = 4'b0000;
        mode = 1'b0;
        c_in = 1'b0;
        Op = 3'b000;
        errors = 0;
        #50;
        
        for (m = 0; m < 2; m = m + 1) begin
            mode = m;
            for (n = 0; n < 2; n = n + 1) begin
                c_in = n;
                for (i = 0; i < 8; i = i + 1) begin
                    Op = i;
                    for (k = 0; k < 16; k = k + 1) begin
                        b = k;
                        for (j = 0; j < 16; j = j + 1) begin
                        a = j;
                        #10;
                        end
                    end
                end
            end
        end
                     
                      
        $finish;
    end
