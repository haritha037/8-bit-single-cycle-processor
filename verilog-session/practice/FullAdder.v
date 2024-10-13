module FullAdder (a, b, cIn, s, cOut);
  input a, b, cIn;
  output reg s, cOut;

  // assign {cOut, s} = a + b + cIn;
  always @(a, b, cIn) begin
    {cOut, s} = a + b + cIn;
  end
endmodule
