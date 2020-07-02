.data
n: .word 21

.text
lw $a0, n(r0)
daddi r1, $zero, 1
daddi r3, $zero, 3

slti r30, $a0, 3		;r30 = 1 se $a0 < 3
beq r30, r1, base
beq $a0, r3, equals

daddi $sp, $sp, 12
sw r1, 8($sp)		
sw r1, 4($sp)			
sw r3, 0($sp)

FOR:	
	lw $t3, 0($sp)
	daddi $t3, $t3, 1		;i+1

	lw $t2, 4($sp)
	lw $t1, 8($sp)	

	dadd r30, $t1, $t2		
	dadd $t2, $zero, $t1		;penultimo = ultimo
	dadd $t1, $zero, r30		;ultimo = fib

	sw $t3, 0($sp)			;salva i+1
	sw $t2, 4($sp)			;salva penultimo
	sw $t1, 8($sp)			;salva ultimo

	beq $a0, $t3, end
	bne $a0, $t3, FOR
	HALT
	
end:
	daddi $sp, $sp, -12
	dadd r30, $t1, $t2
	HALT
	
base:
	beqz $a0, zero
	HALT

zero:
	daddi r30, $zero, 0
	HALT

equals:
	daddi r30, $zero, 2
	HALT

