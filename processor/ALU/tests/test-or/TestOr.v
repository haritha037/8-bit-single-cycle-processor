`include "../../units/Or.v"


module TestOr;
  reg signed [7:0] data1;
  reg signed [7:0] data2;
  wire signed [7:0] result;

  Or orUnit(data1, data2, result);

  // test
  initial begin
    #1
    data1 = 25;
    data2 = 3;

    #1
    data1 = 1;
    data2 = 8;

    #1
    data1 = 2;
    data2 = -5;

    #1
    data1 = 6;
    data2 = -2;

    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("TestOr.vcd");
    $dumpvars(0, TestOr);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST Or  ********************");
    $monitor("t=%3d\ndata1:\t%b\ndata2:\t%b\nresult:\t%b\n\n",$time, data1, data2, result); 
  end
endmodule