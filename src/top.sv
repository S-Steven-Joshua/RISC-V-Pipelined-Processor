`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.08.2025 18:30:21
// Design Name: 
// Module Name: top
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
`include "EX_MEM.sv"
`include "ID_EX.sv"
`include "IF_ID.sv"
`include "MEM_WB.sv"
`include "adder.sv"
`include "alu.sv"
`include "alu_control.sv"
`include "branch_unit.sv"
`include "control_unit.sv"
`include "data_extender.sv"
`include "data_memory.sv"
`include "forward_unit.sv"
`include "hazard_detection.sv"
`include "instruction_memory.sv"
`include "instruction_parser.sv"
`include "mux_2.sv"
`include "mux_3.sv"
`include "pc.sv"
`include "pipline_flush.sv"
`include "registerfile.sv"

module top(clock,reset,e1,e2,e3,e4,e5,e6,e7,e8);
input logic clock,reset;
output logic [63:0] e1,e2,e3,e4,e5,e6,e7,e8;
logic stall,flush;
//CU wires
logic branch;
logic memread;
logic memtoreg;
logic memwrite;
logic ALUsrc;
logic [1:0] ALUop;

//regFile
//logic regwrite_memwb_out;
logic [63:0] readdata1,readdata2;
logic [63:0] r8,r19,r20,r26,r27;
logic [63:0] write_data;

//pc wires
logic [63:0] pc_in;
logic [63:0] pc_out;

//adders
logic [63:0] adderout1;
logic [63:0] adderout2;

//inst_mem wire
logic [31:0] instruction;
logic [31:0] inst_ifid_out;

//parser
logic [6:0] opcode;
logic [4:0] rd,rs1,rs2;
logic [2:0] funct3;
logic [6:0] funct7;

//immediate wire
logic [63:0] imm_data;

//IF_ID wire
logic [63:0] ifid;

//ID_EX wire 
//logic [63:0] a1;
logic [63:0] a1;
logic [4:0] RS1;
logic [4:0] RS2;
logic [4:0] RD;
logic [63:0] d, M1, M2;
logic Branch;
logic Memread;
logic Memtoreg;
logic Memwrite;
logic Regwrite;
logic Alusrc;
logic [1:0] aluop;
logic [3:0] funct4_out;

//mux_wire 
logic [63:0] threeby1_out1;
logic [63:0] threeby1_out2;
logic [63:0] alu_64_b;

//EX_MEM wire
logic [63:0] write_Data;
logic [63:0] exmem_out_adder;
logic exmem_out_zero;
logic [63:0] exmem_out_result;
logic [4:0] exmemrd;
logic BRANCH,MEMREAD,MEMTOREG,MEMEWRITE,REGWRITE; 

//ALU
logic [63:0] AluResult;
logic zero;

//ALU Control wire
logic [3:0] operation;

//Data_Memory wire
logic [63:0] readdata;

//memwb wire
logic[63:0] muxin1,muxin2;
logic [4:0] memwbrd;
logic memwb_memtoreg;
logic memwb_regwrite;

//Forwarding_unit Wire 
logic [1:0] forwardA;
logic [1:0] forwardB;

//Branch
logic addermuxselect;
logic branch_final;
//pipline_flush(branch,flush);
pipline_flush p1(.branch(branch_final&BRANCH),.flush(flush));
//hazard_detection(instruction,rd,mem_read,stall);
hazard_detection h1(.instruction(inst_ifid_out),.rd(RD),.mem_read(Memread),.stall(stall));
//pc(pc_in,reset,clock,stall,pc_out);
pc pc1(.pc_in(pc_in),.reset(reset),.clock(clock),.stall(stall),.pc_out(pc_out));
//instruction_memory(inst_address,instruction);
instruction_memory i1(.inst_address(pc_out),.instruction(instruction));
//adder(a,b,c);
adder add1(.a(pc_out),.b(64'd4),.c(adderout1));
//IF_ID(address,clock,reset,ifid_write,flush,instruction,pip_inst,pip_add);
IF_ID iff1(.address(pc_out),.clock(clock),.reset(reset),.ifid_write(stall),.flush(flush),.instruction(instruction),.pip_inst(inst_ifid_out),.pip_add(ifid));
//instruction_parser(instruction,opcode,rd,func3,rs1,rs2,func7);
instruction_parser i2(.instruction(inst_ifid_out),.opcode(opcode),.rd(rd),.func3(funct3),.rs1(rs1),.rs2(rs2),.func7(funct7));
//control_unit(opcode,stall,branch,mem_read,mem_write,mem_to_reg,reg_write,alu_src,alu_op)
control_unit c1(.opcode(opcode),.stall(stall),.branch(branch),.mem_read(memread),.mem_write(memwrite),.mem_to_reg(memtoreg),.reg_write(regwrite),.alu_src(ALUsrc),.alu_op(ALUop));
//data_extender(instruction,imm_data);
data_extender d1(.instruction(inst_ifid_out[31:5]),.imm_data(imm_data));
//registerfile(reg_write,rs1,rs2,rd,clock,reset,Write_data,Read_data1,Read_data2,r8,r19,r20,r26,r27);
registerfile r1(.reg_write(memwb_regwrite),.rs1(rs1),.rs2(rs2),.rd(memwbrd),.clock(clock),.reset(reset),.Write_data(write_data),.Read_data1(readdata1),.Read_data2(readdata2),.r8(r8),.r19(r19),.r20(r20),.r26(r26),.r27(r27));
/*ID_EX(clock,reset,funct_4_in,address_in,read_data1_in,read_data2_in,imm_data_in,rs1_in,
rs2_in,rd_in,branch_in,mem_read_in,mem_to_reg_in,mem_write_in,alu_src_in,reg_write_in,alu_op_in,flush,
address,rs1,rs2,rd,imm_data,read_data1,read_data2,funct_4,branch,mem_read,mem_write,alu_src,
mem_to_reg,reg_write,alu_op);
*/
ID_EX idex1(.clock(clock),.reset(reset),.funct_4_in({inst_ifid_out[30],inst_ifid_out[14:12]}),.address_in(ifid),.read_data1_in(readdata1),.read_data2_in(readdata2),.imm_data_in(imm_data),.rs1_in(rs1),
.rs2_in(rs2),.rd_in(rd),.branch_in(branch),.mem_read_in(memread),.mem_to_reg_in(memtoreg),.mem_write_in(memwrite),.alu_src_in(ALUsrc),.reg_write_in(regwrite),.alu_op_in(ALUop),.flush(flush),
.address(a1),.rs1(RS1),.rs2(RS2),.rd(RD),.imm_data(d),.read_data1(M1),.read_data2(M2),.funct_4(funct4_out),.branch(Branch),.mem_read(Memread),.mem_write(Memwrite),.alu_src(Alusrc),
.mem_to_reg(Memtoreg),.reg_write(Regwrite),.alu_op(aluop));
//adder(a,b,c);
adder add2(.a(a1),.b(d<<1),.c(adderout2));
//mux_3(a,b,c,sel,y)
mux_3 muxx1(.a(M1),.b(write_data),.c(exmem_out_result),.sel(forwardA),.y(threeby1_out1));
//mux_3(a,b,c,sel,y)
mux_3 muxx2(.a(M2),.b(write_data),.c(exmem_out_result),.sel(forwardB),.y(threeby1_out2));
//mux_2(a,b,sel,y);
mux_2 muux1(.a(threeby1_out2),.b(d),.sel(Alusrc),.y(alu_64_b));
//alu(a,b,alu_op,result,zero)
alu alu1(.a(threeby1_out1),.b(alu_64_b),.alu_op(operation),.result(AluResult),.zero(zero));
// alu_control(alu_op,func,operation);
 alu_control con1(.alu_op(aluop),.func(funct4_out),.operation(operation));
 /*EX_MEM(clock,reset,adder_in,result_in,zero_in,write_data_in,rd_in,branch_in,mem_read_in,
mem_to_reg_in,mem_write_in,reg_write_in,flush,mux_sel_in,adder_out,zero_out,result_out,write_data_out,
rd_out,branch_out,mem_read_out,mem_to_reg_out,mem_write_out,reg_write_out,mux_sel_out);
*/
EX_MEM exmem1(.clock(clock),.reset(reset),.adder_in(adderout2),.result_in(AluResult),.zero_in(zero),.write_data_in(threeby1_out2),.rd_in(RD),.branch_in(Branch),.mem_read_in(Memread),
.mem_to_reg_in(Memtoreg),.mem_write_in(Memwrite),.reg_write_in(Regwrite),.flush(flush),.mux_sel_in(addermuxselect),.adder_out(exmem_out_adder),.zero_out(exmem_out_zero),.result_out(exmem_out_result),.write_data_out(write_Data),
.rd_out(exmemrd),.branch_out(BRANCH),.mem_read_out(MEMREAD),.mem_to_reg_out(MEMTOREG),.mem_write_out(MEMEWRITE),.reg_write_out(REGWRITE),.mux_sel_out(branch_final));
//data_memory(clock,mem_address,write_data,mem_write,mem_read,read_data,e1,e2,e3,e4,e5,e6,e7,e8);
data_memory datam1(.clock(clock),.mem_address(exmem_out_result),.write_data(write_Data),.mem_write(MEMEWRITE),.mem_read(MEMREAD),.read_data(readdata),.e1(e1),.e2(e2),.e3(e3),.e4(e4),.e5(e5),.e6(e6),.e7(e7),.e8(e8));
//mux_2(a,b,sel,y);
mux_2 muux2(.a(adderout1),.b(exmem_out_adder),.sel(BRANCH & branch_final),.y(pc_in));
//MEM_WB(clock,reset,read_data_in,result_in,rd_in,mem_to_reg_in,reg_write_in,read_data,result,rd,mem_to_reg_out,reg_write_out);
MEM_WB memwb1(.clock(clock),.reset(reset),.read_data_in(readdata),.result_in(exmem_out_result),.rd_in(exmemrd),.mem_to_reg_in(MEMTOREG),.reg_write_in(REGWRITE),.read_data(muxin1),.result(muxin2),.rd(memwbrd),.mem_to_reg_out(memwb_memtoreg),.reg_write_out(memwb_regwrite));
//mux_2(a,b,sel,y);
mux_2 muux3(.a(muxin2),.b(muxin1),.sel(memwb_memtoreg),.y(write_data));
//forward_unit(rs1,rs2,rd_mem,rd_wb,reg_write_wb,reg_write_mem,for_A,for_B);
forward_unit f1(.rs1(RS1),.rs2(RS2),.rd_mem(exmemrd),.rd_wb(memwbrd),.reg_write_wb(memwb_regwrite),.reg_write_mem(REGWRITE),.for_A(forwardA),.for_B(forwardB));
//branch_unit(funct3,read_data1,b,mux_sel);
branch_unit b1(.funct3(funct4_out[2:0]),.read_data1(M1),.b(alu_64_b),.mux_sel(addermuxselect));
endmodule
