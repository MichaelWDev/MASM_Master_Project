.code32
.global _start
_start:
mov $0x25, %al
sub $0x27, %al
call myDAS
mov %eax, %ebx
mov $1, %eax
int $0x80
myDAS:
	# ... save/initialize registers
	# follow explanations given below the code template to see how you save flags and AL
	pushf
	popw %cx

	I1:  # test condition AL low nibble, or auxiliary carry
		# with conditional jumps on "then" branch to T1, and on "else" to E1

		movb %al, %bl
		andb $0x0f, %bl
		cmpb $9, %bl
		ja T1

		testb $0x10, %cl
		jnz T1

		jmp E1

	T1:  # on then condition 1

		subb $6, %al
		orb $0x10, %cl
		jmp I2


	E1:  # on else condition 1

		andb $0x0f, %cl


	I2:  # test condition high nibble, or carry flag
		# with conditional jumps on "then" branch to T2, and on "else" to E2

		cmpb $0x9f, %al
		ja T2

		testb $0x01, %cl
		jnz T2

		jmp E2


	T2:  # on then condition 2

		subb $0x60, %al
		orb $0x01, %cl

		jmp done


	E2:  # on else condition 2

		andb $0xfe, %cl


	done:
	# ... restore al, flags and used registers

		pushw %cx
		popf


	ret