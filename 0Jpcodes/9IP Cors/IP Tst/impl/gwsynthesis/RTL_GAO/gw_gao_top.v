module gw_gao(
    \cosine_o[16] ,
    \cosine_o[15] ,
    \cosine_o[14] ,
    \cosine_o[13] ,
    \cosine_o[12] ,
    \cosine_o[11] ,
    \cosine_o[10] ,
    \cosine_o[9] ,
    \cosine_o[8] ,
    \cosine_o[7] ,
    \cosine_o[6] ,
    \cosine_o[5] ,
    \cosine_o[4] ,
    \cosine_o[3] ,
    \cosine_o[2] ,
    \cosine_o[1] ,
    \cosine_o[0] ,
    \x_o_int[16] ,
    \x_o_int[15] ,
    \x_o_int[14] ,
    \x_o_int[13] ,
    \x_o_int[12] ,
    \x_o_int[11] ,
    \x_o_int[10] ,
    \x_o_int[9] ,
    \x_o_int[8] ,
    \x_o_int[7] ,
    \x_o_int[6] ,
    \x_o_int[5] ,
    \x_o_int[4] ,
    \x_o_int[3] ,
    \x_o_int[2] ,
    \x_o_int[1] ,
    \x_o_int[0] ,
    \y_o_int[16] ,
    \y_o_int[15] ,
    \y_o_int[14] ,
    \y_o_int[13] ,
    \y_o_int[12] ,
    \y_o_int[11] ,
    \y_o_int[10] ,
    \y_o_int[9] ,
    \y_o_int[8] ,
    \y_o_int[7] ,
    \y_o_int[6] ,
    \y_o_int[5] ,
    \y_o_int[4] ,
    \y_o_int[3] ,
    \y_o_int[2] ,
    \y_o_int[1] ,
    \y_o_int[0] ,
    init,
    \sine_o[16] ,
    \sine_o[15] ,
    \sine_o[14] ,
    \sine_o[13] ,
    \sine_o[12] ,
    \sine_o[11] ,
    \sine_o[10] ,
    \sine_o[9] ,
    \sine_o[8] ,
    \sine_o[7] ,
    \sine_o[6] ,
    \sine_o[5] ,
    \sine_o[4] ,
    \sine_o[3] ,
    \sine_o[2] ,
    \sine_o[1] ,
    \sine_o[0] ,
    rst,
    unused_record,
    clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \cosine_o[16] ;
input \cosine_o[15] ;
input \cosine_o[14] ;
input \cosine_o[13] ;
input \cosine_o[12] ;
input \cosine_o[11] ;
input \cosine_o[10] ;
input \cosine_o[9] ;
input \cosine_o[8] ;
input \cosine_o[7] ;
input \cosine_o[6] ;
input \cosine_o[5] ;
input \cosine_o[4] ;
input \cosine_o[3] ;
input \cosine_o[2] ;
input \cosine_o[1] ;
input \cosine_o[0] ;
input \x_o_int[16] ;
input \x_o_int[15] ;
input \x_o_int[14] ;
input \x_o_int[13] ;
input \x_o_int[12] ;
input \x_o_int[11] ;
input \x_o_int[10] ;
input \x_o_int[9] ;
input \x_o_int[8] ;
input \x_o_int[7] ;
input \x_o_int[6] ;
input \x_o_int[5] ;
input \x_o_int[4] ;
input \x_o_int[3] ;
input \x_o_int[2] ;
input \x_o_int[1] ;
input \x_o_int[0] ;
input \y_o_int[16] ;
input \y_o_int[15] ;
input \y_o_int[14] ;
input \y_o_int[13] ;
input \y_o_int[12] ;
input \y_o_int[11] ;
input \y_o_int[10] ;
input \y_o_int[9] ;
input \y_o_int[8] ;
input \y_o_int[7] ;
input \y_o_int[6] ;
input \y_o_int[5] ;
input \y_o_int[4] ;
input \y_o_int[3] ;
input \y_o_int[2] ;
input \y_o_int[1] ;
input \y_o_int[0] ;
input init;
input \sine_o[16] ;
input \sine_o[15] ;
input \sine_o[14] ;
input \sine_o[13] ;
input \sine_o[12] ;
input \sine_o[11] ;
input \sine_o[10] ;
input \sine_o[9] ;
input \sine_o[8] ;
input \sine_o[7] ;
input \sine_o[6] ;
input \sine_o[5] ;
input \sine_o[4] ;
input \sine_o[3] ;
input \sine_o[2] ;
input \sine_o[1] ;
input \sine_o[0] ;
input rst;
input unused_record;
input clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \cosine_o[16] ;
wire \cosine_o[15] ;
wire \cosine_o[14] ;
wire \cosine_o[13] ;
wire \cosine_o[12] ;
wire \cosine_o[11] ;
wire \cosine_o[10] ;
wire \cosine_o[9] ;
wire \cosine_o[8] ;
wire \cosine_o[7] ;
wire \cosine_o[6] ;
wire \cosine_o[5] ;
wire \cosine_o[4] ;
wire \cosine_o[3] ;
wire \cosine_o[2] ;
wire \cosine_o[1] ;
wire \cosine_o[0] ;
wire \x_o_int[16] ;
wire \x_o_int[15] ;
wire \x_o_int[14] ;
wire \x_o_int[13] ;
wire \x_o_int[12] ;
wire \x_o_int[11] ;
wire \x_o_int[10] ;
wire \x_o_int[9] ;
wire \x_o_int[8] ;
wire \x_o_int[7] ;
wire \x_o_int[6] ;
wire \x_o_int[5] ;
wire \x_o_int[4] ;
wire \x_o_int[3] ;
wire \x_o_int[2] ;
wire \x_o_int[1] ;
wire \x_o_int[0] ;
wire \y_o_int[16] ;
wire \y_o_int[15] ;
wire \y_o_int[14] ;
wire \y_o_int[13] ;
wire \y_o_int[12] ;
wire \y_o_int[11] ;
wire \y_o_int[10] ;
wire \y_o_int[9] ;
wire \y_o_int[8] ;
wire \y_o_int[7] ;
wire \y_o_int[6] ;
wire \y_o_int[5] ;
wire \y_o_int[4] ;
wire \y_o_int[3] ;
wire \y_o_int[2] ;
wire \y_o_int[1] ;
wire \y_o_int[0] ;
wire init;
wire \sine_o[16] ;
wire \sine_o[15] ;
wire \sine_o[14] ;
wire \sine_o[13] ;
wire \sine_o[12] ;
wire \sine_o[11] ;
wire \sine_o[10] ;
wire \sine_o[9] ;
wire \sine_o[8] ;
wire \sine_o[7] ;
wire \sine_o[6] ;
wire \sine_o[5] ;
wire \sine_o[4] ;
wire \sine_o[3] ;
wire \sine_o[2] ;
wire \sine_o[1] ;
wire \sine_o[0] ;
wire rst;
wire unused_record;
wire clk;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top_0  u_la0_top(
    .control(control0[9:0]),
    .trig0_i(unused_record),
    .data_i({\cosine_o[16] ,\cosine_o[15] ,\cosine_o[14] ,\cosine_o[13] ,\cosine_o[12] ,\cosine_o[11] ,\cosine_o[10] ,\cosine_o[9] ,\cosine_o[8] ,\cosine_o[7] ,\cosine_o[6] ,\cosine_o[5] ,\cosine_o[4] ,\cosine_o[3] ,\cosine_o[2] ,\cosine_o[1] ,\cosine_o[0] ,\x_o_int[16] ,\x_o_int[15] ,\x_o_int[14] ,\x_o_int[13] ,\x_o_int[12] ,\x_o_int[11] ,\x_o_int[10] ,\x_o_int[9] ,\x_o_int[8] ,\x_o_int[7] ,\x_o_int[6] ,\x_o_int[5] ,\x_o_int[4] ,\x_o_int[3] ,\x_o_int[2] ,\x_o_int[1] ,\x_o_int[0] ,\y_o_int[16] ,\y_o_int[15] ,\y_o_int[14] ,\y_o_int[13] ,\y_o_int[12] ,\y_o_int[11] ,\y_o_int[10] ,\y_o_int[9] ,\y_o_int[8] ,\y_o_int[7] ,\y_o_int[6] ,\y_o_int[5] ,\y_o_int[4] ,\y_o_int[3] ,\y_o_int[2] ,\y_o_int[1] ,\y_o_int[0] ,init,\sine_o[16] ,\sine_o[15] ,\sine_o[14] ,\sine_o[13] ,\sine_o[12] ,\sine_o[11] ,\sine_o[10] ,\sine_o[9] ,\sine_o[8] ,\sine_o[7] ,\sine_o[6] ,\sine_o[5] ,\sine_o[4] ,\sine_o[3] ,\sine_o[2] ,\sine_o[1] ,\sine_o[0] ,rst}),
    .clk_i(clk)
);

endmodule
