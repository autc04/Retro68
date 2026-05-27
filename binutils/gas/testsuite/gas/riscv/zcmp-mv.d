#as: -march=rv64i_zcmp
#source: zcmp-mv.s
#objdump: -dr -Mno-aliases

.*:[	 ]+file format .*


Disassembly of section .text:

0+000 <target>:
[	 ]*[0-9a-f]+:[	 ]+ac7e[	 ]+cm.mva01s[	 ]+s0,s7
[	 ]*[0-9a-f]+:[	 ]+ac7a[	 ]+cm.mva01s[	 ]+s0,s6
[	 ]*[0-9a-f]+:[	 ]+acfe[	 ]+cm.mva01s[	 ]+s1,s7
[	 ]*[0-9a-f]+:[	 ]+acfa[	 ]+cm.mva01s[	 ]+s1,s6
[	 ]*[0-9a-f]+:[	 ]+afee[	 ]+cm.mva01s[	 ]+s7,s3
[	 ]*[0-9a-f]+:[	 ]+ade2[	 ]+cm.mva01s[	 ]+s3,s0
[	 ]*[0-9a-f]+:[	 ]+aef2[	 ]+cm.mva01s[	 ]+s5,s4
[	 ]*[0-9a-f]+:[	 ]+aefa[	 ]+cm.mva01s[	 ]+s5,s6
[	 ]*[0-9a-f]+:[	 ]+afa2[	 ]+cm.mvsa01[	 ]+s7,s0
[	 ]*[0-9a-f]+:[	 ]+af22[	 ]+cm.mvsa01[	 ]+s6,s0
[	 ]*[0-9a-f]+:[	 ]+afa6[	 ]+cm.mvsa01[	 ]+s7,s1
[	 ]*[0-9a-f]+:[	 ]+af26[	 ]+cm.mvsa01[	 ]+s6,s1
[	 ]*[0-9a-f]+:[	 ]+adbe[	 ]+cm.mvsa01[	 ]+s3,s7
[	 ]*[0-9a-f]+:[	 ]+ada2[	 ]+cm.mvsa01[	 ]+s3,s0
[	 ]*[0-9a-f]+:[	 ]+aeb2[	 ]+cm.mvsa01[	 ]+s5,s4
[	 ]*[0-9a-f]+:[	 ]+aeba[	 ]+cm.mvsa01[	 ]+s5,s6
