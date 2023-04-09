`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2023 06:29:43 PM
// Design Name: 
// Module Name: fsm_unit
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


module fsm_unit(input and11, and12, and21, and22, and31, and32, output or2out);
    wire tmp1, tmp2, tmp3;
    wire or1out;
    and_cell and1(and11, and12, tmp1);
    and_cell and2(and21, and22, tmp2);
    and_cell and3(and31, and32, tmp3);
    
    or_cell or1(tmp1, tmp2, or1out);
    or_cell or2(or1out, tmp3, or2out);
endmodule
