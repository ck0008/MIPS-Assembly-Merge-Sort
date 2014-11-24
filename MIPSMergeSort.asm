		.data		
ins0:		.asciiz 	"This program accepts 10 integers and performs a merge sort on them. \n"
ins1:		.asciiz 	"Please enter the first integer: \n"
ins2:		.asciiz 	"Please enter the second integer: \n"
ins3:		.asciiz 	"Please enter the third integer: \n"
ins4:		.asciiz 	"Please enter the fourth integer: \n"
ins5:		.asciiz 	"Please enter the fifth integer: \n"
ins6:		.asciiz 	"Please enter the sixth integer: \n"
ins7:		.asciiz 	"Please enter the seventh integer: \n"
ins8:		.asciiz 	"Please enter the eighth integer: \n"
ins9:		.asciiz 	"Please enter the ninth integer: \n"
ins10:		.asciiz 	"Please enter the tenth integer: \n"
space:		.asciiz		" "
newl:		.asciiz		" \n"

#----------------------------------------------------------------------

		.text		

             	.globl main	
main:			

	la $a0, ins0		# Print the base instruction message
	li $v0, 4
	syscall
				# Then, get all 10 ints from input:
	la $a0, ins1		# Print instruction for the first integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s0, $v0, $zero

	la $a0, ins2		# Print instruction for the second integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s1, $v0, $zero

	la $a0, ins3		# Print instruction for the third integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s2, $v0, $zero

	la $a0, ins4		# Print instruction for the fourth integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s3, $v0, $zero

	la $a0, ins5		# Print instruction for the fifth integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s4, $v0, $zero

	la $a0, ins6		# Print instruction for the sixth integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s5, $v0, $zero

	la $a0, ins7		# Print instruction for the seventh integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s6, $v0, $zero

	la $a0, ins8		# Print instruction for the eighth integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s7, $v0, $zero

	la $a0, ins9		# Print instruction for the ninth integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $s8, $v0, $zero

	la $a0, ins10		# Print instruction for the tenth integer
	li $v0, 4
	syscall

	li $v0, 5		# Recieve input and store in register
	syscall
	add $t0, $v0, $zero

	li $t1, 1		# Set t1 equal to 1 so program will know where to return to post-printing
	j printall

it1:				# Iteration 1-------------------------
	sub $t3, $s0, $s1
	blez $t3, it1b1		# branch if the first two numbers don't need to be switched
	add $t3, $s1, $zero
	add $s1, $s0, $zero
	add $s0, $t3, $zero

it1b1:
	sub $t3, $s2, $s3	# branch if the second group of two numbers don't need to be switched
	blez $t3, it1b2
	add $t3, $s3, $zero
	add $s3, $s2, $zero
	add $s2, $t3, $zero

it1b2:
	sub $t3, $s4, $s5	# branch if the third group of two numbers don't need to be switched
	blez $t3, it1b3
	add $t3, $s5, $zero
	add $s5, $s4, $zero
	add $s4, $t3, $zero

it1b3:
	sub $t3, $s6, $s7	# branch if the fourth group of two numbers don't need to be switched
	blez $t3, it1b4
	add $t3, $s7, $zero
	add $s7, $s6, $zero
	add $s6, $t3, $zero

it1b4:
	sub $t3, $s8, $t0	# branch if the fifth group of two numbers don't need to be switched
	blez $t3, it1b5
	add $t3, $t0, $zero
	add $t0, $s8, $zero
	add $s8, $t3, $zero

it1b5:
	li $t1, 2		# Print out current list
	j printall


it2:				# Iteration 2--------------------------------
	sub $t3, $s0, $s2	# begin ordering the first group of 4
	blez $t3, it2b1
	add $t3, $s2, $zero
	add $s2, $s0, $zero
	add $s0, $t3, $zero

it2b1:
	sub $t3, $s1, $s2
	blez $t3, it2b2
	add $t3, $s2, $zero
	add $s2, $s1, $zero
	add $s1, $t3, $zero

it2b2:
	sub $t3, $s0, $s3
	blez $t3, it2b3
	add $t3, $s3, $zero
	add $s3, $s0, $zero
	add $s0, $t3, $zero

it2b3:
	sub $t3, $s1, $s3
	blez $t3, it2b4
	add $t3, $s3, $zero
	add $s3, $s1, $zero
	add $s1, $t3, $zero
it2b4:
	sub $t3, $s2, $s3
	blez $t3, it2b5
	add $t3, $s3, $zero
	add $s3, $s2, $zero
	add $s2, $t3, $zero

it2b5:
	sub $t3, $s4, $s6	# begin ordering the second group of 4
	blez $t3, it2b6
	add $t3, $s6, $zero
	add $s6, $s4, $zero
	add $s4, $t3, $zero

