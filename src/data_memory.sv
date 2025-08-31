`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.08.2025 18:48:17
// Design Name: 
// Module Name: data_memory
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


module data_memory(clock,mem_address,write_data,mem_write,mem_read,read_data,e1,e2,e3,e4,e5,e6,e7,e8);
input logic [63:0] mem_address,write_data;
input logic clock,mem_write,mem_read;
output logic [63:0] read_data;
output logic [63:0] e1,e2,e3,e4,e5,e6,e7,e8;
logic [7:0] mem [63:0];
integer i;
initial begin
    for(i=0;i<64;i=i+1)
        begin
            mem[i]=64'd0;
        end
      mem[0] = 8'd1;
      mem[8] = 8'd2;
      mem[16] = 8'd3;
      mem[24] = 8'd4;
      mem[32] = 8'd5;
      mem[40] = 8'd6;
      mem[48] = 8'd7;
      mem[56] = 8'd8;
end
assign element1 = {mem[7],mem[6],mem[5],mem[4],mem[3],mem[2],mem[1],mem[0]};
assign element2 = {mem[15],mem[14],mem[13],mem[12],mem[11],mem[10],mem[9],mem[8]};
assign element3 = {mem[23],mem[22],mem[21],mem[20],mem[19],mem[18],mem[17],mem[16]};
assign element4 = {mem[31],mem[30],mem[29],mem[28],mem[27],mem[26],mem[25],mem[24]};
assign element5 = {mem[39],mem[38],mem[37],mem[36],mem[35],mem[34],mem[33],mem[32]};
assign element6 = {mem[47],mem[46],mem[45],mem[44],mem[43],mem[42],mem[41],mem[40]};
assign element7 = {mem[55],mem[54],mem[53],mem[52],mem[51],mem[50],mem[49],mem[48]};
assign element8 = {mem[63],mem[62],mem[61],mem[60],mem[59],mem[58],mem[57],mem[56]};

always@(*)
    begin
        if(mem_read)
            begin
                read_data[7:0]=mem[mem_address+0];
                read_data[15:8] = mem[mem_address+1];
                read_data[23:16] = mem[mem_address+2];
                read_data[31:24] = mem[mem_address+3];
                read_data[39:32] = mem[mem_address+4];
                read_data[47:40] = mem[mem_address+5];
                read_data[55:48] = mem[mem_address+6];
                read_data[63:56] = mem[mem_address+7];
            end
      end
 always @(posedge clock)
    begin
        if(mem_write)
            begin
                mem[mem_address] = write_data[7:0];
                mem[mem_address+1] = write_data[15:8];
                mem[mem_address+2] = write_data[23:16];
                mem[mem_address+3] = write_data[31:24];
                mem[mem_address+4] = write_data[39:32];
                mem[mem_address+5] = write_data[47:40];
                mem[mem_address+6] = write_data[55:48];
                mem[mem_address+7] = write_data[63:56];
            end
    end
endmodule
