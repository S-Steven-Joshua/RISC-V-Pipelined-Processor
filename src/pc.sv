`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 20:03:01
// Design Name: 
// Module Name: pc
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


module pc(pc_in,reset,clock,stall,pc_out);
input logic [63:0] pc_in;
input logic reset,clock,stall;
output logic [63:0] pc_out;
always_ff@(posedge clock or posedge reset)
begin
    if(reset)
    begin
        pc_out<=64'd0;
     end
     else if(!stall)
     begin
        pc_out<=pc_in;
     end
end      
endmodule
//Stall is used to stall the PC.This is needed because in pipeling some isntruction take 
//longer time to execute and the next instruction might need the value so we need to stall the PC
