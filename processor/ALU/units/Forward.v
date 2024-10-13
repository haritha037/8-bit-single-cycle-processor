module Forward(data2, result);
  input[7:0] data2;
  output[7:0] result;

  assign #1 result = data2;
endmodule