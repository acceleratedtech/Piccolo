.global _start
.global trapHandler
.global abort

.section .init
_start:     la t0, trapvec
            csrw mtvec, t0

            # top of register stack
            li t0, 0x90000000
            csrw mscratch, t0

            # top of stack
            li sp, 0x8F000000
            li a0, 0
            li a1, 0

            jal main

done:       wfi
            j done

abort:      la t0, abort_loop
            csrw mtvec, t0
            j abort_loop
.align 2
abort_loop: unimp

.align 2
trapvec:    csrrw x1, mscratch, x1
            addi x1, x1, -32*4
            sw  x0, 4* 0(x1)
            # sw  x1, 4* 1(x1)
            sw  x2, 4* 2(x1)
            sw  x3, 4* 3(x1)
            sw  x4, 4* 4(x1)
            sw  x5, 4* 5(x1)
            sw  x6, 4* 6(x1)
            sw  x7, 4* 7(x1)
            sw  x8, 4* 8(x1)
            sw  x9, 4* 9(x1)
            sw x10, 4*10(x1)
            sw x11, 4*11(x1)
            sw x12, 4*12(x1)
            sw x13, 4*13(x1)
            sw x14, 4*14(x1)
            sw x15, 4*15(x1)
            sw x16, 4*16(x1)
            sw x17, 4*17(x1)
            sw x18, 4*18(x1)
            sw x19, 4*19(x1)
            sw x20, 4*20(x1)
            sw x21, 4*21(x1)
            sw x22, 4*22(x1)
            sw x23, 4*23(x1)
            sw x24, 4*24(x1)
            sw x25, 4*25(x1)
            sw x26, 4*26(x1)
            sw x27, 4*27(x1)
            sw x28, 4*28(x1)
            sw x29, 4*29(x1)
            sw x30, 4*30(x1)
            sw x31, 4*31(x1)
            # get old x1 to save and replace it with new bottom of register stack
            csrrw t0, mscratch, x1
            sw t0, 4*2(x1)

            csrr a0, mcause
            csrr a1, mepc
            mv a2, x1
            # keep the same sp from the user program

            jal trapHandler

            csrw mepc, a0
            csrr x1, mscratch

            # restore registers
            lw  x0, 4* 0(x1)
            # lw  x1, 4* 1(x1)
            lw  x2, 4* 2(x1)
            lw  x3, 4* 3(x1)
            lw  x4, 4* 4(x1)
            lw  x5, 4* 5(x1)
            lw  x6, 4* 6(x1)
            lw  x7, 4* 7(x1)
            lw  x8, 4* 8(x1)
            lw  x9, 4* 9(x1)
            lw x10, 4*10(x1)
            lw x11, 4*11(x1)
            lw x12, 4*12(x1)
            lw x13, 4*13(x1)
            lw x14, 4*14(x1)
            lw x15, 4*15(x1)
            lw x16, 4*16(x1)
            lw x17, 4*17(x1)
            lw x18, 4*18(x1)
            lw x19, 4*19(x1)
            lw x20, 4*20(x1)
            lw x21, 4*21(x1)
            lw x22, 4*22(x1)
            lw x23, 4*23(x1)
            lw x24, 4*24(x1)
            lw x25, 4*25(x1)
            lw x26, 4*26(x1)
            lw x27, 4*27(x1)
            lw x28, 4*28(x1)
            lw x29, 4*29(x1)
            lw x30, 4*30(x1)
            lw x31, 4*31(x1)
            # restore old x1
            lw  x1, 4* 2(x1)

            mret
