aesdimc	{z0.b-z1.b}, {z0.b-z1.b}, z0.q[4]
aesdimc	{z0.b-z1.b}, {z1.b-z2.b}, z0.q[0]
aesdimc	{z0.q-z1.q}, {z0.b-z1.b}, z0.q[0]
aesdimc	{z0.q-z1.q}, {z0.q-z1.q}, z0.q[0]
aesdimc	{z0.b-z1.b}, {z0.b-z1.b}, z0.b[0]

aesdimc	{z0.b-z3.b}, {z0.b-z3.b}, z0.q[4]
aesdimc	{z0.b-z3.b}, {z3.b-z2.b}, z0.q[0]
aesdimc	{z0.q-z3.q}, {z0.b-z3.b}, z0.q[0]
aesdimc	{z0.q-z3.q}, {z0.q-z3.q}, z0.q[0]
aesdimc	{z0.b-z3.b}, {z0.b-z3.b}, z0.b[0]

aesd	{z0.b-z1.b}, {z0.b-z1.b}, z0.q[4]
aesd	{z0.b-z1.b}, {z1.b-z2.b}, z0.q[0]
aesd	{z0.q-z1.q}, {z0.b-z1.b}, z0.q[0]
aesd	{z0.q-z1.q}, {z0.q-z1.q}, z0.q[0]
aesd	{z0.b-z1.b}, {z0.b-z1.b}, z0.b[0]

aesd	{z0.b-z3.b}, {z0.b-z3.b}, z0.q[4]
aesd	{z0.b-z3.b}, {z3.b-z2.b}, z0.q[0]
aesd	{z0.q-z3.q}, {z0.b-z3.b}, z0.q[0]
aesd	{z0.q-z3.q}, {z0.q-z3.q}, z0.q[0]
aesd	{z0.b-z3.b}, {z0.b-z3.b}, z0.b[0]

aesemc	{z0.b-z1.b}, {z0.b-z1.b}, z0.q[4]
aesemc	{z0.b-z1.b}, {z1.b-z2.b}, z0.q[0]
aesemc	{z0.q-z1.q}, {z0.b-z1.b}, z0.q[0]
aesemc	{z0.q-z1.q}, {z0.q-z1.q}, z0.q[0]
aesemc	{z0.b-z1.b}, {z0.b-z1.b}, z0.b[0]

aesemc	{z0.b-z3.b}, {z0.b-z3.b}, z0.q[4]
aesemc	{z0.b-z3.b}, {z3.b-z2.b}, z0.q[0]
aesemc	{z0.q-z3.q}, {z0.b-z3.b}, z0.q[0]
aesemc	{z0.q-z3.q}, {z0.q-z3.q}, z0.q[0]
aesemc	{z0.b-z3.b}, {z0.b-z3.b}, z0.b[0]

aese	{z0.b-z1.b}, {z0.b-z1.b}, z0.q[4]
aese	{z0.b-z1.b}, {z1.b-z2.b}, z0.q[0]
aese	{z0.q-z1.q}, {z0.b-z1.b}, z0.q[0]
aese	{z0.q-z1.q}, {z0.q-z1.q}, z0.q[0]
aese	{z0.b-z1.b}, {z0.b-z1.b}, z0.b[0]

aese	{z0.b-z3.b}, {z0.b-z3.b}, z0.q[4]
aese	{z0.b-z3.b}, {z3.b-z2.b}, z0.q[0]
aese	{z0.q-z3.q}, {z0.b-z3.b}, z0.q[0]
aese	{z0.q-z3.q}, {z0.q-z3.q}, z0.q[0]
aese	{z0.b-z3.b}, {z0.b-z3.b}, z0.b[0]

pmlal	{z0.b-z1.b}, z0.d, z0.d
pmlal	{z0.q-z3.q}, z0.d, z0.d
pmlal	z0.q, z0.q, z0.d
pmlal	z0.q, {z0.q-z1.q}, z0.d
pmlal	{z0.b-z1.b}, z0.d, {z1.d-z2.d}

pmull	{z0.b-z1.b}, z0.d, z0.d
pmull	{z0.q-z3.q}, z0.d, z0.d
pmull	z0.q, z0.q, z0.d
pmull	z0.q, {z0.q-z1.q}, z0.d
pmull	{z0.b-z1.b}, z0.d, {z1.d-z2.d}
