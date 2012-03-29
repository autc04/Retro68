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
# $Id: xhfs.tcl,v 1.8 1998/04/11 08:27:01 rob Exp $
#

set tk_strictMotif 1

set gNormalFont	{-adobe-helvetica-bold-r-normal-*-*-120-*-*-p-*-iso8859-1}
set gThinFont	{-adobe-helvetica-medium-r-normal-*-*-120-*-*-p-*-iso8859-1}
set gSmallFont	{-adobe-helvetica-medium-r-normal-*-*-100-*-*-p-*-iso8859-1}
set gTypeFont	{-*-lucidatypewriter-medium-r-normal-*-*-120-*-*-m-*-iso8859-1}
set gTitleFont	{-*-lucida-bold-i-normal-*-*-250-*-*-p-*-iso8859-1}

set gDefaultDevice	/dev/fd0
set gLowFormatCmd	[list fdformat $gDefaultDevice]
set gMountSide		.l
set gFlushInterval	30000
set gDfCmd		[list df]

option add *Font $gNormalFont

###############################################################################

# Set architecture defaults

if {[catch {exec uname} gUname] == 0} {
    switch $gUname {
	SunOS {
	    if {[catch {exec uname -r} gUrelease] == 0} {
		switch -glob $gUrelease {
		    4.* {
			set gLowFormatCmd [list fdformat -f /dev/rfd0]
		    }
		    5.* {
			set gDefaultDevice /vol/dev/aliases/floppy0
			set gLowFormatCmd [list fdformat -f $gDefaultDevice]
			set gDfCmd [list df -k]
		    }
		}
	    }
	}

	FreeBSD {
	    set gDefaultDevice /dev/rfd0
	    set gLowFormatCmd [list fdformat $gDefaultDevice]
	}
    }
}

###############################################################################

set gUnique 0

proc unique {} {
    global gUnique

    return [incr gUnique]
}

proc window {title iconname} {
    set w ".w[unique]"

    toplevel $w -cursor left_ptr -relief raised -bd 1
    wm title $w $title
    wm iconname $w $iconname
    wm transient $w .

    wm withdraw $w

    return $w
}

proc showwindow {w} {
    update idletasks

    set x [expr [winfo x .] + [winfo width  .]/2 - [winfo reqwidth  $w]/2]
    set y [expr [winfo y .] + [winfo height .]/3 - [winfo reqheight $w]/3]

    wm geom $w +$x+$y
    wm deiconify $w
}

proc dialog {title cancel {ok ""} {default 0}} {
    set w ".d[unique]"

    toplevel $w -class Dialog -cursor left_ptr
    wm title $w $title
    wm transient $w .

    wm withdraw $w

    frame $w.top -relief raised -bd 1
    frame $w.bot -relief raised -bd 1
    pack $w.top -side top -expand 1 -fill both -ipadx 4m -ipady 4m
    pack $w.bot -side bottom -fill both -ipadx 2m -ipady 2m

    frame $w.bot.default -relief sunken -bd 1

    button $w.bot.cancel -width 6 -text $cancel  \
	    -command "set gAnswer 0; [list destroy $w]"
    if {[string length $ok] > 0} {
	button $w.bot.ok -width 6 -text $ok  \
		-command "set gAnswer 1; [list destroy $w]"
    }

    if {$default} {
	pack $w.bot.cancel -side left -expand 1;# -ipadx 2m -ipady 1m
	pack $w.bot.default -side left -expand 1 -ipadx 1m -ipady 1m
	pack $w.bot.ok -in $w.bot.default -expand 1;# -ipadx 2m -ipady 1m
	bind $w <Key-Return> [list $w.bot.ok invoke]
    } else {
	pack $w.bot.default -side left -expand 1 -ipadx 1m -ipady 1m
	pack $w.bot.cancel -in $w.bot.default -expand 1;# -ipadx 2m -ipady 1m
	if {[string length $ok] > 0} {
	    pack $w.bot.ok -side left -expand 1;# -ipadx 2m -ipady 1m
	}
	bind $w <Key-Return> [list $w.bot.cancel invoke]
    }

    return $w
}

proc showdialog {w} {
    showwindow $w
    grab set $w
}

proc alert {kind title text {aspect 100}} {
    global gThinFont

    set w [dialog $title "OK"]

    frame $w.top.x
    label $w.top.x.icon -bitmap $kind -anchor n
    frame $w.top.x.space -width 2m
    message $w.top.x.msg -aspect $aspect -font $gThinFont -text $text
    pack $w.top.x.icon $w.top.x.space $w.top.x.msg -side left -fill y

    pack $w.top.x -expand 1

    showdialog $w
    tkwait window $w
}

proc bgerror {error} {
    alert stop "Error" "Sorry, $error." 1000
    return -code break
}

proc fixtext {text} {
    regsub -all "(\[^\n])\n\[ \t]*(\[^\n])" $text {\1 \2} text
    regsub -all "(^|\n)\[ \t]+" $text {\1} text
    regsub "\n*\$" $text "" text

    return $text
}

proc copy_ufs_to_hfs {srcvol name mode dstvol} {
    $dstvol copyin $mode "[$srcvol cwd]/$name" :
}

proc copy_hfs_to_ufs {srcvol name mode dstvol} {
    $srcvol copyout $mode $name "[$dstvol cwd]/."
}

proc copy_hfs_to_hfs {srcvol name mode dstvol} {
    $srcvol copy $name $dstvol :
}

proc copy_ufs_to_ufs {srcvol name mode dstvol} {
    $srcvol copy $name "[$dstvol cwd]/."
}

proc copy_directory {srcvol name dstvol copyproc modeproc} {
    global gXMode

    set srccwd [abspath [$srcvol sepchar] [$srcvol path]]
    set dstcwd [abspath [$dstvol sepchar] [$dstvol path]]

    $dstvol mkdir $name
    $srcvol chdir $name
    $dstvol chdir $name

    foreach ind [$srcvol dir] {
	array set item $ind

	if {$item(kind) == "directory"} {
	    copy_directory $srcvol $item(name) $dstvol $copyproc $modeproc
	} else {
	    if {$gXMode == "auto"} {
		set mode [$modeproc $srcvol item]
	    } else {
		set mode $gXMode
	    }

	    $copyproc $srcvol $item(name) $mode $dstvol
	}
    }

    $srcvol chdir $srccwd
    $dstvol chdir $dstcwd
}

