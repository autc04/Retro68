MODULE longint6 ;

FROM libc IMPORT exit ;
FROM cbuiltin IMPORT sinl ;


PROCEDURE myfunc (x: LONGREAL) : LONGREAL ;
     VAR
	  y: LONGREAL ;
BEGIN
     y := sinl (x) ;
     RETURN y
END myfunc ;


PROCEDURE test ;
VAR
     res : LONGREAL ;
BEGIN
     res := myfunc (1.0)
END test ;

BEGIN
   test
END longint6.
