foo:
.option push
.option arch, rv32i
	tail foo
.option pop
.option push
.option arch, rv32i_zicfilp
	tail foo
.option pop
