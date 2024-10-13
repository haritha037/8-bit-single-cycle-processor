`include "../../units/mux-2x1-8bit/Mux_2x1_8bit.v"


module Test_Mux_2x1_8bit;
 // build the circuit
 reg [7:0] I0, I1;
 reg S;
 wire [7:0] Y;

 Mux_2x1_8bit mux(I0, I1, S, Y);


 // test
  initial begin
    #1
    I0 = 10;
    I1 = 20;

    #1
    S = 1'b0;

    #1
    I0 = 4;

    #1
    S =1'b1;
    
    

    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("Mux_2x1_8bit.vcd");
    $dumpvars(0, Test_Mux_2x1_8bit);
  end

  // monitor
  initial begin
    $display();
    $display("********************  TEST Mux_2x1_8bit  ********************");
    $display(" I0  I1   S   Y");
    $monitor("%3d %3d %3d %3d", I0, I1, S, Y); 
  end


endmodule