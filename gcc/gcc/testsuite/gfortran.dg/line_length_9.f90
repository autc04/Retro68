! { dg-do compile }
! { dg-options "-std=f2018 -Wall" }
!
! By default, for free-form source code: Error out
! Even with -Wall, we still get an error
!
      print *, 1                                                                                                                                          + 2 ! { dg-error "Line truncated at .1." }
      end
! { dg-prune-output "some warnings being treated as errors" }
