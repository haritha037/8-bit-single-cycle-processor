`include "Alu.v"


/*
ALUOP values
000 - FORWARD
001 - ADD
010 - AND
011 - OR
1xx - reserved
*/

module TestAlu;
  reg[7:0] operand1, operand2;
  reg[2:0] aluop; 
  wire[7:0] aluResult;
  
  Alu alu(
    .data1(operand1), 
    .data2(operand2), 
    .select(aluop), 
    .result(aluResult)
  );

  // test
  initial begin
    #1
    operand1 = 10;
    operand2 = 5;
    aluop = 0;

    #4
    operand1 = 10;
    operand2 = 5;
    aluop = 1;

    #4
    operand1 = 10;
    operand2 = 5;
    aluop = 2;

    #4
    operand1 = 10;
    operand2 = 5;
    aluop = 3;

    #4
    operand1 = 10;
    operand2 = 5;
    aluop = 4;

    #4
    operand1 = 12;
    operand2 = 5;
    aluop = 1;

    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("TestAlu.vcd");
    $dumpvars(0, TestAlu);
  end

  // monitor
  initial begin
    $display();
    $display("********************  Test Alu  ********************");
    $display("time\toperand1\toperand2\taluop\taluResult");
    $monitor("%4t\t%8d\t%8d\t%5d\t%9d",$time, operand1, operand2, aluop, aluResult); 
  end

endmodule