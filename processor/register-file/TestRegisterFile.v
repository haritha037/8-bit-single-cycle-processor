`include "../clock/Clock.v"
`include "RegisterFile.v"

module TestRegisterFile;
  reg[7:0] dataIn; 
  reg[2:0] inAddress, out1Address, out2Address;
  reg write, reset;
  wire clk;
  wire[7:0] out1, out2;

  // build the circuit
  Clock clock(clk);
  RegisterFile registerFile(dataIn, out1, out2, inAddress, out1Address, out2Address, write, clk, reset);


  // test
  initial begin
    // reset
    reset <= #8 1;
    reset <= #12 0;

    out1Address <= #13 0;
    out2Address <= #13 1;
    // The out1 and out2 values should be available at 15

    // set ro -> 5
    write <= #17 1;
    inAddress <= #17 0;
    dataIn <= #17 24;
    write <= #21 0;

    #40
    $finish;
    

    // set r0->24, r4->12
    // write <= #8 1;
    // inAddress <= #8 0;
    // dataIn <= #8 24;

    
  end


  // gtkWave
  initial begin 
    $dumpfile("TestRegisterFile.vcd");
    $dumpvars(0, TestRegisterFile);
    // dump the registerArray values
    for(integer i = 0; i < 8; i = i + 1) begin
      $dumpvars(1, registerFile.registerArray[i]);
    end
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST RegisterFile  ********************");
    $display("time\tr0\tr1\tr2\tr3\tr4\tr5\tr6\tr7\tout1Addr\tout2Addr\tinAddr\tdataIn\tout1\tout2\twrite\treset");
    $monitor("%4t\t%2d\t%2d\t%2d\t%2d\t%2d\t%2d\t%2d\t%2d\t%8d\t%8d\t%6d\t%6d\t%4d\t%4d\t%5d\t%5d", $time, registerFile.registerArray[0], registerFile.registerArray[1], registerFile.registerArray[2], registerFile.registerArray[3], registerFile.registerArray[4], registerFile.registerArray[5], registerFile.registerArray[6], registerFile.registerArray[7], out1Address, out2Address, inAddress, dataIn, out1, out2, write, reset); 
  end
endmodule