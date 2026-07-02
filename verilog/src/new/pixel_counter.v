`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/06/04 16:54:01
// Design Name: 
// Module Name: pixel_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pixel_counter(
    input aclk ,
    input aresetn ,
    
    input s_axis_tvalid ,
    input [39:0]s_axis_tdata ,
    input s_axis_tuser ,
    input s_axis_tlast ,
    output s_axis_tready ,
    
    output m_axis_tvalid ,
    output [39:0] m_axis_tdata ,
    output m_axis_tuser ,
    output m_axis_tlast ,
    input m_axis_tready ,
    
    output reg [31:0] hsync_cnt ,
    output reg [31:0] vsync_cnt ,
    output reg [31:0] tuser_cnt ,
    output reg flag
    );
    //localparam integer declarations
    
    //regs
    reg [31:0] counter ;
    //wires
    
    //main codes
    
    assign m_axis_tvalid = s_axis_tvalid ;
    assign m_axis_tdata = s_axis_tdata ;
    assign m_axis_tlast = s_axis_tlast ;
    assign m_axis_tuser = s_axis_tuser ;
    assign s_axis_tready = m_axis_tready ;
    
    always @ ( posedge aclk )
    begin 
     	if ( aresetn == 1'b0 )
     		hsync_cnt <= 32'd0 ;
     	else if ( s_axis_tvalid && s_axis_tready && s_axis_tlast ) 
     		hsync_cnt <= 32'd0 ;
     	else if ( s_axis_tvalid && s_axis_tready )
     		hsync_cnt <= hsync_cnt + 32'd1 ;
     		
     	if ( aresetn == 1'b0 )
     		vsync_cnt <= 32'd0 ;
     	else if ( s_axis_tvalid && s_axis_tready && s_axis_tuser )
     		vsync_cnt <= 32'd0 ;
     	else if ( s_axis_tvalid && s_axis_tready && s_axis_tlast )
     		vsync_cnt <= vsync_cnt + 32'd1 ;
     		
     	if ( aresetn == 1'b0 )
     		tuser_cnt <= 32'd0 ;
     	else if ( s_axis_tvalid && s_axis_tready && s_axis_tuser )
     		tuser_cnt <= tuser_cnt + 32'd1 ;	
     	else if ( flag == 1'b1 )
     		tuser_cnt <= 32'd0 ;	
     		
     	if ( aresetn == 1'b0 )
     		counter <= 32'd0 ;
     	else if ( counter == 32'd74_249_999 )
     		counter <= 32'd0 ;
     	else 
     		counter <= counter + 32'd1 ;
     			
     	if ( aresetn == 1'b0 )
     		flag <= 1'b0 ;
     	else if ( counter == 32'd74_249_999 )
     		flag <= 1'b1 ;
     	else 
     		flag <= 1'b0 ;			
    end
endmodule
