`include "UpCounter_4bit.v"
`include "./clock/Clock.v"

module TestUpCounter_4bit;
  // build the circuit
  reg enable, reset;
  wire clk;
  wire[3:0] count;

  Clock clock(clk);
  UpCounter_4bit counter(enable, reset, clk, count);

  // test
  initial begin
    #8
    reset = 1;
    enable = 1;

    #4
    reset = 0;

    #500
    $finish;
  end

  initial begin
    #52
    enable = 0;
    #10
    enable = 1;
  end

  // gtkWave
  initial begin 
    $dumpfile("TestUpCounter_4bit.vcd");
    $dumpvars(0, TestUpCounter_4bit);
  end

  // monitor
  initial begin
    $display();
    $display("********************  Test UpCounter_4bit  ********************");
    $display("\tEnable\tReset\tcount");
    $monitor("\t%b\t%b\t%d", enable, reset, count); 
  end



endmodule