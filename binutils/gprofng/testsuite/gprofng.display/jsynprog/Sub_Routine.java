/* Copyright (c) 2006, 2012, Oracle and/or its affiliates. All rights reserved.
** @(#)Sub_Routine.java 1.4 10/03/24 SMI
** This is subclass of Routine , overrides one method
*/

public class Sub_Routine extends Routine {
    private static native double cTimer();

   /*
    ** Calls another method c() many times, overridden methos
    */
   public int add_int(int scale) {
	int w = 0;
	int kmax = 100*scale;
        if (scale == 1) {
           kmax /= 100;
        }
	double tEnd = jsynprog.Timer() + jsynprog.testtime;
	do { w = 0;
	for (int k=0 ; k<kmax; k++) {
	    w = addcall(w) + 1;
	}
	} while (jsynprog.Timer() < tEnd);
	return w;
   }

   private static int addcall(int x) {
	int jmax = 100;
        int imax = 10;
	for (int j=0; j<jmax;j++) {
            for (int i=0; i<imax; i++) {
	        x = (i%2==0)?x:(x + 1);
            }
	}
	return x;
   }

   public int naptime(int k, int scale)
   {
	int i;
	int imax = k * scale;

	try {
	    for (i = 0; i < imax; i++) {
		System.out.println(i + " sleeping");
		Thread.currentThread().sleep(10);
		i=i+1;  
	    }
	} catch (InterruptedException e) {e.printStackTrace();}
	System.out.println("In naptime");
	return 0;
   }

}
