module sum(
    input [0:0]a,
    input [0:0]b,
    input c_in,
    output reg [0:0]g,
    output reg [0:0]p,
    output reg suma
);

always@(a,b,c_in)
    begin
       g = a & b;
       p = a | b;
       suma = a + b + c_in;
    end

endmodule
