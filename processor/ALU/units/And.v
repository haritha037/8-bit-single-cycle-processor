module And(data1, data2, result);
  input [7:0] data1, data2;
  output [7:0] result;

  assign #1 result = data1 & data2;
endmodule