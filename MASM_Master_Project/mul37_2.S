.code32
.global _start
.bss
.comm a,200
.text

_start:

	# In next cycle we initialize the array of words "a"
	mov $0,%ecx
cycle1:
	movw %cx,a(,%ecx,2) # index scaled by 2, to address words

	#TODO Task 1C

	pushl %ecx
	pushw a(,%ecx, 2)
	pushl %ecx
	pushl $L_Format
	call printf
	add $10, %esp
	popl %ecx

	# ------------------

	inc %ecx
	cmpl $100,%ecx
	jb cycle1

	# Next we call the procedure mul37
	call mul37

mul37_end:
	mov %eax, %ebx
	mov $1, %eax
	int $0x80

# Here follows the body of procedure mul37
mul37:
# general idea... to move 16 bit data make sure to use movw ax rather than mov eax ;)
#TODO init ecx to 0

	mov $0, %ecx

cyclemul:

	#TODO start by uncommenting end of this line to get the crt elem from a # movw a(,%ecx,2), %ax

	movw a(,%ecx,2), %ax

	# ... as per the next lines, implement a[i] = a[i]<<5 + a[i]<<2+a[i]
	#TODO do it by first moving %ax in some register <reg> like %bx or %dx

	movw %ax, %bx

	#TODO then first shift that <reg> by 2 (to multiply with 2^2=4) with shl $2,<reg>

	shlw $2, %bx

	#TODO add the result in <reg> to %ax

	addw %bx, %ax

	#TODO shift <reg> with an additional 3 positions (to multiply with 2^3=8, for a total multiplication with 4*8=32)

	shlw $3, %bx

	#TODO save %ax back  in a

	addw %bx, %ax
	movw %ax, a(,%ecx,2)


	# Task 1B

	pushl %ecx
	pushw a(,%ecx, 2)
	pushl %ecx
	pushl $L_Format
	call printf
	add $10, %esp
	popl %ecx

	# ------------------


	#TODO increment %ecx to go to the next element in array "a"

	inc %ecx

	#TODO cmp $100,... #compare the ecx with 100

	cmpl $100, %ecx

	#TODO jb ... # if ecx below 100, jump back to cyclemul to handle the next array element

	jb cyclemul

ret

#TODO Task 2
.data
L_Format:
	.asciz "idx %d:\t val %hd\n"