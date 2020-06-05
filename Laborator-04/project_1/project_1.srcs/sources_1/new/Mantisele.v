`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2019 02:31:27 PM
// Design Name: 
// Module Name: Mantisele
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


module Mantisele(clear, load, clk, mantise, mantise_out);
    input clear, load, clk;
    input wire [27:0] mantise;
    output reg [27:0] mantise_out;
    
    always @(posedge clk)
        begin
            if(clear)
                mantise_out <= 0;
            else
                if(load)
                    mantise_out <= mantise;
        end
endmodule
