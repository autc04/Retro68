# name: EABI attribute - non-null terminated string
# source: attr-non-null-terminated-string.s
# This test is only valid on EABI based ports.
# target: *-*-*eabi*
# as:
# readelf: --silent-truncation -A
Attribute Section: aeabi
File Attributes
  Tag_CPU_raw_name: "ab<corrupt string tag>"
