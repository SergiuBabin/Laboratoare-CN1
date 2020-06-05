`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2019 03:35:45 PM
// Design Name: 
// Module Name: ComparaExponenti
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


module ComparaExponenti(exponenti, valoare, exponenti_out);
    input wire [9:0] exponenti;
    output reg [5:0] valoare;
    output reg [9:0] exponenti_out;
    
    reg [4:0] exp1, exp2;
    
    always @ (exponenti)
        begin
            exp1 = exponenti[9:5];
            exp2 = exponenti[4:0];
            valoare = 5'b0;
            exponenti_out = 10'b0;
            
            if(exp1 > exp2)
                begin
                    valoare[4:0] = exp1 - exp2;
                    valoare[5] = 1'b1;
                    exponenti_out = {exp1, exp2};
                end
            else if (exp2 > exp1)
                begin
                    valoare[4:0] = exp2 - exp1;
                    valoare[5] = 1'b0;
                    exponenti_out = {exp2, exp1};
                end
        end
endmodule
