module OrUnit8(A, B, C);
  input signed [7:0] A, B;
  output signed [7:0] C;

  assign C = A | B;
endmodule


// test
module TestOrUnit8;
 // implement the circuit
  reg signed [7:0] A, B;
  wire signed [7:0] C;
  
  OrUnit8 orUnit8(A, B, C);

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
    $dumpfile("OrUnit8.vcd");
    $dumpvars(0, TestOrUnit8);
  end


  // monitor
  initial begin
    $display();
    $display("********************  TEST OrUnit8  ********************");
    $display("  A   B   C");
    $monitor("%3d %3d %3d", A, B, C); 
  end

endmodule