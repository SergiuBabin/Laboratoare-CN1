module Num_testbench();
    reg clk, reset, pauza;
    wire[5:0] valoare_bin;
    wire carry_out;
Numarator n(clk, reset, pauza, valoare_bin, carry_out);

initial begin
     reset = 1;
     pauza = 0;
     #20
     reset = 0;
    end
    initial begin
    clk = 0;
    forever #5 clk = ~clk;
    end
    endmodule   
