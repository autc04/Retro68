#
# NAME:		test1
# DESCRIPTION:	fragment two files to excess
#
proc test1 {} {
    global curvol

    set block [block]
    set max 250

    mkvol

    puts "Creating files..."

    set file1 "Foo"
    set file2 "Bar"

    hcreate $file1
    hcreate $file2

    puts "Fragmenting files..."

    set count 0

    for {set i 0} {$i < $max} {incr i} {
	set len [string length "$i "]

	if {[expr $count + $len] > 79} {
	    puts ""
	    set count 0
	}

	puts -nonewline "$i "
	flush stdout
	incr count $len

	set file [$curvol open $file1]

	$file fork data
	$file seek 0 end
	$file write $block

	$file fork rsrc
	$file seek 0 end
	$file write $block

	$file close

	set file [$curvol open $file2]

	$file fork data
	$file seek 0 end
	$file write $block

	$file fork rsrc
	$file seek 0 end
	$file write $block

	$file close
    }

    puts ""

    remount

    puts "Comparing file data forks..."

    set fh1 [$curvol open $file1]
    set fh2 [$curvol open $file2]

    $fh1 fork data
    $fh2 fork data

    for {set i 0} {$i < $max} {incr i} {
	set data [$fh1 read [string length $block]]
	if {[string compare $data $block]} {
	    error "$fh1 ($file1) fork data block $i differs"
	}

	set data [$fh2 read [string length $block]]
	if {[string compare $data $block]} {
	    error "$fh2 ($file2) fork data block $i differs"
	}
    }

    if {[string length [$fh1 read 1]]} {
	error "$fh1 ($file1) bad data fork length"
    }
    if {[string length [$fh2 read 1]]} {
	error "$fh2 ($file2) bad data fork length"
    }

    puts "Comparing file resource forks..."

    $fh1 fork rsrc
    $fh2 fork rsrc

    for {set i 0} {$i < $max} {incr i} {
	set data [$fh1 read [string length $block]]
	if {[string compare $data $block]} {
	    error "$fh1 ($file1) fork rsrc block $i differs"
	}

	set data [$fh2 read [string length $block]]
	if {[string compare $data $block]} {
	    error "$fh2 ($file2) fork rsrc block $i differs"
	}
    }

    if {[string length [$fh1 read 1]]} {
	error "$fh1 ($file1) bad resource fork length"
    }
    if {[string length [$fh2 read 1]]} {
	error "$fh2 ($file2) bad resource fork length"
    }

    $fh1 close
    $fh2 close
}
