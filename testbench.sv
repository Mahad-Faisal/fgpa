module PID_Controller_tb;

    reg clk;
    reg reset;
    reg signed [15:0] setpoint;
    reg signed [15:0] process_variable;
    wire signed [15:0] control_output;

    // Internal signals for dumping
    wire signed [15:0] error;
    wire signed [15:0] integral;
    wire signed [15:0] derivative;
    wire signed [31:0] P_term;
    wire signed [31:0] I_term;
    wire signed [31:0] D_term;
    wire signed [31:0] PID_output;

    // Instantiate the PID controller
    PID_Controller uut (
        .clk(clk),
        .reset(reset),
        .setpoint(setpoint),
        .process_variable(process_variable),
        .control_output(control_output)
    );

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        setpoint = 16'd100;
        process_variable = 16'd0;

        // Dump VCD file
        $dumpfile("dump.vcd");
        $dumpvars(0, PID_Controller_tb);

        #5 reset = 0;

        #10 process_variable = 16'd50;
        #10 process_variable = 16'd75;
        #10 process_variable = 16'd100;
        #10 process_variable = 16'd125;
        #10 process_variable = 16'd150;

        #100 $finish;
    end

    always #5 clk = ~clk;

endmodule
