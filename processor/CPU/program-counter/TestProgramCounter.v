`include "ProgramCounter.v"
`include "../../clock/Clock.v"

module TestProgramCounter;
  wire clk;
  reg reset;
  wire[31:0] pc;

  Clock clock(clk);
  ProgramCounter programCounter(clk, reset, pc);

  initial begin
    reset <= #15 1;
    reset <= #17 0;
 
    reset <= #76 1;
    reset <= #84 0;
   
    #500
    $finish;
  end

  // gtkWave
  initial begin 
    $dumpfile("TestProgramCounter.vcd");
    $dumpvars(0, TestProgramCounter);
  end

  // monitor
  initial begin
    $display();
    $display("********************  Test ProgramCounter  ********************");
    $display("\ttime\treset\tpc\tpcNext");
    $monitor("\t%4t\t%5d\t%2d\t%6d",$time, reset, pc, programCounter.pcNext); 
  end
endmodule