//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
//                                                                              //
//  Author: meisq                                                               //
//          msq@qq.com                                                          //
//          ALINX(shanghai) Technology Co.,Ltd                                  //
//          heijin                                                              //
//     WEB: http://www.alinx.cn/                                                //
//     BBS: http://www.heijin.org/                                              //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////
//                                                                              //
// Copyright (c) 2017,ALINX(shanghai) Technology Co.,Ltd                        //
//                    All rights reserved                                       //
//                                                                              //
// This source file may be used and distributed without restriction provided    //
// that this copyright statement is not removed from the file and that any      //
// derivative work contains the original copyright notice and the associated    //
// disclaimer.                                                                  //
//                                                                              //
//////////////////////////////////////////////////////////////////////////////////

//================================================================================
//  Revision History:
//  Date          By            Revision    Change Description
//--------------------------------------------------------------------------------
//  2017/7/19     meisq          1.0         Original
//*******************************************************************************/

module lut_ov5640_rgb565_1024_768(
	input[9:0]             lut_index,   //Look-up table address
	output reg[31:0]       lut_data     //Device address (8bit I2C address), register address, register data
);

always@(*)
begin
	case(lut_index)			  
		10'd  0: lut_data <= {8'h78 ,16'h3103, 8'h11};              // system clock from pad, bit[1]
		10'd  1: lut_data <= {8'h78 ,16'h3008, 8'h82};              // software reset, bit[7]// delay 5ms 
		10'd  2: lut_data <= {8'h3f ,16'hffff,8'hff};               // software power down, bit[6]
		10'd  3: lut_data <= {8'h78 ,16'h3008, 8'h42};
		10'd  4: lut_data <= {8'h78 ,16'h3103, 8'h03};              // system clock from PLL, bit[1]
		10'd  5: lut_data <= {8'h78 ,16'h3017, 8'h00};              // FREX, Vsync, HREF, PCLK, D[9:6] output enable
		10'd  6: lut_data <= {8'h78 ,16'h3018, 8'h00};              // D[5:0], GPIO[1:0] output enable
		10'd  7: lut_data <= {8'h78 ,16'h3034, 8'h18};              // MIPI 10-bit
		10'd  8: lut_data <= {8'h78 ,16'h3035, 8'h11};              // PLL root divider, bit[4], PLL pre-divider, bit[3:0]
		10'd  9: lut_data <= {8'h78 ,16'h3036, 8'h38};              // PCLK root divider, bit[5:4], SCLK2x root divider, bit[3:2] // SCLK root divider, bit[1:0] 
		10'd 10: lut_data <= {8'h78 ,16'h3037, 8'h11};              
		10'd 11: lut_data <= {8'h78 ,16'h3108, 8'h01};              
		10'd 12: lut_data <= {8'h78 ,16'h303D, 8'h10};              
		10'd 13: lut_data <= {8'h78 ,16'h303B, 8'h19};              
		10'd 14: lut_data <= {8'h78 ,16'h3630, 8'h2e};              
		10'd 15: lut_data <= {8'h78 ,16'h3631, 8'h0e};              
		10'd 16: lut_data <= {8'h78 ,16'h3632, 8'he2};              
		10'd 17: lut_data <= {8'h78 ,16'h3633, 8'h23};              
		10'd 18: lut_data <= {8'h78 ,16'h3621, 8'he0};              
		10'd 19: lut_data <= {8'h78 ,16'h3704, 8'ha0};              
		10'd 20: lut_data <= {8'h78 ,16'h3703, 8'h5a};              
		10'd 21: lut_data <= {8'h78 ,16'h3715, 8'h78};              
		10'd 22: lut_data <= {8'h78 ,16'h3717, 8'h01};              
		10'd 23: lut_data <= {8'h78 ,16'h370b, 8'h60};              
		10'd 24: lut_data <= {8'h78 ,16'h3705, 8'h1a};              
		10'd 25: lut_data <= {8'h78 ,16'h3905, 8'h02};              // VCM control
		10'd 26: lut_data <= {8'h78 ,16'h3906, 8'h10};              // VCM control
		10'd 27: lut_data <= {8'h78 ,16'h3901, 8'h0a};              // system control
		10'd 28: lut_data <= {8'h78 ,16'h3731, 8'h02};              
		10'd 29: lut_data <= {8'h78 ,16'h3600, 8'h37};              
		10'd 30: lut_data <= {8'h78 ,16'h3601, 8'h33};              
		10'd 31: lut_data <= {8'h78 ,16'h302d, 8'h60};              // pre-gain = 1.047x
		10'd 32: lut_data <= {8'h78 ,16'h3620, 8'h52};              // gain ceiling
		10'd 33: lut_data <= {8'h78 ,16'h371b, 8'h20};              // gain ceiling = 15.5x
		10'd 34: lut_data <= {8'h78 ,16'h471c, 8'h50};              
		10'd 35: lut_data <= {8'h78 ,16'h3a13, 8'h43};              
		10'd 36: lut_data <= {8'h78 ,16'h3a18, 8'h00};              
		10'd 37: lut_data <= {8'h78 ,16'h3a19, 8'hf8};               // 50/60Hz detection     50/60Hz 灯光条纹过滤
		10'd 38: lut_data <= {8'h78 ,16'h3635, 8'h13};              // Band auto, bit[7]
		10'd 39: lut_data <= {8'h78 ,16'h3636, 8'h06};              // threshold low sum	 
		10'd 40: lut_data <= {8'h78 ,16'h3634, 8'h44};              // threshold high sum
		10'd 41: lut_data <= {8'h78 ,16'h3622, 8'h01};              // light meter 1 threshold[15:8]
		10'd 42: lut_data <= {8'h78 ,16'h3c01, 8'h34};              // light meter 1 threshold[7:0]
		10'd 43: lut_data <= {8'h78 ,16'h3c04, 8'h28};              // light meter 2 threshold[15:8]
		10'd 44: lut_data <= {8'h78 ,16'h3c05, 8'h98};              // light meter 2 threshold[7:0]
		10'd 45: lut_data <= {8'h78 ,16'h3c06, 8'h00};              // sample number[15:8]
		10'd 46: lut_data <= {8'h78 ,16'h3c07, 8'h08};              // sample number[7:0]
		10'd 47: lut_data <= {8'h78 ,16'h3c08, 8'h00};              // Timing Hoffset[11:8]
		10'd 48: lut_data <= {8'h78 ,16'h3c09, 8'h1c};              // Timing Hoffset[7:0]
		10'd 49: lut_data <= {8'h78 ,16'h3c0a, 8'h9c};              // Timing Voffset[10:8] 
		10'd 50: lut_data <= {8'h78 ,16'h3c0b, 8'h40};              
		10'd 51: lut_data <= {8'h78 ,16'h503d, 8'h00};              // BLC start from line 2
		10'd 52: lut_data <= {8'h78 ,16'h3820, 8'h46};              // BLC always update
		10'd 53: lut_data <= {8'h78 ,16'h300e, 8'h45};              // enable blocks
		10'd 54: lut_data <= {8'h78 ,16'h4800, 8'h14};              // enable clocks 
		10'd 55: lut_data <= {8'h78 ,16'h302e, 8'h08};              // MIPI power down, DVP enable
		10'd 56: lut_data <= {8'h78 ,16'h4300, 8'h6f};              
		10'd 57: lut_data <= {8'h78 ,16'h501f, 8'h01};              // RGB565
		10'd 58: lut_data <= {8'h78 ,16'h4713, 8'h03};              // ISP RGB 
		10'd 59: lut_data <= {8'h78 ,16'h4407, 8'h04};              
		10'd 60: lut_data <= {8'h78 ,16'h440e, 8'h00};               // Lenc on, raw gamma on, BPC on, WPC on, CIP on // AEC target    自动曝光控制
		10'd 61: lut_data <= {8'h78 ,16'h460b, 8'h35};              // stable range in high
		10'd 62: lut_data <= {8'h78 ,16'h460c, 8'h20};              // stable range in low
		10'd 63: lut_data <= {8'h78 ,16'h3824, 8'h01};              // stable range out high
		10'd 64: lut_data <= {8'h78 ,16'h5000, 8'h07};              // stable range out low
		10'd 65: lut_data <= {8'h78 ,16'h5001, 8'h03};              // fast zone high
		10'd 66: lut_data <= {8'h3f ,16'hffff,8'hff};               // fast zone low// Lens correction for ?   镜头补偿
		10'd 67: lut_data <= {8'h78 ,16'h3008, 8'h42};              
		10'd 68: lut_data <= {8'h78 ,16'h3035, 8'h21};              
		10'd 69: lut_data <= {8'h78 ,16'h3036, 8'h46};               
		10'd 70	: lut_data <= {8'h78 ,16'h3037, 8'h05};               
		10'd 71: lut_data <= {8'h78 ,16'h3108, 8'h11};               
		10'd 72: lut_data <= {8'h78 ,16'h3034, 8'h1A};               
