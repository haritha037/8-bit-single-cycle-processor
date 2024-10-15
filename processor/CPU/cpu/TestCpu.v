`include "Cpu.v"
`include "../../clock/Clock.v"


module TestCpu;
  reg[7:0] instructionMemory[1023:0];
  reg reset;
  wire clk;
  wire[31:0] pc;
  wire[31:0] instruction;


  // load the instructions from .mem file
  initial begin
    $readmemb("../testing-tools/instr_mem.mem", instructionMemory);

    // METHOD 1: manually loading instructions to instr_mem
    // {instructionMemory[10'd3], instructionMemory[10'd2], instructionMemory[10'd1], instructionMemory[10'd0]} = 32'b00000000000001000000000000000101;
    // {instructionMemory[10'd7], instructionMemory[10'd6], instructionMemory[10'd5], instructionMemory[10'd4]} = 32'b00000000000000100000000000001001;
    // {instructionMemory[10'd11], instructionMemory[10'd10], instructionMemory[10'd9], instructionMemory[10'd8]} = 32'b00000010000001100000010000000010;
  end


  // simulate the instruction fetching
  assign #2 instruction = {instructionMemory[pc+3], instructionMemory[pc+2], instructionMemory[pc+1], instructionMemory[pc] };

  Clock clock(clk);
  Cpu cpu(instruction, reset, clk, pc);


  // test
  initial begin
    #15
    reset = 1;
    #6
    reset = 0;

    #500
    $finish;
  end


  // gtkwave
  initial begin
    $dumpfile("TestCpu.vcd");

    $dumpvars(0, TestCpu);

    for (integer i = 0; i < 8; i = i + 1) begin
      $dumpvars(1, cpu.registerFile.registerArray[i]);
    end
  end


endmodule