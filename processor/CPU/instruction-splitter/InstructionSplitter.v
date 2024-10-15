module InstructionSplitter(instruction, opcode, writeReg, readReg1, readReg2, immediate);
  input [31:0] instruction;
  output [7:0] opcode, writeReg, readReg1, readReg2, immediate;

  assign opcode = instruction[31:24];
  assign writeReg = instruction[18:16]; // 8 bits are allocated but register file uses 3
  assign readReg1 = instruction[10:8];
  assign readReg2 = instruction[2:0];
  assign immediate = instruction[7:0]; 

endmodule