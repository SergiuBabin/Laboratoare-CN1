`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2019 02:59:49 PM
// Design Name: 
// Module Name: Init
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


module Init(clear, clk, A, B, A_out, B_out);
    input clear, clk;
    input wire [15:0] A, B;
    output reg [15:0] A_out, B_out;
    
    always @(posedge clk)
        begin
            if(clear)
                begin
                    A_out <= 0;
                    B_out <= 0;
                end
            else
                begin
                    A_out <= A;
                    B_out <= B;
                end
        end
endmodule
