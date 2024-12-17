`timescale 1ns / 1ps


module tlc_fsm_tb;

// internal Regs/Wires
reg clock;
reg reset;

reg ew_vehicle_detected;

wire NS_RED;
wire NS_YELLOW;
wire NS_GREEN;
wire EW_RED;
wire EW_YELLOW;
wire EW_GREEN;

// gen Clock
always #5 clock = ~clock;

//Logic Block
initial begin

clock               = 0;
reset               = 1;
ew_vehicle_detected = 0 ;
#20 reset = 0 ;
#1000 ew_vehicle_detected = 1 ;
#500  ew_vehicle_detected = 0 ;  
#500  ew_vehicle_detected = 1 ;
#5000 ew_vehicle_detected = 0 ;

#5000 $stop;

end
 
// Instantiations
 tlc_fsm u_tlc_fsm(
         
         .i_clk        (clock),//clock
         .i_rst        (reset),//reset
         .i_ew_vd      ( ew_vehicle_detected)  ,  // East West Vehicle Detection status
         .o_ns_red     (NS_RED)    ,  //North-South Red
         . o_ns_yellow ( NS_YELLOW)    ,  //North South Yellow
         .o_ns_green   (NS_GREEN)    ,  //North-South Green
         .o_ew_red     (EW_RED)     , //East West Red
         .o_ew_yellow  ( EW_YELLOW)    ,  //East West Yellow
         .o_ew_green   (EW_GREEN)    //East West Green
    );
    
endmodule
