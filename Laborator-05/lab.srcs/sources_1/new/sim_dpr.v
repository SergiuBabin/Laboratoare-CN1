`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.05.2020 20:58:00
// Design Name: 
// Module Name: sim_dpr
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


module sim_dpr#(parameter biti = 32);
    reg clk, we_a, we_b;
    reg[2:0] addr_a, addr_b;
    reg[biti-1:0] d_in_a, d_in_b;
    wire[biti-1:0] d_out_a, d_out_b;
    integer i;
    dpr #(biti) inst1(clk, we_a, we_b, addr_a, addr_b, d_in_a, d_in_b, d_out_a, d_out_b);
    always #10 clk = ~clk; 
    initial begin 
        clk=0; we_a=0; we_b=0; d_in_a = {biti{1'bx}}; d_in_b = {biti{1'bx}}; 
        addr_a = {3{1'bx}}; addr_b = {3{1'bx}}; 
         
        //Test scriere 
        for(i=0; i<4; i=i+1) 
        begin 
            @(negedge clk); 
            #5 addr_a=i; we_a=1; d_in_a=15-i; addr_b=i+4; we_b=1; d_in_b=15-i+4; 
        end 
         
        //Test citire 
        @(negedge clk); 
        for(i=0; i<4; i=i+1) 
        begin 
            @(negedge clk); 
            #5 addr_a=i; addr_b=i+4; we_a=0; we_b=0;  
                        d_in_a={biti{1'bx}}; d_in_b={biti{1'bx}}; 
        end 
         
        //Scriere ?i citire de la aceea?i adresa la acela?i moment de timp 
        @(negedge clk); 
        #5 addr_a=5; we_a=1; d_in_a=200;   
         //Terminare 
        @(negedge clk); 
        @(negedge clk); 
        $finish; 
    end 
endmodule 
