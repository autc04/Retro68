	rev64	v0.8b, v0.8b
	rev64	v31.8b, v0.8b
	rev64	v0.8b, v31.8b
	rev64	v0.4h, v0.4h
	rev64	v31.4h, v0.4h
	rev64	v0.4h, v31.4h
	rev64	v0.2s, v0.2s
	rev64	v31.2s, v0.2s
	rev64	v0.2s, v31.2s
	rev64	v0.16b, v0.16b
	rev64	v31.16b, v0.16b
	rev64	v0.16b, v31.16b
	rev64	v0.8h, v0.8h
	rev64	v31.8h, v0.8h
	rev64	v0.8h, v31.8h
	rev64	v0.4s, v0.4s
	rev64	v31.4s, v0.4s
	rev64	v0.4s, v31.4s

	rev16	v0.8b, v0.8b
	rev16	v31.8b, v0.8b
	rev16	v0.8b, v31.8b
	rev16	v0.16b, v0.16b
	rev16	v31.16b, v0.16b
	rev16	v0.16b, v31.16b

	saddlp	v0.4h, v0.8b
	saddlp	v31.4h, v0.8b
	saddlp	v0.4h, v31.8b
	saddlp	v0.2s, v0.4h
	saddlp	v31.2s, v0.4h
	saddlp	v0.2s, v31.4h
	saddlp	v0.1d, v0.2s
	saddlp	v31.1d, v0.2s
	saddlp	v0.1d, v31.2s
	saddlp	v0.8h, v0.16b
	saddlp	v31.8h, v0.16b
	saddlp	v0.8h, v31.16b
	saddlp	v0.4s, v0.8h
	saddlp	v31.4s, v0.8h
	saddlp	v0.4s, v31.8h
	saddlp	v0.2d, v0.4s
	saddlp	v31.2d, v0.4s
	saddlp	v0.2d, v31.4s

	suqadd	v0.8b, v0.8b
	suqadd	v31.8b, v0.8b
	suqadd	v0.8b, v31.8b
	suqadd	v0.4h, v0.4h
	suqadd	v31.4h, v0.4h
	suqadd	v0.4h, v31.4h
	suqadd	v0.2s, v0.2s
	suqadd	v31.2s, v0.2s
	suqadd	v0.2s, v31.2s
	suqadd	v0.16b, v0.16b
	suqadd	v31.16b, v0.16b
	suqadd	v0.16b, v31.16b
	suqadd	v0.8h, v0.8h
	suqadd	v31.8h, v0.8h
	suqadd	v0.8h, v31.8h
	suqadd	v0.4s, v0.4s
	suqadd	v31.4s, v0.4s
	suqadd	v0.4s, v31.4s
	suqadd	v0.2d, v0.2d
	suqadd	v31.2d, v0.2d
	suqadd	v0.2d, v31.2d

	cls	v0.8b, v0.8b
	cls	v31.8b, v0.8b
	cls	v0.8b, v31.8b
	cls	v0.4h, v0.4h
	cls	v31.4h, v0.4h
	cls	v0.4h, v31.4h
	cls	v0.2s, v0.2s
	cls	v31.2s, v0.2s
	cls	v0.2s, v31.2s
	cls	v0.16b, v0.16b
	cls	v31.16b, v0.16b
	cls	v0.16b, v31.16b
	cls	v0.8h, v0.8h
	cls	v31.8h, v0.8h
	cls	v0.8h, v31.8h
	cls	v0.4s, v0.4s
	cls	v31.4s, v0.4s
	cls	v0.4s, v31.4s

	cnt	v0.8b, v0.8b
	cnt	v31.8b, v0.8b
	cnt	v0.8b, v31.8b
	cnt	v0.16b, v0.16b
	cnt	v31.16b, v0.16b
	cnt	v0.16b, v31.16b

	sadalp	v0.4h, v0.8b
	sadalp	v31.4h, v0.8b
	sadalp	v0.4h, v31.8b
	sadalp	v0.2s, v0.4h
	sadalp	v31.2s, v0.4h
	sadalp	v0.2s, v31.4h
	sadalp	v0.1d, v0.2s
	sadalp	v31.1d, v0.2s
	sadalp	v0.1d, v31.2s
	sadalp	v0.8h, v0.16b
	sadalp	v31.8h, v0.16b
	sadalp	v0.8h, v31.16b
	sadalp	v0.4s, v0.8h
	sadalp	v31.4s, v0.8h
	sadalp	v0.4s, v31.8h
	sadalp	v0.2d, v0.4s
	sadalp	v31.2d, v0.4s
	sadalp	v0.2d, v31.4s

	sqabs	v0.8b, v0.8b
	sqabs	v31.8b, v0.8b
	sqabs	v0.8b, v31.8b
	sqabs	v0.4h, v0.4h
	sqabs	v31.4h, v0.4h
	sqabs	v0.4h, v31.4h
	sqabs	v0.2s, v0.2s
	sqabs	v31.2s, v0.2s
	sqabs	v0.2s, v31.2s
	sqabs	v0.16b, v0.16b
	sqabs	v31.16b, v0.16b
	sqabs	v0.16b, v31.16b
	sqabs	v0.8h, v0.8h
	sqabs	v31.8h, v0.8h
	sqabs	v0.8h, v31.8h
	sqabs	v0.4s, v0.4s
	sqabs	v31.4s, v0.4s
	sqabs	v0.4s, v31.4s
	sqabs	v0.2d, v0.2d
	sqabs	v31.2d, v0.2d
	sqabs	v0.2d, v31.2d

	cmgt	v0.8b, v0.8b, #0
	cmgt	v31.8b, v0.8b, #0
	cmgt	v0.8b, v31.8b, #0
	cmgt	v0.4h, v0.4h, #0
	cmgt	v31.4h, v0.4h, #0
	cmgt	v0.4h, v31.4h, #0
	cmgt	v0.2s, v0.2s, #0
	cmgt	v31.2s, v0.2s, #0
	cmgt	v0.2s, v31.2s, #0
	cmgt	v0.16b, v0.16b, #0
	cmgt	v31.16b, v0.16b, #0
	cmgt	v0.16b, v31.16b, #0
	cmgt	v0.8h, v0.8h, #0
	cmgt	v31.8h, v0.8h, #0
	cmgt	v0.8h, v31.8h, #0
	cmgt	v0.4s, v0.4s, #0
	cmgt	v31.4s, v0.4s, #0
	cmgt	v0.4s, v31.4s, #0
	cmgt	v0.2d, v0.2d, #0
	cmgt	v31.2d, v0.2d, #0
	cmgt	v0.2d, v31.2d, #0

	cmeq	v0.8b, v0.8b, #0
	cmeq	v31.8b, v0.8b, #0
	cmeq	v0.8b, v31.8b, #0
	cmeq	v0.4h, v0.4h, #0
	cmeq	v31.4h, v0.4h, #0
	cmeq	v0.4h, v31.4h, #0
	cmeq	v0.2s, v0.2s, #0
	cmeq	v31.2s, v0.2s, #0
	cmeq	v0.2s, v31.2s, #0
	cmeq	v0.16b, v0.16b, #0
	cmeq	v31.16b, v0.16b, #0
	cmeq	v0.16b, v31.16b, #0
	cmeq	v0.8h, v0.8h, #0
	cmeq	v31.8h, v0.8h, #0
	cmeq	v0.8h, v31.8h, #0
	cmeq	v0.4s, v0.4s, #0
	cmeq	v31.4s, v0.4s, #0
	cmeq	v0.4s, v31.4s, #0
	cmeq	v0.2d, v0.2d, #0
	cmeq	v31.2d, v0.2d, #0
	cmeq	v0.2d, v31.2d, #0

	cmlt	v0.8b, v0.8b, #0
	cmlt	v31.8b, v0.8b, #0
	cmlt	v0.8b, v31.8b, #0
	cmlt	v0.4h, v0.4h, #0
	cmlt	v31.4h, v0.4h, #0
	cmlt	v0.4h, v31.4h, #0
	cmlt	v0.2s, v0.2s, #0
	cmlt	v31.2s, v0.2s, #0
	cmlt	v0.2s, v31.2s, #0
	cmlt	v0.16b, v0.16b, #0
	cmlt	v31.16b, v0.16b, #0
	cmlt	v0.16b, v31.16b, #0
	cmlt	v0.8h, v0.8h, #0
	cmlt	v31.8h, v0.8h, #0
	cmlt	v0.8h, v31.8h, #0
	cmlt	v0.4s, v0.4s, #0
	cmlt	v31.4s, v0.4s, #0
	cmlt	v0.4s, v31.4s, #0
	cmlt	v0.2d, v0.2d, #0
	cmlt	v31.2d, v0.2d, #0
	cmlt	v0.2d, v31.2d, #0

	abs	v0.8b, v0.8b
	abs	v31.8b, v0.8b
	abs	v0.8b, v31.8b
	abs	v0.4h, v0.4h
	abs	v31.4h, v0.4h
	abs	v0.4h, v31.4h
	abs	v0.2s, v0.2s
	abs	v31.2s, v0.2s
	abs	v0.2s, v31.2s
	abs	v0.16b, v0.16b
	abs	v31.16b, v0.16b
	abs	v0.16b, v31.16b
	abs	v0.8h, v0.8h
	abs	v31.8h, v0.8h
	abs	v0.8h, v31.8h
	abs	v0.4s, v0.4s
	abs	v31.4s, v0.4s
	abs	v0.4s, v31.4s
	abs	v0.2d, v0.2d
	abs	v31.2d, v0.2d
	abs	v0.2d, v31.2d

	rev32	v0.8b, v0.8b
	rev32	v31.8b, v0.8b
	rev32	v0.8b, v31.8b
	rev32	v0.4h, v0.4h
	rev32	v31.4h, v0.4h
	rev32	v0.4h, v31.4h
	rev32	v0.16b, v0.16b
	rev32	v31.16b, v0.16b
	rev32	v0.16b, v31.16b
	rev32	v0.8h, v0.8h
	rev32	v31.8h, v0.8h
	rev32	v0.8h, v31.8h

	uaddlp	v0.4h, v0.8b
	uaddlp	v31.4h, v0.8b
	uaddlp	v0.4h, v31.8b
	uaddlp	v0.2s, v0.4h
	uaddlp	v31.2s, v0.4h
	uaddlp	v0.2s, v31.4h
	uaddlp	v0.1d, v0.2s
	uaddlp	v31.1d, v0.2s
	uaddlp	v0.1d, v31.2s
	uaddlp	v0.8h, v0.16b
	uaddlp	v31.8h, v0.16b
	uaddlp	v0.8h, v31.16b
	uaddlp	v0.4s, v0.8h
	uaddlp	v31.4s, v0.8h
	uaddlp	v0.4s, v31.8h
	uaddlp	v0.2d, v0.4s
	uaddlp	v31.2d, v0.4s
	uaddlp	v0.2d, v31.4s

	usqadd	v0.8b, v0.8b
	usqadd	v31.8b, v0.8b
	usqadd	v0.8b, v31.8b
	usqadd	v0.4h, v0.4h
	usqadd	v31.4h, v0.4h
	usqadd	v0.4h, v31.4h
	usqadd	v0.2s, v0.2s
	usqadd	v31.2s, v0.2s
	usqadd	v0.2s, v31.2s
	usqadd	v0.16b, v0.16b
	usqadd	v31.16b, v0.16b
	usqadd	v0.16b, v31.16b
	usqadd	v0.8h, v0.8h
	usqadd	v31.8h, v0.8h
	usqadd	v0.8h, v31.8h
	usqadd	v0.4s, v0.4s
	usqadd	v31.4s, v0.4s
	usqadd	v0.4s, v31.4s
	usqadd	v0.2d, v0.2d
	usqadd	v31.2d, v0.2d
	usqadd	v0.2d, v31.2d

	clz	v0.8b, v0.8b
	clz	v31.8b, v0.8b
	clz	v0.8b, v31.8b
	clz	v0.4h, v0.4h
	clz	v31.4h, v0.4h
	clz	v0.4h, v31.4h
	clz	v0.2s, v0.2s
	clz	v31.2s, v0.2s
	clz	v0.2s, v31.2s
	clz	v0.16b, v0.16b
	clz	v31.16b, v0.16b
	clz	v0.16b, v31.16b
	clz	v0.8h, v0.8h
	clz	v31.8h, v0.8h
	clz	v0.8h, v31.8h
	clz	v0.4s, v0.4s
	clz	v31.4s, v0.4s
	clz	v0.4s, v31.4s

	not	v0.8b, v0.8b
	not	v31.8b, v0.8b
	not	v0.8b, v31.8b
	not	v0.16b, v0.16b
	not	v31.16b, v0.16b
	not	v0.16b, v31.16b

	mvn	v0.8b, v0.8b
	mvn	v31.8b, v0.8b
	mvn	v0.8b, v31.8b
	mvn	v0.16b, v0.16b
	mvn	v31.16b, v0.16b
	mvn	v0.16b, v31.16b

	rbit	v0.8b, v0.8b
	rbit	v31.8b, v0.8b
	rbit	v0.8b, v31.8b
	rbit	v0.16b, v0.16b
	rbit	v31.16b, v0.16b
	rbit	v0.16b, v31.16b

	uadalp	v0.4h, v0.8b
	uadalp	v31.4h, v0.8b
	uadalp	v0.4h, v31.8b
	uadalp	v0.2s, v0.4h
	uadalp	v31.2s, v0.4h
	uadalp	v0.2s, v31.4h
	uadalp	v0.1d, v0.2s
	uadalp	v31.1d, v0.2s
	uadalp	v0.1d, v31.2s
	uadalp	v0.8h, v0.16b
	uadalp	v31.8h, v0.16b
	uadalp	v0.8h, v31.16b
	uadalp	v0.4s, v0.8h
	uadalp	v31.4s, v0.8h
	uadalp	v0.4s, v31.8h
	uadalp	v0.2d, v0.4s
	uadalp	v31.2d, v0.4s
	uadalp	v0.2d, v31.4s

	sqneg	v0.8b, v0.8b
	sqneg	v31.8b, v0.8b
	sqneg	v0.8b, v31.8b
	sqneg	v0.4h, v0.4h
	sqneg	v31.4h, v0.4h
	sqneg	v0.4h, v31.4h
	sqneg	v0.2s, v0.2s
	sqneg	v31.2s, v0.2s
	sqneg	v0.2s, v31.2s
	sqneg	v0.16b, v0.16b
	sqneg	v31.16b, v0.16b
	sqneg	v0.16b, v31.16b
	sqneg	v0.8h, v0.8h
	sqneg	v31.8h, v0.8h
	sqneg	v0.8h, v31.8h
	sqneg	v0.4s, v0.4s
	sqneg	v31.4s, v0.4s
	sqneg	v0.4s, v31.4s
	sqneg	v0.2d, v0.2d
	sqneg	v31.2d, v0.2d
	sqneg	v0.2d, v31.2d

	cmge	v0.8b, v0.8b, #0
	cmge	v31.8b, v0.8b, #0
	cmge	v0.8b, v31.8b, #0
	cmge	v0.4h, v0.4h, #0
	cmge	v31.4h, v0.4h, #0
	cmge	v0.4h, v31.4h, #0
	cmge	v0.2s, v0.2s, #0
	cmge	v31.2s, v0.2s, #0
	cmge	v0.2s, v31.2s, #0
	cmge	v0.16b, v0.16b, #0
	cmge	v31.16b, v0.16b, #0
	cmge	v0.16b, v31.16b, #0
	cmge	v0.8h, v0.8h, #0
	cmge	v31.8h, v0.8h, #0
	cmge	v0.8h, v31.8h, #0
	cmge	v0.4s, v0.4s, #0
	cmge	v31.4s, v0.4s, #0
	cmge	v0.4s, v31.4s, #0
	cmge	v0.2d, v0.2d, #0
	cmge	v31.2d, v0.2d, #0
	cmge	v0.2d, v31.2d, #0

	cmle	v0.8b, v0.8b, #0
	cmle	v31.8b, v0.8b, #0
	cmle	v0.8b, v31.8b, #0
	cmle	v0.4h, v0.4h, #0
	cmle	v31.4h, v0.4h, #0
	cmle	v0.4h, v31.4h, #0
	cmle	v0.2s, v0.2s, #0
	cmle	v31.2s, v0.2s, #0
	cmle	v0.2s, v31.2s, #0
	cmle	v0.16b, v0.16b, #0
	cmle	v31.16b, v0.16b, #0
	cmle	v0.16b, v31.16b, #0
	cmle	v0.8h, v0.8h, #0
	cmle	v31.8h, v0.8h, #0
	cmle	v0.8h, v31.8h, #0
	cmle	v0.4s, v0.4s, #0
	cmle	v31.4s, v0.4s, #0
	cmle	v0.4s, v31.4s, #0
	cmle	v0.2d, v0.2d, #0
	cmle	v31.2d, v0.2d, #0
	cmle	v0.2d, v31.2d, #0

	neg	v0.8b, v0.8b
	neg	v31.8b, v0.8b
	neg	v0.8b, v31.8b
	neg	v0.4h, v0.4h
	neg	v31.4h, v0.4h
	neg	v0.4h, v31.4h
	neg	v0.2s, v0.2s
	neg	v31.2s, v0.2s
	neg	v0.2s, v31.2s
	neg	v0.16b, v0.16b
	neg	v31.16b, v0.16b
	neg	v0.16b, v31.16b
	neg	v0.8h, v0.8h
	neg	v31.8h, v0.8h
	neg	v0.8h, v31.8h
	neg	v0.4s, v0.4s
	neg	v31.4s, v0.4s
	neg	v0.4s, v31.4s
	neg	v0.2d, v0.2d
	neg	v31.2d, v0.2d
	neg	v0.2d, v31.2d
