module debug #(parameter text_len = 20) (
  input clk,
  input greset,
  input text_req,
  output text_done,
  input [8*text_len-1:0] debug_text,
  output UART_TX);

  wire reset;

  reg [3:0]       text_cntr;

  reg             tx_req;
  reg [7:0]       tx_data;
  wire            tx_ready;

  sync_reset u_sync_reset(
          .clk(clk),
          .reset_in(greset),
          .reset_out(reset)
  );

  uart_tx u_uart_tx (
          .clk (clk),
          .reset (reset),
          .tx_req(tx_req),
          .tx_ready(tx_ready),
          .tx_data(tx_data),
          .uart_tx(UART_TX)
  );

  // Output the text
  always @(posedge clk) begin
     if (text_req && text_cntr == 0 && !tx_req) begin
       text_cntr <= text_len;
       text_done <= 1'b1;
     end

     if (text_cntr == text_len || (text_cntr > 0 && tx_ready)) begin
        tx_data = debug_text[(text_cntr-1)*8 +: 8]; 
        text_cntr <= text_cntr - 1;
        tx_req <= 1'b1;
     end else if (tx_ready) tx_req <= 1'b0;
  end

endmodule
