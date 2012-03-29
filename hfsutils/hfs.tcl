#
# hfsutils - tools for reading and writing Macintosh HFS volumes
# Copyright (C) 1996-1998 Robert Leslie
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# $Id: hfs.tcl,v 1.9 1998/08/31 04:27:18 rob Exp $
#

proc ctime {secs} {
    return [clock format $secs -format "%c"]
}

proc getvol {var} {
    global curvol
    upvar $var vol

    if {! [info exists curvol]} {
	error "no volume is current"
    }

    set vol $curvol
}

proc hinfo {} {
    getvol vol

    if {[$vol islocked]} {
	set locked " (locked)"
    } else {
	set locked ""
    }

    puts stdout "Volume name is \"[$vol vname]\"$locked"
    puts stdout "Volume was created on [ctime [$vol crdate]]"
    puts stdout "Volume was last modified on [ctime [$vol mddate]]"
    puts stdout "Volume has [lindex [$vol size] 1] bytes free"
}

proc hmount {path {partno ""}} {
    global mounts curpath curvol

    set nparts [hfs nparts $path]
    if {$nparts >= 0} {
	puts stdout [concat "$path contains $nparts HFS"  \
		[ternary {$nparts == 1} "partition" "partitions"]]
    }

    if {[string length $partno] == 0} {
	if {$nparts > 0} {
	    puts stderr "partition unspecified; selecting number 1"
	    set partno 1
	} elseif {$nparts == -1} {
	    set partno 0
	} else {
	    set partno 1
	}
    }

    set vol [hfs mount $path $partno]

    if {[info exists mounts($path)]} {
	humount $path
    }

    set curpath $path
    set curvol $vol
    set mounts($path) $vol

    hinfo
}

proc humount {{path {}}} {
    global mounts curpath curvol

    if {[string length $path] == 0} {
	if {! [info exists curpath]} {
	    error "no volume is current"
	}

	set path $curpath
    } elseif {! [info exists mounts($path)]} {
	error "$path not mounted"
    }

    set vol $mounts($path)
    unset mounts($path)

    if {[string compare $vol $curvol] == 0} {
	unset curpath
	unset curvol
    }

    $vol umount
}

proc hvol {name} {
    global mounts curpath curvol

    if {[info exists mounts($name)]} {
	set curpath $name
	set curvol $mounts($name)
	return
    }

    error "unknown volume"
}

proc hpwd {} {
    getvol vol

    return "[join [$vol path] ":"]:"
}

proc hcd {{path ""}} {
    getvol vol

    set globbed [$vol glob [list $path]]
    if {[llength $globbed] != 1} {
	error "$path: ambiguous path"
    }
    set path [lindex $globbed 0]

    if {[string length $path] == 0} {
	set path "[$vol vname]:"
    }

    $vol cd $path
}

proc timestr {secs} {
    set ctime [ctime $secs]

    return "[string range $ctime 4 15][string range $ctime 19 23]"
}

proc ternary {test true false} {
    if {[uplevel expr $test]} {
	return $true
    } else {
	return $false
    }
}

proc hdir {{path ":"}} {
    getvol vol

    set globbed [$vol glob [list $path]]
    if {[llength $globbed] != 1} {
	error "$path: ambiguous path"
    }
    set path [lindex $globbed 0]

    foreach ent [$vol dir $path] {
	array set item $ent

	if {$item(kind) == "directory"} {
	    puts stdout [format "d%s %9lu item%s               %s %s"  \
		    [ternary {[lsearch $item(flags) "invis"] >= 0} "i" " "]  \
		    $item(size)  \
		    [ternary {$item(size) == 1} " " "s"]  \
		    [timestr $item(mddate)]  \
		    $item(name)]
	} else {
	    puts stdout [format "%s%s %4s/%4s %9lu %9lu %s %s"  \
		    [ternary {[lsearch $item(flags) "locked"] >= 0} "F" "f"]  \
		    [ternary {[lsearch $item(flags) "invis"] >= 0} "i" " "]  \
		    $item(type)  \
		    $item(creator)  \
		    $item(rsize)  \
		    $item(dsize)  \
		    [timestr $item(mddate)]  \
		    $item(name)]
	}
    }
}

proc hstat {{path ":"}} {
    getvol vol

    set globbed [$vol glob [list $path]]
    if {[llength $globbed] != 1} {
	error "$path: ambiguous path"
    }
    set path [lindex $globbed 0]

    array set item [$vol stat $path]

    foreach elt [lsort [array names item]] {
	if {[regexp {date$} $elt]} {
	    set value [ctime $item($elt)]
	} else {
	    set value $item($elt)
	}

	puts stdout [format "%-10s %s" "$elt:" $value]
    }
}

proc hmkdir {args} {
    getvol vol

    foreach arg [$vol glob $args] {
	$vol mkdir $arg
    }
}

proc hrmdir {args} {
    getvol vol

    foreach arg [$vol glob $args] {
	$vol rmdir $arg
    }
}

proc hcreate {path {type "TEXT"} {creator "UNIX"}} {
    getvol vol

    set file [$vol create $path $type $creator]
    $file close
}

proc htouch {args} {
    getvol vol

    foreach arg [$vol glob $args] {
	if [catch {$vol touch $arg}] {
	    hcreate $arg
	}
    }
}

proc hdel {args} {
    getvol vol

    foreach arg [$vol glob $args] {
	$vol delete $arg
    }
}

