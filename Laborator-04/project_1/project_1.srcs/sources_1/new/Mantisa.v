`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 11:44:18 AM
// Design Name: 
// Module Name: Mantisa
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


module Mantisa(clear, load, clk, mantisa, mantisa_out);
    input clear, load, clk;
    input wire [11:0] mantisa;
    output reg [11:0] mantisa_out;
    
    always @(posedge clk)
        begin
            if(clear)
                mantisa_out <= 0;
            else
                if(load)
                    mantisa_out <= mantisa;
        end
endmodule
