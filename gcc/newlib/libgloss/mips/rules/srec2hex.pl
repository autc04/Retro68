#!/bin/env perl

# Copyright (C) 2018 MIPS Tech, LLC
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
# 3. Neither the name of the copyright holder nor the names of its
# contributors may be used to endorse or promote products derived from this
# software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
#  File: srec2hex.pl
#
#  Description:
#    This script converts an S-record file to a MIPS HEX file useful for
#    some simulation environments
# 
#  Usage:
#	srec2hex.pl -EL|-EB inputfile [outputfile]
#

use File::Basename;
use Cwd;

# Init global variables
$Endian = "";
$Debug = 0;
$Verbose = 0;
$IFile = "";
$IFH = "STDIN";
$OFile = "";
$OFH = "STDOUT";

# Parse command line for switches
$Errors = 0;
while (@ARGV && ($ARGV[0] =~ /^-./))		# Check for switches
{
    $ARGV[0] =~ /^-help$/ && ($Errors++, shift(@ARGV), next);
    $ARGV[0] =~ /^-verbose$/ && ($Verbose = 1, shift(@ARGV), next);
    $ARGV[0] =~ /^-EL$/ && ($Endian = $ARGV[0], shift(@ARGV), next);
    $ARGV[0] =~ /^-EB$/ && ($Endian = $ARGV[0], shift(@ARGV), next);
    print STDERR "\n$0: Unknown qualifier: $ARGV[0]\n";
    $Errors++;
    last;
}

$Errors++ if ($Endian eq "");
if ($#ARGV > 1) {
    $Errors++;
} else {
    $IFile = $ARGV[0] if ($#ARGV >= 0);
    $OFile = $ARGV[1] if ($#ARGV == 1);
    if ($IFile ne "") {
	if (! -f $IFile) {
	    print STDERR "\n$0: ERROR: Input file $IFile does not exist\n";
	    $Errors++;
	} else {
	    if (! open (IFILE, "< $IFile")) {
		printf "\n$0: ERROR: Failed to open input file $IFile - $!\n";
		$Errors++;
	    }
	}
	$IFH = "IFILE";
    }
    if ($OFile ne "") {
	if (! open (OFILE, "> $OFile")) {
	    printf "\n$0: ERROR: Failed to open output file $OFile - $!\n";
	    close(IFILE);
	    $Errors++;
	}
	$OFH = "OFILE";
    }
}

if ($Errors > 0) {
    $usage = 
"Usage: $0 -E{B|L} [qualifiers] [input-file] [[output-file]]
   -EB      Convert big-endian S-Record file
   -EL      Convert little-endian S-Record file
   -help    Output this message and exit
   -verbose Emit verbose messages
";
    printf STDERR $usage;
    exit(1);
}

printf $OFH "\# Endian %s\n", ($Endian eq "-EB") ? "Big" : "Little";

my $word = "";
my $start;
my $incr;

if ($Endian eq "-EL") {
    $start = 6;
    $incr = -2;
    $word = "00000000";
} else {
    $start = 0;
    $incr = 2;
}
my $byteno = $start;
my $tofill = 4;
my $waddr = "";
my $naddr = "";

while (<$IFH>) {
    my $line = $_;
    my $dbindex;
    my $addr;
    my $datablock;
    chomp $line;

    last if $line =~ /^S[7-9]/ ;
    next if $line =~ /^S0/ || $line =~ /^S[4-6]/ ;

    my $reclen = hex(substr $line, 2, 2);

    if ( $line =~ /^S1/ ) {
	$addr = hex(substr $line, 4, 4);
	$datablock = substr $line, 8;
	$reclen -= 2;
    } elsif ( $line =~ /^S2/ ) {
	$addr = hex(substr $line, 4, 6);
	$datablock = substr $line, 10;
	$reclen -= 3;
    } elsif ( $line =~ /^S3/ ) {
	$addr = hex(substr $line, 4, 8);
	$datablock = substr $line, 12;
	$reclen -= 4;
    } else {
	printf STDERR "Bad s-record found: %s\n", $line;
	exit(1);
    }
    $dbindex = 0;
    # snip checksum byte
    $reclen -= 1;

    unless ($addr == $naddr) {
	if ($tofill != 4) {
	    while ($tofill--) {
		substr($word, $byteno, 2) = "00";
		$byteno += $incr;
	    }
	    $word =~ tr/A-Z/a-z/;
	    printf $OFH "%x %s\n", $waddr / 4, $word;
	    $tofill = 4;
	    $byteno = $start;
	    $waddr = $waddr+4;
	}
	if (($addr & 0x3) != 0) {
	    $naddr = $addr & ~0x3;
	    $byteno = $start;
	    $tofill = 4;
	    while($naddr != $addr) {
		substr($word, $byteno, 2) = "00";
		$byteno += $incr;
		$naddr += 1;
		$tofill -=1;
	    }
	}
    }
    $naddr = $addr;
    $waddr = $naddr;
    while($reclen > 0) {
        substr ($word, $byteno, 2) = substr ($datablock, $dbindex, 2);
	$byteno += $incr;
	$dbindex += 2;
	$tofill -=1;
	if ($tofill == 0) {
	    $word =~ tr/A-Z/a-z/;
	    printf $OFH "%x %s\n", $waddr / 4, $word;
	    $byteno = $start;
	    $tofill = 4;
	    $waddr = $waddr+4;
	}
	$reclen = $reclen - 1;
	$naddr = $naddr + 1;
    }
}
