`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2019 02:19:07 PM
// Design Name: 
// Module Name: AlegeExponent
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


module AlegeExponent(exponenti, exponent);
    input wire [9:0] exponenti;
    output reg [4:0] exponent;
    
    always @ (exponenti)
        begin
            exponent = exponenti[9:5];
        end
endmodule
