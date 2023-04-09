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


module fsm(input i0, i1, clk, output left, right);
    wire not_i0, not_i1;
    wire not_left;
    
    wire fsm0_out, fsm1_out;
    //wire left, right;
    //wire [2:0] dc_control_left, dc_control_right;
    
    not_cell not0(i0, not_i0);
    not_cell not1(i1, not_i1);
    not_cell notleft(left, not_left);
    
    fsm_unit fsm1(not_i1, left, i0, not_i1, i0, left, fsm1_out);
    fsm_unit fsm0(not_i0, not_left, not_left, i1, not_i0, i1, fsm0_out);
    
    dff_cell dff1(.clk(clk), .d(fsm1_out), .q(left));
    dff_cell dff0(.clk(clk), .d(fsm0_out), .q(right));
    
endmodule
