module half_adder(
  input a,b,
  output sum, c_out
);
  
  xor(sum,a,b);
  and(c_out,a,b);
  
endmodule

module full_adder(
	input a, b, c_in;
  	output sum, c_out;
);
  
  wire c_out1, sum1, c_out2;
  
  half_adder U1 ( sum_1, c_out_1, a, b );
  half_adder U2 ( sum, c_out_2, sum_1, c_in );
  or         U3 ( c_out, c_out_1, c_out_2 );
  
endmodule

module decoder(num_1, num_2);
  reg [3:0] num_1, num_2,dados;
  integer status, arquivo_bin;
  reg [3:0] codigo_op;
  reg [3:0] linha;
  reg [3:0] resultado;
  
  
  arquivo_bin =  $fopen(binario.txt, rb);
  
  always @(*) begin
       case(codigo_op)
         4'b1111: resultado = num_1 + num_2;
         4'b0000: resultado = num_1 - num_2;
         default: result = 16'b0;
       endcase
     end
  
  while(!$eof(arquivo_bin)) begin
    
    status = $fgets(linha, arquivo_bin);
    if(status) begin
      %sscanf(linha, "%b", codigo_op);
    end
    
    status = $fgets(linha, arquivo_bin);
    if(status) begin
      %sscanf(linha, "%b", num_1);
    end
    
    status = $fgets(linha, arquivo_bin);
    if(status) begin
      %sscaf(linha, "%b", num_2);
    end
    
  end
  
  $fclose(arquivo_bin);
  $finish;
  
endmodule
