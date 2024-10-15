module ControlUnit(opcode, regWriteEnable, negate, aluSource, aluop);
  input[7:0] opcode;
  output reg[2:0] aluop;
  output reg regWriteEnable, negate, aluSource;

  always @(opcode) begin
    #1
    case (opcode)
      // loadi
      0: begin
        aluop = 0;
        aluSource = 0;
        negate = 1'bx;
        regWriteEnable = 1;
      end 
      // add
      1: begin
        aluop = 1;
        aluSource = 1;
        negate = 0;
        regWriteEnable = 1;
      end 
      // mov
      2: begin
        aluop = 0;
        aluSource = 1;
        negate = 0;
        regWriteEnable = 1;
      end 
      // sub
      3: begin
        aluop = 1;
        aluSource = 1;
        negate = 1;
        regWriteEnable = 1;
      end 
      // and
      4: begin
        aluop = 2;
        aluSource = 1;
        negate = 0;
        regWriteEnable = 1;
      end 
      // or
      5: begin
        aluop = 3;
        aluSource = 1;
        negate = 0;
        regWriteEnable = 1;
      end 
    endcase
  end
endmodule