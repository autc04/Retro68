SECTIONS {
	. = SIZEOF_HEADERS;
	.text : {
		*(.text)
	}
	.data : {
		_data_start = .;
		*(.data)
	}
	.note.gnu.build-id (NOLOAD) : { *(.note.gnu.build-id) }
	/DISCARD/ : { *(*) }
}
