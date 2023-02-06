/* hello.S */

.section .rodata

sHelloMsg: .string "Hello, world\n"

.section .text // code goes in .text section

	.globl main // make 'main' visible to other modules
main:
	subq $8, %rsp // decrementing rsp register by 8 to align the stack pointer
	movl $0, %eax // putting number 0 in eax register
	// allowing printf to pass in arbitrary number of argument
	// eax stores the number of vector argument
	movq $sHelloMsg, %rdi // passing an argument to printf
	// rdi: first argument register
	// '$' before the label --> immediate value passing the pointer of 
	// the constant instead of the alue
	call printf

	addq $8, %rsp  // restore stack pointer
	ret // returns from a function call

	// gcc -c -no-pie -o hello.o hellp.S
	// gcc -no-pie -o hello hello.o
	// ./hello