it2b6:
	sub $t3, $s5, $s6
	blez $t3, it2b7
	add $t3, $s6, $zero
	add $s6, $s5, $zero
	add $s5, $t3, $zero

it2b7:
	sub $t3, $s4, $s7
	blez $t3, it2b8
	add $t3, $s7, $zero
	add $s7, $s4, $zero
	add $s4, $t3, $zero

it2b8:
	sub $t3, $s5, $s7
	blez $t3, it2b9
	add $t3, $s7, $zero
	add $s7, $s5, $zero
	add $s5, $t3, $zero

it2b9:
	sub $t3, $s6, $s7
	blez $t3, it2b10
	add $t3, $s7, $zero
	add $s7, $s6, $zero
	add $s6, $t3, $zero

it2b10:	

	li $t1, 3
	j printall

it3:
	sub $t3, $s0, $s4	# Begin ordering group of 8 integers
	blez $t3, it3b0		# Do this by adding second group to first, in order, one by one
	add $t3, $s4, $zero
	add $s4, $s0, $zero
	add $s0, $t3, $zero

it3b0:
	sub $t3, $s1, $s4
	blez $t3, it3b1
	add $t3, $s4, $zero
	add $s4, $s1, $zero
	add $s1, $t3, $zero

it3b1:
	sub $t3, $s2, $s4
	blez $t3, it3b2
	add $t3, $s4, $zero
	add $s4, $s2, $zero
	add $s2, $t3, $zero

it3b2:
	sub $t3, $s3, $s4
	blez $t3, it3b3
	add $t3, $s4, $zero
	add $s4, $s3, $zero
	add $s3, $t3, $zero

it3b3:
	sub $t3, $s0, $s5	# Second integer of second group of 4
	blez $t3, it3b4
	add $t3, $s5, $zero
	add $s5, $s0, $zero
	add $s0, $t3, $zero

it3b4:
	sub $t3, $s1, $s5
	blez $t3, it3b5
	add $t3, $s5, $zero
	add $s5, $s1, $zero
	add $s1, $t3, $zero

it3b5:
	sub $t3, $s2, $s5
	blez $t3, it3b6
	add $t3, $s5, $zero
	add $s5, $s2, $zero
	add $s2, $t3, $zero

it3b6:
	sub $t3, $s3, $s5
	blez $t3, it3b7
	add $t3, $s5, $zero
	add $s5, $s3, $zero
	add $s3, $t3, $zero

it3b7:
	sub $t3, $s4, $s5
	blez $t3, it3b8
	add $t3, $s5, $zero
	add $s5, $s4, $zero
	add $s4, $t3, $zero

it3b8:
	sub $t3, $s0, $s6	# Third integer of second group of 4
	blez $t3, it3b9
	add $t3, $s6, $zero
	add $s6, $s0, $zero
	add $s0, $t3, $zero
it3b9:
	sub $t3, $s1, $s6
	blez $t3, it3b10
	add $t3, $s6, $zero
	add $s6, $s1, $zero
	add $s1, $t3, $zero
it3b10:
	sub $t3, $s2, $s6
	blez $t3, it3b11
	add $t3, $s6, $zero
	add $s6, $s2, $zero
	add $s2, $t3, $zero

it3b11:
	sub $t3, $s3, $s6
	blez $t3, it3b12
	add $t3, $s6, $zero
	add $s6, $s3, $zero
	add $s3, $t3, $zero

it3b12:
	sub $t3, $s4, $s6
	blez $t3, it3b13
	add $t3, $s6, $zero
	add $s6, $s4, $zero
	add $s4, $t3, $zero

it3b13:
	sub $t3, $s5, $s6
	blez $t3, it3b14
	add $t3, $s6, $zero
	add $s6, $s5, $zero
	add $s5, $t3, $zero

it3b14:
	sub $t3, $s0, $s7	# Fourth integer of second group of 4
	blez $t3, it3b15
	add $t3, $s7, $zero
	add $s7, $s0, $zero
	add $s0, $t3, $zero

it3b15:
	sub $t3, $s1, $s7
	blez $t3, it3b16
	add $t3, $s7, $zero
	add $s7, $s1, $zero
	add $s1, $t3, $zero

it3b16:
	sub $t3, $s2, $s7
	blez $t3, it3b17
	add $t3, $s7, $zero
	add $s7, $s2, $zero
	add $s2, $t3, $zero

it3b17:
	sub $t3, $s3, $s7
	blez $t3, it3b18
	add $t3, $s7, $zero
	add $s7, $s3, $zero
	add $s3, $t3, $zero

it3b18:
	sub $t3, $s4, $s7
	blez $t3, it3b19
	add $t3, $s7, $zero
	add $s7, $s4, $zero
	add $s4, $t3, $zero

