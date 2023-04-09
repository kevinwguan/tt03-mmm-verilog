`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2023 03:06:42 PM
// Design Name: 
// Module Name: setup
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


module setup(input s, r, is0, output reg s_setup, output reg r_setup);
always @(*) begin
if (is0 == 1)
    begin
        s_setup <= 0;
        r_setup <= 1;
    end
else
    begin
        s_setup <= s;
        r_setup <= r;
    end
end
endmodule
