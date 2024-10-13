`include "../../units/and-unit-8bit/AndUnit8.v"

module TestAndUnit8bit;
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
    $dumpfile("and_unit_8bit.vvp.vcd");
    $dumpvars(0, TestAndUnit8bit);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST AndUnit8bit  ********************");
    $display("  A   B   C");
    $monitor("%3d %3d %3d", A, B, C); 
  end

  
endmodule