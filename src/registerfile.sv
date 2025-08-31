`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.08.2025 21:25:37
// Design Name: 
// Module Name: registerfile
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


module registerfile(reg_write,rs1,rs2,rd,clock,reset,Write_data,Read_data1,Read_data2,r8,r19,r20,r26,r27);
input logic reset,clock,reg_write;;
input logic [4:0]rs1;
input logic [4:0]rs2;
input logic [4:0]rd;
input logic [63:0] Write_data;
output logic[63:0] Read_data1;
output logic [63:0] Read_data2;
output logic [63:0] r8;
output logic [63:0] r19;
output logic [63:0] r20;
output logic [63:0] r26;
output logic [63:0] r27;
logic [63:0] register [31:0];
integer i;
assign register[0]=64'd0;
initial 
    begin
        for(i=1;i<32;i=i+1)
            register[i]=64'd0;
    end
assign r8=register[8];
assign r19=register[19];
assign r20=register[20];
assign r26=register[26];
assign r27=register[27];

always@(posedge clock or posedge reset)
begin
    if(reset)
        begin
            Read_data1=64'd0;
            Read_data2=64'd0;
        end
      else
        begin
            Read_data1=register[rs1];
            Read_data2=register[rs2];
        end
end
always@(negedge clock)
begin
    if(reg_write)
        begin
            register[rd]=Write_data;
        end
end
endmodule
