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


module fsm_unit(input and11, and12, and21, and22, or2in, output or2out);
    wire tmp1, tmp2;
    wire or1out;
    and_cell and1(and11, and12, tmp1);
    and_cell and2(and21, and22, tmp2);
    
    or_cell or1(tmp1, tmp2, or1out);
    or_cell or2(or1out, or2in, or2out);
endmodule
