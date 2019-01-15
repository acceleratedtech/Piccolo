//
// Generated by Bluespec Compiler, version 2017.07.A (build 1da80f1, 2017-07-21)
//
// On Thu Jan 10 22:17:53 EST 2019
//
//
// Ports:
// Name                         I/O  size props
// m_boot_rom_addr_size           O    64 const
// m_boot_rom_addr_base           O    64 const
// m_boot_rom_addr_lim            O    64 const
// m_tcm_addr_size                O    64 const
// m_tcm_addr_base                O    64 const
// m_tcm_addr_lim                 O    64 const
// m_mem0_controller_addr_size    O    64 const
// m_mem0_controller_addr_base    O    64 const
// m_mem0_controller_addr_lim     O    64 const
// m_uart0_addr_size              O    64 const
// m_uart0_addr_base              O    64 const
// m_uart0_addr_lim               O    64 const
// m_near_mem_io_addr_size        O    64 const
// m_near_mem_io_addr_base        O    64 const
// m_near_mem_io_addr_lim         O    64 const
// m_is_IO_addr                   O     1
// m_is_near_mem_IO_addr          O     1
// CLK                            I     1 unused
// RST_N                          I     1 unused
// m_is_IO_addr_addr              I    64
// m_is_near_mem_IO_addr_addr     I    64
//
// Combinational paths from inputs to outputs:
//   m_is_IO_addr_addr -> m_is_IO_addr
//   m_is_near_mem_IO_addr_addr -> m_is_near_mem_IO_addr
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkSoC_Map(CLK,
		 RST_N,

		 m_boot_rom_addr_size,

		 m_boot_rom_addr_base,

		 m_boot_rom_addr_lim,

		 m_tcm_addr_size,

		 m_tcm_addr_base,

		 m_tcm_addr_lim,

		 m_mem0_controller_addr_size,

		 m_mem0_controller_addr_base,

		 m_mem0_controller_addr_lim,

		 m_uart0_addr_size,

		 m_uart0_addr_base,

		 m_uart0_addr_lim,

		 m_near_mem_io_addr_size,

		 m_near_mem_io_addr_base,

		 m_near_mem_io_addr_lim,

		 m_is_IO_addr_addr,
		 m_is_IO_addr,

		 m_is_near_mem_IO_addr_addr,
		 m_is_near_mem_IO_addr);
  input  CLK;
  input  RST_N;

  // value method m_boot_rom_addr_size
  output [63 : 0] m_boot_rom_addr_size;

  // value method m_boot_rom_addr_base
  output [63 : 0] m_boot_rom_addr_base;

  // value method m_boot_rom_addr_lim
  output [63 : 0] m_boot_rom_addr_lim;

  // value method m_tcm_addr_size
  output [63 : 0] m_tcm_addr_size;

  // value method m_tcm_addr_base
  output [63 : 0] m_tcm_addr_base;

  // value method m_tcm_addr_lim
  output [63 : 0] m_tcm_addr_lim;

  // value method m_mem0_controller_addr_size
  output [63 : 0] m_mem0_controller_addr_size;

  // value method m_mem0_controller_addr_base
  output [63 : 0] m_mem0_controller_addr_base;

  // value method m_mem0_controller_addr_lim
  output [63 : 0] m_mem0_controller_addr_lim;

  // value method m_uart0_addr_size
  output [63 : 0] m_uart0_addr_size;

  // value method m_uart0_addr_base
  output [63 : 0] m_uart0_addr_base;

  // value method m_uart0_addr_lim
  output [63 : 0] m_uart0_addr_lim;

  // value method m_near_mem_io_addr_size
  output [63 : 0] m_near_mem_io_addr_size;

  // value method m_near_mem_io_addr_base
  output [63 : 0] m_near_mem_io_addr_base;

  // value method m_near_mem_io_addr_lim
  output [63 : 0] m_near_mem_io_addr_lim;

  // value method m_is_IO_addr
  input  [63 : 0] m_is_IO_addr_addr;
  output m_is_IO_addr;

  // value method m_is_near_mem_IO_addr
  input  [63 : 0] m_is_near_mem_IO_addr_addr;
  output m_is_near_mem_IO_addr;

  // signals for module outputs
  wire [63 : 0] m_boot_rom_addr_base,
		m_boot_rom_addr_lim,
		m_boot_rom_addr_size,
		m_mem0_controller_addr_base,
		m_mem0_controller_addr_lim,
		m_mem0_controller_addr_size,
		m_near_mem_io_addr_base,
		m_near_mem_io_addr_lim,
		m_near_mem_io_addr_size,
		m_tcm_addr_base,
		m_tcm_addr_lim,
		m_tcm_addr_size,
		m_uart0_addr_base,
		m_uart0_addr_lim,
		m_uart0_addr_size;
  wire m_is_IO_addr, m_is_near_mem_IO_addr;

  // value method m_boot_rom_addr_size
  assign m_boot_rom_addr_size = 64'h0000000000001000 ;

  // value method m_boot_rom_addr_base
  assign m_boot_rom_addr_base = 64'h0000000000001000 ;

  // value method m_boot_rom_addr_lim
  assign m_boot_rom_addr_lim = 64'd8192 ;

  // value method m_tcm_addr_size
  assign m_tcm_addr_size = 64'd0 ;

  // value method m_tcm_addr_base
  assign m_tcm_addr_base = 64'd0 ;

  // value method m_tcm_addr_lim
  assign m_tcm_addr_lim = 64'd0 ;

  // value method m_mem0_controller_addr_size
  assign m_mem0_controller_addr_size = 64'd268435456 ;

  // value method m_mem0_controller_addr_base
  assign m_mem0_controller_addr_base = 64'h0000000080000000 ;

  // value method m_mem0_controller_addr_lim
  assign m_mem0_controller_addr_lim = 64'h0000000090000000 ;

  // value method m_uart0_addr_size
  assign m_uart0_addr_size = 64'h0000000000000080 ;

  // value method m_uart0_addr_base
  assign m_uart0_addr_base = 64'h00000000C0000000 ;

  // value method m_uart0_addr_lim
  assign m_uart0_addr_lim = 64'h00000000C0000080 ;

  // value method m_near_mem_io_addr_size
  assign m_near_mem_io_addr_size = 64'h000000000000C000 ;

  // value method m_near_mem_io_addr_base
  assign m_near_mem_io_addr_base = 64'h0000000002000000 ;

  // value method m_near_mem_io_addr_lim
  assign m_near_mem_io_addr_lim = 64'd33603584 ;

  // value method m_is_IO_addr
  assign m_is_IO_addr =
	     m_is_IO_addr_addr >= 64'h00000000C0000000 &&
	     m_is_IO_addr_addr < 64'h00000000C0000080 ||
	     m_is_IO_addr_addr >= 64'h0000000002000000 &&
	     m_is_IO_addr_addr < 64'd33603584 ;

  // value method m_is_near_mem_IO_addr
  assign m_is_near_mem_IO_addr =
	     m_is_near_mem_IO_addr_addr >= 64'h0000000002000000 &&
	     m_is_near_mem_IO_addr_addr < 64'd33603584 ;
endmodule  // mkSoC_Map

