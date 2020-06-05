`timescale 1ns / 1ps
module automat(
input b1, b5, b10,
input clk,reset,
output reg suc, rest_5, rest_10);

reg [3:0] state;

always @(posedge clk or posedge reset)
    begin
        if(reset)
        begin
            state <= 4'b0000;
            suc <= 0; 
            rest_5 <= 0; 
            rest_10 <= 0; 
        end
        else 
        begin
        
        suc <= 0; 
        rest_5 <= 0; 
        rest_10 <= 0;    
        case({state, b1, b5, b10})
            7'b0000000:
                begin
                    state <= 4'b0000;
                    suc <= 0;    
                    rest_5 <= 0;
                    rest_10 <= 0;
                end 
            7'b0000100:
                begin
                    state <= 4'b0001;
                    suc <= 0;    
                    rest_5 <= 0;
                    rest_10 <= 0;
                end  
            7'b0001100:
                begin
                    state <= 4'b0010;
                    suc <= 0;    
                    rest_5 <= 0;
                    rest_10 <= 0;
                end  
           7'b0010100:
                begin
                    state <= 4'b0000;
                    suc <= 1;    
                    rest_5 <= 0;
                    rest_10 <= 0;
                end  
           7'b0000010: 
                begin
                    state <= 4'b0000;
                    suc <= 1;    
                    rest_5 <= 1;
                    rest_10 <= 0;
                end  
           7'b0000001: 
                begin
                    state <= 4'b0000;
                    suc <= 1;    
                    rest_5 <= 0;
                    rest_10 <= 1;
                end
           default: state <= 0;
           endcase
       end
    end
endmodule
