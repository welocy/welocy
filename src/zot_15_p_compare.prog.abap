*&---------------------------------------------------------------------*
*& Report zot_15_p_compare
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_compare.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_1 TYPE char6 OBLIGATORY,
              p_2 TYPE char6 OBLIGATORY,
              p_3 TYPE char6 OBLIGATORY,
              p_4 TYPE char6 OBLIGATORY,
              p_5 TYPE char6 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

START-OF-SELECTION.

  DATA gv_count1 TYPE n VALUE 1.
  DATA gv_count2 TYPE n VALUE 1.
  DATA gv_count3 TYPE n VALUE 1.
  DATA gv_count4 TYPE n VALUE 1.
  DATA gv_count5 TYPE n VALUE 1.


  IF p_1 CO p_2 AND p_2 CO p_1.
    WRITE : | { p_1 } ve { p_2 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count1 += 1.
    gv_count2 += 1.
  ENDIF.

  IF p_1 CO p_3 AND p_3 CO p_1.
    WRITE : | { p_1 } ve { p_3 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count1 += 1.
    gv_count3 += 1.
  ENDIF.

  IF p_1 CO p_4 AND p_4 CO p_1.
    WRITE : | { p_1 } ve { p_4 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count1 += 1.
    gv_count4 += 1.
  ENDIF.

  IF p_1 CO p_5 AND p_5 CO p_1.
    WRITE : | { p_1 } ve { p_5 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count1 += 1.
    gv_count5 += 1.
  ENDIF.

  IF p_2 CO p_3 AND p_3 CO p_2.
    WRITE : | { p_2 } ve { p_3 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count2 += 1.
    gv_count3 += 1.
  ENDIF.

  IF p_2 CO p_4 AND p_4 CO p_2.
    WRITE : | { p_2 } ve { p_4 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count2 += 1.
    gv_count4 += 1.
  ENDIF.

  IF p_2 CO p_5 AND p_5 CO p_2.
    WRITE : | { p_2 } ve { p_5 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count2 += 1.
    gv_count5 += 1.
  ENDIF.



  IF p_3 CO p_4 AND p_4 CO p_3.
    WRITE : | { p_3 } ve { p_4 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count4 += 1.
    gv_count3 += 1.
  ENDIF.

  IF p_3 CO p_5 AND p_5 CO p_3.
    WRITE : | { p_3 } ve { p_5 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count3 += 1.
    gv_count5 += 1.
  ENDIF.


  IF p_4 CO p_5 AND p_5 CO p_4.
    WRITE : | { p_4 } ve { p_5 } aynı|.
    NEW-LINE.
  ELSE.
    gv_count4 += 1.
    gv_count5 += 1.
  ENDIF.

  IF gv_count1 = 5.
    WRITE : |{ p_1 } Hiç biriyle eş değil.|.
    gv_count1 = 1.
  ENDIF.

  IF gv_count2 = 5.
    WRITE : |{ p_2 } Hiç biriyle eş değil.|.
    gv_count1 = 1.
  ENDIF.

  IF gv_count3 = 5.
    WRITE : |{ p_3 } Hiç biriyle eş değil.|.
    gv_count1 = 1.
  ENDIF.

  IF gv_count4 = 5.
    WRITE : |{ p_4 } Hiç biriyle eş değil.|.
    gv_count1 = 1.
  ENDIF.

  IF gv_count5 = 5.
    WRITE : |{ p_5 } Hiç biriyle eş değil.|.
    gv_count5 = 1.
  ENDIF.
