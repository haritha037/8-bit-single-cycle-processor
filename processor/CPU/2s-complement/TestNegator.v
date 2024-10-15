`include "Negator.v"

module TestNegator;
 reg signed[7:0] in;
 wire signed[7:0] out;

 Negator negator(in, out);

 initial begin
  #4
  in = 45;
  #4
  in = 20;
  #4
  in = -3;
  #4
  in = -48;
  #5
  $finish;
 end

 // gtkWave
  initial begin 
    $dumpfile("TestNegator.vcd");
    $dumpvars(0, TestNegator);
  end

  // monitor
  initial begin
    $display();
    $display("********************  Test Negator  ********************");
    $display("\ttime\tin\tout");
    $monitor("\t%4t\t%2d\t%3d",$time, in, out); 
  end

endmodule