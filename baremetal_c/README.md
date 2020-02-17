# Baremetal C Example

This is an example program written in bare metal C.
This program currently does some simple tag loads and stores and is designed to be modified to test the processor's tagging implementation further.

There are three main source files in this example:
- `crt0.s` - Assembly file containing the startup code and low level trap handling code.
- `util.c` - C file containing a trap handler and some print functions (including a simple printf).
- `main.c` - C file containing the main program.
