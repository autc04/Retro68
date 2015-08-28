# name: EABI attributes from command line
# source: blank.s
# as: -mcpu=cortex-a8 -mfpu=neon
# readelf: -A
# This test is only valid on EABI based ports.
# target: *-*-*eabi

Attribute Section: aeabi
File Attributes
  Tag_CPU_name: "CORTEX-A8"
  Tag_CPU_arch: v7
  Tag_CPU_arch_profile: Application
  Tag_ARM_ISA_use: Yes
  Tag_THUMB_ISA_use: Thumb-2
  Tag_VFP_arch: VFPv3
  Tag_Advanced_SIMD_arch: NEONv1
