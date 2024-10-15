module ProgramCounter(clk, reset, pc);
  input clk, reset;

  output reg[31:0] pc;
  wire[31:0] pcNext;

  // pc adder
  assign #1 pcNext = pc + 4;

  // update pc
  always @(posedge clk) begin
    #1
    if(reset) pc = 0;
    else pc = pcNext;
  end
endmodule