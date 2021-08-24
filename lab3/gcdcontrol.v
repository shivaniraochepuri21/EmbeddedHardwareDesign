//state machine is asynchronous
//meeley machine --- output changes with inputs as well as with current state
module gcdcontrol(clk,rst,go,a_gt_b,a_eq_b,a_lt_b,a_ld,b_ld,a_sel,b_sel,output_en,done);

input clk,rst,go;
input a_gt_b, a_eq_b, a_lt_b;
output reg a_ld, b_ld, a_sel, b_sel,done,output_en;

reg [2:0] state, nstate;
//that is 3 filpflops
parameter s0 = 3'b000;
parameter s1 = 3'b001;
parameter s2 = 3'b010;
parameter s3 = 3'b011;
parameter s4 = 3'b100;
parameter s5 = 3'b101;
parameter s6 = 3'b110;
parameter s7 = 3'b111;

 //state register

always@(rst or posedge clk)
begin
	if(rst==1)
		state <= s0;
	else
		state <= nstate;
end
//input and next state logic ---> inputs are coming from datapath except state
always @(go or a_gt_b or a_eq_b or a_lt_b or state)
//change in the sensitivity list changes nstate 
begin
	case(state)
	// s0 --- state machine is on
	s0: if(go == 0) nstate <= s0;
		else nstate <= s1;
	s1: nstate <= s2;
	s2: nstate <= s3;
	s3: if(a_gt_b == 1) nstate <= s4;
	    else if(a_lt_b == 1) nstate <= s5;
            else nstate <= s7;
	s4: nstate <= s6;
	s5: nstate <= s6;
	s6: nstate <= s3;
	s7: nstate <= s0;
	default: nstate <= s0;

	endcase
end

//output logic --

always @(go or a_gt_b or a_eq_b or a_lt_b or state)
begin
	case(state)
	// s0 --- state machine is on
	s0: begin
	    a_ld <= 0;
	    b_ld <= 0;
            a_sel <= 0;
	    b_sel <= 0;
	    done <= 1;
	    output_en <= 0;
	    end	
	s1: begin 
	    a_sel <= 1;
	    b_sel <= 1;
	    a_ld <= 1;
	    b_ld <= 1;
            done <= 0;
	    output_en <= 0;end
	s2: begin a_ld <= 0;
	    b_ld <= 0;
            a_sel <= 0;
	    b_sel <= 0;
	    done <= 0;
	    output_en <= 0;end
	s3: begin a_ld <= 0;
	    b_ld <= 0;
            a_sel <= 0;
	    b_sel <= 0;
	    done <= 0;
	    output_en <= 0; end
	s4: begin 
	    a_sel <= 0;
	    b_sel <= 0;
	    a_ld <= 1; // a>b to write a = a-b
	    b_ld <= 0;
            done <= 0;
	    output_en <= 0; end
	s5: begin 
            a_sel <= 0;
	    b_sel <= 0;
	    a_ld <= 0;//a<b 
	    b_ld <= 1;
            done <= 0;
	    output_en <= 0; end
	s6: begin 
       	    a_sel <= 0;
	    b_sel <= 0;
	    a_ld <= 0;
	    b_ld <= 0;
            done <= 0;
	    output_en <= 0; end
	s7: begin 
            a_sel <= 0;
	    b_sel <= 0;
            a_ld <= 0;// a=b
	    b_ld <= 0;
	    done <= 1;//done computing gcd
	    output_en <= 1; end
	default: begin
            a_sel <= 0;
	    b_sel <= 0;
	    a_ld <= 0;
	    b_ld <= 0;
	    done <= 0;
	    output_en <= 0;
	    end
	endcase

end
endmodule
