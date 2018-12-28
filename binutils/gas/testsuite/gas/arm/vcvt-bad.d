#name: Invalid Immediate field for VCVT (between floating-point and fixed-point, VFP)  
#skip: *-*-pe *-*-wince
#error-output: vcvt-bad.l
#as: -mcpu=cortex-a8 -mfpu=vfpv3
