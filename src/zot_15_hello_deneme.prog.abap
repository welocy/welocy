*&---------------------------------------------------------------------*
*& Report zot_15_hello_deneme
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_hello_deneme.

data lv_hello type char12 value 'Hello World!'.

write : lv_hello.

*cl_demo_output=>write_data( lv_hello ).
*cl_demo_output=>display(  ).
