#source: start.s
#ld: --build-id -T pr32787.t
#nm: -n
# The following targets don't support --build-id.
#xfail: [uses_genelf]

#...
.* start
#pass
