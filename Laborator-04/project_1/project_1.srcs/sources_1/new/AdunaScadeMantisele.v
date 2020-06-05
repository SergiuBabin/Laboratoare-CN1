`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 11:27:15 AM
// Design Name: 
// Module Name: AdunaScadeMantisele
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


module AdunaScadeMantisele(mantise, semn, operatie, mantisa_out);
    input wire [21:0] mantise;
    input wire semn, operatie;
    output reg [11:0] mantisa_out;
    
    reg [9:0] mantisa1, mantisa2;
    
    always @ (mantise)
        begin
            mantisa1 = mantise[20:11];
            mantisa2 = mantise[9:0];
            
            if(operatie == 1)
			     begin 
			         mantisa_out[10:0] = mantisa1 + ~mantisa2 + 1'b1;
			     end 
			 else 
			     begin 
			         mantisa_out[10:0] = mantisa1 + mantisa2;
			     end
			
			mantisa_out[11] = semn;	
        
        end
    
endmodule
