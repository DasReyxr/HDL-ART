//Copyright (C)2014-2025 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: Template file for instantiation
//Tool Version: V1.9.11.03 Education
//Part Number: GW1NZ-LV1QN48C6/I5
//Device: GW1NZ-1
//Created Time: Fri Apr 24 10:59:40 2026

//Change the instance name and port connections to the signal names
//--------Copy here to design--------

	CORDIC_Top your_instance_name(
		.clk(clk), //input clk
		.rst(rst), //input rst
		.init(init), //input init
		.x_i(x_i), //input [16:0] x_i
		.y_i(y_i), //input [16:0] y_i
		.theta_i(theta_i), //input [16:0] theta_i
		.x_o(x_o), //output [16:0] x_o
		.y_o(y_o), //output [16:0] y_o
		.theta_o(theta_o) //output [16:0] theta_o
	);

//--------Copy end-------------------
