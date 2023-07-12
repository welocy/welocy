*&---------------------------------------------------------------------*
*& Report zot_15_hello_deneme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_hello_deneme.

DATA: a,b,c type i.
      a ='81'.
      b ='12'.
      c = a + b.

cl_demo_output=>write( c ).

c = a - b.
cl_demo_output=>write( c ).

BREAK otmyildiz.
cl_demo_output=>display(  ).
