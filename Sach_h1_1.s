######################Program 1######################################################
# Program name: Sach_h1_1.s
# Programmer: Diksha Sach
# Submission Date: December 8, 2015
#####################################################################################
# Overall Program Functional Description: The program asks the user to enter two integers between a range of numbers.
#Then, it calculates a number using the computer function
#####################################################################################
# Register Usage in Main: 
#$t0: int x
#$t1: int  y
#$t4: Stores multiplacation of x*x = x^2
#$t5 Stores multiplication of y*4
#$t6: Stores subtraction of $t4 from $t5
#$t7: Stores $t6 * 16 which is the function answer
##################################################################################### 


.data 
int1: .asciiz "Enter your first integer:"
int1message: .asciiz " The first intege you have intered is: "
int2: .asciiz "Enter your second integer:"
int2message: .asciiz " The second integer you have entered is: "
newLine: .asciiz "\n"
errormsg: .asciiz "wrong integer"
Result: .asciiz "The result for computing (int1^2-4*int2)*16) is equal to: "
.text 

getX:
#display string message for x
li $v0,4
la $a0, int1
syscall #print the string
#get x
li $v0, 5 #read the integer
syscall
#[-20,0]
slti $t4, $v0,1
slti $t5, $v0, -20
beq $t4, $t5, getX
move $t0, $v0 
#ble $v0, -21, getX # if the number is less than -21 return to get X
#bge $v0, 1, getX
#move $t0, $v0

getY:
#display message for y
li $v0, 4
la $a0, int2
syscall 
#get second number y
li $v0, 5
syscall
#[10,20]
#ble    $v0, 10, getY # if the number is less than -21 return to get X
#bge $v0, 20, getY
slti $t4, $v0, 21
slti $t5, $v0, 10
beq $4, $t5, getY
move $t1, $v0



#display message
li $v0, 4
la $a0, int1message
syscall
#print x
li $v0, 1
move $a0, $t0
syscall

#adding a line between output
la $a0, newLine
addi $v0, $0, 4
syscall

#display message for y
li $v0, 4
la $a0, int2message
syscall
#print y
li $v0, 1
move $a0, $t1
syscall 



computer:
mul  $t4 ,$t0, $t0 # store product the integer squared in t4
sll $t5, $t1,2## store product of 4 times integer 2 into t5
sub  $t6, $t4, $t5 #$t6= $t4-$t5
sll $t7, $t6, 4 # multiply 16 by the value stored in $t6


#adding a line between output
la $a0, newLine
addi $v0, $0, 4
syscall
#display product message
li $v0, 4
la $a0, Result
syscall
#display product
li $v0, 1
add $a0, $zero, $t7
syscall


exit:
li $v0, 10
syscall



