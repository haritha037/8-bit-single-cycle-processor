`include "Clock.v"

module TestClock;
  wire clk;

  Clock clock(clk);

  // test
  initial begin
    #25
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("TestClock.vcd");
    $dumpvars(0, TestClock);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST Clock  ********************");
    // $display("  A   B   C");
    $monitor("%b", clk); 
  end

endmodule