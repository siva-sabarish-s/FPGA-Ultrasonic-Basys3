module seven_segment_display(
    input clk,
    input [15:0] distance,
    output reg [6:0] seg,
    output reg [3:0] an
);

reg [19:0] refresh_counter = 0;
reg [1:0] digit_select = 0;

reg [3:0] digit;
reg [3:0] thousands, hundreds, tens, ones;

//----------------------------------------
// Split digits
//----------------------------------------
always @(*) begin
    thousands = (distance / 1000) % 10;
    hundreds  = (distance / 100)  % 10;
    tens      = (distance / 10)   % 10;
    ones      = distance % 10;
end

//----------------------------------------
// Refresh counter (~1kHz)
//----------------------------------------
always @(posedge clk) begin
    refresh_counter <= refresh_counter + 1;
    digit_select <= refresh_counter[19:18];
end

//----------------------------------------
// Digit multiplexing
//----------------------------------------
always @(*) begin
    case(digit_select)
        2'b00: begin an = 4'b1110; digit = ones; end
        2'b01: begin an = 4'b1101; digit = tens; end
        2'b10: begin an = 4'b1011; digit = hundreds; end
        2'b11: begin an = 4'b0111; digit = thousands; end
    endcase
end

//----------------------------------------
// 7-segment decoder (Common Anode)
//----------------------------------------
always @(*) begin
    case(digit)
        0: seg = 7'b1000000;
        1: seg = 7'b1111001;
        2: seg = 7'b0100100;
        3: seg = 7'b0110000;
        4: seg = 7'b0011001;
        5: seg = 7'b0010010;
        6: seg = 7'b0000010;
        7: seg = 7'b1111000;
        8: seg = 7'b0000000;
        9: seg = 7'b0010000;
        default: seg = 7'b1111111;
    endcase
end

endmodule