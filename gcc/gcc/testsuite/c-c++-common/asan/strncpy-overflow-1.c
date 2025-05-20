/* { dg-do run } */
/* { dg-options "-fno-builtin-malloc -fno-builtin-strncpy" } */
/* { dg-additional-options "-D_FORTIFY_SOURCE=0 -gdwarf-3" { target *-*-darwin* } } */
/* { dg-shouldfail "asan" } */

#include <string.h>
#include <stdlib.h>
int main(int argc, char **argv) {
  char *hello = (char*)malloc(6);
  strcpy(hello, "hello");
  char *short_buffer = (char*)malloc(9);
  strncpy(short_buffer, hello, 10);  /* BOOM */
  return short_buffer[8];
}

/* { dg-output "WRITE of size \[0-9\]* at 0x\[0-9a-f\]+ thread T0\[^\n\r]*(\n|\r\n|\r)" } */
/* { dg-output "    #0 0x\[0-9a-f\]+ +(in _*(interceptor_|wrap_|)strncpy|\[(\])\[^\n\r]*(\n|\r\n|\r)" } */
/* { dg-output "    #1 0x\[0-9a-f\]+ +(in _*main (\[^\n\r]*strncpy-overflow-1.c:12|\[^\n\r]*:0|\[^\n\r]*\\+0x\[0-9a-z\]*)|\[(\]).*(\n|\r\n|\r)" } */
/* { dg-output "\[^\n\r]*0x\[0-9a-f\]+ is located 0 bytes after 9-byte region\[^\n\r]*(\n|\r\n|\r)" } */
/* { dg-output "\[^\n\r]*allocated by thread T0 here:\[^\n\r]*(\n|\r\n|\r)" } */
/* { dg-output "    #0 0x\[0-9a-f\]+ +(in _*(interceptor_|wrap_|)malloc|\[(\])\[^\n\r]*(\n|\r\n|\r)" } */
/* { dg-output "    #1 0x\[0-9a-f\]+ +(in _*main (\[^\n\r]*strncpy-overflow-1.c:11|\[^\n\r]*:0|\[^\n\r]*\\+0x\[0-9a-z\]*)|\[(\])\[^\n\r]*(\n|\r\n|\r)" } */
