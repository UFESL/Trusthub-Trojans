/*
 * Copyright 2012, Homer Hsing <homer.hsing@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

`timescale 1ns / 1ps

module test_aes_128;

	// Inputs
	reg clk;
	reg rst;
	reg [127:0] state;
	reg [127:0] key;

	// Outputs
	wire [127:0] out;

	// Instantiate the Unit Under Test (UUT)
	aes_128 uut (
		.clk(clk), 
		.rst(rst),
		.state(state), 
		.key(key), 
		.out(out)
	);

	initial begin
		$dumpfile("a.vcd");
		$dumpvars(0, test_aes_128);

		clk = 0;
		rst = 0;
		state = 0;
		key = 0;

		#100;
        /*
         * TIMEGRP "key" OFFSET = IN 6.4 ns VALID 6 ns AFTER "clk" HIGH;
         * TIMEGRP "state" OFFSET = IN 6.4 ns VALID 6 ns AFTER "clk" HIGH;
         * TIMEGRP "out" OFFSET = OUT 2.2 ns BEFORE "clk" HIGH;
         */
        @ (negedge clk);
        # 2;
        rst = 1;
        state = 128'h3243f6a8_885a308d_313198a2_e0370734;
        key   = 128'h2b7e1516_28aed2a6_abf71588_09cf4f3c;
        #10;
        state = 128'h00112233_44556677_8899aabb_ccddeeff;
        key   = 128'h00010203_04050607_08090a0b_0c0d0e0f;
        #10;
        state = 128'h0;
        key   = 128'h0;
        #10;
        state = 128'h0;
        key   = 128'h1;
        #10;
        state = 128'h1;
        key   = 128'h0;
        #10;
        state = 128'hc5416bca52f8743b56115c0687dca33f;
        key   = 128'h2439d8dc9ade879157fd0e42a672b0d4;
        #10;
        state = 128'h27d67e0334493a95c8c5e28f5229d3a2;
        key   = 128'h329eff163ba24c2c422c8e96740f0e12;
        #10;
        state = 128'he18ac5ccb8e9eef77a36c4fc86113da3;
        key   = 128'hcf1f416e2a68e24a8d8b47220ac1d9ca;
        #10;
        state = 128'h45a4154030bfc5856c5da5666ef852ab;
        key   = 128'h036f7e13b8d5c682b7d94bdb67346273;
        #10;
        state = 128'hf6b76adf05a879051703f3a9e2113e7a;
        key   = 128'h246758ab6c8dcf346b16668c6bd12442;
        #10;
        state = 128'hddba8efc0fa1053d0b5d30e988b563f2;
        key   = 128'h68316b9cbc5a36ff4427aeacfaa0074a;
        #10;
        state = 128'h3da45a8c1f3dcac9494ab92b48435302;
        key   = 128'hfdb0ed201b59ea64c485b7fc1731fed4;
        #10;
        state = 128'h1be8eeb8c87a89441d117afd56ee85ee;
        key   = 128'he9237dafd016f6b8d8d399e7f2b9c84c;
        #10;
        state = 128'hc60101b8aeee79b31c550fd833c6bb7a;
        key   = 128'hd551b97b5d9a979e9e9424bf155a0e93;
        #10;
        state = 128'h89606898d35698526b2b6f26ea5f2ff7;
        key   = 128'h7f38b0e5f779e734e23733902c025305;
        #10;
        state = 128'he85ec883ff00f57e16991447d10bcbb7;
        key   = 128'h13b75c723bc7362a11fce9791db4fd26;
        #10;
        state = 128'hd6a2b0b8febfd9c8ef9cb09d211ab7e4;
        key   = 128'hc1a8a3b137d9859f8ac8ba7842724ff5;
        #10;
        state = 128'h8a740e76b5d41c64ab64065c588e713e;
        key   = 128'h036b93cde8f2c63b54aa851b3080b6f2;
        #10;
        state = 128'h440b30ff200eb65791deb4d16560d99f;
        key   = 128'h1ffe31f364dfc3dead3764e06a20c7c8;
        #10;
        state = 128'ha1521312c5b8b7cedca124ce2ee7c890;
        key   = 128'h4a0d5c60c5d5cca1636eeed038c2f916;
        #10;
        state = 128'h2641c181a5d419769ebe65fc476e8094;
        key   = 128'h96d5a56736eaec69cdcd4753c1ae2dc9;
	#10
        if (out !== 128'h3925841d02dc09fbdc118597196a0b32)
          begin $display("E"); $finish; end
        state = 128'h82ca158e950ac7dbdd1eaf4f66e791ab;
        key   = 128'hf41c1c0b2f565d9ac78334f3d9a3bf8e;
        #10;
        if (out !== 128'h69_c4_e0_d8_6a_7b_04_30_d8_cd_b7_80_70_b4_c5_5a)
          begin $display("E"); $finish; end
        state = 128'h97b6a84691db469f749293423e69eca5;
        key   = 128'ha9bf13b41c98727d205df286daa04588;
        #10;
        if (out !== 128'h66_e9_4b_d4_ef_8a_2c_3b_88_4c_fa_59_ca_34_2b_2e)
          begin $display("E"); $finish; end
        state = 128'h44ab71458e73a20ada2fb2a975000408;
        key   = 128'hb63070901cfcbe6e969472f3577f3164;
        #10;
        if (out !== 128'h05_45_aa_d5_6d_a2_a9_7c_36_63_d1_43_2a_3d_1c_84)
          begin $display("E"); $finish; end
        #10;
        if (out !== 128'h58_e2_fc_ce_fa_7e_30_61_36_7f_1d_57_a4_e7_45_5a)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h20E02B44053C271196E78AA90087EAC7)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hD4CB372A6CAEF2A5F041AF59FDCFF000)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hEF66CBE2B1D076C83B9495B5E9D58975)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h0EFA3D15495416EBFCF6B73B4EBA0EB5)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h4E6A6A33AEB8D148473E6937E2D8EBEC)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h741888CC4C6F61435B394AA0990BC96F)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hF0EF4C29E618DA35214012BAD7E64894)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hDCBDC6AAEF598DF3E777EB52CF8E444F)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h2E2530EC648A57936D7BE3CD6B4AD8C2)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hF1A1132DE33842B8D8BCF4C1EE418889)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h5293C0015ACC6956B1027499B8A44A5C)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h3EAB9001BF255AC37DAE573865AEA1A5)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h8162C286CB192E15FC5DEA50CC52EFEB)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'h6962B8E49086D9B834E4EB6D1E48A4A5)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hF3463A565A7E1E2E0B92F91A2805B4E6)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hCC0E209F3C0BC6C68F1146FF8FC9CA3D)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hE5F90BF953EF74ECC8729EF352F6094C)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hB492CAF1B23D6D16DC82DCFF49074B61)
          begin $display("E"); $finish; end
	#10
        if (out !== 128'hA5B19D6341D966E35CB850F28DB72E34)
          begin $display("E"); $finish; end

        $display("Good.");
        $finish;
	end
      
    always #5 clk = ~clk;
endmodule
