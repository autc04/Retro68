#name: Test of SVE-AES2 instructions.
#as: -march=armv9-a+sve-aes2+ssve-aes
#as: -march=armv9-a+sve-aes2+sve2
#source: sve-aes2.s
#objdump: -dr

[^:]+:     file format .*

.*:

.*:
.*:	4523ec00 	aesdimc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[0\]
.*:	453bec00 	aesdimc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[3\]
.*:	4523efe0 	aesdimc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[0\]
.*:	453befe0 	aesdimc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[3\]
.*:	4523ec1e 	aesdimc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[0\]
.*:	453bec1e 	aesdimc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[3\]
.*:	4523effe 	aesdimc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[0\]
.*:	453beffe 	aesdimc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4527ec00 	aesdimc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[0\]
.*:	453fec00 	aesdimc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[3\]
.*:	4527efe0 	aesdimc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[0\]
.*:	453fefe0 	aesdimc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[3\]
.*:	4527ec1c 	aesdimc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[0\]
.*:	453fec1c 	aesdimc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[3\]
.*:	4527effc 	aesdimc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[0\]
.*:	453feffc 	aesdimc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4522ec00 	aesd	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[0\]
.*:	453aec00 	aesd	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[3\]
.*:	4522efe0 	aesd	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[0\]
.*:	453aefe0 	aesd	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[3\]
.*:	4522ec1e 	aesd	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[0\]
.*:	453aec1e 	aesd	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[3\]
.*:	4522effe 	aesd	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[0\]
.*:	453aeffe 	aesd	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4526ec00 	aesd	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[0\]
.*:	453eec00 	aesd	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[3\]
.*:	4526efe0 	aesd	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[0\]
.*:	453eefe0 	aesd	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[3\]
.*:	4526ec1c 	aesd	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[0\]
.*:	453eec1c 	aesd	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[3\]
.*:	4526effc 	aesd	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[0\]
.*:	453eeffc 	aesd	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4523e800 	aesemc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[0\]
.*:	453be800 	aesemc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[3\]
.*:	4523ebe0 	aesemc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[0\]
.*:	453bebe0 	aesemc	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[3\]
.*:	4523e81e 	aesemc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[0\]
.*:	453be81e 	aesemc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[3\]
.*:	4523ebfe 	aesemc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[0\]
.*:	453bebfe 	aesemc	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4527e800 	aesemc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[0\]
.*:	453fe800 	aesemc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[3\]
.*:	4527ebe0 	aesemc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[0\]
.*:	453febe0 	aesemc	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[3\]
.*:	4527e81c 	aesemc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[0\]
.*:	453fe81c 	aesemc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[3\]
.*:	4527ebfc 	aesemc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[0\]
.*:	453febfc 	aesemc	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4522e800 	aese	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[0\]
.*:	453ae800 	aese	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z0\.q\[3\]
.*:	4522ebe0 	aese	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[0\]
.*:	453aebe0 	aese	{ ?z0\.b-z1\.b ?}, { ?z0\.b-z1\.b ?}, z31\.q\[3\]
.*:	4522e81e 	aese	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[0\]
.*:	453ae81e 	aese	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z0\.q\[3\]
.*:	4522ebfe 	aese	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[0\]
.*:	453aebfe 	aese	{ ?z30\.b-z31\.b ?}, { ?z30\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4526e800 	aese	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[0\]
.*:	453ee800 	aese	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z0\.q\[3\]
.*:	4526ebe0 	aese	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[0\]
.*:	453eebe0 	aese	{ ?z0\.b-z3\.b ?}, { ?z0\.b-z3\.b ?}, z31\.q\[3\]
.*:	4526e81c 	aese	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[0\]
.*:	453ee81c 	aese	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z0\.q\[3\]
.*:	4526ebfc 	aese	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[0\]
.*:	453eebfc 	aese	{ ?z28\.b-z31\.b ?}, { ?z28\.b-z31\.b ?}, z31\.q\[3\]

.*:
.*:	4520fc00 	pmlal	{ ?z0\.q-z1\.q ?}, z0\.d, z0\.d
.*:	453ffc00 	pmlal	{ ?z0\.q-z1\.q ?}, z0\.d, z31\.d
.*:	4520ffe0 	pmlal	{ ?z0\.q-z1\.q ?}, z31\.d, z0\.d
.*:	453fffe0 	pmlal	{ ?z0\.q-z1\.q ?}, z31\.d, z31\.d
.*:	4520fc1e 	pmlal	{ ?z30\.q-z31\.q ?}, z0\.d, z0\.d
.*:	453ffc1e 	pmlal	{ ?z30\.q-z31\.q ?}, z0\.d, z31\.d
.*:	4520fffe 	pmlal	{ ?z30\.q-z31\.q ?}, z31\.d, z0\.d
.*:	453ffffe 	pmlal	{ ?z30\.q-z31\.q ?}, z31\.d, z31\.d

.*:
.*:	4520f800 	pmull	{ ?z0\.q-z1\.q ?}, z0\.d, z0\.d
.*:	453ff800 	pmull	{ ?z0\.q-z1\.q ?}, z0\.d, z31\.d
.*:	4520fbe0 	pmull	{ ?z0\.q-z1\.q ?}, z31\.d, z0\.d
.*:	453ffbe0 	pmull	{ ?z0\.q-z1\.q ?}, z31\.d, z31\.d
.*:	4520f81e 	pmull	{ ?z30\.q-z31\.q ?}, z0\.d, z0\.d
.*:	453ff81e 	pmull	{ ?z30\.q-z31\.q ?}, z0\.d, z31\.d
.*:	4520fbfe 	pmull	{ ?z30\.q-z31\.q ?}, z31\.d, z0\.d
.*:	453ffbfe 	pmull	{ ?z30\.q-z31\.q ?}, z31\.d, z31\.d
