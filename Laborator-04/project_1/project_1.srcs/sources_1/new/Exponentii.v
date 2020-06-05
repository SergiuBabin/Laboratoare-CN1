`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2019 02:41:28 PM
// Design Name: 
// Module Name: Exponentii
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


module Exponentii(clear, load, clk, exponenti, exponenti_out);
    input clear, load, clk;
    input wire [9:0] exponenti;
    output reg [9:0] exponenti_out;
    
    always @(posedge clk)
        begin
//            if(clear)
//                exponenti_out <= 0;
//            else
//                if(load)
                    exponenti_out <= exponenti;
        end
endmodule
