`define WIDTH 8
`define DELAY 20
`timescale 1ns/100ps

module exercise1_tb(
);
    reg [`WIDTH-1:0] A;
    reg [`WIDTH-1:0] B;
    reg [`WIDTH-1:0] C;
    reg [`WIDTH-1:0] D;
    reg [1:0] select;
    reg pass;
    wire error;
    wire [`WIDTH-1:0] out;

    exercise1 exercise1_inst(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .select(select),
        .out(out),
        .error(error)   
    );

    initial begin
        
        //you can uncomment the following statement for debugging
        $monitor("%d\tA=%d\tB=%d\tC=%d\tD=%d\tselect=%b\tout=%b\terror=%d",$time,A,B,C,D,select,out,error);

        #0 pass=1'b1; $display("%d Starting Simulation", $time);
        #`DELAY select=2'b00; A=`WIDTH'd15; B=`WIDTH'd2; C=`WIDTH'd12; D=`WIDTH'd12;
        #`DELAY if(out!= A/B || error!= (B==0)) printIncorrect;    
        
//        #`DELAY select=2'b00; A=`WIDTH'd12; B=`WIDTH'd8; C=`WIDTH'd12; D=`WIDTH'd12;
//        #`DELAY if(out!= A/B || error!= (B==0)) printIncorrect;
        
//        #`DELAY select=2'b01; A=`WIDTH'd156; B=`WIDTH'd252; C=`WIDTH'd12; D=`WIDTH'd0;
//        #`DELAY if(out!= B/C || error!= (C==0)) printIncorrect;

//        #`DELAY select=2'b10; A=`WIDTH'd12; B=`WIDTH'd8; C=`WIDTH'd128; D=`WIDTH'd12;
//        #`DELAY if(out!= C/D || error!= (D==0)) printIncorrect;

//        #`DELAY select=2'b11; A=`WIDTH'd0; B=`WIDTH'd8; C=`WIDTH'd12; D=`WIDTH'd12;
//        #`DELAY if(out!= D/A || error!= (A==0)) printIncorrect;

//        #`DELAY select=2'b00; A=`WIDTH'd87; B=`WIDTH'd202; C=`WIDTH'd2; D=`WIDTH'd1;
//        #`DELAY if(out!= A/B || error!= (B==0)) printIncorrect;
        
//        #`DELAY select=2'b01; A=`WIDTH'd56; B=`WIDTH'd0; C=`WIDTH'd8; D=`WIDTH'd5;
//        #`DELAY if(out!= B/C || error!= (C==0)) printIncorrect;

//        #`DELAY select=2'b10; A=`WIDTH'd11; B=`WIDTH'd98; C=`WIDTH'd222; D=`WIDTH'd18;
//        #`DELAY if(out!= C/D || error!= (D==0)) printIncorrect;

//        #`DELAY select=2'b11; A=`WIDTH'd0; B=`WIDTH'd8; C=`WIDTH'd12; D=`WIDTH'd0;
//        #`DELAY if(out!= D/A || error!= (A==0)) printIncorrect;

        #50 $display("%d Simulation Finished", $time);

        if (pass == 1'b1)
            $display(">>>> [PASS] Congratulations!");
        else
            $display(">>>> [ERROR] Try it again!");
        $finish;
    end

    task printIncorrect;
        begin
            pass = 1'b0;
            $display("  Error:\nsel=%b\tA=%d\tB=%d\tC=%d\tD=%d\tout=%d\terror=%d", select, A, B, C, D,out,error);
        end
    endtask

endmodule