//		10'd 73: lut_data <= {8'h78 ,16'h3800, (0 >> 8) & 8'h0F};   
//		10'd 74: lut_data <= {8'h78 ,16'h3801, 0 & 8'hFF};          
		10'd 73: lut_data <= {8'h78 ,16'h3802, 8'h00};   
		10'd 74: lut_data <= {8'h78 ,16'h3803, 8'h04};           
		10'd 75: lut_data <= {8'h78 ,16'h3804, 8'h0a}; 
		10'd 76: lut_data <= {8'h78 ,16'h3805, 8'h3f};        
		10'd 77: lut_data <= {8'h78 ,16'h3806, 8'h07}; 
		10'd 78: lut_data <= {8'h78 ,16'h3807, 8'h9f};        
		10'd 79: lut_data <= {8'h78 ,16'h3810, 8'h00};   
		10'd 80: lut_data <= {8'h78 ,16'h3811, 8'h00};          
		10'd 81: lut_data <= {8'h78 ,16'h3812, 8'h00};   
		10'd 82: lut_data <= {8'h78 ,16'h3813, 8'h04};           
		10'd 83: lut_data <= {8'h78 ,16'h3808, 8'h04};
		10'd 84: lut_data <= {8'h78 ,16'h3809, 8'h00};       
		10'd 85: lut_data <= {8'h78 ,16'h380a, 8'h03}; 
		10'd 86: lut_data <= {8'h78 ,16'h380b, 8'h00};         
		10'd 87: lut_data <= {8'h78 ,16'h380c, 8'h07};
		10'd 88: lut_data <= {8'h78 ,16'h380d, 8'h68};       
		10'd 89: lut_data <= {8'h78 ,16'h380e, 8'h03}; 
		10'd 90: lut_data <= {8'h78 ,16'h380f, 8'hd8};        
		10'd 91: lut_data <= {8'h78 ,16'h3814, 8'h31};              
		10'd 92: lut_data <= {8'h78 ,16'h3815, 8'h31};              
		10'd 93: lut_data <= {8'h78 ,16'h3821, 8'h01};              
		10'd 94: lut_data <= {8'h78 ,16'h4837, 8'd36}; // 1/56M*2   
		10'd 95: lut_data <= {8'h78 ,16'h3618, 8'h00};              
		10'd 96: lut_data <= {8'h78 ,16'h3612, 8'h59};              
		10'd 97: lut_data <= {8'h78 ,16'h3708, 8'h64};              
		10'd 98: lut_data <= {8'h78 ,16'h3709, 8'h52};              
        10'd 99: lut_data <= {8'h78 , 16'h370c, 8'h03};              
        10'd 100: lut_data <= {8'h78 , 16'h4300, 8'h00};              
        10'd 101: lut_data <= {8'h78 , 16'h501f, 8'h03};              
        10'd 102: lut_data <= {8'h78 , 16'h3406 ,8'h00};              
		10'd 103: lut_data <= {8'h78 , 16'h5192 ,8'h04};              
        10'd 104: lut_data <= {8'h78 , 16'h5191 ,8'hf8};              
        10'd 105: lut_data <= {8'h78 , 16'h518d ,8'h26};              
        10'd 106: lut_data <= {8'h78 , 16'h518f ,8'h42};              
        10'd 107: lut_data <= {8'h78 , 16'h518e ,8'h2b};              
        10'd 108: lut_data <= {8'h78 , 16'h5190 ,8'h42};              
        10'd 109: lut_data <= {8'h78 , 16'h518b ,8'hd0};              
        10'd 110: lut_data <= {8'h78 , 16'h518c ,8'hbd};              
        10'd 111: lut_data <= {8'h78 , 16'h5187 ,8'h18};              
        10'd 112: lut_data <= {8'h78 , 16'h5188 ,8'h18};              
        10'd 113: lut_data <= {8'h78 , 16'h5189 ,8'h56};              
        10'd 114: lut_data <= {8'h78 , 16'h518a ,8'h5c};              
        10'd 115: lut_data <= {8'h78 , 16'h5186 ,8'h1c};              
        10'd 116: lut_data <= {8'h78 , 16'h5181 ,8'h50};              
        10'd 117: lut_data <= {8'h78 , 16'h5184 ,8'h20};              
        10'd 118: lut_data <= {8'h78 , 16'h5182 ,8'h11};              
        10'd 119: lut_data <= {8'h78 , 16'h5183 ,8'h00};              
        10'd 120: lut_data <= {8'h78 , 16'h5001 ,8'h03};              
        10'd 121: lut_data <= {8'h78 , 16'h3008 ,8'h02};
        10'd 122: lut_data <= {8'hff , 16'hffff , 8'hff};
   		default : ;
     endcase
   end     
endmodule          