######################Program 1######################################################
# Program name: Sach_Diksha_h2.s
# Programmer: Diksha Sach
# Submission Date: December 20, 2015
####################################################################################
#	Func(n): if (n=0 or n=1 or n=2)
#	then Func(n) = 2;
#	else Func(n) = (n+3)+ 2*Func(n-2);
#	Have n (n>= 0) be prompted from the user.
#	Check for correct input.
#	If n is not a natural number display an error message.
#	Else, display a result_message together with the numeric value of the
#	function.
#	Repeat
#	NOTE: use recursive function calls. Use 999 as sentinel value to exit
#	the loop
######################################################################################
#Some Test values:
#Solving for 0 is: 2
#Solving for 1 is: 2
#Solving for 2 is: 2
#Solving for 3 is: 8
#Solving for 4 is: 9
#Solving for 5 is: 16
#Solving for 6 is: 18
#Solving for 7 is: 26
#Solving for 8 is: 29
#Solving for 9 is: 38
#Solving for 10 is: 42
#Solving for 999: program will exit
#####################################################################################
# Register Usage in Main: 
#$a0-Syscall
#$v0-Syscall
#$t7- holds temporary value for errorMessager
#$ra- return address
#$s1- holds func(n-2)
#s2- holds (n+3)
#####################################################################################

.data 
errorMessage: .asciiz "You have to enter a number thats a natural number (greater than 0)"
getNMessage: .asciiz "Enter a number(if you enter 999 the program will exit) : "
newLine: .asciiz "\n"
result: .asciiz "The result of the computation is: "
Answer: .word 0
Number: .word 0
.text
.globl main
main:
li $v0, 4
la $a0, getNMessage
syscall
li $v0, 5
syscall

sw $v0, Number
## if you enter 99 program finishes
beq $v0, 999, exit
#check if number is less than 0(not a natural number)
slti $t7, $v0, 0 
bne $t7, $zero, errorMessager
 

#call the function
lw $a0, Number
jal func
sw $v0, Answer

#display the results
li $v0, 4
la $a0, result
syscall
 
li $v0, 1
lw $a0, Answer
syscall
#print a new line
li $v0,4
la $a0, newLine      
 syscall 
j main
#error message if number isn't a natural number
errorMessager:
li $v0, 4
la $a0, errorMessage
syscall
#print a new line
li $v0,4
la $a0, newLine      
 syscall 
j main


exit:
li $v0, 10
syscall
##########################################################################################
func:
addi $sp, $sp, -12 #allocate space
sw $ra, 12($sp)  #save return address
sw $s0, 8($sp) 
sw $s1, 4($sp) 
sw $s2, 0($sp) 

move $s0, $a0 # get n 
#basecases
li $t1, 1 ##t1<-1
beq $a0, $t1, basecase       #jump to basecase  
li $t2, 2 #$t2<-2
beq  $a0, $t2, basecase      #jump to basecase      
li $t0, 0 #$t0<-0
beq $a0,$t3, basecase   #jump to basecase
 
#recursive step
addi $a0, $s0, -2 #(n -2)
jal func #func(n-2)
move $s1, $v0 # s1 <= func(n-2)

add $a0, $s0, 3 #(n+3)
move $s2, $a0 # $s2 <= n+3
add $v0, $s1, $s2 # $v0 = func(n-2)+(n+3)
b return #go to return

basecase: 
li $v0, 2 #return 2 when basecase is called

return:
lw $ra, 12($sp) # restore return address
lw $s0, 8($sp) # restore $s0
lw $s1, 4($sp) # restore $s1
lw $s2, 0($sp) # restore $s2
addi $sp, $sp, 12 # return to caller
jr $ra # return.
