######################Program 2######################################################
# Program name: Sach_h1_2.s
# Programmer: Diksha Sach
# Submission Date: December 8, 2015
#####################################################################################
# Overall Program Functional Description: First, the program asks for user input to get a constant variable. 
#Then program creates a for loop that iterates through the loop from x=1 to x<15
# then it prints out the total which is calculated by adding the constant and the x together.
#####################################################################################
# Register Usage in Main: 
#$t7: Stores constant
#$t6: Stores total value
#t1: Stores the value 0 initially then it increases by 1
#$v0: used to as a syscall paramter
##################################################################################### 
#Pseudocode:
#Pseudocode: for(int j=1; j<15; j++){
#total=j + constant;
#println(?for j equal ? + j + ?, total equal ? + total);
#}
##################################################################################### 
.data

constant: .asciiz "Please enter a number for the constant value: "
number: .asciiz "the number you have entered is: "
newLine: .asciiz "\n"
message: .asciiz "after loop is done"
result: .asciiz "result ="
jequals: .asciiz "for j equals "
tequals: .asciiz ", total equals "
.text

main:
    
     
 getConstant:
li $v0,4
la $a0, constant
syscall # prints the constant message     
li $v0, 5 #read the integer
syscall
move $t7, $v0   
#display message
li $v0, 4
la $a0, number
syscall
#print x
li $v0, 1
move $a0, $t7
syscall
#print a new line
li $v0,4
la $a0, newLine      
 syscall    
              
               
                
                
      li $t6, 0     #total=0        
      li $t1, 1                     #i=1
 For: slti   $t0, $t1,16         #i<16 
      beq $t0, $0, EXIT # $t0= $0 go to Exit
      add $t6, $t7, $t1 # total = constant + j
    j loop # go to loop
      

loop: 
# prints jequals message
li $v0,4
la $a0, jequals
syscall  
#prints j
li $v0, 1 
move $a0, $t1 
syscall
#prints tequals message
li $v0, 4
la $a0, tequals
syscall
#prints t
li $v0, 1
move $a0, $t6
syscall
#prints a new line
  la $a0, newLine     
  li $v0, 4       
  syscall 
  
  #add i++
  add $t1, $t1, 1          
  j For
       
EXIT:  
li $v0, 10 # exit
syscall 

