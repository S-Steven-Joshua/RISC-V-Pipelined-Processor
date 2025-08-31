`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 19:36:01
// Design Name: 
// Module Name: mux_2
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


module mux_2(a,b,sel,y);
input logic [63:0] a,b;
input logic sel;
output logic [63:0] y;
always_comb
begin
if(sel==1'b0)
    begin
    y=a;
    end
else
    begin
    y=b;
    end
end
endmodule
