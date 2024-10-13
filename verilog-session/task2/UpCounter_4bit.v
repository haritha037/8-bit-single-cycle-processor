module UpCounter_4bit(enable, reset, clk, count);
  input enable, reset, clk;
  output reg[3:0] count;

  always @(posedge clk) begin
    if(reset) count = 0;
    if(enable && !reset) count++;
  end
endmodule