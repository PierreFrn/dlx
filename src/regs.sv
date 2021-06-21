module regs(input  logic clk,
            input  logic reset_n,
            input  logic WB,
            input  logic reg_s_enable,
      // Numéros des registres
            input  logic [4:0]  Rs1,
            input  logic [4:0]  Rs2,
            input  logic [4:0]  Rd,

            input  logic [31:0] reg_s,
            output logic [31:0] S1,
            output logic [31:0] S2);

      logic [31:0] regs[31:0];

      always@(posedge clk)
        if(negedge reset_n)
          regs[31:0] <= '0[31:0];
        else
          if(WB)
            begin
              S1 <= regs[Rs1];
              S2 <= regs[Rs2];
              if(reg_s_enable and Rd != 0)
                regs[Rd] <= reg_s;
            end
            