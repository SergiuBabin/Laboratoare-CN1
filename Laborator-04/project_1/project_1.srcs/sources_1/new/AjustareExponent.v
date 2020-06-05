`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 11:54:28 AM
// Design Name: 
// Module Name: AjustareExponent
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


module AjustareExponent (exponent, valoarea2, exponent_out);
	
	input wire [4:0] exponent;
	input wire valoarea2;
	output reg [4:0] exponent_out;
	
    always @ (exponent | valoarea2)
        begin
            if (valoarea2 == 1'b1)
                begin
                    exponent_out = exponent + 1'b1;		
                end
            else
                begin
                    exponent_out = exponent;
                end
        end
endmodule
