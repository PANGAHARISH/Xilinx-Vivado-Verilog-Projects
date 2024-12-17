`timescale 1ns / 1ps


module seq_1010(
    // Global Singals
    input  i_clock,
    input  i_reset,
    
    // Btn
    input i_btn,
    // LED
    output o_led
     );
    
    
 // Local Parameters
 localparam [2:0]  S0 = 0,S1 = 1,S2 = 2,S3 = 3,S4 = 4;
 // Internal Regs or wire declarations
 reg [2:0] state,next_state;
 
 //Reset Condition
 
 always @(posedge i_clock) begin 
 
      if(i_reset)
          state <= 3'b000  ;
      else
          state <= next_state  ;
 end
 
 always@(*) begin
   // store the state
   next_state = state;
   
   // State Machine
   
    case(state)
        S0: next_state <= i_btn ? S1 : S0;
        S1: next_state <= i_btn ? S1 : S2;
        S2: next_state <= i_btn ? S3 : S0;
        S3: next_state <= i_btn ? S1 : S4;
        //S4: next_state <= i_btn ? S1 : S0;  //Non Overlapping
      S4 : next_state <= i_btn ? S3 : S0 ; // Overlapping
endcase

 end
 
 assign o_led = (state == S4 ) ? 1 : 0 ;

endmodule
