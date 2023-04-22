`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 03:37:58 PM
// Design Name: 
// Module Name: fsm
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


module fsm(input i0, i1, clk, rst, output right, left);
    wire not_i0, not_i1;
    //wire not_right, not_left;
    wire tmp_s0, tmp_s1;
    wire fsm_s0_out, fsm_s1_out;    
    //wire right, left;
    //wire [2:0] dc_control_right, dc_control_left;
        
    not_cell not_s0(i1, not_i1);
    not_cell not_s1(i0, not_i0);
    
    fsm_unit fsms0(not_i1, right, not_i1, left, i0, fsm_s0_out);
    fsm_unit fsms1(not_i0, right, not_i0, left, i1, fsm_s1_out);
    
    dff dffs0(.rst(rst), .clk(clk), .d(fsm_s0_out), .q(right));
    dff dffs1(.rst(rst), .clk(clk), .d(fsm_s1_out), .q(left));
    
endmodule
