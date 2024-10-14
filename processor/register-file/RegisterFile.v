module RegisterFile(dataIn, out1, out2, inAddress, out1Address, out2Address, write, clk, reset);
  input[7:0] dataIn; 
  input[2:0] inAddress, out1Address, out2Address;
  input write, clk, reset;
  output[7:0] out1, out2;
  
endmodule