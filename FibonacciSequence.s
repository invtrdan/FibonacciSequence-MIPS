#Author: Danielle McIntosh

.data                                                          # Define the program data
promptN: .asciiz "\nEnter an integer N, where N >= 25: "       # N Prompt
promptFib: .asciiz "\n\nFibonacci Sequence\n"                  # Fibonacci Sequence Prompt
is_legal: .asciiz "The number is legal"                        # Variable that signifies that the number is legal
is_illegal: .asciiz "Illegal Number!"                          # Variable that signifies that the number is illegal
newline: .asciiz "\n"                                          # new line

.text                                                          # Define the program instructions
main:                                                          # Starting point 
  li $v0, 4                                                    # Load 4 into $v0 to indicate a print string.
  la $a0, promptN                                              # Load the address of pronptN into $a0
  syscall                                                      # Control is transferred from the user space to the kernel where the system call is handled
  li $v0, 5                                                    # Read the input integer, stores it at $v0
  syscall                                                      # Request system service
  move $t0, $v0                                                # Save the integer in $t0
  li $9, 25                                                    # Initial value to be used for processing
  blt $t0, 25, isIllegal                                       # If the number that the user enters is less than 25, branch to isIllegal
  bgt $t0, 25, isLegal                                         # If the number that the user enters is greater than or equal to 25, branch to isLegal
    
isLegal:
  li $v0, 4                                                    # Print("The number is legal")
  la $a0, is_legal                                             # log the address of is_legal
  syscall
  
  li $v0, 4                                                    # Print("\nFibonacci Sequence\n")
  la $a0, promptFib                                            # log the address of is_legal
  syscall
  
  li $t1, 0                                                    # Load 0 into register 10 (count)
  li $t2, 0                                                    # Load 0 into register 11 (num1)
  li $t3, 1                                                    # Load 1 into register 12 (num2)
  li $t4, 0                                                    # Load 0 into register 13 (temp)
  
  ####################################################################################################################################################
  #    $t0  contains the user input (N)                                                                   
  #    $t1  contains the counter (initial value: 0)                                                                                                    
  #    $t2  contains num1 (the number printed on each iteration) (initial value: 0)                                                              
  #    $t3  contains num2 (the sum of the two previous numbers in the sequence) (initial value: 1)                                                  
  #    $t4  contains temp (the sum of num1 and num2)   
  #                                                                                                                                                  
  #    Example:                                                                                                                                      
  #    N (user input) = 6                                                                                                                            
  #    count = 0                                                                                                                                     
  #    num1 = 0                                                                                                                                      
  #    num2 = 1                                                                                                                                      
  #    temp = 0                                                                                                                                      
  #                                                                  N = 4 (just for loop algorithm testing purposes) 6 is ILLEGAL!                  
  #    LOOP                                                                                                                                          
  #    Exit if count == 6                                            Count  Num1  Num2  Temp  Output
  #    print num1                                                      0      0     1     0    0
  #    temp = num1 + num2                                              0      0     1     1     
  #    num1 = num2                                                     0      1     1     1     
  #    num2 = temp                                                     0      1     1     1     
  #    increment count                                                 1      1     1     1     
  #
  #    Exit if count == 6                                            Count  Num1  Num2  Temp  Output
  #    print num1                                                      1      1     1     1    0 1
  #    temp = num1 + num2                                              1      1     1     2     
  #    num1 = num2                                                     1      1     1     2     
  #    num2 = temp                                                     1      1     2     2
  #    increment count                                                 2      1     2     2
  #    
  #    Exit if count == 6                                            Count  Num1  Num2  Temp  Output
  #    print num1                                                      2      1     2     2    0 1 1
  #    temp = num1 + num2                                              2      1     2     3     
  #    num1 = num2                                                     2      2     2     3  
  #    num2 = temp                                                     2      2     3     3
  #    increment count                                                 3      2     3     3
  #
  #    Exit if count == 6                                            Count  Num1  Num2  Temp  Output
  #    print num1                                                      3      2     3     3    0 1 1 2
  #    temp = num1 + num2                                              3      2     3     5 
  #    num1 = num2                                                     3      3     3     5
  #    num2 = temp                                                     3      3     5     5
  #    increment count                                                 4      3     5     5
  #
  #    Exit if count == 6                                            Count  Num1  Num2  Temp  Output
  #    print num1                                                      4      3     5     5    0 1 1 2 3
  #    temp = num1 + num2                                              4      3     5     8
  #    num1 = num2                                                     4      5     5     8
  #    num2 = temp                                                     4      5     8     8
  #    increment count                                                 5      5     8     8
  #
  #    Exit if count == 6                                            Count  Num1  Num2  Temp  Output
  #    print num1                                                      5      5     8     8    0 1 1 2 3 5
  #    temp = num1 + num2                                              5      5     8    13
  #    num1 = num2                                                     5      8     8    13 
  #    num2 = temp                                                     5      8    13    13
  #    increment count                                                 6      8    13    13
  #
  #    Exit if count == 6
  #    EXIT!
  ####################################################################################################################################################
  
  #    $t0   N                                                                  
  #    $t1   count                                                                                                   
  #    $t2   num1                                                             
  #    $t3   num2                                                     
  #    $t4   temp 
  
  loopFib:                                                     # Generate Fibonacci sequence                               
    beq $t1, $t0, exit                                         # Exit if the value in $10 is equal to the value in $8      # Exit if count == N
    
    li $v0, 1                                                  # Instruction for printing an integer                       # print num1
    move $a0, $t2                                              # Print num1          
    syscall
    li $v0, 4                                                  # Instruction for printing a string
    la $a0, newline                                            # Print each number in a new line
    syscall
    
    
    addi $10, $10, 1                                           # Increment Count                                           # Increment Count
    b loopFib
    
    

isIllegal:
  li $v0, 4                                                    # Print("Illegal Number!")
  la $a0, is_illegal                                           # log the address of is_illegal
  syscall
  
  b main

exit:                                                          # Exit the program
  li $v0, 10                                                   
  syscall                                                      
