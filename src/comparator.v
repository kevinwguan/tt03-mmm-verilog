module comparator (input [2:0] a, input [2:0] b, output reg equal);
   
   always @(*) begin
    if (a == b) begin
      equal <= 1;
    end
    else begin
      equal <= 0;
    end
   end
endmodule
