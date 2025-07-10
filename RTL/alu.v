module alu (
    input  [7:0] a,
    input  [7:0] b,
    input  [2:0] sel,
    output reg [7:0] result,
    output reg zero
);

always @(*) begin
    case (sel)
        3'b000: result = a + b;           // ADD
        3'b001: result = a - b;           // SUB
        3'b010: result = a & b;           // AND
        3'b011: result = a | b;           // OR
        3'b100: result = a ^ b;           // XOR
        3'b101: result = a * b;           // MUL
        3'b110: result = (a == b) ? 8'b1 : 8'b0; // CMP
        3'b111: result = 8'b00000000;     // NOP
        default: result = 8'b00000000;
    endcase

    zero = (result == 8'b0) ? 1'b1 : 1'b0;
end

endmodule
