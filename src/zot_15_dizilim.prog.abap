*&---------------------------------------------------------------------*
*& Report zot_15_dizilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_dizilim.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_maknum TYPE i OBLIGATORY,
              p_kirnum TYPE i OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

data gv_sayi type i value 1.
data gv_kirnumcarpan type i value 1.

if p_maknum gt 100.
write: '100 sayısından küçük bir sayı giriniz. '.
else.

WHILE gv_sayi LE p_maknum.

   if gv_sayi LE p_kirnum * gv_kirnumcarpan.

     write : gv_sayi .

   gv_sayi = gv_sayi + 1.
   else.

     write /.
     gv_kirnumcarpan = gv_kirnumcarpan + 1.
   endif.

ENDWHILE.

endif.
