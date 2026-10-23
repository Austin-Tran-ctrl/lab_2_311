Austin Tran - U22361718

Taha Ben Hadj Miled - U14114036

We updated our ALU to support more operation types. It now uses a Carry Select Adder that consists of a lower ripple carry adder that computes the first 2 bits and two higher ripple carry adders that calculate the sum assuming a carry in of both 0 and 1 and uses a mux to select the correct sum.

The decoder interprets an input of 12 bits and identifies them either the Opcode, input A, or input B.

On the FPGA Board, the leftmost display bit corresponded to the ALU operation, next 2 bits corresponded to A and B, and the final rightmost bit corresponded to the output.
