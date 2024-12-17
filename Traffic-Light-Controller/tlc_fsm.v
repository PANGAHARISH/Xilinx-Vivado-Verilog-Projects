`timescale 1ns / 1ps

module tlc_fsm(
     // Global Signals
     input wire i_clk            ,  //Clock
     input wire i_rst            ,  //Reset
     
     //Inputs
     input wire i_ew_vd          ,  // East West Vehicle Detection status
     
     //Outputs
         output wire o_ns_red    ,  //North-South Red
         output wire o_ns_yellow ,  //North South Yellow
         output wire o_ns_green  ,  //North-South Green
         output wire o_ew_red    ,  //East West Red
         output wire o_ew_yellow ,  //East West Yellow
         output wire o_ew_green    //East West Green
    );
    
    // State Declaration
    localparam NS_GREEN = 0,
               YELLOW   = 1,
               EW_GREEN = 2;
    // internal Regs/Wires           
    reg ns_to_ew                   ;
    reg [9:0] counter              ;
    reg [1:0] state,next_state     ;
    reg ns_red     ,next_ns_red    ;
    reg ns_yellow  ,next_ns_yellow ;
    reg ns_green   ,next_ns_green  ;
    reg ew_red     ,next_ew_red    ;
    reg ew_yellow  ,next_ew_yellow ;
    reg ew_green   ,next_ew_green  ;
    
    
    
    
    //Update State
    always@(posedge i_clk) begin
    
        if(i_rst) begin
             ns_red     <=  1'b0       ;
             ns_yellow  <=  1'b0       ;
             ns_green   <=  1'b1       ;
             ew_red     <=  1'b1       ;
             ew_yellow  <=  1'b0       ;
             ew_green   <=  1'b0       ;
             state      <=  NS_GREEN   ;
            
            
    
        end else begin
             ns_red     <=  next_ns_red      ;
             ns_yellow  <=  next_ns_yellow   ;
             ns_green   <=  next_ns_green    ;
             ew_red     <=  next_ew_red      ;
             ew_yellow  <=  next_ew_yellow   ;
             ew_green   <=  next_ew_green    ;
             state      <=  next_state        ;
           
        
        end
        // Counter Logic
        // RESET    ||   state change NS -EW   || state change EW=NS
        
       if(i_rst ||  (counter >  25 && i_ew_vd && state == NS_GREEN ) || (counter ==  4 && state == YELLOW) || (counter >= 25 && state ==  EW_GREEN && ~ns_to_ew))
         counter <= 1'b0;
       //  else if
         
         else
            counter <= counter+1;
        
        end
    
    // State Machine Logic
    
     always@(*) begin
       // Store to memory
             next_ns_red     =  ns_red      ;
             next_ns_yellow  =  ns_yellow   ;
             next_ns_green   =  ns_green    ;
             next_ew_red     =  ew_red      ;
             next_ew_yellow  =  ew_yellow   ;
             next_ew_green   =  ew_green    ;
             next_state      =  state       ;
             //FSM
           case(state)
             NS_GREEN : begin
                if ( counter >  25 && i_ew_vd) begin
                   next_state   = YELLOW      ;
                   ns_to_ew     = 1'b1        ;
                 end  else begin
                     ns_red     =  1'b0       ;
                     ns_yellow  =  1'b0       ;
                     ns_green   =  1'b1       ;
                     ew_red     =  1'b1       ;
                     ew_yellow  =  1'b0       ;
                     ew_green   =  1'b0       ;
                     
                  end
             
             end
             YELLOW   : begin
                    if ( counter    == 4) begin
                       if(  ns_to_ew )
                       next_state   = EW_GREEN      ;
                       else
                       next_state   = NS_GREEN    ;
                     end  else begin
                         ns_red     =  1'b0       ;
                         ns_yellow  =  1'b1       ;
                         ns_green   =  1'b0       ;
                         ew_red     =  1'b0       ;
                         ew_yellow  =  1'b1       ;
                         ew_green   =  1'b0       ;
                         
                      end
                 
                 end
             
             EW_GREEN :  begin
                if ( counter >=  25 || ~i_ew_vd) begin
                   next_state   = YELLOW      ;
                   ns_to_ew     = 1'b0        ;
                 end  else begin
                     ns_red     =  1'b1       ;
                     ns_yellow  =  1'b0       ;
                     ns_green   =  1'b0       ;
                     ew_red     =  1'b0       ;
                     ew_yellow  =  1'b0       ;
                     ew_green   =  1'b1       ;
             end
             
             end
             default  : begin
                     ns_red     =  1'b0       ;
                     ns_yellow  =  1'b0       ;
                     ns_green   =  1'b1       ;
                     ew_red     =  1'b1       ;
                     ew_yellow  =  1'b0       ;
                     ew_green   =  1'b0       ;
                     
              end
             
         endcase
   
    end
    
 assign o_ns_red = ns_red       ;
 assign o_ns_yellow = ns_yellow ;
 assign o_ns_green = ns_green   ;
 assign o_ew_red = ew_red       ;
 assign o_ew_yellow = ew_yellow ;
 assign o_ew_green = ew_green    ;
 assign o_ew_green = ew_green    ;
 
 
 
    
    
endmodule












