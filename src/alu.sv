`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 09:17:04
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu(a,b,alu_op,result,zero);
input logic [63:0] a,b;
input logic [3:0] alu_op;
output logic [63:0] result;
output logic zero;
always@(*)
    begin
        unique case(alu_op)
            4'b0000:result=a&b;
            4'b0001:result=a|b;
            4'b0010:result=a+b;
            4'b0110:result=a-b;
            4'b1100:result=~(a|b);
        endcase
end
assign zero=&result[63:0];
endmodule
