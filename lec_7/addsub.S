/* addsub.S */
.section .rodata
sPrompt: .string "Enter an integer value: "
sInputFmt: .string "%u"
sFmt: .string "Result is %u\n"

.section .data // section for global variables
val: .space 4 // refers to 4 bytes of memory storage

.section .text
	.globl main
main:
	subq $8, %rsp

	movq $sPrompt, %rdi
	call printf

	movq $sInputFmt, %rdi
	movq $val, %rsi // put the address of the global variable into the rsi
	// register
	call scanf // scanf will read an unsign integer and put the integer into
	// the memory location associated with the global variable

	addl $10, val // increasing the current value stored in val by 10 
	subl $2, val

	movq $sFmt, %rdi
	movl val, %esi
	call printf

	addq $8, %rsp

	ret
