`timescale 1ns / 1ps
module Numarator(input clk,
    input reset,
    input pauza,
    output reg [5:0]valoare_bin,
    output reg carry_out
    );
    
   
    always @(posedge clk)
        if(reset)
        begin
            valoare_bin = 0;
            carry_out = 0;
        end
        else
        begin
            if(valoare_bin < 59)
            begin
                valoare_bin = valoare_bin + 1;
            end
            else
            begin
                valoare_bin = 0;
                carry_out = 1;
            end
            end
            endmodule  