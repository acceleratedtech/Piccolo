REPO=..

CC=riscv64-linux-gnu-gcc
CFLAGS=-march=rv32imac -mabi=ilp32 -Wno-builtin-declaration-mismatch -fno-stack-protector

all: Mem.hex main.dump

Mem.hex: main $(REPO)/Tests/elf_to_hex/elf_to_hex
	$(REPO)/Tests/elf_to_hex/elf_to_hex main Mem.hex

main.dump: main
	riscv64-linux-gnu-objdump -d main > main.dump

$(REPO)/Tests/elf_to_hex/elf_to_hex:
	$(MAKE) -C $(REPO)/Tests/elf_to_hex

main: main.o util.o crt0.o piccolo.ld
	riscv64-linux-gnu-ld -march=rv32imac -melf32lriscv -T piccolo.ld -o main crt0.o main.o util.o

crt0.o: crt0.S
	riscv64-linux-gnu-as -march=rv32imac -mabi=ilp32 crt0.S -o crt0.o

main.o: main.c util.h tagging_macros.h

util.o: util.c util.h tagging_macros.h

.PHONY: clean
clean:
	rm -rf Mem.hex main.dump main *.o symbol_table.txt

