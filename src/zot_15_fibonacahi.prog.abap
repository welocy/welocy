*&---------------------------------------------------------------------*
*& Report zot_15_fibonacahi
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_fibonacahi.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_maknum TYPE numc5 OBLIGATORY,
              p_kirnum TYPE numc1 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

data gv_oncekisayi  type int4 value 1.
data gv_simdikisayi type int4 value 2.
data gv_sonrakisayi type int4.

write: gv_oncekisayi, gv_simdikisayi.

      do p_kirnum - 2 TIMES.
       gv_sonrakisayi = gv_oncekisayi + gv_simdikisayi.
       write gv_sonrakisayi.
       gv_oncekisayi = gv_simdikisayi.
       gv_simdikisayi = gv_sonrakisayi.
      enddo.

write /.

 do.

      if gv_sonrakisayi gt p_maknum.
      exit.
      elseif gv_oncekisayi gt p_maknum.
      exit.

      elseif gv_simdikisayi gt p_maknum.
      exit.

      else.


      do p_kirnum times.



      gv_sonrakisayi = gv_oncekisayi + gv_simdikisayi.
      if gv_sonrakisayi gt p_maknum.
      exit.
      elseif gv_oncekisayi gt p_maknum.
      exit.

      elseif gv_simdikisayi gt p_maknum.
      exit.
      else.
      write gv_sonrakisayi.


      gv_oncekisayi = gv_simdikisayi.
      gv_simdikisayi = gv_sonrakisayi.
      endif.



      enddo.

    write /.

      endif.


enddo.
