// moore <<depends on present state only>> FSM to detect sequence "1101"

module fsm(input in, clk, rst, 
           output reg f);
			  
// present and next state
reg [2:0] ps, ns;

// defining the states in Gray encoding 
localparam [2:0] s00 = 3'b000,
                 s01 = 3'b001,
                 s1  = 3'b011,
                 s2  = 3'b010,
					  s3  = 3'b110; 


// combuntional always block

always @(*)
begin 
f = 1'b0;
ns = ps ;
case (ps)
      s00 :begin
			if (in == 1'b1)
			   ns = s1;
			else if (in == 1'b0)
		      ns = s00;	
			end
		
		
		s01 :begin
		   f = 1'b1;
			if (in == 1'b1)
			   ns = s1;
			else if (in == 1'b0)
		      ns = s00;	
		end
	
		s1 :begin
			if (in == 1'b1)
			   ns = s2;
			else if (in == 1'b0)
		      ns = s00;  		
		end
		
		s2 :begin
			if (in == 1'b1)
				ns = s2;
			else if (in == 1'b0) 
		      ns = s3;
		end
		
		s3 :begin
			if (in == 1'b1) 
			   ns = s01;				
			else if (in == 1'b0)
		      ns = s00;	
		end
				
endcase		
end


// Feedback(seq. always block / DFF)
// asynchronus

always @ (posedge clk, posedge rst)

begin
 if (rst) begin
     ps  <=  s00;
end	  
else	 
     ps  <=  ns; 

end 

endmodule