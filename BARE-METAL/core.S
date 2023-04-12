// These instructions define attributes of our chip and
// the assembly language we'll use:
.syntax unified
.cpu cortex-m7
.thumb

// Global memory locations.
.global vtable
.global reset_handler

/*
 * The actual vector table.
 * Only the size of RAM and 'reset' handler are
 * included, for simplicity.
 */
.type vtable, %object
vtable:
    .word _estack
    .word reset_handler
.size vtable, .-vtable

.type reset_handler, %function
reset_handler:
  LDR   r0, =_estack
  MOV   sp, r0

  LDR   r7, =0xDEADBEEF
  MOVS  r0, #0
  
main_loop:
  ADDS  r0, r0, #1
  B     main_loop

.size reset_handler, .-reset_handler 
