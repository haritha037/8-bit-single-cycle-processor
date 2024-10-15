module Negator(in, out);
  input signed[7:0] in;
  output signed[7:0] out;

  assign #1 out = -in;
endmodule