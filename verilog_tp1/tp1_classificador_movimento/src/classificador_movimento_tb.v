`timescale 1ns/1ps

module classificador_movimento_tb;

    reg  [7:0] nivel_movimento;
    wire [1:0] estado;

    classificador_movimento uut (
        .nivel_movimento(nivel_movimento),
        .estado(estado)
    );

    initial begin
	$dumpfile("classificador_movimento.vcd");
    	$dumpvars(0, classificador_movimento_tb);        

	nivel_movimento = 8'd10;
        #10;

        nivel_movimento = 8'd50;
        #10;

        nivel_movimento = 8'd51;
        #10;

        nivel_movimento = 8'd80;
        #10;

        nivel_movimento = 8'd120;
        #10;

        nivel_movimento = 8'd121;
        #10;

        nivel_movimento = 8'd180;
        #10;

        nivel_movimento = 8'd255;
        #10;

        $finish;
    end

endmodule
