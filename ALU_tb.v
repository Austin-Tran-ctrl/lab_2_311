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

    reg  [3:0] a;
    reg  [3:0] b;
    reg  mode;
    reg        c_in;
    
    wire [3:0] result;
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
        a = 4'b0000;
        b = 4'b0000;
        mode = 1'b0;
        c_in = 1'b0;
        #50;
        
        
        $finish;
    end

endmodule

