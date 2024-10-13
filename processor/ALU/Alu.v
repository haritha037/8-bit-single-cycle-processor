`include "units/Forward.v"
`include "units/And.v"
`include "units/Add.v"
`include "units/Or.v"
`include "units/Mux_8X1_8bit.v"

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