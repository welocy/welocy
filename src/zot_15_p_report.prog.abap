*&---------------------------------------------------------------------*
*& Report zot_15_p_report
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_report.
tables:eban,ekpo.

data gs_layout type slis_layout_alv.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
SELECT-OPTIONS: s_satno FOR eban-banfn ,
               s_satbel FOR eban-matkl.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
SELECT-OPTIONS: s_sasno   FOR ekpo-ebeln NO INTERVALS,
                 s_sasmal FOR ekpo-matkl NO INTERVALS.
SELECTION-SCREEN END OF BLOCK b2.

SELECTION-SCREEN BEGIN OF BLOCK b3 WITH FRAME TITLE TEXT-003.
  PARAMETERS: p_sat RADIOBUTTON GROUP g1,
              p_sas RADIOBUTTON GROUP g1.

SELECTION-SCREEN END OF BLOCK b3.

START-OF-SELECTION.


if p_sat eq 'X'.
* screen-invisible( b2 ) = 0.

     select eban~banfn,
            eban~bnfpo,
            eban~bsart,
            eban~matnr,
            eban~meins,
            eban~menge
       from eban
 inner join ekpo  on eban~banfn = ekpo~banfn AND
                     eban~bnfpo = ekpo~bnfpo
      where eban~banfn in @s_sasno  and
            eban~matkl in @s_sasmal
 into table @data(lt_sat).



data(lt_fieldcat_sat) = value slis_t_fieldcat_alv(  ( fieldname = 'BANFN' seltext_m = 'SAT No'  )
                                                    ( fieldname = 'BNFPO' seltext_m = 'SAT Kalem No' )
                                                    ( fieldname = 'BSART' seltext_m = 'SAT Belge Türü' )
                                                    ( fieldname = 'MATNR' seltext_m = 'Malzeme No' )
                                                    ( fieldname = 'MENGE' seltext_m = 'SAT Miktarı'  )
                                                    ( fieldname = 'MEINS' seltext_m = 'SAT Ölçü Miktarı'  ) ).



  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program     = sy-repid
        it_fieldcat            = lt_fieldcat_sat
*        i_callback_top_of_page = 'TOP-OF-PAGE'
        is_layout              = gs_layout
      TABLES
        t_outtab               = lt_sat.


*       cl_demo_output=>write_data( lt_sat ).
*       cl_demo_output=>display( ).

else.
     select  ekpo~ebeln,
             ekpo~ebelp,
             ekpo~matnr,
             ekpo~meins,
             ekpo~menge
       from  ekpo
  inner join eban  on ekpo~banfn = eban~banfn and
                      ekpo~bnfpo = eban~bnfpo
       where ekpo~banfn in @s_satno and
             ekpo~matkl in @s_satbel
  into table @data(lt_sas).


data(lt_fieldcat_sas) = value slis_t_fieldcat_alv( ( fieldname = 'EBELN' seltext_m = 'SAS No'  )
                                                   ( fieldname = 'EBELP' seltext_m = 'SAS Kalem No' )
                                                   ( fieldname = 'MATNR' seltext_m = 'SAS Malzeme' )
                                                   ( fieldname = 'MEİNS' seltext_m = 'SAS Ölçü Miktarı'  )
                                                   ( fieldname = 'MENGE' seltext_m = 'SAS Miktarı'  ) ).



  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
      EXPORTING
        i_callback_program     = sy-repid
        it_fieldcat            = lt_fieldcat_sas
*        i_callback_top_of_page = 'TOP-OF-PAGE'
        is_layout              = gs_layout
      TABLES
        t_outtab               = lt_sas.



*       cl_demo_output=>write_data( lt_sas ).
*       cl_demo_output=>display( ).
endif.