proc hrename {src dst} {
    getvol vol

    set globbed [$vol glob [list $src]]
    if {[llength $globbed] != 1} {
	error "$src: ambiguous path"
    }
    set src [lindex $globbed 0]

    $vol rename $src $dst
}

proc hbless {path} {
    getvol vol

    set globbed [$vol glob [list $path]]
    if {[llength $globbed] != 1} {
	error "$path: ambiguous path"
    }
    set path [lindex $globbed 0]

    $vol bless $path
}

proc hcat {path} {
    getvol vol

    set globbed [$vol glob [list $path]]
    if {[llength $globbed] != 1} {
	error "$path: ambiguous path"
    }
    set path [lindex $globbed 0]

    set file [$vol open $path]

    while {1} {
	set buf [$file read 512]
	if {[string length $buf] == 0} {
	    $file close
	    break
	}

	regsub -all "\r" $buf "\n" buf

	puts -nonewline stdout $buf
    }
}

proc hcopyout {path {dest "."} {mode ""}} {
    getvol vol

    set globbed [$vol glob [list $path]]
    if {[llength $globbed] != 1} {
	error "$path: ambiguous path"
    }
    set path [lindex $globbed 0]

    if {[string length $mode] == 0} {
	array set item [$vol stat $path]

	if {$item(kind) == "directory"} {
	    error "can't copy whole directories"
	} elseif {[regexp {^TEXT|ttro$} $item(type)]} {
	    set mode text
	} else {
	    set mode macb
	}
    }

    $vol copyout $mode $path $dest
}

proc hcopyin {path {dest ":"} {mode ""}} {
    getvol vol

    set globbed [$vol glob [list $path]]
    if {[llength $globbed] != 1} {
	error "$path: ambiguous path"
    }
    set path [lindex $globbed 0]

    if {[string length $mode] == 0} {
	if {[regexp {\.bin$} $path]} {
	    set mode macb
	} elseif {[regexp {\.hqx$} $path]} {
	    set mode binh
	} elseif {[regexp {\.(txt|c|h)$} $path]} {
	    set mode text
	} elseif {[regexp {\.(sit|sea|cpt|tar|gz|Z|gif|jpg)$} $path]} {
	    set mode raw
	} elseif {[catch {exec file -L $path} type] == 0 &&  \
		[regexp {text} $type]} {
	    set mode text
	} else {
	    set mode raw
	}
    }

    $vol copyin $mode $path $dest
}

proc hformat {path {partno 0} {vname "Untitled"} {badblocks {}}} {
    global mounts

    if {[info exists mounts($path)]} {
	humount $path
    }

    hfs format $path $partno $vname $badblocks

    hmount $path $partno
}

###############################################################################

proc help {{what ""}} {
    if {[string length $what]} {
	if {[catch {info args h$what} msg]} {
	    puts stdout "Sorry, no help for \"$what\""
	} else {
	    puts stdout "$what $msg"
	}
    } else {
	puts stdout {
info		Show current volume information
mount		Open a new HFS volume
umount		Close an HFS volume
vol		Select an open volume
pwd		Show the current working directory path
cd		Change the current working directory
dir		Show a directory listing
stat		Show details about a given path
mkdir		Create a new directory
rmdir		Delete an empty directory
create		Create an empty file
touch		Update modification date or create a file
del		Delete a file
rename		Rename a file, directory, or volume
cat		Display file's data fork contents
copyout		Copy a complete file out into the native filesystem
copyin		Copy a MacBinary/BinHex/text/raw file into HFS
format		Create an empty HFS volume
}
    }
}

proc ? {args} {
    eval help $args
}

###############################################################################

proc version {} {
    puts stdout "[hfs version] - [hfs copyright]"
}

proc license {} {
    puts -nonewline stdout "\n[hfs license]"
}

proc author {} {
    puts stdout [hfs author]
}

if {[string compare [lindex $argv 0] "--license"] == 0} {
    license
    exit
}

version

if {[string compare [lindex $argv 0] "--version"] == 0} {
    puts stdout "`$argv0 --license' for licensing information."
    exit
}

puts stdout "This is free software but comes with ABSOLUTELY NO WARRANTY."
if {$hfs_interactive} {
    puts stdout "Type `license' for details."
}
puts stdout ""

###############################################################################

proc echo {args} {
    puts stdout [join $args " "]
}

proc quit {} {
    exit
}

###############################################################################

# Apparently some shells don't grok "$@" correctly
if {$argc == 1 && [string length [lindex $argv 0]] == 0} {
    incr argc -1
    set argv [lreplace $argv 0 0]
}

if {$argc > 0} {
    eval hmount $argv
}

while {1} {
    if {$hfs_interactive} {
	puts -nonewline stdout "hfs> "
	flush stdout
    }

    if {[gets stdin line] == -1} {
	exit
    }

    while {! [info complete $line]} {
	if {[gets stdin more] == -1} {
	    break
	} else {
	    set line "$line$more"
	}
    }

    if {[string length [info procs "h[lindex $line 0]"]] > 0} {
	set result [catch {eval h$line} msg]
    } else {
	set result [catch {eval $line} msg]
    }

    if {[string length $msg] > 0} {
	if {$result == 1} {
	    puts stdout "Error: $msg"
	    if {! $hfs_interactive} {
		exit 1
	    }
	} else {
	    puts stdout $msg
	}
    }
}
