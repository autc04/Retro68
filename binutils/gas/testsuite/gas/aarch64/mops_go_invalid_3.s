// Test warnings about different operands in subsequent instructions

.arch		armv9.6-a+mops-go

setgop		[x0]!, x1!
setgom		[x2]!, x1!
setgoe		[x2]!, x1!
setgop		[x0]!, x1!
setgom		[x0]!, x2!
setgoe		[x0]!, x2!
setgop		[x0]!, x1!
setgom		[x0]!, x1!
setgoe		[x2]!, x1!
setgop		[x0]!, x1!
setgom		[x0]!, x1!
setgoe		[x0]!, x2!

setgopt		[x0]!, x1!
setgomt		[x2]!, x1!
setgoet		[x2]!, x1!
setgopt		[x0]!, x1!
setgomt		[x0]!, x2!
setgoet		[x0]!, x2!
setgopt		[x0]!, x1!
setgomt		[x0]!, x1!
setgoet		[x2]!, x1!
setgopt		[x0]!, x1!
setgomt		[x0]!, x1!
setgoet		[x0]!, x2!

setgopn		[x0]!, x1!
setgomn		[x2]!, x1!
setgoen		[x2]!, x1!
setgopn		[x0]!, x1!
setgomn		[x0]!, x2!
setgoen		[x0]!, x2!
setgopn		[x0]!, x1!
setgomn		[x0]!, x1!
setgoen		[x2]!, x1!
setgopn		[x0]!, x1!
setgomn		[x0]!, x1!
setgoen		[x0]!, x2!

setgoptn	[x0]!, x1!
setgomtn	[x2]!, x1!
setgoetn	[x2]!, x1!
setgoptn	[x0]!, x1!
setgomtn	[x0]!, x2!
setgoetn	[x0]!, x2!
setgoptn	[x0]!, x1!
setgomtn	[x0]!, x1!
setgoetn	[x2]!, x1!
setgoptn	[x0]!, x1!
setgomtn	[x0]!, x1!
setgoetn	[x0]!, x2!
