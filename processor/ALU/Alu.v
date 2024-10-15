// `include "units/Forward.v"
// `include "units/And.v"
// `include "units/Add.v"
// `include "units/Or.v"
// `include "units/Mux_8X1_8bit.v"

module Alu (data1, data2, select, result);
  input[7:0] data1, data2;
  input[2:0] select;
  output [7:0] result;

  wire[7:0] forwardResult, addResult, andResult, orResult;
  
  // Instantiate sub-units
  Forward forward(data2, forwardResult);
  And andUnit(data1, data2, andResult); 
  Add add(data1, data2, addResult); 
  Or orUnit(data1, data2, orResult); 

  Mux_8x1_8bit mux(
    .I0(forwardResult),    
    .I1(addResult),
    .I2(andResult),
    .I3(orResult),
    .I4(8'bxxxxxxxx), // Unused input I4 is tied to x
    .I5(8'bxxxxxxxx), // Unused input I5 is tied to x
    .I6(8'bxxxxxxxx), // Unused input I6 is tied to x
    .I7(8'bxxxxxxxx), // Unused input I7 is tied to x
    .S(select),      
    .Y(result)    
  );
  
endmodule



module Add(data1, data2, result);
  input [7:0] data1, data2;
  output [7:0] result;

  assign #2 result = data1 + data2;
endmodule



module Forward(data2, result);
  input[7:0] data2;
  output[7:0] result;

  assign #1 result = data2;
endmodule


module And(data1, data2, result);
  input [7:0] data1, data2;
  output [7:0] result;

  assign #1 result = data1 & data2;
endmodule


module Mux_8x1_8bit(I0, I1, I2, I3, I4, I5, I6, I7, S, Y);
  input[7:0] I0, I1, I2, I3, I4, I5, I6, I7;
  input[2:0] S;
  output reg[7:0] Y;

  always @(*) begin
    case (S)
      3'b000: Y = I0; 
      3'b001: Y = I1; 
      3'b010: Y = I2; 
      3'b011: Y = I3;
      3'b100: Y = I4;
      3'b101: Y = I5;
      3'b110: Y = I6;
      3'b111: Y = I7;
    endcase
  end

endmodule



module Or(data1, data2, result);
  input [7:0] data1, data2;
  output [7:0] result;

  assign #1 result = data1 | data2;
endmodule