proc delete_directory {vol name} {
    set cwd [abspath [$vol sepchar] [$vol path]]

    $vol chdir $name

    foreach ind [$vol dir] {
	array set item $ind

	if {$item(kind) == "directory"} {
	    delete_directory $vol $item(name)
	} else {
	    $vol delete $item(name)
	}
    }

    $vol chdir $cwd
    $vol rmdir $name
}

proc do_open {side} {
    set box $side.mid.lb
    set sel [$box curselection]
    set ind [lindex $sel 0]

    global vol

    set name [$box get $ind]
    if {[regexp "(.*)[$vol($side) sepchar]\$" $name ignore name]} {
	mchdir $side $name
    } else {
	show_file $side $name
    }
}

proc do_copy {side other} {
    set box $side.mid.lb
    set sel [$box curselection]

    global gXMode gAskDelete gAnswer
    global fstype dir vol

    if {$side == ".l"} {
	set other ".r"
    } else {
	set other ".l"
    }

    set needupdate 0

    foreach ind $sel {
	array set item [lindex $dir($side) $ind]

	$box see $ind

	# if {$gAskDelete && [catch {$vol($other) stat $item(name)}] == 0} {
	    # set w [dialog "Overwrite" "Cancel" "OK"]

	    # frame $w.top.x
	    # label $w.top.x.icon -bitmap caution -anchor n
	    # frame $w.top.x.space -width 2m
	    # message $w.top.x.msg -font $gThinFont -aspect 500  \
		    # -text "Overwrite \"$item(name)\"?"
	    # pack $w.top.x.icon $w.top.x.space $w.top.x.msg -side left -fill y

	    # pack $w.top.x -expand 1

	    # showdialog $w
	    # tkwait window $w

	    # if {$gAnswer == 0} {
		# break
	    # }
	# }

	watch_cursor

	if {$item(kind) == "directory"} {
	    set update [after idle  \
		    "[list updatelist $side]; [list updatelist $other]"]

	    copy_directory $vol($side) $item(name) $vol($other)  \
		    copy_$fstype($side)_to_$fstype($other)  \
		    $fstype($side)_automode
	} else {
	    set update [after idle [list updatelist $other]]

	    if {$gXMode == "auto"} {
		set mode [$fstype($side)_automode $vol($side) item]
	    } else {
		set mode $gXMode
	    }

	    copy_$fstype($side)_to_$fstype($other)  \
		    $vol($side) $item(name) $mode $vol($other)
	}

	after cancel $update
	set needupdate 1

	$box selection clear $ind
    }

    if {$needupdate} {
	updatelist $other; clearlists
    }
}

proc do_info {side} {
    set box $side.mid.lb
    set sel [$box curselection]

    global vol dir

    foreach ind $sel {
	show_info $vol($side) [lindex $dir($side) $ind]
    }
}

proc do_rename {side} {
    global dir
    global gTypeFont

    set box $side.mid.lb
    set sel [$box curselection]
    array set item [lindex $dir($side) [lindex $sel 0]]

    set w [dialog "Rename" "Cancel" "Rename" 1]
    $w.bot.ok config -command [list rename2 $w $side]

    frame $w.top.x

    label $w.top.x.lbl -text "Rename \"$item(name)\" to:"
    label $w.top.x.srcname -text $item(name)
    entry $w.top.x.dstname -width 25 -font $gTypeFont -exportsel 0

    pack $w.top.x.lbl $w.top.x.dstname -side top -pady 0.5m
    pack $w.top.x -expand 1

    $w.top.x.dstname insert end $item(name)
    $w.top.x.dstname selection range 0 end

    focus $w.top.x.dstname
    showdialog $w
}

proc rename2 {w side} {
    global vol

    set srcname [$w.top.x.srcname cget -text]
    set dstname [$w.top.x.dstname get]

    watch_cursor $w
    destroy $w

    if {[string length $dstname] == 0} {
	error "cannot rename to zero-length name"
    }

    if {[string compare $srcname $dstname] != 0} {
	$vol($side) rename $srcname $dstname
	updatelist $side; clearlists
    }
}

proc do_delete {side} {
    set box $side.mid.lb
    set sel [$box curselection]

    global gThinFont gAskDelete gAnswer
    global vol dir

    set sepchar [$vol($side) sepchar]
    set needupdate 0

    foreach ind $sel {
	array set item [lindex $dir($side) $ind]

	$box see $ind

	set recursive [expr {$item(kind) == "directory" && $item(size) > 0}]

	if {$recursive || $gAskDelete} {
	    set w [dialog "Delete" "Cancel" "Delete"]

	    if {$recursive} {
		set p1 "Recursively delete \"$item(name)\""
		set p2 "containing $item(size) item[plural $item(size) "" "s"]"
		set prompt "$p1 $p2?"
	    } else {
		set prompt "Really delete \"$item(name)\"?"
	    }

	    frame $w.top.x
	    label $w.top.x.icon -bitmap caution -anchor n
	    frame $w.top.x.space -width 2m
	    message $w.top.x.msg -font $gThinFont -aspect 500 -text $prompt
	    pack $w.top.x.icon $w.top.x.space $w.top.x.msg -side left -fill y

	    pack $w.top.x -expand 1

	    showdialog $w
	    tkwait window $w

	    if {$gAnswer == 0} {
		break
	    }
	}

	watch_cursor
	set update [after idle "[list updatelist $side]; clearlists"]

	if {$item(kind) == "directory"} {
	    delete_directory $vol($side) $item(name)
	} else {
	    $vol($side) delete $item(name)
	}

	after cancel $update
	set needupdate 1

	$box selection clear $ind
    }

    if {$needupdate} {
	updatelist $side; clearlists
    }
}

