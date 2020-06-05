module sum_4b(
    input [3:0]a,
    input [3:0]b,
    input c_in,
    output G,
    output P,
    output [3:0] sum,
    output Cout
    );
    
    wire [3:0]s;
    wire [3:0]g_in, p_in;
    wire [3:0]carry_UAT;
    wire Gp,Pp;
    
    uat instance1(c_in,g_in,p_in,G,P,carry_UAT);
    sum sum1(a[0],b[0],c_in,g_in[0],p_in[0],sum[0]);
    sum sum2(a[1],b[1],carry_UAT[0],g_in[1],p_in[1],sum[1]);
    sum sum3(a[2],b[2],carry_UAT[1],g_in[2],p_in[2],sum[2]);
    sum sum4(a[3],b[3],carry_UAT[2],g_in[3],p_in[3],sum[3]);
    assign Cout = carry_UAT[3];
    
endmodule
