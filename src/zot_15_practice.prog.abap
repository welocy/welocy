*&---------------------------------------------------------------------*
*& Report zot_15_practice
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_practice.



*
** SELECT * Kullanımı
*
*SELECT * FROM sflight
*INTO TABLE @DATA(lt_SFLIGHT_all).
*
*SELECT carrid,
*       connid,
*       fldate,
*       price
*       FROM sflight
*       INTO TABLE @DATA(lt_SFLIGHT).
*
*LOOP AT lt_SFLIGHT INTO DATA(ls_SFLIGHT) WHERE carrid = 'AA'.
*ENDLOOP.
*
*SELECT carrid,
*       connid
*       FROM sflight
*       INTO TABLE @DATA(lt_SFLIGHT_2)
*       WHERE carrid = 'AA'.
*
*
** SELECT SINGLE kullanımı
*
*TYPES: BEGIN OF ty_matnr,
*         matnr TYPE mara-matnr,
*         maktx TYPE makt-maktx,
*       END OF ty_matnr.
*
*DATA: lt_matnr TYPE TABLE OF ty_matnr.
*
*SELECT matnr FROM mara
*INTO TABLE lt_matnr.
*
*
*LOOP AT lt_matnr INTO DATA(ls_matnr).
*  SELECT SINGLE maktx FROM makt
*  INTO ls_matnr-maktx
*  WHERE matnr = ls_matnr-matnr.
**      AND spras = sy-langu.
*ENDLOOP.
*
**sort lt_matnr BY matnr maktx.
*
*LOOP AT lt_matnr ASSIGNING FIELD-SYMBOL(<ls_matnr>).
**  SELECT SINGLE maktx FROM makt
**  INTO <ls_matnr>-maktx
**  WHERE matnr = <ls_matnr>-matnr.
***      AND spras = sy-langu.
**
*ENDLOOP.
*
*IF lt_matnr IS NOT INITIAL.
*
*  SELECT matnr,
*         maktx
*  FROM makt
*  FOR ALL ENTRIES IN @lt_matnr
*  WHERE matnr = @lt_matnr-matnr
*  INTO TABLE @DATA(lt_maktx).
*ENDIF.
*
*SORT lt_maktx BY matnr.
*
*LOOP AT lt_matnr ASSIGNING <ls_matnr>.
*
*  READ TABLE lt_maktx ASSIGNING FIELD-SYMBOL(<ls_maktx>) WITH KEY matnr = <ls_matnr>-matnr BINARY SEARCH.
*  IF sy-subrc = 0.
*    <ls_matnr>-maktx = <ls_maktx>-maktx.
*  ENDIF.
*ENDLOOP.
*
*SELECT mara~matnr, makt~maktx FROM mara
*INNER JOIN makt
*on makt~matnr = mara~matnr
*INTO TABLE @DATA(lt_maktx_last).
*
*BREAK-POINT.

*SELECT SINGLE COUNT(*) FROM mara
*WHERE matnr = '000000000000001390'.
*IF sy-subrc = 0.
*  "*********
*ENDIF..

*
*     TYPES: BEGIN OF ty_sflight,
*             CARRID   TYPE sflight-CARRID,
*             CONNID   type sflight-CONNID,
*             FLDATE   TYPE sflight-FLDATE,
*             PRICE    TYPE sflight-PRICE,
*             SEATSMAX TYPE sflight-SEATSMAX,
*             SEATSMAX_F TYPE sflight-SEATSMAX_F,
*             SEATSOCC_F TYPE sflight-SEATSOCC_F,
*             END OF TY_SFLIGHT.
**DATA: LT_sflight_INTO TYPE TABLE OF sflight.
*DATA: LT_sflight_INTO TYPE TABLE OF TY_SFLIGHT.
*
*
**      SELECT CARRID,
**             CONNID,
**             FLDATE,
**             PRICE,
**             SEATSMAX,
**             SEATSMAX_F,
**             SEATSOCC_F
**             FROM sflight
***             INTO CORRESPONDING FIELDS OF table @LT_sflight_INTO.
***             INTO TABLE @data(LT_sflight_into_2).
**             INTO TABLE @LT_sflight_INTO.
*
*      SELECT CARRID,
*             CONNID,
*             FLDATE,
*             PRICE,
*             SEATSMAX,
*             SEATSMAX_F,
*             SEATSOCC_F FROM sflight
*      INTO TABLE @data(lt_sflight_3)
*      WHERE SEATSMAX gt 350.
*
*      SELECT CARRID,
*             CONNID,
*             FLDATE,
*             PRICE,
*             SEATSMAX,
*             SEATSMAX_F,
*             SEATSOCC_F FROM sflight
*      INTO TABLE @data(lt_sflight_4)
*      WHERE SEATSMAX le 350.
*
*      move lt_sflight_3 to LT_sflight_INTO.
*      APPEND LINES OF lt_sflight_4 to LT_sflight_INTO.
*
