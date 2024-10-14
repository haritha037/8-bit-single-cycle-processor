module Clock(clk);
  output reg clk;

  initial begin
    clk = 1;
    forever begin
      #5 clk = ~clk;
    end
  end
endmodule