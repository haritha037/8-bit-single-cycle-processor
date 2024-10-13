`include "./units/and-unit-8bit/AndUnit8.v"
`include "./units/or-unit-8bit/OrUnit8.v"
`include "./units/mux-2x1-8bit/Mux_2x1_8bit.v"

module LogicSelector(A, B, S, Z);
  input[7:0] A, B;
  input S;
  output[7:0] Z;

  wire[7:0] C, D;

  AndUnit8 andUnit(A, B, C);
  OrUnit8 orUnit(A, B, D);
  Mux_2x1_8bit mux(C, D, S, Z);
endmodule


module TestLogicSelector;
  // build the circuit
  reg[7:0] A, B;
  reg S;
  wire[7:0] Z;

  LogicSelector logicSelector(A, B, S, Z);

  // test
  initial begin

    A = 2;
    B = 54;
    S = 0;

    #5
    A = 2;
    B = 7;
    S = 0;

    #5
    A = 2;
    B = 14;
    S = 1;

    #10
    A = 2;
    B = 14;
    S = 0;

    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("LogicSelector.vcd");
    $dumpvars(0, TestLogicSelector);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST LogicSelector  ********************");
    $display("  t   A   B   S   Z");
    $monitor("%3t %3d %3d %3d %3d",$time, A, B, S, Z); 
  end

endmodule




