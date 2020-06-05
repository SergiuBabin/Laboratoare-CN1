module sum_16b(
    input [15:0]a,
    input [15:0]b,
    input c_in,
    output G,
    output P,
    output [15:0] sum,
    output Cout
    );
    
    wire [15:0]s;
    wire [3:0]g_in, p_in;
    wire [3:0]carry_UAT;
    wire Gp,Pp;
    
    uat instance1(c_in,g_in,p_in,G,P,carry_UAT);
    sum_4b sum1(a[3:0],b[3:0],c_in,g_in[0],p_in[0],sum[3:0]);
    sum_4b sum2(a[7:4],b[7:4],carry_UAT[0],g_in[1],p_in[1],sum[7:4]);
    sum_4b sum3(a[11:8],b[11:8],carry_UAT[1],g_in[2],p_in[2],sum[11:8]);
    sum_4b sum4(a[15:12],b[15:12],carry_UAT[2],g_in[3],p_in[3],sum[15:12]);
    assign Cout = carry_UAT[3];
    
endmodule