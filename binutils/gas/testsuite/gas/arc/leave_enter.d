#objdump: -dr

.*: +file format .*arc.*


Disassembly of section .text:

[0-9a-f]+ <.text>:
   0:	c0c2                	leave_s	\[r13-r13\]
   2:	c4dc                	leave_s	\[r13-gp,pcl\]
   4:	c1dc                	leave_s	\[r13-gp,fp\]
   6:	c2dc                	leave_s	\[r13-gp,blink\]
   8:	c3dc                	leave_s	\[r13-gp,fp,blink\]
   a:	c5dc                	leave_s	\[r13-gp,fp,pcl\]
   c:	c6dc                	leave_s	\[r13-gp,blink,pcl\]
   e:	c7dc                	leave_s	\[r13-gp,fp,blink,pcl\]
  10:	1100 0000           	ld	r0,\[r1\]
  14:	c0e2                	enter_s	\[r13-r13\]
  16:	c1fc                	enter_s	\[r13-gp,fp\]
  18:	c2fc                	enter_s	\[r13-gp,blink\]
  1a:	c3fc                	enter_s	\[r13-gp,fp,blink\]