proc format_disk {} {
    global gTypeFont gThinFont gLowFormatCmd gDefaultDevice

    set w [dialog "Format Disk" "Cancel" "Format"]
    $w.bot.ok config -command [list format2 $w]

    frame $w.top.x

    set low [frame $w.top.x.low]
    label $low.icon -bitmap floppy

    frame $low.info
    checkbutton $low.info.cb -var gLowFormat  \
	    -text "Low-level Format" -anchor w
    entry $low.info.cmd -width 26 -font $gTypeFont
    pack $low.info.cb $low.info.cmd -side top -fill x -pady 0.5m

    pack $low.icon $low.info -side left -padx 2m

    frame $w.top.x.space1 -height 2m

    label $w.top.x.hfs -text "Initialize as HFS Volume..." -anchor w

    set dev [frame $w.top.x.dev]
    label $dev.lbl -width 6 -text "Device:" -font $gThinFont -anchor w
    entry $dev.name -width 15 -font $gTypeFont
    label $dev.parlbl -text "Partition:" -font $gThinFont
    entry $dev.par -width 2 -font $gTypeFont
    pack $dev.lbl $dev.name $dev.parlbl $dev.par -side left -padx 0.5m

    set vol [frame $w.top.x.vol]
    label $vol.lbl -width 6 -text "Name:" -font $gThinFont -anchor w
    entry $vol.name -width 27 -font $gTypeFont
    pack $vol.lbl $vol.name -side left -padx 0.5m

    frame $w.top.x.space2 -height 2m

    set mount [frame $w.top.x.mount]
    label $mount.lbl -text "Open:" -font $gThinFont
    radiobutton $mount.l -var gMountSide -value ".l"  \
	    -text "On Left" -font $gThinFont
    radiobutton $mount.r -var gMountSide -value ".r"  \
	    -text "On Right" -font $gThinFont
    pack $mount.lbl $mount.l $mount.r -side left

    pack $low $w.top.x.space1 $w.top.x.hfs $dev $vol  \
	    -side top -fill x -pady 0.5m
    pack $w.top.x.space2 $mount -side top -pady 0.5m

    pack $w.top.x -expand 1

    $w.top.x.low.info.cmd insert end $gLowFormatCmd
    $w.top.x.dev.name insert end $gDefaultDevice
    $w.top.x.vol.name insert end "Untitled"

    # focus $w.top.x.dev.name
    showdialog $w
}

proc format2 {w} {
    global gAppCWD gLowFormat gLowFormatCmd gMountSide

    set gLowFormatCmd [$w.top.x.low.info.cmd get]

    set path [$w.top.x.dev.name get]
    set partno [$w.top.x.dev.par get]
    set vname [$w.top.x.vol.name get]

    if {[string length $partno] == 0} {
	set partno 0
    }

    watch_cursor $w
    destroy $w

    cd $gAppCWD

    if {$gLowFormat && [string length $gLowFormatCmd] > 0} {
	exec /bin/sh -c $gLowFormatCmd </dev/null >/dev/null
    }

    if {[string length $path] > 0} {
	hfs format $path $partno $vname
	mountdev $gMountSide $path
    }
}

proc help_about {} {
    global gThinFont gSmallFont gTitleFont

    set w [dialog "About" "OK"]

    set f [frame $w.top.t]

    regsub {\(C\)} [hfs copyright] "\251" copyright

    frame $f.banner
    label $f.banner.icon -bitmap macdaemon
    label $f.banner.title -text "xhfs" -font $gTitleFont
    pack $f.banner.icon $f.banner.title -side left -padx 2m

    frame $f.space -height 2m
    label $f.vers -text [hfs version] -font $gThinFont
    label $f.copy -text $copyright -font $gSmallFont
    label $f.auth -text [hfs author] -font $gSmallFont

    pack $f.banner $f.space $f.vers $f.copy $f.auth -side top
    pack $f -expand 1

    showdialog $w
}

proc help_license {} {
    alert note "Software License" [fixtext [hfs license]] 190
}

proc help_options {} {
    set text "\
	    Show All Files: Some files are normally hidden. To unhide\n\
	    invisible files on HFS volumes, or to unhide UNIX files which\n\
	    begin with a period, select this option.\n\n\
	    \
	    Ask Before Delete: To disable verification before deleting files\n\
	    and empty directories, deselect this option.\n\n\
	    \
	    Auto Mode Select: The transfer mode is normally selected\n\
	    automatically. To use manual selection, deselect this option.\n\n\
	    "

    alert note "Options" [fixtext $text] 150
}

proc help_modes {} {
    set text "\
	    MacBinary II: A popular format for binary file transfer. Both\n\
	    forks of the Macintosh file are preserved. This is the\n\
	    recommended mode for transferring arbitrary Macintosh files.\n\n\
	    \
	    BinHex: An alternative format for ASCII file transfer. Both\n\
	    forks of the Macintosh file are preserved.\n\n\
	    \
	    Text: Performs end-of-line translation. Only the data fork of\n\
	    the Macintosh file is copied.\n\n\
	    \
	    Raw Data: Performs no translation. Only the data fork of the\n\
	    Macintosh file is copied.\n\n\
	    \
	    Automatic: A mode will be chosen automatically for each\n\
	    file based on a set of predefined heuristics.\n\n\
	    "

    alert note "Transfer Modes" [fixtext $text]
}

proc hfs_automode {vol array} {
    upvar $array item

    if {$item(kind) == "directory"} {
	return auto
    } elseif {[regexp {^TEXT|ttro$} $item(type)]} {
	return text
    } elseif {$item(rsize) == 0} {
	return raw
    } else {
	return macb
    }
}

proc ufs_automode {vol array} {
    upvar $array item

    set name $item(name)

    if {$item(kind) == "directory"} {
	return auto
    } elseif {[regexp -nocase {\.bin$} $name]} {
	return macb
    } elseif {[regexp -nocase {\.hqx$} $name]} {
	return binh
    } elseif {[regexp -nocase {\.(txt|c|h|html?|rtf)$} $name]} {
	return text
    } elseif {[regexp -nocase {\.(sit|sea|cpt|tar|gz|Z|gif|jpg)$} $name]} {
	return raw
    } else {
	cd [$vol cwd]
	if {([catch {exec file -L $name} type] == 0 ||  \
		[catch {exec file $name} type] == 0) &&  \
		[regexp {text|commands} $type]} {
	    return text
	}

	return raw
    }
} 

proc watch_cursor {{w "."} {default "left_ptr"}} {
    $w config -cursor watch
    if {[string compare $w "."] != 0} {
	. config -cursor watch
    }
    update idletasks

    $w config -cursor $default
    if {[string compare $w "."] != 0} {
	. config -cursor left_ptr
    }
}

