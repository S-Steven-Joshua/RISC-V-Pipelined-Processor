`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 10:56:08
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(clock,reset,funct_4_in,address_in,read_data1_in,read_data2_in,imm_data_in,rs1_in,
rs2_in,rd_in,branch_in,mem_read_in,mem_to_reg_in,mem_write_in,alu_src_in,reg_write_in,alu_op_in,flush,
address,rs1,rs2,rd,imm_data,read_data1,read_data2,funct_4,branch,mem_read,mem_write,alu_src,
mem_to_reg,reg_write,alu_op);
input logic clock,reset,branch_in,mem_to_reg_in,mem_read_in,mem_write_in,alu_src_in,reg_write_in,flush;
input logic [63:0] address_in,imm_data_in,read_data1_in,read_data2_in;
input logic [4:0] rs1_in,rs2_in,rd_in;
input logic [3:0] funct_4_in;
input logic [1:0] alu_op_in;
output logic [63:0] address,imm_data,read_data1,read_data2;
output logic [4:0] rs1,rs2,rd;
output logic [1:0] alu_op;
output logic [3:0] funct_4;
output logic branch,mem_read,mem_write,alu_src,reg_write,mem_to_reg;

always_ff@(posedge clock)
begin
    if(reset)
        begin
            address<=64'd0;
            imm_data<=64'd0;
            read_data1<=64'd0;
            read_data2<=64'd0;
            rs1<=5'd0;
            rs2<=5'd0;
            rd<=5'd0;
            alu_op<=2'b0;
            funct_4<=4'b0;
            branch<=1'b0;
            mem_read<=1'b0;
            mem_write<=1'b0;
            alu_src<=1'b0;
            reg_write<=1'b0;
            mem_to_reg<=1'b0;
        end
    else if(flush)
        begin
            address<=64'd0;
            imm_data<=64'd0;
            read_data1<=64'd0;
            read_data2<=64'd0;
            rs1<=5'd0;
            rs2<=5'd0;
            rd<=5'd0;
            alu_op<=2'b0;
            funct_4<=4'b0;
            branch<=1'b0;
            mem_read<=1'b0;
            mem_write<=1'b0;
            alu_src<=1'b0;
            reg_write<=1'b0;
            mem_to_reg<=1'b0;
        end
     else 
        begin
            address<=address_in;
            imm_data<=imm_data_in;
            read_data1<=read_data1_in;
            read_data2<=read_data2_in;
            rs1<=rs1_in;
            rs2<=rs2_in;
            rd<=rd_in;
            alu_op<=alu_op_in;
            funct_4<=funct_4_in;
            branch<=branch_in;
            mem_read<=mem_read_in;
            mem_write<=mem_write_in;
            alu_src<=alu_src_in;
            reg_write<=reg_write_in;
            mem_to_reg<=mem_to_reg_in;
       end
end         
endmodule
