	.file	"main1.c"
	.text
	.section	.rodata
.LC0:
	.string	"str: %p  pos: %p %c \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movabsq	$6061958822353859667, %rax
	movq	%rax, -22(%rbp)
	movl	$1702130533, -14(%rbp)
	movw	$100, -10(%rbp)
	leaq	-22(%rbp), %rdx
#APP
# 8 "main1.c" 1
	cld 
	movq %rdx, %rdi 
	movq $14, %rcx 
	movb $'T', %al 
	repne scasb 
	decq %rdi 
	movq %rdi, %rdx
# 0 "" 2
#NO_APP
	movq	%rdx, -32(%rbp)
	movq	-32(%rbp), %rax
	movzbl	(%rax), %eax
	movsbl	%al, %ecx
	movq	-32(%rbp), %rdx
	leaq	-22(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L3
	call	__stack_chk_fail@PLT
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04.3) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
