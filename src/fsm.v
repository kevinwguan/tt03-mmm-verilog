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


module fsm(input i0, i1, clk, output right, left);
    wire not_i0, not_i1;
    wire not_right;
    
    wire fsm_s0_out, fsm_s1_out;
    //wire right, left;
    //wire [2:0] dc_control_right, dc_control_left;
    
    not_cell not0(i0, not_i0);
    not_cell not1(i1, not_i1);
    
    fsm_unit fsms0(not_i1, right, i0, not_i1, i0, right, fsm_s0_out);
    fsm_unit fsms1(not_i0, not_right, not_right, i1, not_i0, i1, fsm_s1_out);
    
    dff_cell dffs0(.clk(clk), .d(fsm_s0_out), .q(right), .notq(not_right));
    dff_cell dffs1(.clk(clk), .d(fsm_s1_out), .q(left));
    
endmodule
