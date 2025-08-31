`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 14:22:23
// Design Name: 
// Module Name: EX_MEM
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


module EX_MEM(clock,reset,adder_in,result_in,zero_in,write_data_in,rd_in,branch_in,mem_read_in,
mem_to_reg_in,mem_write_in,reg_write_in,flush,mux_sel_in,adder_out,zero_out,result_out,write_data_out,
rd_out,branch_out,mem_read_out,mem_to_reg_out,mem_write_out,reg_write_out,mux_sel_out);
input logic clock,reset,zero_in,branch_in,mem_read_in,mem_to_reg_in,mem_write_in,reg_write_in,flush,mux_sel_in;
input logic [63:0] adder_in,result_in,write_data_in;
input logic [4:0] rd_in;
output logic branch_out,zero_out,mem_read_out,mem_to_reg_out,mem_write_out,reg_write_out,mux_sel_out;
output logic [63:0] adder_out,result_out,write_data_out;
output logic [4:0] rd_out;

always_ff@(posedge clock)
begin
    if(reset)
        begin
            adder_out<=64'd0;
            result_out<=64'd0;
            write_data_out<=64'd0;
            rd_out<=5'd0;
            branch_out<=1'b0;
            zero_out<=1'b0;
            mem_read_out<=1'b0;
            mem_to_reg_out<=1'b0;
            mem_write_out<=1'b0;
            reg_write_out<=1'b0;
            mux_sel_out<=1'b0;
            //zero_out<=1'b0;
        end     
    else if(flush)
        begin
            adder_out<=64'd0;
            result_out<=64'd0;
            write_data_out<=64'd0;
            rd_out<=5'd0;
            branch_out<=1'b0;
            zero_out<=1'b0;
            mem_read_out<=1'b0;
            mem_to_reg_out<=1'b0;
            mem_write_out<=1'b0;
            reg_write_out<=1'b0;
            mux_sel_out<=1'b0;
            //zero_out<=1'b0;
        end
    else
        begin
            adder_out<=adder_in;
            result_out<=result_in;
            write_data_out<=write_data_in;
            rd_out<=rd_in;
            branch_out<=branch_in;
            zero_out<=zero_in;
            mem_read_out<=mem_read_in;
            mem_to_reg_out<=mem_to_reg_in;
            mem_write_out<=mem_write_in;
            reg_write_out<=reg_write_in;
            mux_sel_out<=mux_sel_in;
            
        end
end        
endmodule