proc updatelist {side} {
    global gShowAllFiles
    global dir vol fstype

    set box $side.mid.lb
    $box delete 0 end

    if {! [info exists vol($side)]} {
	return
    }

    if {$fstype($side) == "hfs"} {
	set chartrans {nulltrans}	;# {hfs charlocal}
    } else {
	set chartrans {nulltrans}
    }

    set list [$vol($side) dir]
    set dir($side) {}

    set sepchar [$vol($side) sepchar]

    foreach ent $list {
	array set item $ent

	set name [eval $chartrans [list $item(name)]]

	if {$item(kind) == "directory"} {
	    set name "$name$sepchar"
	}

	if {$gShowAllFiles || [lsearch $item(flags) "invis"] < 0} {
	    $box insert end $name
	    lappend dir($side) $ent
	}
    }

    set m $side.mb.pop.m
    $m delete 0 end

    set path [$vol($side) path]
    set last 0

    foreach elt $path {
	set partial [abspath [$vol($side) sepchar] [lrange $path 0 $last]]
	incr last

	$m insert 0 command -label $elt -command [list mchdir $side $partial]
    }

    if {$fstype($side) == "hfs"} {
	set what "Folder"
    } else {
	set what "Directory"
    }

    foreach menuitem {
	{separator}
	{command -label "New $what..." -command [list mmkdir $side]}
    } {eval $m insert end $menuitem}

    global cwd
    set cwd($side) [lindex $path [expr [llength $path] - 1]]

    set avail [lindex [$vol($side) size] 1]

    $side.info.x.msg config -text "[size $avail] available"
}

proc clearlists {} {
    .l.mid.lb selection clear 0 end
    .r.mid.lb selection clear 0 end

    .m.1.ops.view config -state disabled -text "View"
    .m.1.ops.copy config -state disabled -text "Copy"

    .m.2.ops.info config -state disabled
    .m.2.ops.rena config -state disabled
    .m.2.ops.dele config -state disabled
}

proc mchdir {side path} {
    global vol

    watch_cursor

    $vol($side) chdir $path

    updatelist $side; clearlists
}

proc open_volume {side} {
    global gDefaultDevice gMountSide gTypeFont gThinFont

    set gMountSide $side

    set w [dialog "Open" "Cancel" "Open" 1]
    $w.bot.ok config -command [list open2 $w]

    frame $w.top.x

    set lbl1 [frame $w.top.x.lbl1]
    label $lbl1.path -text "Path to HFS Device"
    pack $lbl1.path

    set lbl2 [frame $w.top.x.lbl2]
    # label $lbl2.or -text "or"
    # label $lbl2.icon -bitmap sm_floppy
    label $lbl2.dev -text "or UNIX Directory:"
    pack $lbl2.dev -side left -padx 0.5m

    entry $w.top.x.entry -width 25 -font $gTypeFont

    frame $w.top.x.space -height 2m

    set mount [frame $w.top.x.mount]
    label $mount.lbl -text "Open:" -font $gThinFont
    radiobutton $mount.l -var gMountSide -value ".l"  \
	    -text "On Left" -font $gThinFont
    radiobutton $mount.r -var gMountSide -value ".r"  \
	    -text "On Right" -font $gThinFont
    pack $mount.lbl $mount.l $mount.r -side left

    pack $lbl1 $lbl2 $w.top.x.entry $w.top.x.space $mount  \
	    -side top -pady 0.5m

    pack $w.top.x -expand 1

    $w.top.x.entry insert end $gDefaultDevice
    $w.top.x.entry selection range 0 end

    focus $w.top.x.entry
    showdialog $w
}

proc open2 {w} {
    global gMountSide
    global vol

    set path [$w.top.x.entry get]

    watch_cursor $w
    destroy $w

    if {[string length $path] == 0} {
	error "missing path"
    }

    mountdev $gMountSide $path
}

proc close_volume {side} {
    global vol

    watch_cursor

    $vol($side) umount
    unset vol($side)

    pack forget $side.mb.pop $side.info.x.icon $side.info.x.lock
    $side.info.x.msg config -text ""

    $side.sub.open config -text "Open..." -command [list open_volume $side]
    $side.sub.info config -state disabled

    updatelist $side; clearlists
}

proc ctime {secs} {
    return [clock format $secs -format "%c"]
}

proc volume_info {side} {
    global gThinFont
    global vol dev fstype media

    set v $vol($side)

    if {$side == ".l"} {
	set eside "Left"
    } else {
	set eside "Right"
    }

    set w [window "$eside Info" "Info"]

    set locked [$v islocked]
    set icon $media($side)
    set vname [$v vname]

    if {$fstype($side) == "ufs"} {
	set ishfs 0
	set where [file dirname $vname]
	set vname [file tail $vname]
	set kind "UNIX Directory"
    } else {
	set ishfs 1
	set kind "HFS Volume"
	set where $dev($side)
	set crdate [$v crdate]
    }

    wm iconbitmap $w $icon
    wm iconmask $w ${icon}_mask

    frame $w.x
    pack $w.x -expand 1 -fill both -ipadx 4m -ipady 4m

    set f [frame $w.x.f]

    frame $f.name
    frame $f.name.space -width 5
    label $f.name.icon -bitmap $icon
    label $f.name.text -text $vname -font $gThinFont
    pack $f.name.space $f.name.icon $f.name.text -side left -padx 2m

    if {$locked} {
	label $f.name.lock -bitmap padlock
	pack $f.name.lock -side left
    }

    frame $f.space1 -height 4m

    frame $f.kind
    label $f.kind.lbl -width 9 -text "Kind: " -anchor e
    label $f.kind.val -text $kind -font $gThinFont
    pack $f.kind.lbl $f.kind.val -side left

    frame $f.size
    label $f.size.lbl -width 9 -text "Size: " -anchor e
    label $f.size.val -text [size [lindex [$v size] 0]] -font $gThinFont
    pack $f.size.lbl $f.size.val -side left

    frame $f.space2 -height 4m

    frame $f.where
    label $f.where.lbl -width 9 -text "Where: " -anchor e
    label $f.where.val -text $where -font $gThinFont
    pack $f.where.lbl $f.where.val -side left

    pack $f.name $f.space1 $f.kind $f.size $f.space2 $f.where -side top -fill x

    if {$ishfs} {
	frame $f.space3 -height 4m

	frame $f.cr
	label $f.cr.lbl -width 9 -text "Created: " -anchor e
	label $f.cr.val -text [ctime $crdate] -font $gThinFont
	pack $f.cr.lbl $f.cr.val -side left

	pack $f.space3 $f.cr -side top -fill x
    }

    frame $f.md
    label $f.md.lbl -width 9 -text "Modified: " -anchor e
    label $f.md.val -text [ctime [$v mddate]] -font $gThinFont
    pack $f.md.lbl $f.md.val -side left

    pack $f.md -side top -fill x

    pack $f -expand 1

    showwindow $w
}

