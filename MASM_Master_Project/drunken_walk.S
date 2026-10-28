.code32
.global main
.type main, @function

# make a structure COORD with fields x and y on 4 bytes each
.struct 0
COORD:
COORD.x:
	.space 4
COORD.y:
	.space 4
COORD_size = . - COORD

; initialized data
.data
fmt:
	.string "x: %d, y: %d\n"

; uninitialized data
.bss
	# create an instantiation array of 10 coord items
	.lcomm array, COORD_size * 10

; the main code
.text
main:
	push %ebp
	mov %esp, %ebp

	push %ebx
	push %esi

	# seed random number gen
	# time() + srand() seeds random numbers
	push $0
	call time
	add $4, %esp
	push %eax
	call srand
	add $4, %esp

	# fill the array with 10 random coord items

	# resets the index counter
	mov $0, %esi

	# resets the pointer to the start of the array
	mov $array, %ebx

fill_loop:
	cmp $10, %esi
	jge print_start

	# calls rand() for x
	# returns a random integer in eax
	call rand
	mov %eax, COORD.x(%ebx)

	# calls rand() for y
	call rand
	mov %eax, COORD.y(%ebx)

	# moves pointer to next cord item in array
	add $COORD_size, %ebx
	inc %esi
	jmp fill_loop

print_start:
	# goes through the array and prints x and y for each item with printf
	# resets the index counter
	mov $0, %esi

	# resets the pointer to the start of the array
	mov $array, %ebx

print_loop:
	cmp $10, %esi
	jge done

	# push the arguments for printf
	push COORD.y(%ebx)
	push COORD.x(%ebx)
	push $fmt
	call printf
	add $12, %esp

	# move pointer to the next coord item
	add $COORD_size, %ebx
	inc %esi
	jmp print_loop

done:
	# returns 0
	mov $0, %eax

	pop %esi
	pop %ebx
	mov %esp, %ebp
	pop %ebp

	ret

# this tells the gnu assembler to mark the stack as non executable
.section .note.GNU-stack, "", @progbits