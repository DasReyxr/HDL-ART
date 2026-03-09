module gw_gao(
    \card[7] ,
    \card[6] ,
    \card[5] ,
    \card[4] ,
    \card[3] ,
    \card[2] ,
    \card[1] ,
    \card[0] ,
    \ran[10] ,
    \ran[9] ,
    \ran[8] ,
    \ran[7] ,
    \ran[6] ,
    \ran[5] ,
    \ran[4] ,
    \ran[3] ,
    \ran[2] ,
    \ran[1] ,
    \ran[0] ,
    \reg_a[8] ,
    \reg_a[7] ,
    \reg_a[6] ,
    \reg_a[5] ,
    \reg_a[4] ,
    \reg_a[3] ,
    \reg_a[2] ,
    \reg_a[1] ,
    \reg_a[0] ,
    \sw_counter[2] ,
    \sw_counter[1] ,
    \sw_counter[0] ,
    \LCD_inst/DOUT[7] ,
    \LCD_inst/DOUT[6] ,
    \LCD_inst/DOUT[5] ,
    \LCD_inst/DOUT[4] ,
    \LCD_inst/DOUT[3] ,
    \LCD_inst/DOUT[2] ,
    \LCD_inst/DOUT[1] ,
    \LCD_inst/DOUT[0] ,
    \LCD_inst/ControlS[6] ,
    \LCD_inst/ControlS[5] ,
    dlr_s,
    \LCD_inst/RS ,
    \LCD_D[7] ,
    \LCD_D[6] ,
    \LCD_D[5] ,
    \LCD_D[4] ,
    \LCD_D[3] ,
    \LCD_D[2] ,
    \LCD_D[1] ,
    \LCD_D[0] ,
    \LCD_inst/tenMsClk ,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \card[7] ;
input \card[6] ;
input \card[5] ;
input \card[4] ;
input \card[3] ;
input \card[2] ;
input \card[1] ;
input \card[0] ;
input \ran[10] ;
input \ran[9] ;
input \ran[8] ;
input \ran[7] ;
input \ran[6] ;
input \ran[5] ;
input \ran[4] ;
input \ran[3] ;
input \ran[2] ;
input \ran[1] ;
input \ran[0] ;
input \reg_a[8] ;
input \reg_a[7] ;
input \reg_a[6] ;
input \reg_a[5] ;
input \reg_a[4] ;
input \reg_a[3] ;
input \reg_a[2] ;
input \reg_a[1] ;
input \reg_a[0] ;
input \sw_counter[2] ;
input \sw_counter[1] ;
input \sw_counter[0] ;
input \LCD_inst/DOUT[7] ;
input \LCD_inst/DOUT[6] ;
input \LCD_inst/DOUT[5] ;
input \LCD_inst/DOUT[4] ;
input \LCD_inst/DOUT[3] ;
input \LCD_inst/DOUT[2] ;
input \LCD_inst/DOUT[1] ;
input \LCD_inst/DOUT[0] ;
input \LCD_inst/ControlS[6] ;
input \LCD_inst/ControlS[5] ;
input dlr_s;
input \LCD_inst/RS ;
input \LCD_D[7] ;
input \LCD_D[6] ;
input \LCD_D[5] ;
input \LCD_D[4] ;
input \LCD_D[3] ;
input \LCD_D[2] ;
input \LCD_D[1] ;
input \LCD_D[0] ;
input \LCD_inst/tenMsClk ;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \card[7] ;
wire \card[6] ;
wire \card[5] ;
wire \card[4] ;
wire \card[3] ;
wire \card[2] ;
wire \card[1] ;
wire \card[0] ;
wire \ran[10] ;
wire \ran[9] ;
wire \ran[8] ;
wire \ran[7] ;
wire \ran[6] ;
wire \ran[5] ;
wire \ran[4] ;
wire \ran[3] ;
wire \ran[2] ;
wire \ran[1] ;
wire \ran[0] ;
wire \reg_a[8] ;
wire \reg_a[7] ;
wire \reg_a[6] ;
wire \reg_a[5] ;
wire \reg_a[4] ;
wire \reg_a[3] ;
wire \reg_a[2] ;
wire \reg_a[1] ;
wire \reg_a[0] ;
wire \sw_counter[2] ;
wire \sw_counter[1] ;
wire \sw_counter[0] ;
wire \LCD_inst/DOUT[7] ;
wire \LCD_inst/DOUT[6] ;
wire \LCD_inst/DOUT[5] ;
wire \LCD_inst/DOUT[4] ;
wire \LCD_inst/DOUT[3] ;
wire \LCD_inst/DOUT[2] ;
wire \LCD_inst/DOUT[1] ;
wire \LCD_inst/DOUT[0] ;
wire \LCD_inst/ControlS[6] ;
wire \LCD_inst/ControlS[5] ;
wire dlr_s;
wire \LCD_inst/RS ;
wire \LCD_D[7] ;
wire \LCD_D[6] ;
wire \LCD_D[5] ;
wire \LCD_D[4] ;
wire \LCD_D[3] ;
wire \LCD_D[2] ;
wire \LCD_D[1] ;
wire \LCD_D[0] ;
wire \LCD_inst/tenMsClk ;
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
    .trig0_i({\LCD_D[7] ,\LCD_D[6] ,\LCD_D[5] ,\LCD_D[4] ,\LCD_D[3] ,\LCD_D[2] ,\LCD_D[1] ,\LCD_D[0] }),
    .data_i({\card[7] ,\card[6] ,\card[5] ,\card[4] ,\card[3] ,\card[2] ,\card[1] ,\card[0] ,\ran[10] ,\ran[9] ,\ran[8] ,\ran[7] ,\ran[6] ,\ran[5] ,\ran[4] ,\ran[3] ,\ran[2] ,\ran[1] ,\ran[0] ,\reg_a[8] ,\reg_a[7] ,\reg_a[6] ,\reg_a[5] ,\reg_a[4] ,\reg_a[3] ,\reg_a[2] ,\reg_a[1] ,\reg_a[0] ,\sw_counter[2] ,\sw_counter[1] ,\sw_counter[0] ,\LCD_inst/DOUT[7] ,\LCD_inst/DOUT[6] ,\LCD_inst/DOUT[5] ,\LCD_inst/DOUT[4] ,\LCD_inst/DOUT[3] ,\LCD_inst/DOUT[2] ,\LCD_inst/DOUT[1] ,\LCD_inst/DOUT[0] ,\LCD_inst/ControlS[6] ,\LCD_inst/ControlS[5] ,dlr_s,\LCD_inst/RS }),
    .clk_i(\LCD_inst/tenMsClk )
);

endmodule
