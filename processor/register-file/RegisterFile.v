module RegisterFile(dataIn, out1, out2, inAddress, out1Address, out2Address, write, clk, reset);
  input[7:0] dataIn; 
  input[2:0] inAddress, out1Address, out2Address;
  input write, clk, reset;
  output[7:0] out1, out2;

  reg[7:0] registerArray [7:0];
  
  // reading - async - #2
  assign #2 out1 = registerArray[out1Address];
  assign #2 out2 = registerArray[out2Address];

  // writing - sync -#1
  always @(posedge clk) begin
    #1
    if (write) registerArray[inAddress] = dataIn;
  end

  // resetting - sync -#1
  always @(posedge clk) begin
    #1
    if (reset) begin
      for (integer i = 0; i < 8; i++ ) begin
        registerArray[i] = 0;
      end
    end
  end
  
endmodule