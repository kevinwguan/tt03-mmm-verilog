`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2023 12:42:47 AM
// Design Name: 
// Module Name: tiny_tapeout
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


module kevinwguan_tiny_tapeout(input i0, i1, rst, output lpwm, rpwm);
    wire clk_out;
    wire left, right;
    wire [2:0] lcontrol, rcontrol;
    wire [2:0] trigger;
    
    osc osc_inst(rst, clk_out);
    counter counter_inst(rst, clk_out, trigger);
    fsm fsm_inst(i0, i1, clk_out, left, right);
    store store_left(rst, clk_out, left, trigger, lcontrol);
    store store_right(rst, clk_out, right, trigger, rcontrol);
    pwm_simple pwm_simple_linst(lpwm, clk_out, trigger, lcontrol);
    pwm_simple pwm_simple_rinst(rpwm, clk_out, trigger, rcontrol);
endmodule
