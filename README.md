Austin Tran - U22361718

Taha Ben Hadj Miled - U14114036



Half Adder - Adds two bits together, outputs are c\_out and sum.



Full Adder - Uses two half adders to add two bits together, while also taking c\_in as an input and adding that to the sum as well. Outputs are sum and c\_out.



Ripple Adder - 3 - full adders chained together. Each adder uses c\_in from the previous adder in the chain and then feeds c\_out to the next adder in the chain. This is effectively a 3 bit adder.



ALU - Uses mode bits to determine which operation the ALU should perform. Uses Ripple Adder for addition and subtraction (inverts b if mode == 01 and sets c\_in to 1 to add 1). XOR and AND are built using built in functions ^ and \&. (Add == 00) (Subtract == 01) (XOR = 10) (AND = 11). ALU is the top module.

We used our testbenches and the FPGA to test our design at each level.

