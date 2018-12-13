.text


	
	
	

#syscall
loopPrompt:
	jal genSpell
	loopInput: 
		li $v0, 12 #$v0 has first character
		syscall
		beq $v0, 0x72, invoke	#input = 'r'
		beq $v0, 0x78, exit	#input = 'x'
		bne $v0, 0x71, notQuas
		jal addElement
		notQuas:
		bne $v0, 0x77, notWex
		jal addElement
		notWex:
		bne $v0, 0x65, notExort
		jal addElement
		notExort:
		jal printElements
		b loopInput

invoke:
	li $v0, 4
	beqz $t0, notEnough
	beqz $t1, notEnough
	beqz $t2, notEnough
	
	jal sortElements
	beq $v1, $t4, same
	
	la $a0, fail
	syscall
	b loopPrompt
	same:
		la $a0, success
		syscall
		b loopPrompt
	notEnough:
		la $a0, notEnoughOrbs
		syscall
		b loopInput
##get random spell

#OUTPUT
#$v1 = string of correct combination

#prints the randomly chosen spell
genSpell:
	sub $sp, $sp, 4
	sw $ra, ($sp)
	jal printNewLine
	lw $ra, ($sp)
	addi $sp, $sp, 4
	li $a1, 9
	li $v0, 42
	syscall
	li $v0, 4 
	
	bne $a0, $0, next1
	la $a0, coldSnap
	li $v1, 0x717171	#'qqq'
	syscall
	jr $ra
	next1:
	bne $a0, 1, next2
	la $a0, ghostWalk
	li $v1, 0x717177	#'qqw'
	syscall
	jr $ra
	next2:
	bne $a0, 2, next3
	la $a0, iceWall	
	li $v1, 0x657171	#'eqq'
	syscall
	jr $ra
	next3:
	bne $a0, 3, next4
	la $a0, tornado
	li $v1, 0x717777	#'qww'
	syscall
	jr $ra
	next4:
	bne $a0, 4, next5
	la $a0, deafeningBlast
	li $v1, 0x657177	#'eqw'
	syscall
	jr $ra
	next5:
	bne $a0, 5, next6
	la $a0, forgeSpirit
	li $v1, 0x656571	#'eeq'
	syscall
	jr $ra
	next6:
	bne $a0, 6, next7
	la $a0, EMP
	li $v1, 0x777777	#'www'
	syscall
	jr $ra
	next7:
	bne $a0, 7, next8
	la $a0, alacrity
	li $v1, 0x657777	#'eww'
	syscall
	jr $ra
	next8:
	bne $a0, 8, next9
	la $a0, chaosMeteor
	li $v1, 0x656577	#'eew'
	syscall
	jr $ra
	next9:
	la $a0, sunStrike
	li $v1, 0x656565	#'eee'
	syscall

	jr $ra
#######addElement########
#input 
#$v0, element to add

addElement:
	bnez $t0, firstFull	#add element to t0 if it is not full
	add $t0, $v0, $0
	jr $ra
	firstFull:
	bnez $t1, secondFull	#add element to t1 if it is not full
	move $t1, $t0
	add $t0, $v0, $0
	jr $ra
	secondFull:
	move $t2, $t1
	move $t1, $t0
	add $t0, $v0, $0
	jr $ra
	
printElements:
	sub $sp, $sp, 4
	sw $ra, ($sp)
	jal printNewLine
	lw $ra, ($sp)
	addi $sp, $sp, 4
	li $v0, 11
	#move $t4, $t0
	#sll $t4, $t4, 8
	la $a0, ($t0)
	syscall
	
	#move $t4, $t1
	#sll $t4, $t4, 8
	la $a0, ($t1)
	syscall
	
	#move $t4, $t2
	#sll $t4, $t4, 8
	la $a0, ($t2)
	syscall
	sub $sp, $sp, 4
	sw $ra, ($sp)
	jal printNewLine
	lw $ra, ($sp)
	addi $sp, $sp, 4
	jr $ra
sortElements:

	bgt $t2, $t1, skipFirst
	move $t4, $t1
	move $t1, $t2
	move $t2, $t4
	skipFirst:
	#if t0 < t1, swap them
	blt $t0, $t1, skipSecond
	
	move $t4, $t0		#t4 = t0
	move $t0, $t1		#t0 = #t1
	move $t1, $t4		#t1 = t4
	skipSecond:
	bgt $t2, $t1, skipThird
	move $t4, $t1
	move $t1, $t2
	move $t2, $t4
	skipThird:
	
	add $t4, $t0, $0
	sll $t4, $t4, 8
	add $t4, $t4, $t1
	sll $t4, $t4, 8
	add $t4, $t4, $t2
printNewLine:
	li $v0, 4
	la $a0, newLine
	syscall
	jr $ra
exit:
	li $v0, 10
	syscall
	
.data

coldSnap: .asciiz "Cold Snap\n"
ghostWalk: .asciiz "Ghost Walk\n"
iceWall: .asciiz "Ice Wall\n"
tornado: .asciiz "Tornado\n"
deafeningBlast: .asciiz "Deafening Blast\n"
forgeSpirit: .asciiz "Forge Spirit\n"
EMP: .asciiz "EMP\n"
alacrity: .asciiz "Alacrity\n"
chaosMeteor: .asciiz "Chaos Meteor\n"
sunStrike: .asciiz " Sun Strike\n"
notEnoughOrbs:. asciiz "You need three orbs to invoke!\n"
newLine: .asciiz "\n"
success: .asciiz "Success!"
fail: .asciiz "Fail"