it3b19:
	sub $t3, $s5, $s7
	blez $t3, it3b20
	add $t3, $s7, $zero
	add $s7, $s5, $zero
	add $s5, $t3, $zero

it3b20:
	sub $t3, $s6, $s7
	blez $t3, it3b21
	add $t3, $s7, $zero
	add $s7, $s6, $zero
	add $s6, $t3, $zero

it3b21:
	li $t1, 4
	j printall

it4:				# Iteration 4--------------------

	sub $t3, $s0, $s8	# Begin sorting remaining two integers into full list of 10
	blez $t3, it4b0		# First integer
	add $t3, $s8, $zero
	add $s8, $s0, $zero
	add $s0, $t3, $zero

it4b0:
	sub $t3, $s1, $s8
	blez $t3, it4b1
	add $t3, $s8, $zero
	add $s8, $s1, $zero
	add $s1, $t3, $zero

it4b1:
	sub $t3, $s2, $s8
	blez $t3, it4b2
	add $t3, $s8, $zero
	add $s8, $s2, $zero
	add $s2, $t3, $zero
it4b2:
	sub $t3, $s3, $s8
	blez $t3, it4b3
	add $t3, $s8, $zero
	add $s8, $s3, $zero
	add $s3, $t3, $zero

it4b3:
	sub $t3, $s4, $s8
	blez $t3, it4b4
	add $t3, $s8, $zero
	add $s8, $s4, $zero
	add $s4, $t3, $zero

it4b4:
	sub $t3, $s5, $s8
	blez $t3, it4b5
	add $t3, $s8, $zero
	add $s8, $s5, $zero
	add $s5, $t3, $zero

it4b5:
	sub $t3, $s6, $s8
	blez $t3, it4b6
	add $t3, $s8, $zero
	add $s8, $s6, $zero
	add $s6, $t3, $zero

it4b6:
	sub $t3, $s7, $s8
	blez $t3, it4b7
	add $t3, $s8, $zero
	add $s8, $s7, $zero
	add $s7, $t3, $zero

it4b7:
	sub $t3, $s0, $t0	# Second integer
	blez $t3, it4b8
	add $t3, $t0, $zero
	add $t0, $s0, $zero
	add $s0, $t3, $zero

it4b8:
	sub $t3, $s1, $t0
	blez $t3, it4b9
	add $t3, $t0, $zero
	add $t0, $s1, $zero
	add $s1, $t3, $zero

it4b9:
	sub $t3, $s2, $t0
	blez $t3, it4b10
	add $t3, $t0, $zero
	add $t0, $s2, $zero
	add $s2, $t3, $zero

it4b10:
	sub $t3, $s3, $t0
	blez $t3, it4b11
	add $t3, $t0, $zero
	add $t0, $s3, $zero
	add $s3, $t3, $zero

it4b11:
	sub $t3, $s4, $t0
	blez $t3, it4b12
	add $t3, $t0, $zero
	add $t0, $s4, $zero
	add $s4, $t3, $zero

it4b12:
	sub $t3, $s5, $t0
	blez $t3, it4b13
	add $t3, $t0, $zero
	add $t0, $s5, $zero
	add $s5, $t3, $zero

it4b13:
	sub $t3, $s6, $t0
	blez $t3, it4b14
	add $t3, $t0, $zero
	add $t0, $s6, $zero
	add $s6, $t3, $zero

it4b14:
	sub $t3, $s7, $t0
	blez $t3, it4b15
	add $t3, $t0, $zero
	add $t0, $s7, $zero
	add $s7, $t3, $zero

it4b15:
	sub $t3, $s8, $t0
	blez $t3, it4b16
	add $t3, $t0, $zero
	add $t0, $s8, $zero
	add $s8, $t3, $zero
it4b16:				# List is fully sorted

	li $t2, 10		# Set t2 to 10 so printall won't pass control back into the program

printall:

	la $a0, newl		# New line for readability	
	li $v0, 4
	syscall

	add $a0, $s0, $zero	# Print all integers, separated by spaces
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s1, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s2, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s3, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s4, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s5, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s6, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s7, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $s8, $zero
	li $v0, 1
	syscall
	la $a0, space
	li $v0, 4
	syscall
	add $a0, $t0, $zero
	li $v0, 1
	syscall

	li $t2, 1		# Return to program before iteration 1
	sub $t1, $t1, $t2
	beq $t1, $zero, it1

	sub $t1, $t1, $t2	# Return to program before iteration 2
	beq $t1, $zero, it2

	sub $t1, $t1, $t2	# Return to program before iteration 3
	beq $t1, $zero, it3

	sub $t1, $t1, $t2	# Return to program before iteration 4
	beq $t1, $zero, it4

	li $v0, 10		# Terminate the Program
	syscall
