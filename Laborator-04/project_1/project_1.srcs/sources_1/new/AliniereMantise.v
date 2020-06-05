`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2019 02:19:32 PM
// Design Name: 
// Module Name: AliniereMantise
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


module AliniereMantise(mantise, mantise_out, semn);
    input wire [27:0] mantise;
    output reg [21:0] mantise_out;
    output reg semn;
    //output reg op;
    
    reg [5:0] valoare;
	reg [10:0] mantisa1, mantisa2;
	reg semn1, semn2;
    
    always @ (mantise)
        begin
            valoare = mantise[27:22];
            mantisa1 = mantise[21:11];
			mantisa2 = mantise[10:0];
			
			semn1 = mantisa1[10];
			semn2 = mantisa2[10];
			
			mantisa1[10] = 1'b1;
			mantisa2[10] = 1'b1;
			
			semn = semn1 ^ semn2;
			if (valoare[5] == 1'b1) // exponent1 > exponent2
				begin
					mantisa2 = mantisa2 >> valoare[4:0];
					mantise_out = {mantisa1, mantisa2};
					//semn = semn1;
				end
			else if (valoare[5] == 1'b0) // exponent2 > exponent1
				begin
					mantisa1 = mantisa1 >> valoare[4:0];
					mantise_out = {mantisa2, mantisa1};
					//semn = semn2;
				end
        end
    
endmodule
