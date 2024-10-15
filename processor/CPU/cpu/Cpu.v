`include "../instruction-splitter/InstructionSplitter.v"
`include "../control-unit/ControlUnit.v"
`include "../../register-file/RegisterFile.v"
`include "../2s-complement/Negator.v"
`include "../mux/Mux_2x1_8bits.v"
`include "../../ALU/Alu.v"
`include "../program-counter/ProgramCounter.v"

module Cpu(instruction, reset, clk, pc);
  input[31:0] instruction;
  input reset, clk;
  output[31:0] pc;

  // INSTRUCTION SPLITTER
  wire[7:0] opcode, immediate;
  wire[2:0] writeReg, readReg1, readReg2;
  // opcode, writeReg, readReg1, readReg2, immediate
  InstructionSplitter splitter(instruction, opcode, writeReg, readReg1, readReg2, immediate);

  // CONTROL UNIT
  wire[2:0] aluop;
  wire regWriteEnable, negate, aluSource;

  ControlUnit controlUnit(opcode, regWriteEnable, negate, aluSource, aluop);


  // REGISTER FILE
  wire[7:0] aluResult, regOut1, regOut2;

  RegisterFile registerFile(
    .dataIn(aluResult),
    .out1(regOut1),
    .out2(regOut2),
    .inAddress(writeReg),
    .out1Address(readReg1),
    .out2Address(readReg2),
    .write(regWriteEnable),
    .clk(clk),
    .reset(reset)
  );


  // 2'S COMPLEMENT
  wire[7:0] negatedRegOut2;
  Negator negator(regOut2, negatedRegOut2);


  // Mux - 2x1 - negate selector
  wire[7:0] regOut2Final;
  Mux_2x1_8bit negateMux(regOut2, negatedRegOut2, negate, regOut2Final);


  // Mux - 2x1 - ALU operand2 selector (regOut2 vs imm)
  wire[7:0] aluOperand2;
  Mux_2x1_8bit aluSrcMux(immediate, regOut2Final, aluSource, aluOperand2);


  // ALU
  Alu alu(
    .data1(regOut1), 
    .data2(aluOperand2), 
    .select(aluop), 
    .result(aluResult)
  );

  ProgramCounter programCounter(clk, reset, pc);

endmodule