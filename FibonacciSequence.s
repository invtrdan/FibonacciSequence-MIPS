#Author: Danielle McIntosh

.data                                                          # Define the program data
promptN: .asciiz "\nEnter an integer N, where N >= 25: "       # N Prompt
promptFib: .asciiz "\n\nFibonacci Sequence\n"                    # Fibonacci Sequence Prompt
is_legal: .asciiz "The number is legal"                        # Variable that signifies that the number is legal
is_illegal: .asciiz "Illegal Number!"                          # Variable that signifies that the number is illegal

.text                                                          # Define the program instructions
main:                                                          # Starting point 
  li $v0, 4                                                    # Load 4 into $v0 to indicate a print string.
  la $a0, promptN                                              # Load the address of pronptN into $a0
  syscall                                                      # Control is transferred from the user space to the kernel where the system call is handled
  li $v0, 5                                                    # Read the input integer, stores it at $v0
  syscall                                                      # Request system service
  move $8, $v0                                                 # Save the integer in $8 (a temporary register)
  li $9, 25                                                    # Initial value to be used for processing
  blt $8, 25, isIllegal                                        # If the number that the user enters is less than 25, branch to isIllegal
  bgt $8, 25, isLegal                                          # If the number that the user enters is greater than or equal to 25, branch to isLegal
    
isLegal:
  li $v0, 4                                                    # Print("The number is legal")
  la $a0, is_legal                                             # log the address of is_legal
  syscall
  
  li $v0, 4                                                    # Print("\nFibonacci Sequence\n")
  la $a0, promptFib                                            # log the address of is_legal
  syscall
  
  li $10, 1                                                    # Load 1 into register 10 (count)
  li $11, 0                                                    # Load 0 into register 11
  li $12, 1                                                    # Load 1 into register 12
  loopFib:                                                     # Generate Fibonacci sequence
    bgt $10, $8, isExit                                        # Exit if the value in $10 is greater than the value in $8
    li $v0, 1                                                  # Service 1 is print integer
    move $a0, $8                                               # Move the value from register 11 to register $a0
    syscall
    
    
  
  b isExit

isIllegal:
  li $v0, 4                                                    # Print("Illegal Number!")
  la $a0, is_illegal                                           # log the address of is_illegal
  syscall
  
  b main

isExit:                                                        # Exit the program
  li $v0, 10                                                   
  syscall                                                      
