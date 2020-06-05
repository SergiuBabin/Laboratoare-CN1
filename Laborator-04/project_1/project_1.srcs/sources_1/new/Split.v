`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2019 03:06:29 PM
// Design Name: 
// Module Name: Split
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


module Split(A, B, exponenti, mantise);
    input [15:0] A, B;
    output reg [9:0] exponenti;
    output reg [21:0] mantise;
    
    reg semn1, semn2;
    reg [4:0] exp1, exp2;
    reg [10:0] mant1, mant2;
    
    always @ (A | B)
        begin
            semn1 = A[15];
            semn2 = B[15];
            
            exp1 = A[14:10];
            exp2 = B[14:10];
            
            mant1[9:0] = A[9:0];
            mant2[9:0] = B[9:0];
            
            mant1[10] = semn1;
            mant2[10] = semn2;
            
            exponenti = {exp1, exp2};
            mantise = {mant1, mant2}; 
        end   
endmodule
