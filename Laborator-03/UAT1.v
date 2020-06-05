


module UAT(
    input [15:0] a,
    input [15:0] b,
    input cin,
    output reg[15:0] res,
    output cout
    );
    
    wire [15:0] res;
    
    wire P0, G0, P1, G1, P2, G2, P3, G3;
    wire C1, C2, C3;
    
    UAL u1(a[3:0], b[3:0], cin, res[3:0], P0, G0);
    assign C1 = G0 | P0 & cin;
    
    UAL u2(a[7:4], b[7:4], C1, res[7:4], P1, G1);
    assign C2 = G1 | P1 & C1;
    
    UAL u3(a[11:8], b[11:8], C2, res[11:8], P2, G2); 
    assign C3 = G2 | P2 & C2;
    
    UAL u4(a[15:12], b[15:12], C3, res[15:12], P3, G3);
    assign cout = G3 | P3 & C3;
    
endmodule
