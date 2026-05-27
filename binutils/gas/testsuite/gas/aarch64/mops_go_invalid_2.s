// Test diagnostics for wrong register operands used
// and lack of writeback

.arch		armv9.6-a+mops-go

// Operands must differ
setgop		[x0]!, x0!
setgom		[x0]!, x0!
setgoe		[x0]!, x0!
setgopt		[x1]!, x1!
setgomt		[x1]!, x1!
setgoet		[x1]!, x1!
setgopn		[x2]!, x2!
setgomn		[x2]!, x2!
setgoen		[x2]!, x2!
setgoptn	[x3]!, x3!
setgomtn	[x3]!, x3!
setgoetn	[x3]!, x3!

// Operands must be 64-registers
setgop		[xsp]!, x0!
setgom		[xsp]!, x0!
setgoe		[xsp]!, x0!
setgopt		[xsp]!, x1!
setgomt		[xsp]!, x1!
setgoet		[xsp]!, x1!
setgopn		[xsp]!, x2!
setgomn		[xsp]!, x2!
setgoen		[xsp]!, x2!
setgoptn	[xsp]!, x3!
setgomtn	[xsp]!, x3!
setgoetn	[xsp]!, x3!

// Operands must be 64-registers
setgop		[x0]!, xsp!
setgom		[x0]!, xsp!
setgoe		[x0]!, xsp!
setgopt		[x1]!, xsp!
setgomt		[x1]!, xsp!
setgoet		[x1]!, xsp!
setgopn		[x2]!, xsp!
setgomn		[x2]!, xsp!
setgoen		[x2]!, xsp!
setgoptn	[x3]!, xsp!
setgomtn	[x3]!, xsp!
setgoetn	[x3]!, xsp!

// Missing writeback in 1st operand
setgop		[x0], x0!
setgom		[x0], x0!
setgoe		[x0], x0!
setgopt		[x1], x1!
setgomt		[x1], x1!
setgoet		[x1], x1!
setgopn		[x2], x2!
setgomn		[x2], x2!
setgoen		[x2], x2!
setgoptn	[x3], x3!
setgomtn	[x3], x3!
setgoetn	[x3], x3!

// Missing writeback in 2nd operand
setgop		[x0]!, x0
setgom		[x0]!, x0
setgoe		[x0]!, x0
setgopt		[x1]!, x1
setgomt		[x1]!, x1
setgoet		[x1]!, x1
setgopn		[x2]!, x2
setgomn		[x2]!, x2
setgoen		[x2]!, x2
setgoptn	[x3]!, x3
setgomtn	[x3]!, x3
setgoetn	[x3]!, x3
