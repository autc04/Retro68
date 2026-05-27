# Check 64bit AMX-TRANSPOSE APX_F EVEX-Promoted instructions.

	.arch .amx_transpose
	.text
_start:
	t2rpntlvwz0	0x123(%r31,%rax,8),%tmm6
	t2rpntlvwz0rs	0x123(%r31,%rax,8),%tmm6
	t2rpntlvwz0rst1	0x123(%r31,%rax,8),%tmm6
	t2rpntlvwz0t1	0x123(%r31,%rax,8),%tmm6
	t2rpntlvwz1	0x123(%r31,%rax,8),%tmm6
	t2rpntlvwz1rs	0x123(%r31,%rax,8),%tmm6
	t2rpntlvwz1rst1	0x123(%r31,%rax,8),%tmm6
	t2rpntlvwz1t1	0x123(%r31,%rax,8),%tmm6

_intel:
	t2rpntlvwz0	tmm6,[r31+rax*8+0x123]
	t2rpntlvwz0rs	tmm6,[r31+rax*8+0x123]
	t2rpntlvwz0rst1	tmm6,[r31+rax*8+0x123]
	t2rpntlvwz0t1	tmm6,[r31+rax*8+0x123]
	t2rpntlvwz1	tmm6,[r31+rax*8+0x123]
	t2rpntlvwz1rs	tmm6,[r31+rax*8+0x123]
	t2rpntlvwz1rst1	tmm6,[r31+rax*8+0x123]
	t2rpntlvwz1t1	tmm6,[r31+rax*8+0x123]
