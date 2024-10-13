
module AndUnit8(A, B, C);
  input signed [7:0] A, B;
  output signed [7:0] C;

  // if we are using assign, C should be a wire.
  // if we are using always block, C should be output reg.
  assign C = A & B;
endmodule