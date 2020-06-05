module simConv_testbench();
    reg[5:0] valoare_bin;
    wire[3:0] BCD0, BCD1;
    reg [7:0] i;
    Convertor a(valoare_bin, BCD0, BCD1);
    initial
begin
    for (i = 0; i < 65; i = i + 1)
    begin
        valoare_bin = i;
        #10;
    end
    #1000 $stop;
end

endmodule