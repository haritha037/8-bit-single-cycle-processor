`include "../../units/Mux_8x1_8bit.v"


module TestMux_8x1_8bit;
  reg signed[7:0] I0, I1, I2, I3;
  reg signed[2:0] S;
  wire signed[7:0] Y;

  // Mux_8x1_8bit mux_8x1_8bit(
  //   I0, 
  //   I1, 
  //   I2, 
  //   I3, 
  //   .I4(8'b00000000), 
  //   .I5(8'b00000000), 
  //   .I6(8'b00000000), 
  //   .I7(8'b00000000), 
  //   S, 
  //   Y
  // );
  Mux_8x1_8bit mux_8x1_8bit (
    .I0(I0),    
    .I1(I1),
    .I2(I2),
    .I3(I3),
    .I4(8'bxxxxxxxx), // Unused input I4 is tied to x
    .I5(8'bxxxxxxxx), // Unused input I5 is tied to x
    .I6(8'bxxxxxxxx), // Unused input I6 is tied to x
    .I7(8'bxxxxxxxx), // Unused input I7 is tied to x
    .S(S),       
    .Y(Y)        
);

  // test
  initial begin
    #1
    I0 = 12;
    I1 = 2;
    I2 = 5;
    I3 = 1;
    S = 0;


    #1
    I0 = 12;
    I1 = 2;
    I2 = 5;
    I3 = 1;
    S = 1;

    #1
    I0 = 12;
    I1 = 2;
    I2 = 5;
    I3 = 1;
    S = 2;

    #1
    I0 = 12;
    I1 = 2;
    I2 = 5;
    I3 = 1;
    S = 3;

    #1
    I0 = 12;
    I1 = 2;
    I2 = 5;
    I3 = 10;
    S = 3;

    #5
    $finish;
  end


  // gtkWave
  initial begin 
    $dumpfile("TestMux_8x1_8bit.vcd");
    $dumpvars(0, TestMux_8x1_8bit);
  end

  // monitor
  initial begin
    $display();
    $display("********************  Test Mux_8x1_8bit  ********************");
    $display("time\t I0\t I1\t I2\t I3\t  S\t  Y");
    $monitor("%3t\t%3d\t%3d\t%3d\t%3d\t%3d\t%3d",$time, I0, I1, I2, I3, S, Y); 
  end
endmodule