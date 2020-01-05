module blinky_top (
    output wire [2:0] gpio
);
    logic clk;
    OSC #(
        .FREQ_DIV(105), // 210[MHz] / FREQ_DIV = output
        .DEVICE("GW1N-4")
    ) osc_inst (
        .OSCOUT(clk)
    );

    localparam int COUNTER_TOP = 32'd1_000_000 - 32'd1;

    logic [2:0] gpio_out = 0;
    assign gpio = ~gpio_out[2:0];

    logic [31:0] counter = 0;

    always_ff @(posedge clk) begin
        if( counter == COUNTER_TOP ) begin
            counter <= 0;
            gpio_out <= ~gpio_out;
        end
        else begin
            counter <= counter + 1;
        end
    end
endmodule