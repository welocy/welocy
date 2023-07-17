*&---------------------------------------------------------------------*
*& Report zot_15_p_zmn
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_zmn.

DATA gs_zaman type zot_15_t_zmn.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS s_index FOR gs_zaman-idi.
SELECTION-SCREEN END OF BLOCK b1.

DATA: lv_datediff TYPE p,
      lv_timediff TYPE p,
      lv_saniye   TYPE uzeit.

START-OF-SELECTION.

  SELECT idi,
         baslangict,
         baslangics,
         bitist,
         bitiss
  FROM zot_15_t_zmn
  WHERE idi IN @s_index
  INTO TABLE @DATA(lt_zaman).


LOOP AT lt_zaman INTO DATA(ls_zmn).

    CALL FUNCTION 'SD_DATETIME_DIFFERENCE'
      EXPORTING
        date1    = ls_zmn-baslangict
        time1    = ls_zmn-baslangics
        date2    = ls_zmn-bitist
        time2    = ls_zmn-bitiss
      IMPORTING
        datediff = lv_datediff
        timediff = lv_timediff.


    lv_saniye = ls_zmn-bitiss - ls_zmn-baslangics.

    DATA(lv_gun_diff) = ls_zmn-bitist - ls_zmn-baslangict.

    DATA(lv_yıl) = lv_datediff DIV 365.
    lv_datediff = lv_datediff MOD 365.


    DATA(lv_ay) = lv_datediff DIV 30.
    DATA(lv_gun) = lv_datediff MOD 30.

    WRITE: | { ls_zmn-idi } Id zaman farkı : |.

        IF lv_yıl NE 0.
           WRITE: |{ lv_yıl  } YIL|.
        ENDIF.

        IF lv_ay NE 0.
           WRITE: |{ lv_ay } AY|.
        ENDIF.

        IF lv_gun NE 0.
           WRITE: |{ lv_gun } GÜN|.
        ENDIF.

        IF lv_saniye NE 0.
           WRITE: |{ lv_saniye+0(2) } SAAT|.
        ENDIF.

        IF lv_saniye NE 0.
           WRITE: |{ lv_saniye+2(2) } DAKİKA|.
        ENDIF.

        IF lv_saniye NE 0.
           WRITE: |{ lv_saniye+4(2) } SANİYE|.
        ENDIF.

    NEW-LINE.

  ENDLOOP.
