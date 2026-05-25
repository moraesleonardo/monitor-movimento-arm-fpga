module top_tangnano (
    input  wire sys_clk,
    input  wire sys_rst_n,
    output wire led
);

    reg [7:0] nivel_movimento;
    reg [23:0] contador;
    wire [1:0] estado;

    classificador_movimento u_classificador (
        .nivel_movimento(nivel_movimento),
        .estado(estado)
    );

    always @(posedge sys_clk or negedge sys_rst_n) begin
        if (!sys_rst_n) begin
            contador <= 24'd0;
            nivel_movimento <= 8'd0;
        end else begin
            contador <= contador + 1'b1;

            if (contador == 24'd0) begin
                nivel_movimento <= nivel_movimento + 8'd10;
            end
        end
    end

    assign led = (estado == 2'b10);

endmodule