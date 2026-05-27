#source: farcall-missing-type-main.s
#source: farcall-missing-type-bad.s
#as:
#ld:-T farcall-missing-type.ld
#error: .* .*/farcall-missing-type-bad.o\(bad\): Unknown destination type \(ARM/Thumb\) in .*/farcall-missing-type-main.o
