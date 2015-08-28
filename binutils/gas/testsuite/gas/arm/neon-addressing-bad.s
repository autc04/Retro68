.syntax unified

VLD1.8 {d0}, 1f
1:
VLD1.8 {D0}, R0
VLD1.8 {Q1}, R0
VLD1.8 {D0}, [PC]
VLD1.8 {D0}, [PC, #0]
VST1.8 {D0}, R0
VST1.8 {Q1}, R0
VST1.8 {D0}, [PC]
VST1.8 {D0}, [PC, #0]
VST1.8 {D0[]}, [R0]
VST2.8 {D0[], D2[]}, [R0]
VST3.16 {D0[], D1[], D2[]}, [R0]
VST4.32 {D0[], D1[], D2[], D3[]}, [R0]
VLD1.8 {Q0}, [R0, #8]
VLD1.8 {Q0}, [R0, #8]!
VLD1.8 {Q0}, [R0, R1]
VLD1.8 {Q0}, [R0, R1]!
.thumb
VLD1.8 {d0}, 2f
2:
VLD1.8 {D0}, R0
VLD1.8 {Q1}, R0
VLD1.8 {D0}, [PC]
VLD1.8 {D0}, [PC, #0]
VST1.8 {D0}, R0
VST1.8 {Q1}, R0
VST1.8 {D0}, [PC]
VST1.8 {D0}, [PC, #0]
