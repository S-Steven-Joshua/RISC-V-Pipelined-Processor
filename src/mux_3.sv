`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 19:40:03
// Design Name: 
// Module Name: mux_3
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


module mux_3(a,b,c,sel,y);
input logic [63:0]a,b,c;
input logic [1:0]sel;
output logic [63:0] y;
always_comb
begin
    unique case(sel[1:0]) //if(sel=2'b11 then if unique not used y is not assigned. But unique prints a warning
    2'b00:y=a;
    2'b01:y=b;
    2'b10:y=c;
    endcase
end
endmodule
