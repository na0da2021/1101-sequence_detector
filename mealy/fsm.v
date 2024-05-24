// Mealy <<depends on input & present state>> FSM to detect sequence "1101"

module fsm(input in, clk, rst, 
           output reg f);
			  
// present and next state
reg [1:0] ps, ns;

// defining the states in Gray encoding 
localparam [1:0] s0 = 2'b00,
                 s1 = 2'b01,
                 s2 = 2'b11,
                 s3 = 2'b10;		


// combuntional always block                                                                                                << in mealy fsm the output is asynchronus of the event of clk edge, so we split the two always blocks>>>

always @(*)
begin 
ns = ps;
case (ps)
      s0 :begin
			if (in == 1'b1) begin
			   ns = s1;
				f  = 1'b0;
				end
			else if (in == 1'b0) begin
		      ns = s0;
			   f  = 1'b0;	
			end
			else 
		      f  = 1'b0;	
			end
		
		s1 :begin
			if (in == 1'b1) begin
			   ns = s2;
				f  = 1'b0;
				end
			else if (in == 1'b0) begin
		      ns = s0;
			   f  = 1'b0;
			end	
			else 
		      f  = 1'b0;
		end
	
		s2 :begin
			if (in == 1'b1) begin
			   ns = s2;
				f  = 1'b0;
				end
			else if (in == 1'b0) begin
		      ns = s3;  	
			   f  = 1'b0;
			end
		   else 
		      f  = 1'b0;	
		end
		
		s3 :begin
			if (in == 1'b1)
			   begin
				ns  = s0;
				f   = 1'b1;
				end
			else if (in == 1'b0) 
			begin
		      ns  = s0;
			   f   = 1'b0;
         end
         else 
		      f  = 1'b0;			
		end
endcase		
end

// Feedback(seq. always block / DFF)
// asynchronus

always @ (posedge clk, posedge rst)

begin
 if (rst)
     ps  <=  s0;
else	 
     ps  <=  ns; 
	  
end

endmodule