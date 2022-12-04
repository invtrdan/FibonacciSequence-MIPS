#Author: Danielle McIntosh

.data                                                          # Define the program data
promptN: .asciiz "\nEnter an integer N, where N >= 25: "       # N Prompt
promptFib: .asciiz "\nFibonacci Sequence"                      # Fibonacci Sequence Prompt
is_legal: .asciiz "\nThe number is legal"                       #Variable that signifies that the number is legal
is_illegal: .asciiz "\nIllegal Number!"                         #Variable that signifies that the number is illegal

.text                                                          # Define the program instructions
main:                                                          # Starting point 
  li $v0, 4                                                    # Load 4 into $v0 to indicate a print string.
  la $a0, promptN                                              # Load the address of pronptN into $a0
  syscall                                                      # Control is transferred from the user space to the kernel where the system call is handled
  li $v0, 5                                                    # Read the input integer, stores it at $v0
  syscall                                                      # Request system service
  move $8, $v0                                                 # Save the integer in $s0 (a temporary register)
  blt $8, 25, isIllegal                                        # If the number that the user enters is less than 25, branch to isIllegal
  beq $8, 25, isLegal                                          # If the number that the user enters is 25, branch to isLegal
  
isLegal:
  li $v0, 4                                                    # Print("The number is legal")
  la $a0, is_illegal                                           # log the address of is_legal
  syscall

isIllegal:
  li $v0, 4                                                    # Print("Illegal Number!")
  la $a0, is_illegal                                           # log the address of is_illegal
  syscall

fib:

isExit:                                                        # Exit the program
  li $v0, 10                                                   
  syscall                                                      
