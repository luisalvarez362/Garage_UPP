/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_garage_project (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    wire _unused = &{ena, ui_in[4], ui_in[5], ui_in[6],ui_in[7],uio_in[0],uio_in[1],uio_in[2],uio_in[3],uio_in[4],uio_in[5],uio_in[6],uio_in[7], 1'b0};
    wire rst;
    assign rst=!rst_n;
  // All output pins must be assigned. If not used, assign to 0.
    assign uo_out[2]=0;
    assign uo_out[3]=0;
    assign uo_out[4]=0;
    assign uo_out[5]=0;
    assign uo_out[6]=0;
    assign uo_out[7]=0;

    assign uio_oe = 8'b1111_1111;
    assign uio_out[7:0] = 8'b0000_0000;
  // List all unused inputs to prevent warnings

    tt_um_garage top (
        .clk(clk),
        .rst(rst),
        .btn(ui_in[0]),
        .ob(ui_in[1]),
        .SA(ui_in[2]),
        .SAB(ui_in[3]),
        .MS(uo_out[0]),
        .MB(uo_out[1])
        );
endmodule
