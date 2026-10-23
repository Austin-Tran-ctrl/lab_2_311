`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2026 02:15:35 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [3:0] a,
    input [3:0] b,
    input [2:0] Op,
    input mode,
    input c_in,
    output reg [3:0] result,
    output reg c_out
    );
    
    wire [3:0] b_new;
    wire c_in_new;
    wire [3:0] adder_sum;
    wire adder_c_out;
    
    assign b_new = (mode == 1'b1) ? 
                   ((Op == 3'b011) ? ~b : // for A - B
                    (Op == 3'b110) ? 4'b0001 : //set b to 1 for A + 1
                    (Op == 3'b111) ? 4'b1111 : b) : b; // A + (-1) = A - 1
                    
    assign c_in_new = (mode == 1'b1) ? 
                      ((Op == 3'b011) ? 1'b1 : // adds 1 to A-B to satisfy 2's compliment
                       (Op == 3'b110) ? 1'b0 : // c_in should be 0
                       (Op == 3'b111) ? 1'b0 : c_in) : c_in; //c_in should be 0
        
    csa CSA(
        .b(b_new),
        .a(a),
        .c_in(c_in_new),
        .sum(adder_sum),
        .c_out(adder_c_out));
        
    always @(*) begin
        case (mode)
            1'b0: begin // Logical
                case (Op)
                    3'b000: begin
                        result = a & b;
                        c_out = 1'b0; 
                    end
                    3'b001: begin
                        result = a | b;
                        c_out = 1'b0;
                    end
                    3'b010: begin
                        result = ~(a & b);
                        c_out = 1'b0;
                    end
                    3'b011: begin
                        result = ~(a | b);
                        c_out = 1'b0;
                    end
                    3'b100: begin
                        result = a ^ b;
                        c_out = 1'b0;
                    end
                    3'b101: begin
                        result = a ~^ b;
                        c_out = 1'b0;
                    end
                    3'b110: begin
                        result = ~a;
                        c_out = 1'b0;
                    end
                    3'b111: begin
                        result = ~b;
                        c_out = 1'b0;
                    end
                    default: begin
                        result = 4'b0000;
                        c_out = 1'b0;
                    end
                endcase
            end
            
            1'b1: begin // Arithmetic
                case (Op)
                    3'b000: begin
                        result = -a;
                        c_out = 1'b0;
                    end
                    3'b001: begin
                        result = -b;
                        c_out = 1'b0;
                    end
                    3'b010: begin // a+b
                        result = adder_sum;
                        c_out = adder_c_out;
                    end
                    3'b011: begin // a-b
                        result = adder_sum;
                        c_out = adder_c_out;
                    end
                    3'b100: begin
                        result = a * b;
                        c_out = 1'b0;
                    end
                    3'b101: begin
                        result = b - a;
                        c_out = 1'b0;
                    end
                    3'b110: begin // a+1
                        result = adder_sum;
                        c_out = adder_c_out;
                    end
                    3'b111: begin // a-1
                        result = adder_sum;
                        c_out = adder_c_out;
                    end
                    default: begin
                        result = 4'b0000;
                        c_out = 1'b0;
                    end
                endcase
            end
            
            default: begin
                result = 4'b0000;
                c_out = 1'b0;
            end
        endcase
    end        
endmodule