#name: Accepted v8-a with ARMv8.1 AdvSIMD.
#as: -march=armv8-a+simd
#objdump: -dr
#skip: *-*-pe *-*-wince
#source: armv8-a+rdma.s
#error-output: armv8-a+rdma.l