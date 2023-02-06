/* leaq_example.S */
// lea can be any integer computations of the form p + (qS) + r where
 // S is 0, 1, 2, 4, 8
.section .rodata
sFmt: .string "Result is: %lu\n"

.section .text
	.globl main
main:
	subq $8, %rsp
	movl $0, %eax
	movq $sFmt, %rdi
	movq $1000, %r10
	movq $3, %r11
	leaq 15(%r10,%r11,8), %rsi
	//     (base address, index, scaling factor--> sizes of the hardware
	// support machine datatype)
	// 1000 + 3*8 + 15
	call printf
	addq $8, %rsp
	ret
