`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 11:16:33 AM
// Design Name: 
// Module Name: Exponent
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


module Exponent(clear, load, clk, exponent, exponent_out);
    input clear, load, clk;
    input wire [4:0] exponent;
    output reg [4:0] exponent_out;
    
    always @(posedge clk)
        begin
            if(clear)
                exponent_out <= 0;
            else
                if(load)
                    exponent_out <= exponent;
        end
endmodule
