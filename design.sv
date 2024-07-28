module PID_Controller (
    input wire clk,
    input wire reset,
    input wire signed [15:0] setpoint,
    input wire signed [15:0] process_variable,
    output reg signed [15:0] control_output,
    output wire signed [15:0] error,
    output wire signed [15:0] integral,
    output wire signed [15:0] derivative,
    output wire signed [31:0] P_term,
    output wire signed [31:0] I_term,
    output wire signed [31:0] D_term,
    output wire signed [31:0] PID_output
);

    // PID coefficients
    parameter signed [15:0] Kp = 16'h1000; // Proportional gain
    parameter signed [15:0] Ki = 16'h0100; // Integral gain
    parameter signed [15:0] Kd = 16'h0800; // Derivative gain

    // State variables
    reg signed [15:0] integral_reg;
    reg signed [15:0] prev_error;
    reg signed [15:0] error_reg;
    reg signed [31:0] P_term_reg;
    reg signed [31:0] I_term_reg;
    reg signed [15:0] derivative_reg;
    reg signed [31:0] D_term_reg;
    reg signed [31:0] PID_output_reg;

    assign error = error_reg;
    assign integral = integral_reg;
    assign derivative = derivative_reg;
    assign P_term = P_term_reg;
    assign I_term = I_term_reg;
    assign D_term = D_term_reg;
    assign PID_output = PID_output_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            integral_reg <= 16'd0;
            prev_error <= 16'd0;
            control_output <= 16'd0;
        end else begin
            // Calculate error
            error_reg <= setpoint - process_variable;
            
            // Proportional term
            P_term_reg <= Kp * error_reg;
            
            // Integral term
            integral_reg <= integral_reg + error_reg;
            I_term_reg <= Ki * integral_reg;
            
            // Derivative term
            derivative_reg <= error_reg - prev_error;
            D_term_reg <= Kd * derivative_reg;
            
            // PID output
            PID_output_reg <= P_term_reg + I_term_reg + D_term_reg;
            
            // Update control output
            control_output <= PID_output_reg[15:0];
            
            // Update previous error
            prev_error <= error_reg;
        end
    end
endmodule
