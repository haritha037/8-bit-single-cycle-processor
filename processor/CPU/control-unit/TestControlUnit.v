`include "ControlUnit.v"

module TestControlUnit;
  reg[7:0] opcode;
  wire[2:0] aluop;
  wire regWriteEnable, negate, aluSource;

  ControlUnit controlUnit(opcode, regWriteEnable, negate, aluSource, aluop);

  initial begin
    #5
    opcode = 0;
    #5
    opcode = 1;
    #5
    opcode = 2;
    #5
    opcode = 3;
    #5
    opcode = 4;
    #5
    opcode = 5;
    #5
    $finish;
  end

  // gtkWave
  initial begin 
    $dumpfile("TestControlUnit.vcd");
    $dumpvars(0, TestControlUnit);
  end

  // monitor
  initial begin
    $display();
    $display("********************  Test ControlUnit  ********************");
    $display("\ttime\tOPCODE  \taluop\taluSource\tnegate\tregWriteEnable");
    $monitor("\t%4t\t%b\t%5b\t%9b\t%6b\t%14b",$time, opcode, aluop, aluSource, negate, regWriteEnable); 
  end
endmodule