// Test for unsupported processor errors and warnings
// about sequence of instrucions

.arch		armv9.6-a

setgop		[x0]!, x1!
setgom		[x0]!, x1!
setgoe		[x0]!, x1!
setgopt		[x0]!, x1!
setgomt		[x0]!, x1!
setgoet		[x0]!, x1!
setgopn		[x0]!, x1!
setgomn		[x0]!, x1!
setgoen		[x0]!, x1!
setgoptn	[x0]!, x1!
setgomtn	[x0]!, x1!
setgoetn	[x0]!, x1!

.arch		armv9.6-a+mops-go

setgop		[x0]!, x1!
ret
setgopt		[x0]!, x1!
ret
setgopn		[x0]!, x1!
ret
setgoptn	[x0]!, x1!
ret

setgop		[x0]!, x1!
setgom		[x0]!, x1!
ret
setgopt		[x0]!, x1!
setgomt		[x0]!, x1!
ret
setgopn		[x0]!, x1!
setgomn		[x0]!, x1!
ret
setgoptn	[x0]!, x1!
setgomtn	[x0]!, x1!
ret

setgop		[x10]!, x11!
setgop		[x0]!, x1!
setgom		[x0]!, x1!
setgoe		[x0]!, x1!

setgopt		[x10]!, x11!
setgop		[x0]!, x1!
setgom		[x0]!, x1!
setgoe		[x0]!, x1!

setgopn		[x10]!, x11!
setgop		[x0]!, x1!
setgom		[x0]!, x1!
setgoe		[x0]!, x1!

setgoptn	[x10]!, x11!
setgop		[x0]!, x1!
setgom		[x0]!, x1!
setgoe		[x0]!, x1!