proc mmkdir {side} {
    global gTypeFont
    global fstype

    if {$fstype($side) == "hfs"} {
	set what "folder"
	set title "New Folder"
    } else {
	set what "directory"
	set title "New Directory"
    }

    set w [dialog $title "Cancel" "Create" 1]
    $w.bot.ok config -command [list mmkdir2 $w $side $what]

    frame $w.top.x

    frame $w.top.x.lbl
    label $w.top.x.lbl.icon -bitmap sm_folder
    label $w.top.x.lbl.text -text "Name for new $what:"
    pack $w.top.x.lbl.icon $w.top.x.lbl.text -side left -padx 0.5m

    entry $w.top.x.entry -width 25 -font $gTypeFont -exportsel 0

    pack $w.top.x.lbl $w.top.x.entry -side top -pady 0.5m
    pack $w.top.x -expand 1

    $w.top.x.entry insert end "untitled $what"
    $w.top.x.entry selection range 0 end

    focus $w.top.x.entry
    showdialog $w
}

proc mmkdir2 {w side what} {
    global vol

    set name [$w.top.x.entry get]

    watch_cursor $w
    destroy $w

    if {[string length $name] == 0} {
	error "cannot create $what with empty name"
    }

    $vol($side) mkdir $name
    $vol($side) chdir $name

    updatelist $side; clearlists
}

proc plural {count single plural} {
    if {$count == 1} {
	return $single
    } else {
	return $plural
    }
}

proc nulltrans {str} {
    return $str
}

proc show_file {side fname} {
    global gTypeFont
    global vol fstype

    watch_cursor

    if {$fstype($side) == "hfs"} {
	set charset macroman
    } else {
	set charset latin1
    }

    # Make sure we can open the file before building the interface
    set fh [$vol($side) open $fname]

    set path [abspath [$vol($side) sepchar]  \
	    [concat [$vol($side) path] [list $fname]] 1]
    set w [window $path $fname]

    frame $w.x
    pack $w.x -expand 1 -fill both -padx 1m -pady 1m

    set f [frame $w.x.f]

    text $f.text -yscroll [list $f.scroll set]  \
	    -height 30 -width 80 -wrap word -font $gTypeFont
    scrollbar $f.scroll -orient vert -command [list $f.text yview]
    pack $f.scroll -side right -fill y
    pack $f.text -fill both -expand 1

    pack $f -fill both -expand 1

    watch_cursor $f.text xterm
    after idle "[list $f.text config -state disabled]; [list showwindow $w]"

    while {1} {
	set buf [$fh read 512]
	if {[string length $buf] == 0} {
	    $fh close
	    break
	}

	regsub -all "\r\n?" $buf "\n" buf

	$f.text insert end [hfs chartrans $charset latin1 $buf]
    }
}

proc commas {number} {
    while {[regexp  \
	    {([^,]+)(([0-9][0-9][0-9])(,[0-9][0-9][0-9])*([^0-9].*|$))}  \
	    $number ignore pre rest]} {
	set number "$pre,$rest"
    }

    return $number
}

proc size {bytes} {
    if {$bytes == -1} {
	return "unknown K"
    }

    set k 1024
    set mb [expr 1024 * $k]

    if {$bytes > $mb} {
	set q $mb
	set u "M"
    } else {
	set q $k
	set u "K"
    }

    set amount [commas [format "%.1f" [expr ${bytes}.0 / $q]]]

    regsub {\.0$} $amount "" amount
    regsub {^0$} $amount "zero " amount

    return "$amount$u"
}

proc show_info {vol list} {
    global gTypeFont gThinFont

    array set info $list

    set isdir [expr [string compare $info(kind) "directory"] == 0]
    set ishfs [info exists info(crdate)]

    if {$ishfs} {
	set chartrans {nulltrans}	;# {hfs charlocal}
    } else {
	set chartrans {nulltrans}
    }

    set name [eval $chartrans [list $info(name)]]
    set w [window "$name Info" $name]

    set icon "document"

    if {$isdir} {
	set icon "folder"

	if {$ishfs} {
	    set info(kind) "folder"
	}
    } else {
	if {$ishfs} {
	    if {[string compare $info(type) "APPL"] == 0} {
		set icon "application"
		set info(kind) "application"
	    } else {
		set info(kind) "document"
	    }
	} else {
	    cd [$vol cwd]
	    if {[file executable $info(name)]} {
		set icon "application"
	    }
	}
    }

    wm iconbitmap $w $icon
    wm iconmask $w ${icon}_mask

    if {$ishfs} {
	set where "[join [$vol path] ":"]:"
    } else {
	set where [$vol cwd]

	cd $where
	if {[catch {exec file $info(name)} type] == 0} {
	    if {[string first "$info(name):" $type] == 0} {
		set type [string range $type  \
			[expr [string length $info(name)] + 1] end]
	    }

	    regsub "^\[ \t]*" $type "" info(kind)
	}
    }

    frame $w.x
    pack $w.x -expand 1 -fill both -ipadx 4m -ipady 4m

    set f [frame $w.x.f]

    frame $f.name
    frame $f.name.space -width 5
    label $f.name.icon -bitmap $icon
    label $f.name.text -text $name -font $gThinFont
    pack $f.name.space $f.name.icon $f.name.text -side left -padx 2m

    if {[lsearch $info(flags) "locked"] >= 0} {
	label $f.name.lock -bitmap padlock
	pack $f.name.lock -side left
    }

    frame $f.space1 -height 4m

    frame $f.kind
    label $f.kind.lbl -width 9 -text "Kind: " -anchor e
    label $f.kind.val -text $info(kind) -font $gThinFont
    pack $f.kind.lbl $f.kind.val -side left

    set label "Size: "
    if {$isdir} {
	set label "Contains: "
	set size $info(size)
	set what [plural $size item items]
    } elseif {$ishfs} {
	set size [list $info(rsize) $info(dsize)]
	set what [list  \
		[plural $info(rsize) byte bytes]  \
		[plural $info(dsize) byte bytes]]
    } else {
	set size $info(size)
	set what [plural $size byte bytes]
    }

    frame $f.size

    if {[llength $size] == 1} {
	label $f.size.lbl -width 9 -text $label -anchor e
	label $f.size.val -text "[commas $size] $what" -font $gThinFont
	pack $f.size.lbl $f.size.val -side left
    } else {
	set rsize [lindex $size 0]
	set rwhat [lindex $what 0]
	set dsize [lindex $size 1]
	set dwhat [lindex $what 1]

	frame $f.size.r
	label $f.size.r.lbl -width 9 -text "Resource: " -anchor e
	label $f.size.r.val -text "[commas $rsize] $rwhat" -font $gThinFont
	pack $f.size.r.lbl $f.size.r.val -side left

	frame $f.size.d
	label $f.size.d.lbl -width 9 -text "Data: " -anchor e
	label $f.size.d.val -text "[commas $dsize] $dwhat" -font $gThinFont
	pack $f.size.d.lbl $f.size.d.val -side left

	pack $f.size.r $f.size.d -side top -fill x
    }

    frame $f.space2 -height 4m

    frame $f.where
    label $f.where.lbl -width 9 -text "Where: " -anchor e
    label $f.where.val -text $where -font $gThinFont
    pack $f.where.lbl $f.where.val -side left

    pack $f.name $f.space1 $f.kind $f.size $f.space2 $f.where -side top -fill x

    if {$ishfs && ! $isdir} {
	frame $f.space3 -height 4m

	frame $f.type
	label $f.type.lbl -width 9 -text "Type: " -anchor e
	label $f.type.val -text $info(type) -font $gTypeFont
	pack $f.type.lbl $f.type.val -side left

	frame $f.crea
	label $f.crea.lbl -width 9 -text "Creator: " -anchor e
	label $f.crea.val -text $info(creator) -font $gTypeFont
	pack $f.crea.lbl $f.crea.val -side left

	pack $f.space3 $f.type $f.crea -side top -fill x
    }

    if {$ishfs} {
	frame $f.space4 -height 4m

	frame $f.cr
	label $f.cr.lbl -width 9 -text "Created: " -anchor e
	label $f.cr.val -text [ctime $info(crdate)] -font $gThinFont
	pack $f.cr.lbl $f.cr.val -side left

	pack $f.space4 $f.cr -side top -fill x
    }

    frame $f.md
    label $f.md.lbl -width 9 -text "Modified: " -anchor e
    label $f.md.val -text [ctime $info(mddate)] -font $gThinFont
    pack $f.md.lbl $f.md.val -side left

    pack $f.md -side top -fill x

    pack $f -expand 1

    showwindow $w
}

