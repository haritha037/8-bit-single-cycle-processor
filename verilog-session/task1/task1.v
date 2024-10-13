module Task1;
 // implement the circuit
  reg signed [7:0] A, B;
  wire signed [7:0] C;
  OrUnit orUnit(A, B, C);

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


module OrUnit8(A, B, C);
  input signed [7:0] A, B;
  output signed [7:0] C;

  assign C = A | B;
endmodule


