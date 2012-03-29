#
# NAME:		block
# DESCRIPTION:	return a string of length 512 (size of one HFS block)
#
proc block {} {
    set block "0123456789abcdef"
    set block "$block$block$block$block"
    set block "$block$block$block$block"
    set block "$block$block"

    return $block
}

#
# NAME:		mkvol
# DESCRIPTION:	create an empty test volume and mount it
#
proc mkvol {{size 1440} {path "image.hfs"}} {
    catch {humount $path}

    puts "Zeroing $path (${size}K)..."
    catch {exec rm -f $path}
    catch {exec dd if=/dev/zero of=$path bs=1k count=$size} msg
    puts $msg

    puts "Formatting $path..."
    hformat $path 0 "Test Volume"
}

#
# NAME:		remount
# DESCRIPTION:	flush and remount a volume
#
proc remount {{path "image.hfs"}} {
    puts "Remounting $path..."

    humount $path
    hmount $path 0
}

foreach test [glob test*.tcl] {
    source $test
}
