`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2019 02:48:33 PM
// Design Name: 
// Module Name: BandaAsamblare
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


module BandaAsamblare(clear, load, clk, A, B, operatie, Result, exp, mant, man2, val, mant_out);
    input clear, load, clk;
    input wire [15:0] A, B;
    input wire operatie;
    output wire [15:0] Result;
    output wire [9:0] exp;
    output wire [27:0] mant;
    output wire [21:0] man2;
    output wire [11:0] mant_out;
    output wire [5:0] val;
    
    
    //Seg 0
    wire [15:0]  A1, B1;
    wire [9:0] exponenti_0_in, exponenti_0_out;
    wire [27:0] mantise_0_in, mantise_0_out;
    
    Init init(clear, clk, A, B, A1, B1);
    Split split(A1, B1, exponenti_0_in, mantise_0_in);
    
    Exponentii e0(clear, load, clk, exponenti_0_in, exponenti_0_out);
    Mantisele m0(clear, load, clk, mantise_0_in, mantise_0_out);
    

    
    //Seg 1
    wire [5:0] valoare; //exp mai mare + diferenta exponenti
    wire [9:0] exponenti_1_in, exponenti_1_out;
    wire [27:0] mantise_1_in, mantise_1_out;    //mantise + valoare
    
    ComparaExponenti comparaExponenti(exponenti_0_out, valoare, exponenti_1_in);
    Concatenare concatenare(mantise_0_out, valoare, mantise_1_in);

    Exponentii e1(clear, load, clk, exponenti_1_in, exponenti_1_out);
    Mantisele m1(clear, load, clk, mantise_1_in, mantise_1_out);
    
    
    //Seg 2
    wire [4:0] exponenti_2_in, exponenti_2_out;
    wire [21:0] mantise_2_in, mantise_2_out;
    wire semn, operatie_2_out;
    
    AlegeExponent alegeExponent(exponenti_1_out, exponenti_2_in);
    AliniereMantise aliniereMantise(mantise_1_out, mantise_2_in, semn);
    
    
    Exponent e2(clear, load, clk, exponenti_2_in, exponenti_2_out);
    Mantisele m2(clear, load, clk, mantise_2_in, mantise_2_out);
    Exponent op2(clear, load, clk, operatie, operatie_2_out);
    
    
    
    //Seg 3
    wire [4:0] exponent_3_out;
    wire [11:0] mantise_3_in, mantise_3_out;
    
    AdunaScadeMantisele adunaScadeMantisele(mantise_2_out, semn, operatie_2_out, mantise_3_in);
    
    Exponent e3(clear, load, clk, exponenti_2_out, exponent_3_out);
    Mantisa m3(clear, load, clk, mantise_3_in, mantise_3_out);
    
//    assign mant_out = mantise_3_out;
//    assign val = valoare;
//    assign mant = mantise_1_in;
//    assign man2 = mantise_2_out;
//    assign exp = exponenti_1_out;
    
    //Seg 4
    wire [4:0] exponent_4_in, exponent_4_out;
    wire [11:0] mantise_4_in, mantise_4_out;
    wire valoare2;
    
    Normalizare norm(mantise_3_out, valoare2, mantise_4_in);
    AjustareExponent ajustareExponent(exponent_3_out, valoare2, exponent_4_in);
    
    Exponent e4(clear, load, clk, exponent_4_in, exponent_4_out);
    Mantisa m4(clear, load, clk, mantise_4_in, mantise_4_out);
    
    assign exp = mantise_4_out;
    assign Result = {mantise_4_out[10], exponent_4_out, mantise_4_out[9:0]};
    
endmodule
