*&---------------------------------------------------------------------*
*& Report zot_15_sip_kirilim
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_sip_kirilim.

TABLES: vbak, vbap.

TYPES: BEGIN OF lty_main,
         vbak  TYPE vbak-vbeln,
         kunnr TYPE vbak-kunnr,
         auart TYPE vbak-auart,
         audat TYPE vbak-audat,
         matnr TYPE vbap-matnr,
         matkl TYPE vbap-matkl,
         charg TYPE vbap-charg,
         netwr TYPE vbap-netwr,
         waerk TYPE vbap-waerk,
       END OF lty_main.



DATA : ls_main TYPE lty_main,
       lt_main TYPE TABLE OF lty_main.
DATA:  lt_main_collected TYPE STANDARD TABLE OF lty_main.
DATA:  ls_main_collected TYPE lty_main.


SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  SELECT-OPTIONS: p_sipno FOR vbak-vbeln ,
                 p_sipver FOR vbak-kunnr,
                 p_siptur FOR vbak-auart,
                 p_siptrh FOR vbak-audat.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  SELECT-OPTIONS:    p_malz FOR vbap-matnr ,
                   p_uretim FOR vbap-werks ,
                    p_kalem FOR vbap-pstyv ,
                      p_mal FOR vbap-matkl,
                    p_parti FOR vbap-charg.
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.
  PARAMETERS: k_siptur AS CHECKBOX,
              k_malz   AS CHECKBOX,
              k_sipver AS CHECKBOX,
              k_mal    AS CHECKBOX,
              k_parti  AS CHECKBOX.

SELECTION-SCREEN END OF BLOCK b3.

START-OF-SELECTION.


  SELECT     vbak~vbeln,
             vbak~kunnr,
             vbak~auart,
             vbak~audat,
             vbap~matnr,
             vbap~matkl,
             vbap~charg,
             vbap~netwr,
             vbap~waerk
         FROM vbak INNER JOIN vbap ON vbak~vbeln = vbap~vbeln
         WHERE vbak~auart IN @p_siptur
         INTO TABLE @lt_main.


  IF k_siptur EQ 'X'
  AND k_malz EQ 'X'
  AND k_sipver NE 'X'
  AND k_mal NE 'X'
  AND k_parti NE 'X'.




    SORT lt_main BY matnr.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-matnr  TO ls_main_collected-matnr.
      MOVE  ls_main-auart  TO ls_main_collected-auart.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY matnr.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.


  IF k_siptur EQ 'X'
  AND k_malz NE 'X'
  AND k_sipver EQ 'X'
  AND k_mal NE 'X'
  AND k_parti NE 'X'.




    SORT lt_main BY kunnr.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-kunnr  TO ls_main_collected-kunnr.
      MOVE  ls_main-auart  TO ls_main_collected-auart.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY kunnr.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.

  IF k_siptur EQ 'X'
   AND k_malz NE 'X'
   AND k_sipver NE 'X'
   AND k_mal EQ 'X'
   AND k_parti NE 'X'.




    SORT lt_main BY matkl.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-matkl  TO ls_main_collected-matkl.
      MOVE  ls_main-auart  TO ls_main_collected-auart.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY matkl.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.


  IF k_siptur EQ 'X'
   AND k_malz NE 'X'
   AND k_sipver NE 'X'
   AND k_mal NE 'X'
   AND k_parti EQ 'X'.




    SORT lt_main BY auart.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-charg  TO ls_main_collected-charg.
      MOVE  ls_main-auart  TO ls_main_collected-auart.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY auart.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.


  IF k_siptur NE 'X'
   AND k_malz EQ 'X'
   AND k_sipver EQ 'X'
   AND k_mal NE 'X'
   AND k_parti NE 'X'.




    SORT lt_main BY matnr.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-matnr  TO ls_main_collected-matnr.
      MOVE  ls_main-kunnr  TO ls_main_collected-kunnr.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY matnr.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.


  IF k_siptur NE 'X'
   AND k_malz EQ 'X'
   AND k_sipver NE 'X'
   AND k_mal EQ 'X'
   AND k_parti NE 'X'.




    SORT lt_main BY matnr.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-matnr  TO ls_main_collected-matnr.
      MOVE  ls_main-matkl  TO ls_main_collected-matkl.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY matnr.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.



  IF k_siptur NE 'X'
   AND k_malz EQ 'X'
   AND k_sipver NE 'X'
   AND k_mal NE 'X'
   AND k_parti EQ 'X'.




    SORT lt_main BY matnr.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-matnr  TO ls_main_collected-matnr.
      MOVE  ls_main-charg  TO ls_main_collected-charg.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY matnr.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.


  IF k_siptur NE 'X'
   AND k_malz NE 'X'
   AND k_sipver EQ 'X'
   AND k_mal EQ 'X'
   AND k_parti NE 'X'.




    SORT lt_main BY kunnr.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-kunnr  TO ls_main_collected-kunnr.
      MOVE  ls_main-matkl  TO ls_main_collected-matkl.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY kunnr.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.


  IF k_siptur NE 'X'
   AND k_malz NE 'X'
   AND k_sipver EQ 'X'
   AND k_mal NE 'X'
   AND k_parti EQ 'X'.




    SORT lt_main BY kunnr.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-kunnr  TO ls_main_collected-kunnr.
      MOVE  ls_main-charg  TO ls_main_collected-charg.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY kunnr.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.


  IF k_siptur NE 'X'
   AND k_malz NE 'X'
   AND k_sipver NE 'X'
   AND k_mal EQ 'X'
   AND k_parti EQ 'X'.




    SORT lt_main BY matkl.

    LOOP AT lt_main INTO ls_main.
      MOVE  ls_main-matkl  TO ls_main_collected-matkl.
      MOVE  ls_main-charg  TO ls_main_collected-charg.
      MOVE  ls_main-netwr  TO ls_main_collected-netwr.
      MOVE  ls_main-waerk  TO ls_main_collected-waerk.

      COLLECT ls_main_collected INTO lt_main_collected.
      SORT lt_main_collected BY matkl.
    ENDLOOP.

    cl_demo_output=>write( lt_main_collected ).
    cl_demo_output=>display( ).

  ENDIF.

