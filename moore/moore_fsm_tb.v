module moore_fsm_tb();

reg  in, clk, rst;
wire f;

fsm dut(.in(in), .clk(clk), .rst(rst), .f(f));

initial begin
in  = 1;
clk = 0;
rst = 0;

#12
rst = 1;
in  = 1;

#12
rst = 0;
in =  1;

#12
in = 0;

#12
in = 1;

#12

in = 1;

#12
in = 0;

#12
in = 1;

#12
in = 1;

#12
in = 0;
end
 
always #5 clk = ~ clk; 
initial #500 $finish;  

endmodule