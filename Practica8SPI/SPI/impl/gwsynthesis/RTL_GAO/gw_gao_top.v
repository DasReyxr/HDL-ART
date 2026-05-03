module gw_gao(
    \data_o[15] ,
    \data_o[14] ,
    \data_o[13] ,
    \data_o[12] ,
    \data_o[11] ,
    \data_o[10] ,
    \data_o[9] ,
    \data_o[8] ,
    \data_o[7] ,
    \data_o[6] ,
    \data_o[5] ,
    \data_o[4] ,
    \data_o[3] ,
    \data_o[2] ,
    \data_o[1] ,
    \data_o[0] ,
    \shift_reg[15] ,
    \shift_reg[14] ,
    \shift_reg[13] ,
    \shift_reg[12] ,
    \shift_reg[11] ,
    \shift_reg[10] ,
    \shift_reg[9] ,
    \shift_reg[8] ,
    \shift_reg[7] ,
    \shift_reg[6] ,
    \shift_reg[5] ,
    \shift_reg[4] ,
    \shift_reg[3] ,
    \shift_reg[2] ,
    \shift_reg[1] ,
    \shift_reg[0] ,
    \bit_count[3] ,
    \bit_count[2] ,
    \bit_count[1] ,
    \bit_count[0] ,
    rst,
    sclk,
    mosi,
    data_valid_o,
    recording,
    nss,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \data_o[15] ;
input \data_o[14] ;
input \data_o[13] ;
input \data_o[12] ;
input \data_o[11] ;
input \data_o[10] ;
input \data_o[9] ;
input \data_o[8] ;
input \data_o[7] ;
input \data_o[6] ;
input \data_o[5] ;
input \data_o[4] ;
input \data_o[3] ;
input \data_o[2] ;
input \data_o[1] ;
input \data_o[0] ;
input \shift_reg[15] ;
input \shift_reg[14] ;
input \shift_reg[13] ;
input \shift_reg[12] ;
input \shift_reg[11] ;
input \shift_reg[10] ;
input \shift_reg[9] ;
input \shift_reg[8] ;
input \shift_reg[7] ;
input \shift_reg[6] ;
input \shift_reg[5] ;
input \shift_reg[4] ;
input \shift_reg[3] ;
input \shift_reg[2] ;
input \shift_reg[1] ;
input \shift_reg[0] ;
input \bit_count[3] ;
input \bit_count[2] ;
input \bit_count[1] ;
input \bit_count[0] ;
input rst;
input sclk;
input mosi;
input data_valid_o;
input recording;
input nss;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \data_o[15] ;
wire \data_o[14] ;
wire \data_o[13] ;
wire \data_o[12] ;
wire \data_o[11] ;
wire \data_o[10] ;
wire \data_o[9] ;
wire \data_o[8] ;
wire \data_o[7] ;
wire \data_o[6] ;
wire \data_o[5] ;
wire \data_o[4] ;
wire \data_o[3] ;
wire \data_o[2] ;
wire \data_o[1] ;
wire \data_o[0] ;
wire \shift_reg[15] ;
wire \shift_reg[14] ;
wire \shift_reg[13] ;
wire \shift_reg[12] ;
wire \shift_reg[11] ;
wire \shift_reg[10] ;
wire \shift_reg[9] ;
wire \shift_reg[8] ;
wire \shift_reg[7] ;
wire \shift_reg[6] ;
wire \shift_reg[5] ;
wire \shift_reg[4] ;
wire \shift_reg[3] ;
wire \shift_reg[2] ;
wire \shift_reg[1] ;
wire \shift_reg[0] ;
wire \bit_count[3] ;
wire \bit_count[2] ;
wire \bit_count[1] ;
wire \bit_count[0] ;
wire rst;
wire sclk;
wire mosi;
wire data_valid_o;
wire recording;
wire nss;
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
    .trig0_i(data_valid_o),
    .trig1_i(recording),
    .data_i({\data_o[15] ,\data_o[14] ,\data_o[13] ,\data_o[12] ,\data_o[11] ,\data_o[10] ,\data_o[9] ,\data_o[8] ,\data_o[7] ,\data_o[6] ,\data_o[5] ,\data_o[4] ,\data_o[3] ,\data_o[2] ,\data_o[1] ,\data_o[0] ,\shift_reg[15] ,\shift_reg[14] ,\shift_reg[13] ,\shift_reg[12] ,\shift_reg[11] ,\shift_reg[10] ,\shift_reg[9] ,\shift_reg[8] ,\shift_reg[7] ,\shift_reg[6] ,\shift_reg[5] ,\shift_reg[4] ,\shift_reg[3] ,\shift_reg[2] ,\shift_reg[1] ,\shift_reg[0] ,\bit_count[3] ,\bit_count[2] ,\bit_count[1] ,\bit_count[0] ,rst,sclk,mosi,data_valid_o,recording,nss}),
    .clk_i(sclk)
);

endmodule
