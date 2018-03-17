module font8x16 (
		 input		clk,
		 input  [7:0]	ascii_code,
		 input  [3:0]	row,
		 input  [2:0]   col,
		 output wire	pixel
		 );

reg [255:0] font [0:127];

initial begin
  font[7'h00] = 256'h00000000000000000000000000000000000000007e818199bd8181a5817e0000;
  font[7'h01] = 256'h000000007effffe7c3ffffdbff7e00000000000010387cfefefefe6c00000000;
  font[7'h02] = 256'h000000000010387cfe7c381000000000000000003c1818e7e7e73c3c18000000;
  font[7'h03] = 256'h000000003c18187effff7e3c18000000000000000000183c3c18000000000000;
  font[7'h04] = 256'hffffffffffffe7c3c3e7ffffffffffff00000000003c664242663c0000000000;
  font[7'h05] = 256'hffffffffffc399bdbd99c3ffffffffff0000000078cccccccc78321a0e1e0000;
  font[7'h06] = 256'h0000000018187e183c666666663c000000000000e0f070303030303f333f0000;
  font[7'h07] = 256'h000000c0e6e767636363637f637f0000000000001818db3ce73cdb1818000000;
  font[7'h08] = 256'h0000000080c0e0f0f8fef8f0e0c080000000000002060e1e3efe3e1e0e060200;
  font[7'h09] = 256'h0000000000183c7e1818187e3c18000000000000666600666666666666660000;
  font[7'h0A] = 256'h000000001b1b1b1b1b7bdbdbdb7f00000000007cc60c386cc6c66c3860c67c00;
  font[7'h0B] = 256'h00000000fefefefe0000000000000000000000007e183c7e1818187e3c180000;
  font[7'h0C] = 256'h00000000181818181818187e3c18000000000000183c7e181818181818180000;
  font[7'h0D] = 256'h000000000000180cfe0c1800000000000000000000003060fe60300000000000;
  font[7'h0E] = 256'h000000000000fec0c0c00000000000000000000000002466ff66240000000000;
  font[7'h0F] = 256'h0000000000fefe7c7c3838100000000000000000001038387c7cfefe00000000;
  font[7'h10] = 256'h00000000000000000000000000000000000000001818001818183c3c3c180000;
  font[7'h11] = 256'h00000000000000000000002466666600000000006c6cfe6c6c6cfe6c6c000000;
  font[7'h12] = 256'h000018187cc68606067cc0c2c67c18180000000086c66030180cc6c200000000;
  font[7'h13] = 256'h0000000076ccccccdc76386c6c38000000000000000000000000006030303000;
  font[7'h14] = 256'h000000000c18303030303030180c00000000000030180c0c0c0c0c0c18300000;
  font[7'h15] = 256'h000000000000663cff3c66000000000000000000000018187e18180000000000;
  font[7'h16] = 256'h0000003018181800000000000000000000000000000000007e00000000000000;
  font[7'h17] = 256'h000000001818000000000000000000000000000080c06030180c060200000000;
  font[7'h18] = 256'h000000007cc6c6e6f6decec6c67c0000000000007e1818181818187838180000;
  font[7'h19] = 256'h00000000fec6c06030180c06c67c0000000000007cc60606063c0606c67c0000;
  font[7'h1A] = 256'h000000001e0c0c0cfecc6c3c1c0c0000000000007cc6060606fcc0c0c0fe0000;
  font[7'h1B] = 256'h000000007cc6c6c6c6fcc0c0603800000000000030303030180c0606c6fe0000;
  font[7'h1C] = 256'h000000007cc6c6c6c67cc6c6c67c000000000000780c0606067ec6c6c67c0000;
  font[7'h1D] = 256'h0000000000181800000018180000000000000000301818000000181800000000;
  font[7'h1E] = 256'h00000000060c18306030180c06000000000000000000007e00007e0000000000;
  font[7'h1F] = 256'h000000006030180c060c183060000000000000001818001818180cc6c67c0000;
  font[7'h20] = 256'h000000007cc0dcdededec6c6c67c000000000000c6c6c6c6fec6c66c38100000;
  font[7'h21] = 256'h00000000fc666666667c666666fc0000000000003c66c2c0c0c0c0c2663c0000;
  font[7'h22] = 256'h00000000f86c6666666666666cf8000000000000fe6662606878686266fe0000;
  font[7'h23] = 256'h00000000f06060606878686266fe0000000000003a66c6c6dec0c0c2663c0000;
  font[7'h24] = 256'h00000000c6c6c6c6c6fec6c6c6c60000000000003c18181818181818183c0000;
  font[7'h25] = 256'h0000000078cccccc0c0c0c0c0c1e000000000000e666666c78786c6666e60000;
  font[7'h26] = 256'h00000000fe6662606060606060f0000000000000c3c3c3c3c3dbffffe7c30000;
  font[7'h27] = 256'h00000000c6c6c6c6cedefef6e6c60000000000007cc6c6c6c6c6c6c6c67c0000;
  font[7'h28] = 256'h00000000f0606060607c666666fc000000000e0c7cded6c6c6c6c6c6c67c0000;
  font[7'h29] = 256'h00000000e66666666c7c666666fc0000000000007cc6c6060c3860c6c67c0000;
  font[7'h2A] = 256'h000000003c18181818181899dbff0000000000007cc6c6c6c6c6c6c6c6c60000;
  font[7'h2B] = 256'h00000000183c66c3c3c3c3c3c3c30000000000006666ffdbdbc3c3c3c3c30000;
  font[7'h2C] = 256'h00000000c3c3663c18183c66c3c30000000000003c181818183c66c3c3c30000;
  font[7'h2D] = 256'h00000000ffc3c16030180c86c3ff0000000000003c30303030303030303c0000;
  font[7'h2E] = 256'h0000000002060e1c3870e0c080000000000000003c0c0c0c0c0c0c0c0c3c0000;
  font[7'h2F] = 256'h000000000000000000000000c66c38100000ff00000000000000000000000000;
  font[7'h30] = 256'h000000000000000000000000001830300000000076cccccc7c0c780000000000;
  font[7'h31] = 256'h000000007c666666666c786060e00000000000007cc6c0c0c0c67c0000000000;
  font[7'h32] = 256'h0000000076cccccccc6c3c0c0c1c0000000000007cc6c0c0fec67c0000000000;
  font[7'h33] = 256'h00000000f060606060f060646c3800000078cc0c7ccccccccccc760000000000;
  font[7'h34] = 256'h00000000e666666666766c6060e00000000000003c1818181818380018180000;
  font[7'h35] = 256'h003c66660606060606060e000606000000000000e6666c78786c666060e00000;
  font[7'h36] = 256'h000000003c181818181818181838000000000000dbdbdbdbdbffe60000000000;
  font[7'h37] = 256'h00000000666666666666dc0000000000000000007cc6c6c6c6c67c0000000000;
  font[7'h38] = 256'h00f060607c6666666666dc0000000000001e0c0c7ccccccccccc760000000000;
  font[7'h39] = 256'h00000000f06060606676dc0000000000000000007cc60c3860c67c0000000000;
  font[7'h3A] = 256'h000000001c3630303030fc30301000000000000076cccccccccccc0000000000;
  font[7'h3B] = 256'h00000000183c66c3c3c3c300000000000000000066ffdbdbc3c3c30000000000;
  font[7'h3C] = 256'h00000000c3663c183c66c3000000000000f80c067ec6c6c6c6c6c60000000000;
  font[7'h3D] = 256'h00000000fec6603018ccfe0000000000000000000e18181818701818180e0000;
  font[7'h3E] = 256'h000000001818181818001818181800000000000070181818180e181818700000;
  font[7'h3F] = 256'h000000000000000000000000dc7600000000000000fec6c6c66c381000000000;
  font[7'h40] = 256'h00007c060c3c66c2c0c0c0c2663c00000000000076cccccccccccc0000cc0000;
  font[7'h41] = 256'h000000007cc6c0c0fec67c0030180c000000000076cccccc7c0c78006c381000;
  font[7'h42] = 256'h0000000076cccccc7c0c780000cc00000000000076cccccc7c0c780018306000;
  font[7'h43] = 256'h0000000076cccccc7c0c7800386c38000000003c060c3c666060663c00000000;
  font[7'h44] = 256'h000000007cc6c0c0fec67c006c381000000000007cc6c0c0fec67c0000c60000;
  font[7'h45] = 256'h000000007cc6c0c0fec67c0018306000000000003c1818181818380000660000;
  font[7'h46] = 256'h000000003c18181818183800663c1800000000003c1818181818380018306000;
  font[7'h47] = 256'h00000000c6c6c6fec6c66c381000c60000000000c6c6c6fec6c66c3800386c38;
  font[7'h48] = 256'h00000000fe6660607c6066fe006030180000000077dcd87e1b3b6e0000000000;
  font[7'h49] = 256'h00000000ceccccccccfecccc6c3e0000000000007cc6c6c6c6c67c006c381000;
  font[7'h4A] = 256'h000000007cc6c6c6c6c67c0000c60000000000007cc6c6c6c6c67c0018306000;
  font[7'h4B] = 256'h0000000076cccccccccccc00cc7830000000000076cccccccccccc0018306000;
  font[7'h4C] = 256'h00780c067ec6c6c6c6c6c60000c60000000000007cc6c6c6c6c6c6c67c00c600;
  font[7'h4D] = 256'h000000007cc6c6c6c6c6c6c6c600c6000000000018187ec3c0c0c0c37e181800;
  font[7'h4E] = 256'h00000000fce660606060f060646c380000000000181818ff18ff183c66c30000;
  font[7'h4F] = 256'h00000000f36666666f66627c6666fc00000070d818181818187e1818181b0e00;
  font[7'h50] = 256'h0000000076cccccc7c0c780060301800000000003c1818181818380030180c00;
  font[7'h51] = 256'h000000007cc6c6c6c6c67c00603018000000000076cccccccccccc0060301800;
  font[7'h52] = 256'h00000000666666666666dc00dc76000000000000c6c6c6cedefef6e6c600dc76;
  font[7'h53] = 256'h0000000000000000007e003e6c6c3c000000000000000000007c00386c6c3800;
  font[7'h54] = 256'h000000007cc6c6c060303000303000000000000000c0c0c0c0fe000000000000;
  font[7'h55] = 256'h000000000006060606fe00000000000000001f0c069bce603018ccc6c2c0c000;
  font[7'h56] = 256'h000006063e96ce663018ccc6c2c0c00000000000183c3c3c1818180018180000;
  font[7'h57] = 256'h000000000000366cd86c360000000000000000000000d86c366cd80000000000;
  font[7'h58] = 256'h44114411441144114411441144114411aa55aa55aa55aa55aa55aa55aa55aa55;
  font[7'h59] = 256'h77dd77dd77dd77dd77dd77dd77dd77dd18181818181818181818181818181818;
  font[7'h5A] = 256'h1818181818181818f8181818181818181818181818181818f818f81818181818;
  font[7'h5B] = 256'h3636363636363636f6363636363636363636363636363636fe00000000000000;
  font[7'h5C] = 256'h1818181818181818f818f800000000003636363636363636f606f63636363636;
  font[7'h5D] = 256'h363636363636363636363636363636363636363636363636f606fe0000000000;
  font[7'h5E] = 256'h0000000000000000fe06f636363636360000000000000000fe36363636363636;
  font[7'h5F] = 256'h0000000000000000f818f818181818181818181818181818f800000000000000;
  font[7'h60] = 256'h00000000000000001f181818181818180000000000000000ff18181818181818;
  font[7'h61] = 256'h1818181818181818ff0000000000000018181818181818181f18181818181818;
  font[7'h62] = 256'h0000000000000000ff000000000000001818181818181818ff18181818181818;
  font[7'h63] = 256'h18181818181818181f181f181818181836363636363636363736363636363636;
  font[7'h64] = 256'h00000000000000003f30373636363636363636363636363637303f0000000000;
  font[7'h65] = 256'h0000000000000000ff00f736363636363636363636363636f700ff0000000000;
  font[7'h66] = 256'h363636363636363637303736363636360000000000000000ff00ff0000000000;
  font[7'h67] = 256'h3636363636363636f700f736363636360000000000000000ff00ff1818181818;
  font[7'h68] = 256'h0000000000000000ff363636363636361818181818181818ff00ff0000000000;
  font[7'h69] = 256'h3636363636363636ff0000000000000000000000000000003f36363636363636;
  font[7'h6A] = 256'h00000000000000001f181f181818181818181818181818181f181f0000000000;
  font[7'h6B] = 256'h36363636363636363f000000000000003636363636363636ff36363636363636;
  font[7'h6C] = 256'h1818181818181818ff18ff18181818180000000000000000f818181818181818;
  font[7'h6D] = 256'h18181818181818181f00000000000000ffffffffffffffffffffffffffffffff;
  font[7'h6E] = 256'hffffffffffffffffff00000000000000f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0;
  font[7'h6F] = 256'h0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f000000000000000000ffffffffffffff;
  font[7'h70] = 256'h0000000076dcd8d8d8dc76000000000000000000ccc6c6c6ccd8cccccc780000;
  font[7'h71] = 256'h00000000c0c0c0c0c0c0c0c6c6fe0000000000006c6c6c6c6c6c6cfe00000000;
  font[7'h72] = 256'h00000000fec66030183060c6fe0000000000000070d8d8d8d8d87e0000000000;
  font[7'h73] = 256'h000000c060607c66666666660000000000000000181818181818dc7600000000;
  font[7'h74] = 256'h000000007e183c6666663c187e00000000000000386cc6c6fec6c66c38000000;
  font[7'h75] = 256'h00000000ee6c6c6c6cc6c6c66c380000000000003c666666663e0c18301e0000;
  font[7'h76] = 256'h0000000000007edbdbdb7e000000000000000000c0607ef3dbdb7e0603000000;
  font[7'h77] = 256'h000000001c306060607c6060301c000000000000c6c6c6c6c6c6c6c67c000000;
  font[7'h78] = 256'h0000000000fe0000fe0000fe0000000000000000ff000018187e181800000000;
  font[7'h79] = 256'h000000007e0030180c060c1830000000000000007e000c18306030180c000000;
  font[7'h7A] = 256'h181818181818181818181b1b1b0e00000000000070d8d8d81818181818181818;
  font[7'h7B] = 256'h00000000001818007e00181800000000000000000000dc7600dc760000000000;
  font[7'h7C] = 256'h0000000000000000000000386c6c380000000000000000181800000000000000;
  font[7'h7D] = 256'h00000000000000180000000000000000000000001c3c6c6cec0c0c0c0c0c0f00;
  font[7'h7E] = 256'h0000000000000000006c6c6c6c6cd800000000000000000000f8c86030d87000;
  font[7'h7F] = 256'h00000000007c7c7c7c7c7c7c0000000000000000000000000000000000000000;
end

wire [7:0] r;
assign r = row;

wire[255:0] pixels32;
assign pixels32 = font[ascii_code >> 1];

wire [127:0] pixels;
assign pixels = ascii_code[0] == 0 ? pixels32[255:128] : pixels32[127:0];
assign pixel = pixels[(r << 3) + ~col];
	 
endmodule
