module Task1;
 // implement the circuit
  reg signed [7:0] A, B;
  wire signed [7:0] C;
  AndUnit andUnit(A, B, C);

  // test
  initial begin
    A = 1;
    B = 0;

    #5
    A = 8'b11010100;
    B = 10;

    #5
    A = 15;
    B = 11;

    #5
    $finish;
  end

  // monitor
  initial begin
    $display("  A   B   C");
    $monitor("%3d %3d %3d", A, B, C); 
  end

  // gtkWave
  initial begin
    $dumpfile("task1.vcd");
    $dumpvars(0, Task1);
  end

endmodule


module AndUnit(A, B, C);
  input signed [7:0] A, B;
  output signed [7:0] C;

  // if we are using assign, C should be a wire.
  // if we are using always block, C should be output reg.
  assign C = A & B;
endmodule