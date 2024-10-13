`include "FullAdder.v"

module TestBench;
  reg a, b, cIn;
  wire s, cOut;

  FullAdder fullAdder(a, b, cIn, s, cOut);

  initial begin
    a = 0;
    b = 0;
    cIn = 0;

    // #1
    // a = 0;
    // b = 1;
    // cIn = 0;

    // #1
    // a = 0;
    // b = 1;
    // cIn = 1;

    // #1
    // a = 1;
    // b = 1;
    // cIn = 1;

    #10
    $finish;
  end

  initial begin
    $monitor("a=%b b=%b cin=%b cout=%b s=%b", a, b, cIn, cOut, s);
  end

  initial begin
    $dumpfile("FullAdder.vcd");
    $dumpvars(0, TestBench);
  end

endmodule