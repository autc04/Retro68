ldd: # local define default
call36 ldd # ldd

ldh: # local define hidden
.hidden ldh
call36 ldh # ldh

gdd:
.global gdd # global define default
call36 gdd # gdd@plt

gdh:
.global gdh # global define hidden
.hidden gdh
call36 gdh # gdh

wdd:
.weak wdd # weak define default
call36 wdd # wdd@plt

.weak wud # weak undefine default
call36 wud # wud@plt

wdh:
.weak wdh # weak define hidden
.hidden wdh
call36 wdh # wdh

.weak wuh # weak undefine hidden
.hidden wuh
call36 wuh # wuh

