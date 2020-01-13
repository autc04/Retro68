    IConsole

This is a slightly improved version of Retro68's Console library, offering a
support for a subset of ANSI control sequences.

Here is a list of the supported sequences and their meaning:

ESC[0m          Reset all text style
ESC[1m          Bold font (*)
ESC[3m          Italic font
ESC[4m          Underline font


NOTES:
(*) Obtained with bold + condense style together, so that the character grid
remains regular (this way, the width of bold characters remains the same as 
regular ones).
