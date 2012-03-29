#
# NAME:		test2
# DESCRIPTION:	create hundreds of files and directories
#
proc test2 {} {
    global curvol

    set block [block]

    mkvol

    puts "Creating files and directories..."

    foreach dir {one two three four five six seven eight nine ten} {
	puts -nonewline [format "%6s: " $dir]

	hmkdir $dir
	hcd $dir

	foreach subdir {a b c d e f g h i j} {
	    puts -nonewline "$subdir "
	    flush stdout

	    hmkdir "$dir/$subdir"
	    hcd "$dir/$subdir"

	    foreach subsubdir {1 2 3 4 5 6 7 8 9 10} {
		hmkdir "$dir/$subdir/$subsubdir"

		set fname ":$dir/$subdir/$subsubdir:$dir/$subdir/$subsubdir/File"

		set fd [$curvol create $fname "TEXT" "UNIX"]
		$fd write $block
		$fd close
	    }

	    hcd ::
	}

	hcd ::

	puts ""
    }

    remount

    puts "Deleting files..."

    foreach dir {one two three four five six seven eight nine ten} {
	puts -nonewline [format "%6s: " $dir]

	hcd $dir

	foreach subdir {a b c d e f g h i j} {
	    puts -nonewline "$subdir "
	    flush stdout

	    hcd "$dir/$subdir"

	    foreach subsubdir {2 4 6 8 10} {
		hdel ":$dir/$subdir/$subsubdir:$dir/$subdir/$subsubdir/File"
		# hrmdir "$dir/$subdir/$subsubdir"
	    }

	    hcd ::
	    # hrmdir "$dir/$subdir"
	}

	hcd ::
	# hrmdir $dir

	puts ""
    }
}
