`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 11:54:13 AM
// Design Name: 
// Module Name: Normalizare
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


module Normalizare (mantise, valoare, mantisa_out);
	
	input wire [11:0] mantise;
	output reg valoare;
	output reg [10:0] mantisa_out;
	reg [9:0] mantisa;
	reg depasire;
	reg semn;
	
    always @ (mantise)
        begin
            semn = mantise[11];
            depasire = mantise[10];
            mantisa = mantise[9:0];
            
            valoare = 1'b0;
            
            if(depasire == 1'b1)
                begin
                    mantisa_out[9:0] = mantisa >> 1'b1;
                    valoare = 1'b1;
                end
            else
                begin
                    mantisa_out = mantisa;
                end
                
            mantisa_out[10] = semn;
             
            
            
            
            //diferenta = 9'b0;
            
//            if (mantisa[25] != 0)
//            repeat(24)
//                begin
                
//                    if (mantisa[23] == 1'b0)
//                        begin
                        
//                            mantisa = mantisa << 1'b1;
//                            diferenta[7:0] = diferenta[7:0] + 1'b1;
                        
//                        end
                
//                end
                
//            mantisa_out[22:0] = mantisa[22:0];
//            mantisa_out[23] = semn;
            //valoarea2 = diferenta;
        
        end
		
endmodule
