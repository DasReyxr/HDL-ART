module gw_gao(
    \debug_theta[16] ,
    \debug_theta[15] ,
    \debug_theta[14] ,
    \debug_theta[13] ,
    \debug_theta[12] ,
    \debug_theta[11] ,
    \debug_theta[10] ,
    \debug_theta[9] ,
    \debug_theta[8] ,
    \debug_theta[7] ,
    \debug_theta[6] ,
    \debug_theta[5] ,
    \debug_theta[4] ,
    \debug_theta[3] ,
    \debug_theta[2] ,
    \debug_theta[1] ,
    \debug_theta[0] ,
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
    init,
    rst,
    unused_record,
    clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \debug_theta[16] ;
input \debug_theta[15] ;
input \debug_theta[14] ;
input \debug_theta[13] ;
input \debug_theta[12] ;
input \debug_theta[11] ;
input \debug_theta[10] ;
input \debug_theta[9] ;
input \debug_theta[8] ;
input \debug_theta[7] ;
input \debug_theta[6] ;
input \debug_theta[5] ;
input \debug_theta[4] ;
input \debug_theta[3] ;
input \debug_theta[2] ;
input \debug_theta[1] ;
input \debug_theta[0] ;
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
input init;
input rst;
input unused_record;
input clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \debug_theta[16] ;
wire \debug_theta[15] ;
wire \debug_theta[14] ;
wire \debug_theta[13] ;
wire \debug_theta[12] ;
wire \debug_theta[11] ;
wire \debug_theta[10] ;
wire \debug_theta[9] ;
wire \debug_theta[8] ;
wire \debug_theta[7] ;
wire \debug_theta[6] ;
wire \debug_theta[5] ;
wire \debug_theta[4] ;
wire \debug_theta[3] ;
wire \debug_theta[2] ;
wire \debug_theta[1] ;
wire \debug_theta[0] ;
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
wire init;
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
    .data_i({\debug_theta[16] ,\debug_theta[15] ,\debug_theta[14] ,\debug_theta[13] ,\debug_theta[12] ,\debug_theta[11] ,\debug_theta[10] ,\debug_theta[9] ,\debug_theta[8] ,\debug_theta[7] ,\debug_theta[6] ,\debug_theta[5] ,\debug_theta[4] ,\debug_theta[3] ,\debug_theta[2] ,\debug_theta[1] ,\debug_theta[0] ,\sine_o[16] ,\sine_o[15] ,\sine_o[14] ,\sine_o[13] ,\sine_o[12] ,\sine_o[11] ,\sine_o[10] ,\sine_o[9] ,\sine_o[8] ,\sine_o[7] ,\sine_o[6] ,\sine_o[5] ,\sine_o[4] ,\sine_o[3] ,\sine_o[2] ,\sine_o[1] ,\sine_o[0] ,init,rst}),
    .clk_i(clk)
);

endmodule
