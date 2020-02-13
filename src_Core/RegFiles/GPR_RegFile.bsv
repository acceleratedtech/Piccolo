// Copyright (c) 2016-2019 Bluespec, Inc. All Rights Reserved

package GPR_RegFile;

// ================================================================
// GPR (General Purpose Register) Register File

// ================================================================
// Exports

export GPR_RegFile_IFC (..), mkGPR_RegFile, RegValue (..);

// ================================================================
// BSV library imports

import ConfigReg    :: *;
import RegFile      :: *;
import FIFOF        :: *;
import GetPut       :: *;
import ClientServer :: *;
import DefaultValue :: *;
// BSV additional libs

import GetPut_Aux :: *;

// ================================================================
// Project imports

import ISA_Decls  :: *;
import TagMonitor :: *;

// ================================================================

typedef struct {
   Word data;
   TagT tag;
} RegValue deriving (Bits,Eq, FShow);

instance Literal#(RegValue);
   function RegValue fromInteger(Integer x);
      return RegValue { data: fromInteger(x), tag: defaultValue };
   endfunction
   function Bool inLiteralRange(RegValue target, Integer x);
      return inLiteralRange(target.data, x);
   endfunction
endinstance

interface GPR_RegFile_IFC;
   // Reset
   interface Server #(Token, Token) server_reset;

   // GPR read
   (* always_ready *)
   method RegValue read_rs1 (RegName rs1);
   (* always_ready *)
   method RegValue read_rs1_port2 (RegName rs1);    // For debugger access only
   (* always_ready *)
   method RegValue read_rs2 (RegName rs2);

   // GPR write
   (* always_ready *)
   method Action write_rd (RegName rd, RegValue rd_val, Bool write_tag_only);

endinterface

// ================================================================
// Major states of mkGPR_RegFile module

typedef enum { RF_RESET_START, RF_RESETTING, RF_RUNNING } RF_State
deriving (Eq, Bits, FShow);

// ================================================================

(* synthesize *)
module mkGPR_RegFile (GPR_RegFile_IFC);

   Reg #(RF_State) rg_state      <- mkReg (RF_RESET_START);

   // Reset
   FIFOF #(Token) f_reset_rsps <- mkFIFOF;

   // General Purpose Registers
   // TODO: can we use Reg [0] for some other purpose?
   RegFile #(RegName, Word) regfile_data <- mkRegFileFull;
   RegFile #(RegName, TagT) regfile_tag <- mkRegFileFull;

   // ----------------------------------------------------------------
   // Reset.
   // This loop initializes all GPRs to 0.
   // The spec does not require this, but it's useful for debugging
   // and tandem verification

`ifdef INCLUDE_TANDEM_VERIF
   Reg #(RegName) rg_j <- mkRegU;    // reset loop index
`endif

   rule rl_reset_start (rg_state == RF_RESET_START);
      rg_state <= RF_RESETTING;
`ifdef INCLUDE_TANDEM_VERIF
      rg_j <= 1;
`endif
   endrule

   rule rl_reset_loop (rg_state == RF_RESETTING);
`ifdef INCLUDE_TANDEM_VERIF
      regfile_data.upd (rg_j, 0);
      regfile_tag.upd (rg_j, defaultValue);
      rg_j <= rg_j + 1;
      if (rg_j == 31)
	 rg_state <= RF_RUNNING;
`else
      rg_state <= RF_RUNNING;
`endif
   endrule

   // ----------------------------------------------------------------
   // INTERFACE

   // Reset
   interface Server server_reset;
      interface Put request;
	 method Action put (Token token);
	    rg_state <= RF_RESET_START;

	    // This response is placed here, and not in rl_reset_loop, because
	    // reset_loop can happen on power-up, where no response is expected.
	    f_reset_rsps.enq (?);
	 endmethod
      endinterface
      interface Get response;
	 method ActionValue #(Token) get if (rg_state == RF_RUNNING);
	    let token <- pop (f_reset_rsps);
	    return token;
	 endmethod
      endinterface
   endinterface

   // GPR read
   method RegValue read_rs1 (RegName rs1);
      return ((rs1 == 0) ? 0 : RegValue{data: regfile_data.sub (rs1), tag: regfile_tag.sub (rs1)});
   endmethod

   // GPR read
   method RegValue read_rs1_port2 (RegName rs1);        // For debugger access only
      return ((rs1 == 0) ? 0 : RegValue{data: regfile_data.sub (rs1), tag: regfile_tag.sub (rs1)});
   endmethod

   method RegValue read_rs2 (RegName rs2);
      return ((rs2 == 0) ? 0 : RegValue{data: regfile_data.sub (rs2), tag: regfile_tag.sub (rs2)});
   endmethod

   // GPR write
   method Action write_rd (RegName rd, RegValue rd_val, Bool write_tag_only);
       if (rd != 0) begin
           let old_data = regfile_data.sub(rd);
           if (!write_tag_only) begin
               regfile_data.upd (rd, rd_val.data);
           end
	   else begin
               $display("Loading register", fshow(rd), " data ", fshow(rd_val.data), " tag ", fshow(rd_val.tag), " old data ", fshow(old_data));
           end
           regfile_tag.upd (rd, rd_val.tag);
       end
   endmethod

endmodule

// ================================================================

endpackage
