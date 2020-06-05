module UAL(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] res,
    output  p,
    output  g
    );
    
     assign g = a[3] & b[3];
     assign p = a[3] | b[3];  
     assign res = a + b + cin;  
     
endmodule
