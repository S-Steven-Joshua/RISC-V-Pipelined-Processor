`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 14:58:12
// Design Name: 
// Module Name: MEM_WB
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


module MEM_WB(clock,reset,read_data_in,result_in,rd_in,mem_to_reg_in,reg_write_in,read_data,result,rd,mem_to_reg_out,reg_write_out);
input logic [63:0] read_data_in,result_in;
input logic [4:0] rd_in;
input logic clock,reset,mem_to_reg_in,reg_write_in;
output logic [63:0] read_data,result;
output logic [4:0] rd;
output logic mem_to_reg_out,reg_write_out;

always_ff@(posedge clock)
begin
    if(reset)
        begin
            read_data<=64'd0;
            result<=64'd0;
            rd<=5'd0;
            mem_to_reg_out<=1'b0;
            reg_write_out<=1'b0;
        end
    else
        begin 
            read_data<=read_data_in;
            result<=result_in;
            rd<=rd_in;
            mem_to_reg_out<=mem_to_reg_in;
            reg_write_out<=reg_write_in;
        end
end
endmodule
