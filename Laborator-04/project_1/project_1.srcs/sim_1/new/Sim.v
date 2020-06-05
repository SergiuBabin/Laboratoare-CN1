`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/11/2019 03:26:42 PM
// Design Name: 
// Module Name: Sim
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


module Sim;

	reg clear;
	reg load;
	reg clk;
	reg [15:0] A;
	reg [15:0] B;
	reg operatie;

	wire [15:0] Result;
	wire [27:0] mant;
	wire [21:0] man2;
	wire [11:0] mant_out;
	wire [9:0] exp;
	wire [5:0] valoareapulii;

	BandaAsamblare sim (clear, load, clk, A, B, operatie, Result,exp, mant, man2, valoareapulii, mant_out);

	initial begin
		clear = 0;
		load = 0;
		clk = 0;
		
		#150
		load = 1;
		operatie = 0;
		A = 16'b0100110001101100; // 17.69
		B = 16'b0011111111110110; // 1.99
		//Result = 0100110011101011
		
		#100
		A = 16'b0100001101000011; // 3.63
		B = 16'b0100100011111111; // 9.99
		//Result = 0100101011010000
		
		#100
		operatie = 1;
		A = 16'b0100110001101100; // 17.69
		B = 16'b0011111111110110; // 1.99
		
//		#100
//		A = 16'b0100011101011010; // 7.35
//		B = 16'b0011111001001000; // 1.57
//		//Result = 0100100001110110
		
//		#100
//		A = 16'b0100001010000000; // 3.25
//		B = 16'b0100010101001010; // 5.29
//		//Result = 0100100001000101
	end
	
	always begin
		 #50 clk = ~clk;
	end    
endmodule
