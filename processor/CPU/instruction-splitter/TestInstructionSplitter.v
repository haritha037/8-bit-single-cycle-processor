`include "InstructionSplitter.v"

module TestInstructionSplitter;
  reg[31:0] instruction;
  wire [7:0] opcode, writeReg, readReg1, readReg2, immediate;


  InstructionSplitter splitter(instruction, opcode, writeReg, readReg1, readReg2, immediate);

  initial begin
    #1
    instruction = 32'h12345678;
    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("TestInstructionSplitter.vcd");
    $dumpvars(0, TestInstructionSplitter);
  end

  // monitor
  initial begin
    $display();
    $display("********************  Test InstructionSplitter  ********************");
    $display("\ttime\tinstruction\topcode\twriteReg\treadReg1\treadReg2\timmediate");
    $monitor("\t%4t\t%11h\t%6h\t%8h\t%8h\t%8h\t%9h",$time, instruction, opcode, writeReg, readReg1, readReg2, immediate); 
  end
endmodule