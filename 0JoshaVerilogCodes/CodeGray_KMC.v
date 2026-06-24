module CodeGray_KMC (Q, Qn_POS, Qn_SOP);
input [2:0] Q;
output [2:0] Qn_POS;
output [2:0] Qn_SOP;

assign Qn_POS[0] = (Q[2] | ~Q[1]) & (~Q[2] | Q[1]);
assign Qn_SOP[0] = (~Q[2] & ~Q[1]) | (Q[2] & Q[1]);

assign Qn_POS[1] = (Q[1] | Q[0]) & (~Q[2] | ~Q[0]);
assign Qn_SOP[1] = (~Q[2] & Q[0]) | (Q[1] & ~Q[0]);

assign Qn_POS[2] = (Q[1] | Q[0]) & (Q[2] | ~Q[0]);
assign Qn_SOP[2] = (Q[2] & Q[0]) | (Q[1] & ~Q[0]);

endmodule