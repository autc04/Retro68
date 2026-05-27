.macro imply string base=i xlen=32
.option push
.option arch, rv\xlen\base\string
nop
.option pop
.endm

.text
imply ,g
imply ,e
imply ,i
imply ,i2p0

imply zicntr
imply zihpm

imply m

imply zabha
imply zacas
imply a

imply xsfvcp
imply xsfvqmaccqoq
imply xsfvqmaccdod
imply xsfvfnrclipxfqf

imply xtheadvector
imply xtheadzvamo

imply v
imply zvfh
imply zvfhmin
imply zvfbfwma
imply zvfbfmin
imply zve64d
imply zve64f
imply zve32f
imply zve64x
imply zve32x
imply zve32x_zvl65536b
imply zve32x_zvl32768b
imply zve32x_zvl16384b
imply zve32x_zvl8192b
imply zve32x_zvl4096b
imply zve32x_zvl2048b
imply zve32x_zvl1024b
imply zve32x_zvl512b
imply zve32x_zvl256b
imply zve32x_zvl128b
imply zve32x_zvl64b

imply zicfilp
imply zicfiss

imply sha

imply shcounterenw
imply shgatpa
imply shtvala
imply shvsatpa
imply shvstvala
imply shvstvecd
imply h
imply zhinx
imply zhinxmin

imply zcd
imply zcf

imply q
imply zqinx

imply d
imply zdinx

imply zfa
imply zfbfmin
imply zfh
imply zfhmin
imply zfinx
imply f

imply zce,if,32
imply zce,if,64
imply zce,id,32
imply zce,id,64
imply zce
imply zcb
imply zcmp
imply zcmop
imply zcmt
imply c,if,32
imply c,if,64
imply c,id,32
imply c,id,64
imply c

imply b

imply zk
imply zkn
imply zks
imply zvbb
imply zvkng
imply zvknc
imply zvkn
imply zvksg
imply zvksc
imply zvks

imply sdtrig

imply smaia
imply smcdeleg
imply smcsrind
imply smcntrpmf
imply smrnmi
imply smstateen
imply smepmp
imply smdbltrp

imply ssaia
imply ssccfg
imply sscsrind
imply sscofpmf
imply sscounterenw
imply ssstateen
imply ssstrict
imply sstc
imply sstvala
imply sstvecd
imply ssu64xl
imply ssdbltrp

imply svade
imply svadu
imply svbare
