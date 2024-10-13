`include "../../units/Add.v"


module TestAdd;
  reg signed [7:0] data1;
  reg signed [7:0] data2;
  wire signed [7:0] result;

  Add add(data1, data2, result);

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
    $dumpfile("TestAdd.vcd");
    $dumpvars(0, TestAdd);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST Add  ********************");
    $display("\ttime\tdata1\tdata2\tresult");
    $monitor("\t%3t\t%d\t%d\t%d",$time, data1, data2, result); 
  end
endmodule