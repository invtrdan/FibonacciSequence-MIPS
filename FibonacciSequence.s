#Author: Danielle McIntosh

.data                                                          # Define the program data
promptN: .asciiz "\nEnter an integer N, where N >= 25: "       # N Prompt
promptFib: .asciiz "\nFibonacci Sequence"                      # Fibonacci Sequence Prompt

.text                                                          # Define the program instructions
main:                                                          # Starting point 
  li $v0, 4                                                    # Load 4 into $v0 to indicate a print string.
  la $a0, promptN                                              # Load the address of pronptN into $a0
  syscall                                                      # Control is transferred from the user space to the kernel where the system call is handled
  li $v0, 5                                                    # Read the input integer, stores it at $v0
  syscall                                                      # Request system service
  move $s0, $v0                                                # Save the integer in $s0
  
  li $v0, 10                                                   # Exit the program
  syscall                                                      # Request system service  
  
 
