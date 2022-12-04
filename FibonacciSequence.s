#Author: Danielle McIntosh

.data                                                           # Define the program data
promptN: .asciiz "\nEnter an integer N, where N >= 25: "        # N Prompt
promptFib: .asciiz "\nFibonacci Sequence"                       # Fibonacci Sequence Prompt

.text                                                           # Define the program instructions
main:                                                           # Starting point 
  li $v0, 4                                                     # Load 4 into $v0 to indicate a print string.
  la $a0, promptN                                               # Load the address of pronptN into $a0
  syscall                                                       # This is where the program ends
