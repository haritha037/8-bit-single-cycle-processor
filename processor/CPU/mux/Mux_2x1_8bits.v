module Mux_2x1_8bit(I0, I1, S, Y);
  input[7:0] I0, I1;
  input S;
  output reg [7:0] Y;

  always @(*) begin
    case (S)
      1'b0: Y = I0; 
      1'b1: Y = I1;  
    endcase
  end
endmodule