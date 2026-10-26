.code32
.global _start
.bss
.comm a,100
.text
_start:

	# initialize the cycle
	mov $0,%ecx
cycle1:
	movb $3,a(,%ecx,1)
	inc %ecx
	cmpl $100,%ecx
	jb cycle1

end_cycle1:

	call bmul32

	mov %eax, %ebx
	mov $1, %eax
	int $0x80

# the bmul32 procedure multiplies array "a" with 32 (shifting it by 5) from the big endian
bmul32:
	mov $48, %ecx               # 48*2+2=98, the last index of a word
cycle2:
	# the register %ax is used for intermediary results
	movw a(,%ecx,2), %ax        # shld only works on 2 bytes at once
	shldw $5, %ax, a+2(,%ecx,2) # shift a(ecx*2+2) by 5 with fill from %ax

	# TODO decrement ecx # dec %ecx
	dec %ecx

	# TODO compare with 0 with cmp $0, %ecx
	cmpl $0, %ecx

	# TODO cycle (on greater or equal >=0) to cycle2 with #jge cycle2
	jge cycle2

	shlw $5, a                  # the last, least significant word, is just shifted

end_cycle2:
ret