************************************OLUMSUZLAR**********************************************

  IF k_siptur NE 'X' AND k_malz NE 'X' AND k_sipver NE 'X' AND k_mal NE 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.


  IF k_siptur EQ 'X' AND k_malz NE 'X' AND k_sipver NE 'X' AND k_mal NE 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz EQ 'X' AND k_sipver NE 'X' AND k_mal NE 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz NE 'X' AND k_sipver EQ 'X' AND k_mal NE 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz NE 'X' AND k_sipver NE 'X' AND k_mal EQ 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz NE 'X' AND k_sipver NE 'X' AND k_mal NE 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz EQ 'X' AND k_sipver EQ 'X' AND k_mal NE 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz EQ 'X' AND k_sipver NE 'X' AND k_mal EQ 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz EQ 'X' AND k_sipver NE 'X' AND k_mal NE 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz NE 'X' AND k_sipver EQ 'X' AND k_mal EQ 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz NE 'X' AND k_sipver EQ 'X' AND k_mal NE 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz NE 'X' AND k_sipver NE 'X' AND k_mal EQ 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz EQ 'X' AND k_sipver EQ 'X' AND k_mal EQ 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz EQ 'X' AND k_sipver EQ 'X' AND k_mal EQ 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz EQ 'X' AND k_sipver EQ 'X' AND k_mal EQ 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz NE 'X' AND k_sipver EQ 'X' AND k_mal EQ 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz EQ 'X' AND k_sipver EQ 'X' AND k_mal EQ 'X' AND k_parti NE 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur EQ 'X' AND k_malz EQ 'X' AND k_sipver NE 'X' AND k_mal EQ 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.


  IF k_siptur EQ 'X' AND k_malz EQ 'X' AND k_sipver EQ 'X' AND k_mal NE 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.

  IF k_siptur NE 'X' AND k_malz EQ 'X' AND k_sipver EQ 'X' AND k_mal NE 'X' AND k_parti EQ 'X'.

    WRITE: 'Lütfen iki tane kırılım seçiniz.'.

  ENDIF.



*********************************************************************************************************