proc abspath {sepchar path {asfile 0}} {
    switch $sepchar {
	":" {
	    if {$asfile} {
		return [join $path ":"]
	    } else {
		return "[join $path ":"]:"
	    }
	}

	"/" {
	    if {[string compare [lindex $path 0] "/"] == 0} {
		set path [lreplace $path 0 0 ""]
	    }

	    if {[llength $path] == 1 &&  \
		    [string length [lindex $path 0]] == 0} {
		return "/"
	    } else {
		return [join $path "/"]
	    }
	}
    }
}

proc ufs_handle {dir} {
    set handle "ufsvol[unique]"

    global ufsdir

    cd $dir
    set ufsdir($handle) [pwd]

    proc $handle {verb args} {
	set handle [lindex [info level [info level]] 0]
	global gAppCWD gDfCmd
	global ufsdir

	set cwd $ufsdir($handle)

	switch -glob $verb {
	    vname {
		return $cwd
	    }

	    umount {
		cd $gAppCWD

		unset ufsdir($handle)
		rename $handle ""
	    }

	    path {
		set path [split $cwd "/"]

		if {[string compare [lindex $path 0] ""] == 0} {
		    set path [lreplace $path 0 0 "/"]
		}

		if {[llength $path] == 2 &&  \
			[string length [lindex $path 1]] == 0} {
		    set path [lreplace $path 1 1]
		}

		return $path
	    }

	    dir {
		cd $cwd

		set list {}
		set files [lsort [glob .* *]]

		foreach name $files {
		    if {[string compare $name "."] == 0 ||  \
			    [string compare $name ".."] == 0} {
			continue
		    }

		    if {[catch {file stat $name stat}]} {
			continue
		    }

		    set kind [file type $name]
		    set mddate $stat(mtime)

		    if {[file isdirectory $name]} {
			set kind "directory"
			set size "?"
			catch {
			    set size [expr [llength  \
				    [glob $name/.* $name/*]] - 2]
			}
		    } elseif {$kind == "file"} {
			set size $stat(size)
		    } else {
			continue
		    }

		    set flags {}

		    if {! [file writable $name]} {
			lappend flags "locked"
		    }

		    if {[regexp {^\.} $name]} {
			lappend flags "invis"
		    }

		    lappend list [list  \
			    name $name  \
			    kind $kind  \
			    size $size  \
			    flags $flags  \
			    mddate $mddate]
		}

		return $list
	    }

	    chdir {
		set path [lindex $args 0]

		if {! [regexp {^/} $path]} {
		    cd $cwd
		}

		cd $path
		set ufsdir($handle) [pwd]
	    }

	    cwd {
		return $cwd
	    }

	    sepchar {
		return "/"
	    }

	    mkdir {
		set path [lindex $args 0]

		cd $cwd
		exec mkdir $path
	    }

	    rmdir {
		set path [lindex $args 0]

		cd $cwd
		exec rmdir $path
	    }

	    open {
		set path [lindex $args 0]

		cd $cwd
		set fh [open $path]

		proc $fh {verb args} {
		    set fh [lindex [info level [info level]] 0]

		    switch -glob $verb {
			read {
			    set len [lindex $args 0]

			    return [read $fh $len]
			}

			close {
			    close $fh
			    rename $fh ""
			}

			* {
			    error "unknown call to $fh $verb $args"
			}
		    }
		}

		return $fh
	    }

	    copy {
		set path [lindex $args 0]
		set dest [lindex $args 1]

		cd $cwd
		exec cp -f $path $dest
	    }

	    rename {
		set path [lindex $args 0]
		set dest [lindex $args 1]

		cd $cwd
		exec mv -f $path $dest
	    }

	    delete {
		set path [lindex $args 0]

		cd $cwd
		exec rm -f $path
	    }

	    size {
		if {[catch {eval exec [join $gDfCmd " "] [list $cwd]} info]} {
		    return [list -1 -1]
		}

		set s "\[ \t]+"
		set d "\[0-9]+"

		if {[catch {
		    regexp "(.*)\n(\[^\n]*)\$" $info ignore head data
		    regexp "${s}($d)$s$d${s}($d)" $data ignore size avail
		}]} {
		    return [list -1 -1]
		}

		set block 512
		if {[regexp -nocase {kbyte|1024} $head]} {
		    set block 1024
		}

		return [list [expr $size * $block] [expr $avail * $block]]
	    }

	    mddate {
		return [file mtime $cwd]
	    }

	    islocked {
		return 0
	    }

	    * {
		error "unknown call to $handle $verb $args"
	    }
	}
    }

    return $handle
}

proc ufs {verb args} {
    switch $verb {
	mount {
	    set dir [lindex $args 0]

	    return [ufs_handle $dir]
	}

	* {
	    error "bad arg 1 to ufs"
	}
    }
}

proc mountdev {side device} {
    global gAppCWD gXMode
    global vol dev fstype media

    if {[info exists vol($side)]} {
	$vol($side) umount
    }

    cd $gAppCWD

    if {! [file exists $device]} {
	error "can't open $device (no such file or directory)"
    }

    if {[file isdirectory $device]} {
	set type ufs
    } else {
	set type hfs
    }

    set v [$type mount $device]
    set fstype($side) $type
    set locked [$v islocked]

    if {$type == "ufs"} {
	set icon "folder"
    } else {
	set size [lindex [$v size] 0]

	if {$size <= [expr 1440 * 1024]} {
	    set icon "floppy"
	} elseif {$locked &&  \
		$size >= [expr 100 * 1024 * 1024] &&  \
		$size <= [expr 800 * 1024 * 1024]} {
	    set icon "cdrom"
	} else {
	    set icon "harddisk"
	}
    }

    $side.info.x.icon config -bitmap sm_$icon
    pack $side.info.x.icon -before $side.info.x.msg -side left -padx 0.5m

    if {$locked} {
	pack $side.info.x.lock -side left -padx 0.5m
    } else {
	pack forget $side.info.x.lock
    }

    pack $side.mb.pop

    $side.sub.open config -text "Close" -command [list close_volume $side]
    $side.sub.info config -state normal

    set vol($side) $v
    set dev($side) $device
    set media($side) $icon

    updatelist $side; clearlists

    if {$fstype(.l) == $fstype(.r)} {
	set state disabled
	set gXMode auto
    } else {
	set state normal
    }

    foreach mode {auto macb binh text raw} {
	.m.3.mode.$mode config -state $state
    }
}

proc flushtask {} {
    global gFlushInterval

    after $gFlushInterval flushtask

    watch_cursor
    hfs flushall
}

###############################################################################

# Apparently some versions of Tk don't grok this
if {$argc > 0 && [string compare [lindex $argv 0] "--"] == 0} {
    incr argc -1
    set argv [lreplace $argv 0 0]
}

if {[string compare [lindex $argv 0] "--license"] == 0} {
    puts -nonewline stdout "\n[hfs license]"
    exit
}

if {[string compare [lindex $argv 0] "--version"] == 0} {
    puts stdout "[hfs version] - [hfs copyright]"
    puts stdout "`$argv0 --license' for licensing information."
    exit
}

###############################################################################

# Build the user interface

proc makelist {w click other} {
    global gSmallFont

    frame $w

    frame $w.mb -height 30
    menubutton $w.mb.pop -textvariable cwd($w)  \
	    -indicatoron 1 -menu $w.mb.pop.m  \
	    -relief raised -bd 2 -padx 4p -pady 4p  \
	    -highlightthickness 2 -anchor c
    menu $w.mb.pop.m -tearoff 0

    frame $w.info -height 16
    pack propagate $w.info 0

    frame $w.info.x
    pack $w.info.x -expand 1

    label $w.info.x.icon
    label $w.info.x.msg -font $gSmallFont -text ""
    label $w.info.x.lock -bitmap padlock

    pack $w.info.x.msg -side left -padx 0.5m

    frame $w.mid -bd 0

    listbox $w.mid.lb -xscroll "$w.bot.sb set" -yscroll "$w.mid.sb set"  \
	    -exportselection 0 -height 16 -width 25 -selectmode extended
    scrollbar $w.mid.sb -orient vert -command [list $w.mid.lb yview]

    bind $w.mid.lb <Button-1> [list $other selection clear 0 end]
    bind $w.mid.lb <KeyPress> [list $other selection clear 0 end]
    bind $w.mid.lb <ButtonRelease-1> [list wclick $w $click]
    bind $w.mid.lb <KeyRelease> [list wclick $w $click]
    bind $w.mid.lb <Double-ButtonRelease-1> ".m.1.ops.view invoke"
    bind $w.mid.lb <Key-Return> ".m.1.ops.view invoke"

    pack $w.mid.sb -side right -fill y
    pack $w.mid.lb -side right -fill both -expand 1

    frame $w.bot

    scrollbar $w.bot.sb -orient horiz -command [list $w.mid.lb xview]
    frame $w.bot.c -height 24 -width 24

    # label $w.bot.c.icon
    # pack $w.bot.c.icon -expand 1
    # pack propagate $w.bot.c 0

    pack $w.bot.c -side right
    pack $w.bot.sb -side bottom -fill x

    frame $w.sub -relief sunken -bd 1

    frame $w.sub.space1 -width 1m
    button $w.sub.open -width 8 -text "Open..."  \
	    -command [list open_volume $w]
    button $w.sub.info -width 8 -text "Volume Info" -state disabled  \
	    -command [list volume_info $w]

    frame $w.sub.space2 -width 1m
    pack $w.sub.space1 -side left
    pack $w.sub.open $w.sub.info  \
	    -side left -pady 1m -padx 0.5m -fill x -expand 1
    pack $w.sub.space2 -side left

    frame $w.space -height 2m

    pack $w.space -side bottom
    pack $w.mb -side top
    pack $w.sub -side bottom -fill x -pady 1m -ipadx 2m
    pack $w.info $w.bot -side bottom -fill x
    pack $w.mid -side top -fill both -expand 1
}

proc wclick {side copytext} {
    set box $side.mid.lb
    set sel [$box curselection]

    global gXMode gAutoModeSelect
    global vol dir fstype

    if {$side == ".l"} {
	set other ".r"
    } else {
	set other ".l"
    }

    set cstate normal
    if {! [info exists vol($other)]} {
	set cstate disabled
    }

    if {[llength $sel] == 0} {
	.m.1.ops.view config -state disabled -text "View"
	.m.1.ops.copy config -state disabled -text "Copy"

	.m.2.ops.info config -state disabled
	.m.2.ops.rena config -state disabled
	.m.2.ops.dele config -state disabled
    } elseif {[llength $sel] == 1} {
	array set item [lindex $dir($side) [lindex $sel 0]]

	switch -glob $item(kind) {
	    directory {
		set viewtext "Open"
		set vstate normal
	    }

	    file {
		set viewtext "View"
		set mode [$fstype($side)_automode $vol($side) item]

		if {$mode == "text" || $mode == "binh"} {
		    set vstate normal
		} else {
		    set vstate disabled
		}
	    }
	}

	.m.1.ops.view config -state $vstate -text $viewtext  \
		-command [list do_open $side]
	.m.1.ops.copy config -state $cstate -text $copytext  \
		-command [list do_copy $side $other]

	.m.2.ops.info config -state normal -command [list do_info $side]
	.m.2.ops.rena config -state normal -command [list do_rename $side]
	.m.2.ops.dele config -state normal -command [list do_delete $side]

	if {$gAutoModeSelect &&  \
		[.m.3.mode.auto cget -state] != "disabled"} {
	    if {[info exists mode]} {
		set gXMode $mode
	    } else {
		set gXMode [$fstype($side)_automode $vol($side) item]
	    }
	}
    } else {
	.m.1.ops.view config -state disabled -text "View"
	.m.1.ops.copy config -state $cstate -text $copytext  \
		-command [list do_copy $side $other]

	.m.2.ops.info config -state normal -command [list do_info $side]
	.m.2.ops.rena config -state disabled
	.m.2.ops.dele config -state normal -command [list do_delete $side]

	if {$gAutoModeSelect &&  \
		[.m.3.mode.auto cget -state] != "disabled"} {
	    foreach ind $sel {
		array set item [lindex $dir($side) $ind]
		set auto [$fstype($side)_automode $vol($side) item]

		if {[info exists mode]} {
		    if {$mode != $auto} {
			set mode auto
			break
		    }
		} else {
		    set mode $auto
		}
	    }

	    set gXMode $mode
	}
    }
}


# Middle controls

frame .m

frame .m.1
frame .m.1.ops -relief sunken -bd 1
frame .m.1.ops.space1 -height 0.5m
button .m.1.ops.view -state disabled -text "View"
button .m.1.ops.copy -state disabled -text "Copy"
frame .m.1.ops.space2 -height 0.5m

pack  \
	.m.1.ops.space1  \
	.m.1.ops.view .m.1.ops.copy  \
	.m.1.ops.space2  \
	-side top -fill x -padx 1m -pady 0.5m
pack .m.1.ops -side top -fill x

frame .m.2
frame .m.2.ops -relief sunken -bd 1
frame .m.2.ops.space1 -height 0.5m
button .m.2.ops.info -state disabled -text "Get Info"
button .m.2.ops.rena -state disabled -text "Rename..."
button .m.2.ops.dele -state disabled -text "Delete"
frame .m.2.ops.space2 -height 0.5m

pack  \
	.m.2.ops.space1  \
	.m.2.ops.info .m.2.ops.rena .m.2.ops.dele  \
	.m.2.ops.space2  \
	-side top -fill x -padx 1m -pady 0.5m
pack .m.2.ops -side top -fill x

frame .m.3
label .m.3.l -text "Mode"
frame .m.3.mode -relief groove -bd 2

frame .m.3.mode.space1 -height 1m
radiobutton .m.3.mode.macb -font $gThinFont -text "MacBinary II"  \
	-var gXMode -value macb -anchor w
radiobutton .m.3.mode.binh -font $gThinFont -text "BinHex"  \
	-var gXMode -value binh -anchor w
radiobutton .m.3.mode.text -font $gThinFont -text "Text"  \
	-var gXMode -value text -anchor w
radiobutton .m.3.mode.raw -font $gThinFont -text "Raw Data"  \
	-var gXMode -value raw -anchor w
radiobutton .m.3.mode.auto -font $gThinFont -text "Automatic"  \
	-var gXMode -value auto -anchor w
frame .m.3.mode.space2 -height 1m

set gXMode auto

pack  \
	.m.3.mode.space1  \
	.m.3.mode.macb  \
	.m.3.mode.binh  \
	.m.3.mode.text  \
	.m.3.mode.raw  \
	.m.3.mode.auto  \
	.m.3.mode.space2  \
	-side top -fill x -padx 1m
pack .m.3.l .m.3.mode -side top -fill x

pack .m.1 .m.2 .m.3 -side top -fill x -padx 2m -pady 2m


# Menu bar

frame .mb -relief raised -bd 2
frame .mbpad -height 3m
menubutton .mb.file -text "File" -menu .mb.file.m
menubutton .mb.opts -text "Options" -menu .mb.opts.m
menubutton .mb.help -bitmap help -menu .mb.help.m

pack .mb.file .mb.opts -side left
pack .mb.help -side right -fill y -ipadx 2m

menu .mb.file.m -tearoff 0
foreach menuitem {
    {command -label "Open..." -command {open_volume $gMountSide}}
    {separator}
    {command -label "Format Disk..." -command "format_disk"}
    {command -label "Eject Disk" -command "hfs flushall; exec eject"}
    {separator}
    {command -label "Quit" -command "destroy ."}
} {eval .mb.file.m add $menuitem}

menu .mb.opts.m -tearoff 0
foreach menuitem {
    {checkbutton -label "Show All Files" -variable gShowAllFiles  \
	    -command "watch_cursor; updatelist .l; updatelist .r; clearlists"}
    {separator}
    {checkbutton -label "Ask Before Delete" -variable gAskDelete}
    {checkbutton -label "Auto Mode Select" -variable gAutoModeSelect}
} {eval .mb.opts.m add $menuitem}

set gAutoModeSelect 1
set gAskDelete 1

menu .mb.help.m -tearoff 0
foreach menuitem {
    {command -label "About" -command "help_about"}
    {command -label "Software License" -command "help_license"}
    {separator}
    {command -label "Options" -command "help_options"}
    {command -label "Transfer Modes" -command "help_modes"}
} {eval .mb.help.m add $menuitem}


# Put it together

makelist .l ">> Copy >>" .r.mid.lb
makelist .r "<< Copy <<" .l.mid.lb

rename makelist ""

pack .mb .mbpad -side top -fill x
pack .l -side left -fill both -expand 1 -padx 3m
pack .r -side right -fill both -expand 1 -padx 3m
pack .m -side left

wm title . "Macintosh HFS Volume Browser"

wm iconbitmap . macdaemon
wm iconmask . macdaemon_mask
wm iconname . "HFS Browser"

. config -cursor left_ptr

###############################################################################

tk appname xhfs

set gAppCWD [pwd]

set fstype(.l) none
set fstype(.r) none

if {$argc > 2} {
    puts stderr "Usage: $argv0 \[left-vol \[right-vol]]"
    exit 1
}

if {$argc > 0} {
    mountdev .l [lindex $argv 0]

    if {$argc > 1} {
	mountdev .r [lindex $argv 1]
    }
}

if {$argc < 2} {
    mountdev .r .
}

after $gFlushInterval flushtask
