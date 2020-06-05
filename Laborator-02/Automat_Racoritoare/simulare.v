`timescale 1ns / 1ps
module simulare();
reg b1, b5, b10;
reg clk, reset;
wire cola; 
wire r1, r2;

automat a(b1, b5, b10, clk, reset, cola, r1, r2);
always #20 clk = ~clk;
initial begin
    b1 = 0; b5 = 0; b10 = 0;
    clk = 0;
    reset = 1;
    #50 b1 = 0; b5 = 0; b10 = 1; reset = 0;
   #50 b1 = 0; b5 = 0; b10 = 0;reset = 0;
    #50 b1 = 0; b5 = 1; b10 = 0;reset = 0;
    #50 b1 = 0; b5 = 0 ; b10 = 0 ;reset = 0;
    #50 b1 = 1; b5 = 0; b10 = 0; reset = 0;
    #50 b1 = 1; b5 = 0; b10 = 0; reset = 0;
    #50 b1 = 1; b5 = 0; b10 = 0; reset = 0;
    #50 b1 = 0; b5 = 0; b10 = 0; reset = 0;
end
endmodule
