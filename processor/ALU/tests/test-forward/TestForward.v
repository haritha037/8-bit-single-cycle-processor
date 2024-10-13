`include "../../units/Forward.v"


module TestForward;
  reg[7:0] data2;
  wire[7:0] result;

  Forward forward(data2, result);

  // test
  initial begin
    #1
    data2 = 25;

    #1
    data2 = 1;

    #1
    data2 = 34;
    
    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("TestForward.vcd");
    $dumpvars(0, TestForward);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST Forward  ********************");
    $display("\ttime\tdata2\tresult");
    $monitor("\t%3t\t%d\t%d",$time, data2, result); 
  end
endmodule