`include "../../units/And.v"


module TestAnd;
  reg signed [7:0] data1;
  reg signed [7:0] data2;
  wire signed [7:0] result;

  And andUnit(data1, data2, result);

  // test
  initial begin
    #1
    data1 = 25;
    data2 = 3;

    #4
    data1 = 1;
    data2 = 8;

    #4
    data1 = 2;
    data2 = -5;

    #3
    data1 = 6;
    data2 = -2;

    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("TestAnd.vcd");
    $dumpvars(0, TestAnd);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST And  ********************");
    $monitor("t=%3d\ndata1:\t%b\ndata2:\t%b\nresult:\t%b\n\n",$time, data1, data2, result); 
  end
endmodule