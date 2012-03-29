#
# NAME:		test3
# DESCRIPTION:	create thousands of files
#
proc test3 {} {
    mkvol [expr 100 * 1024]	;# /usr/local/mirrors/image.hfs

    puts "Creating files..."

    for {set i 0} {$i < 25000} {incr i} {
	hcreate [format "f%x" $i]
    }
}
