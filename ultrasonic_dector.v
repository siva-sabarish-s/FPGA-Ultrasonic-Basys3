module ultrasonic_dector(
    input clk,            // 100MHz
    input echo,
    output reg trig,
    output reg [2:0] led,
    output [6:0] seg,
    output [3:0] an
);

//------------------------------------------------
// Trigger generation (10us pulse every ~60ms)
//------------------------------------------------
reg [22:0] trig_counter = 0;

always @(posedge clk) begin
    if(trig_counter < 6000000)   // 60ms
        trig_counter <= trig_counter + 1;
    else
        trig_counter <= 0;

    if(trig_counter < 1000)      // 10us pulse
        trig <= 1;
    else
        trig <= 0;
end

//------------------------------------------------
// Echo measurement
//------------------------------------------------
reg [31:0] echo_counter = 0;
reg [15:0] distance = 0;

always @(posedge clk) begin
    if(echo)
        echo_counter <= echo_counter + 1;
    else if(echo_counter > 0) begin
        distance <= echo_counter / 5800;  // distance in cm
        echo_counter <= 0;
    end
end

//------------------------------------------------
// LED Control
//------------------------------------------------
always @(posedge clk) begin
    if(distance < 10)
        led <= 3'b001;       // Short
    else if(distance < 30)
        led <= 3'b010;       // Medium
    else
        led <= 3'b100;       // Long
end

//------------------------------------------------
// 7-Segment Display Module
//------------------------------------------------
seven_segment_display display_unit(
    .clk(clk),
    .distance(distance),
    .seg(seg),
    .an(an)
);

endmodule
