module garage (
	input SA, SAB, clk, rst, b,	ob,
	output reg MS, MB
	); 	
// Definici�n de etiquetas de los estados para tratar con nombres en lugar de bits
parameter S1=3'b000, S2=3'b001, S3=3'b010, S4=3'b011, S5=3'b100, S6=3'b101, S7=3'b110; 
// Variables para almacenar estado presente y futuro
reg [2:0] current_state, next_state;  //n�mero de bits igual a la definici�n de estados
	
// PROCESO DE ACTUALIZACI�N DE ESTADO (esta parte no cambia)
always @(posedge clk or posedge rst)
	begin 
		if (rst)
			current_state<=S1;		
		else
			current_state<=next_state;
	end
	
// DETERMINACI�N DEL SIGUIENTE ESTADO
always @(current_state, b, ob, SA, SAB)
	begin
		MS=0;
		MB=0; //inicializar salidas a 0
		case (current_state)
			S1: begin
				MS=0;
				MB=0;
				if(b == 1)
					next_state=S2;
				else 
				
					next_state=S1;
				end
			S2: begin
				MS=1;
				MB=0;
				if 	(b== 1)
					next_state= S4;
				else if (SA==1) 
					next_state= S3;
				else 
					next_state= S2;
				end	
			S3:	begin 
				MS=0;
				MB=0;
				if(b==1)
     			    next_state=S5; 
				else 
					next_state=S3;
				end
			S4: begin
				MS=0;
				MB=0;
				if 	(b== 1)
					next_state= S5;
				
				else 
					next_state= S4;
				end	
			S5:	begin 
				MS=0;
				MB=1;
				if(SAB==1)
     			    next_state=S7; 
				else if (ob==1) 
					next_state=S6;
				else 
					next_state=S5;
				end
			S6: begin
				MS=0;
				MB=0;
				if 	(b== 1)
					next_state= S2;
				else 
					next_state= S6;
				end	
			S7:	begin 
				MS=0;
				MB=0;
				if(b==1)
     			    next_state=S2; 
				else 
					next_state=S7;
				end
				
				
		endcase
	end		
endmodule