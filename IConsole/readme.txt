    IConsole

This is a slightly improved version of Retro68's Console library, offering a
support for a subset of ANSI control sequences.

Here is a list of the supported sequences and their meaning:

ESC[0m          Reset all text style
ESC[1m          Bold font (*)
ESC[3m          Italic font
ESC[4m          Underline font


NOTES:
(*) The bold font may be slightly larger that the normal font. Hence, the
character grid may not be perfectly regular if this font is used.
