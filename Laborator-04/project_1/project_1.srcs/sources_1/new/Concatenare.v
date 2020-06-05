`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2019 02:05:24 PM
// Design Name: 
// Module Name: Concatenare
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


module Concatenare(mantise, valoare, out);
    input wire [21:0] mantise;
    input wire [5:0] valoare;
    output reg [27:0] out;
    
    always @ (valoare)
        begin
            out = {valoare, mantise};
        end
endmodule
