module prst (
	input bt, clk, rst,
	output reg push
	); 	
// Definici�n de etiquetas de los estados para tratar con nombres en lugar de bits
parameter S0=2'b00, S1=2'b01, S2=2'b10;
// Variables para almacenar estado presente y futuro
reg [1:0] current_state, next_state;  //n�mero de bits igual a la definici�n de estados
	
// PROCESO DE ACTUALIZACI�N DE ESTADO (esta parte no cambia)
always @(posedge clk or posedge rst)
	begin 
		if (rst)
			current_state<=S0;		
		else
			current_state<=next_state;
	end
	
// DETERMINACI�N DEL SIGUIENTE ESTADO
always @(current_state, bt)
	begin
		push=0; //inicializar salidas a 0
		case (current_state)
			S0: begin
				push=0;
				if(bt == 1)
					next_state=S1;
				else
					next_state=S0;
				end
			S1: begin
				push=0;
				if 	(bt== 1)
					next_state= S1;
				else 
					next_state= S2;
				end	
			S2:	begin
				push=1;
     			next_state=S0;
				end
		endcase
	end		
endmodule