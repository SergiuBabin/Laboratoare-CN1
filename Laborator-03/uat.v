module uat(
        input c_in,
        input [3:0] g_in,
        input [3:0] p_in,
        output reg UAT_G,
        output reg UAT_P,
        output reg [3:0] carry_UAT
    );
    
always @ (c_in, g_in, p_in)
    begin
        UAT_P = p_in[0] & p_in[1] & p_in[2] & p_in[3];
        UAT_G = g_in[3] | (p_in[3] & g_in[2]) | (p_in[3] & p_in[2] & g_in[1]) | (p_in[3] & p_in[2] & p_in[1] & g_in[0]);
        carry_UAT[0]=g_in[0] | (p_in[0] & c_in);
        carry_UAT[1]=g_in[1] | (p_in[1] & g_in[0]) | (p_in[1] & p_in[0] & c_in);
        carry_UAT[2]=g_in[2] | (p_in[2] & g_in[1]) | (p_in[2] & p_in[1] & g_in[0]) | (p_in[2] & p_in[1] & p_in[0] & c_in);
        carry_UAT[3]=g_in[3] | (p_in[3] & g_in[2]) | (p_in[3] & p_in[2] & g_in[1]) | (p_in[3] & p_in[2] & p_in[1] & g_in[0]) | (p_in[3] & p_in[2] & p_in[1] & p_in[0] & c_in);
    end
    
endmodule
