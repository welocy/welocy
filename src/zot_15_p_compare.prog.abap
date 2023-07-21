*&---------------------------------------------------------------------*
*& Report zot_15_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_compare.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_1 TYPE char6 OBLIGATORY ,
              p_2 TYPE char6 OBLIGATORY ,
              p_3 TYPE char6 OBLIGATORY ,
              p_4 TYPE char6 OBLIGATORY ,
              p_5 TYPE char6 OBLIGATORY .
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

data gv_count1 type n value 1.
data gv_count2 type n value 1.
data gv_count3 type n value 1.
data gv_count4 type n value 1.
data gv_count5 type n value 1.


   if p_1 co p_2 and p_2 co p_1.
     write : | { p_1 } ve { p_2 } aynı|.
     NEW-LINE.
   else.
     gv_count1 += 1.
     gv_count2 += 1.
   endif.

   if p_1 co p_3 and p_3 co p_1.
     write : | { p_1 } ve { p_3 } aynı|.
     NEW-LINE.
   else.
     gv_count1 += 1.
     gv_count3 += 1.
   endif.

   if p_1 co p_4 and p_4 co p_1.
     write : | { p_1 } ve { p_4 } aynı|.
     NEW-LINE.
   else.
     gv_count1 += 1.
     gv_count4 += 1.
   endif.

   if p_1 co p_5 and p_5 co p_1.
     write : | { p_1 } ve { p_5 } aynı|.
     NEW-LINE.
   else.
     gv_count1 += 1.
     gv_count5 += 1.
   endif.

   if p_2 co p_3 and p_3 co p_2.
     write : | { p_2 } ve { p_3 } aynı|.
     NEW-LINE.
   else.
     gv_count2 += 1.
     gv_count3 += 1.
   endif.

   if p_2 co p_4 and p_4 co p_2.
     write : | { p_2 } ve { p_4 } aynı|.
     NEW-LINE.
   else.
     gv_count2 += 1.
     gv_count4 += 1.
   endif.

   if p_2 co p_5 and p_5 co p_2.
    write : | { p_2 } ve { p_5 } aynı|.
NEW-LINE.
else.
gv_count2 += 1.
gv_count5 += 1.
endif.



if p_3 co p_4 and p_4 co p_3.
write : | { p_3 } ve { p_4 } aynı|.
NEW-LINE.
else.
gv_count4 += 1.
gv_count3 += 1.
endif.

if p_3 co p_5 and p_5 co p_3.
write : | { p_3 } ve { p_5 } aynı|.
NEW-LINE.
else.
gv_count3 += 1.
gv_count5 += 1.
endif.


if p_4 co p_5 and p_5 co p_4.
write : | { p_4 } ve { p_5 } aynı|.
NEW-LINE.
else.
gv_count4 += 1.
gv_count5 += 1.
endif.

if gv_count1 = 5.
 write : |{ p_1 } Hiç biriyle eş değil.|.
  gv_count1 = 1.
endif.

if gv_count2 = 5.
 write : |{ p_2 } Hiç biriyle eş değil.|.
  gv_count1 = 1.
endif.

if gv_count3 = 5.
 write : |{ p_3 } Hiç biriyle eş değil.|.
  gv_count1 = 1.
endif.

if gv_count4 = 5.
 write : |{ p_4 } Hiç biriyle eş değil.|.
  gv_count1 = 1.
endif.

if gv_count5 = 5.
 write : |{ p_5 } Hiç biriyle eş değil.|.
  gv_count5 = 1.
endif.
