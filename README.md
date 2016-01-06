# mips1
Program1. Write a MIPS assembly language program that will cover the following  
steps:  
Prompt the user to enter a negative integer (in the range [-20, 0] named integer1  
Prompt the user to enter a positive integer (in the range [10, 20] integer named integer2 
Compute (int1^2- 4*int2)*16 // don’t use subi;  
Print the value of the result together with a message  
Repeat until sentinel value entered  
The program should enforce the rule that the two entered integers must be in the correct  
interval. If the entered integer is not in the specified range, prompt again the user to  
enter an integer in the specified range.  
Create a sentinel (999 for example) that will allow the user to exit the program  
<br/>

#mips2
Program 2. Write a MIPS assembly language program for the following for loop:  <br/> 
Pseudocode: for(int j=1; j<15; j++){    <br/>
total=j + constant;    <br/>
println(“for j equal ” + j + “, total equal ” + total);   <br/> 
}    <br/>
The constant value should be prompted from the user.    <br/>
In the program use the slt or the slti instruction.    <br/>
<br/>

#mips3  
Program 3.  
Write a MIPS assembly language program that computes the recursive function defined below:  
Func(n): if (n=0 or n=1 or n=2)  
then Func(n) = 2;  
else Func(n) = (n+3)+ 2*Func(n-2);  
Have n (n>= 0) be prompted from the user.  
Check for correct input.  
If n is not a natural number display an error message.  
Else, display a result_message together with the numeric value of the function.  
Repeat  
NOTE: use recursive function calls. Use 999 as sentinel value to exit  
