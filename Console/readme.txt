    Console

This library provides a simple console library, offering a limited support for ANSI control sequences.

Here is a list of the supported sequences and their meaning:

ESC[0m              Reset all text style
ESC[1m              Bold font (*)
ESC[3m              Italic font
ESC[4m              Underline font

ESC]0;NewnameBEL    Set the window title to "Newname" (**)

NOTES:
(*) Obtained with bold + condense style together, so that the character grid
remains regular (this way, the width of bold characters remains the same as 
regular ones).
(**) BEL is ASCII character 7.
