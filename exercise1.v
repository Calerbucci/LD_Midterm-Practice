`define WIDTH 8

// DO NOT change IO signals and define
module exercise1(
    input wire [`WIDTH-1:0] A,
    input wire [`WIDTH-1:0] B,
    input wire [`WIDTH-1:0] C,
    input wire [`WIDTH-1:0] D,
    input wire [1:0] select,
    output reg [`WIDTH-1:0] out,
    output reg error     
);
    // # Hint #
    // You can delcare a vector array as follows:
    //   reg [3:0] A[0:5];
    //
    // Also, for-loop in combinational always block is a handy style: 
    // integer i;
    // always @(*) begin
    //   for(i=0 ; i<5 ; i=i+1) begin
    //     A[i+1] = A[i] + 1;
    //   end
    // end
    //
    // Note that with vector array, we can avoid the style of "A = A + 1":

    // Good Luck :D

endmodule
