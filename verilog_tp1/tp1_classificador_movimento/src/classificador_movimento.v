module classificador_movimento (
    input  wire [7:0] nivel_movimento,
    output reg  [1:0] estado
);

    // Estados:
    // 2'b00 = Normal
    // 2'b01 = Atencao
    // 2'b10 = Alerta

    always @(*) begin
        if (nivel_movimento <= 8'd50) begin
            estado = 2'b00;
        end else if (nivel_movimento <= 8'd120) begin
            estado = 2'b01;
        end else begin
            estado = 2'b10;
        end
    end

endmodule