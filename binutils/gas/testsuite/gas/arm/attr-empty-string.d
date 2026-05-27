# name: EABI attribute - empy string
# source: attr-empty-string.s
# as:
# readelf: -T -A
# This test is only valid on EABI based ports.
# target: *-*-*eabi*

Attribute Section: aeabi
File Attributes
  Tag_CPU_raw_name: ""
