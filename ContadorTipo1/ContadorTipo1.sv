 module ContadorTipo1(input logic clock, reset,
							output logic [3:0]cont);
							
			logic position = 1'b0; 
			
			always_ff @(posedge clock)
				
				
				 if(reset)
					begin
					cont <= 4'd0;
					position <= 1'b0;
					end
				 else begin
					if(position == 1'b0)
						if(cont == 4'd0)
							cont <= cont + 4'd1;
						else if(cont != 4'd15)
							cont <= cont + 4'd1;
						else
							begin
							position <= 1'b1;
							cont <= cont - 4'd1;
							end
				 	
					if(position == 1'b1)
						if(cont == 4'd15)
							cont <= cont - 4'd1;
						else if(cont != 0)
							cont <= cont - 4'd1;
						else
							begin
							position <= 1'b0;
							cont <= cont + 4'd1;
							end
				 end
				
endmodule 