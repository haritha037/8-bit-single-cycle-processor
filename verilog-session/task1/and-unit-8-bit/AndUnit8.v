
module AndUnit8(A, B, C);
  input signed [7:0] A, B;
  output signed [7:0] C;

  // if we are using assign, C should be a wire.
  // if we are using always block, C should be output reg.
  assign C = A & B;
endmodule


// test
module TestAndUnit8;
 // implement the circuit
  reg signed [7:0] A, B;
  wire signed [7:0] C;
  
  AndUnit8 andUnit8(A, B, C);

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


  // gtkWave
  initial begin 
    $dumpfile("AndUnit8.vcd");
    $dumpvars(0, TestAndUnit8);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST AndUnit8  ********************");
    $display("  A   B   C");
    $monitor("%3d %3d %3d", A, B, C); 
  end

  
endmodule