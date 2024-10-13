module OrUnit8(A, B, C);
  input signed [7:0] A, B;
  output signed [7:0] C;

  assign C = A | B;
endmodule