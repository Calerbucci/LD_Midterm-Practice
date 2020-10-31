`define WIDTH 8

module divider(a, b, o); 
input  [`WIDTH-1:0] a;
input  [`WIDTH-1:0] b;
output  [`WIDTH-1:0] o;


reg [7:0] Q[0:`WIDTH];
integer count,i;
reg [`WIDTH-1:0] b_temp, a_temp, tmp_shift;




initial begin
 for(i=0; i<9; i=i+1) begin
     Q[i] <= 8'b0;
    end
   count =0;
  #10  a_temp <= a;
  #10  b_temp <= b << 4 ;   
end

always@(*) begin
    for (count=0; count<5; count=count+1) begin
            b_temp = b_temp >> 1;
            Q[count+1] = (Q[count] << 1) + Q[0];
           if((a_temp - b_temp)<0) begin
                Q[0] = 0;
                a_temp = a_temp + 0;
           end
           else begin
                 Q[0] = 1;
                 a_temp = a_temp - b_temp;
           end
    end
end
assign o = Q[7];
endmodule

// DO NOT change IO signals and define
module exercise1(
    input wire [`WIDTH-1:0] A,
    input wire [`WIDTH-1:0] B,
    input wire [`WIDTH-1:0] C,
    input wire [`WIDTH-1:0] D,
    input wire [1:0] select,
    output reg [`WIDTH-1:0] out,
    output wire error
);

wire [`WIDTH-1:0] out_temp1, out_temp2, out_temp3, out_temp4;
reg out_temp;
reg error_temp;

 divider _1div(.a(A), .b(B), .o(out_temp1));
 divider _2div(.a(B), .b(C), .o(out_temp2));
 divider _3div(.a(C), .b(D), .o(out_temp3));
 divider _4div(.a(D), .b(A), .o(out_temp4));
 
 //select  the case
always@(*) begin
    case(select)
        2'b00: out = out_temp1;
        2'b01: out = out_temp2;
        2'b10: out = out_temp3;
        2'b11: out = out_temp4;
    endcase
end

//set error condition
always@(*) begin
     case(select)
        2'b00:begin
            if(B == 0) error_temp = 1;
            else error_temp = 0;
        end
        2'b01: begin
            if(C == 0) error_temp = 1;
            else error_temp = 0;
        end
        2'b10:begin
            if(D == 0) error_temp = 1;
            else error_temp = 0;
        end
        2'b11:begin
            if(A == 0) error_temp = 1;
            else error_temp = 0;
        end
    endcase
end

//assign out = out_temp;
assign error = error_temp;
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
