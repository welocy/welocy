*&---------------------------------------------------------------------*
*& Report zot_15_p_sports
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_sports.

types: begin of lty_bag,
             team_id type int2,
          team_name type char30,
       team_country type char3,
           team_bag type numc1,
         end of lty_bag.

         TYPES : BEGIN OF lty_final,
          team_id      type int2,
          team_name    TYPE char30,
          team_country TYPE char3,
          team_bag type numc1,
        END OF lty_final.

 data ls_final TYPE lty_final.
 data ls_bag type lty_bag.

 DATA : gt_groupa TYPE TABLE OF lty_final,
      gt_groupb TYPE TABLE OF lty_final,
      gt_groupc TYPE TABLE OF lty_final,
     gt_groupd TYPE TABLE OF lty_final.

data randnum16 type i.

data randnum type i.

data lv_do type int2.
lv_do = 16.

data lt_bag type table of lty_bag.

lt_bag = value #( base lt_bag ( team_id = 1
                              team_name = 'LIVERPOOL'
                           team_country = 'EN'
                               team_bag = 1          )

                              ( team_id = 2
                              team_name = 'BAYERN MUNICH'
                          team_country  = 'DE'
                              team_bag  = 1          )

                              ( team_id = 3
                              team_name = 'INTER'
                          team_country  = 'IT'
                              team_bag  = 1          )

                              ( team_id = 4
                              team_name = 'PSG'
                          team_country  = 'FR'
                              team_bag  = 1          )

                              ( team_id = 5
                              team_name = 'MAN CITY'
                          team_country  = 'EN'
                              team_bag  = 2          )

                              ( team_id = 6
                               team_name = 'PSV'
                          team_country  = 'NE'
                              team_bag  = 2          )

                              (  team_id = 7
                              team_name = 'PORTO'
                          team_country  = 'PO'
                              team_bag  = 2          )

                              ( team_id = 8
                              team_name = 'REAL MADRİD'
                          team_country  = 'ES'
                              team_bag  = 2          )

                              ( team_id = 9
                              team_name = 'DORTMUND'
                          team_country  = 'DE'
                              team_bag  = 3          )

                              ( team_id = 10
                              team_name = 'GALATASARAY'
                          team_country  = 'TR'
                              team_bag  = 3          )

                              ( team_id = 11
                              team_name = 'MARSILYA'
                          team_country  = 'FR'
                              team_bag  = 3          )

                              ( team_id = 12
                               team_name = 'AJAX'
                          team_country  = 'NE'
                              team_bag  = 3          )

                              ( team_id = 13
                               team_name = 'AEK'
                          team_country  = 'GR'
                              team_bag  = 4          )

                              ( team_id = 14
                               team_name = 'ROMA'
                          team_country  = 'IT'
                              team_bag  = 4          )

                             ( team_id = 15
                              team_name = 'STEAU BUKRES'
                          team_country  = 'RO'
                              team_bag  = 4          )

                              ( team_id = 16
                              team_name = 'ATLETICO MADRID'
                          team_country  = 'ES'
                              team_bag  = 4          )  ).

do 100 times.

    call FUNCTION 'GENERAL_GET_RANDOM_INT'
    EXPORTING
    range  = 100
    IMPORTING
    random = randnum .

    randnum16 = randnum mod 17.

     if randnum16 eq 0.
        randnum16 += 1.
     endif.

 SELECT SINGLE team_id, team_name, team_country, team_bag
         FROM @lt_bag AS bag
         WHERE team_id = @randnum16 and team_country <> @ls_bag-team_country
         INTO @ls_bag.

     if ls_bag-team_id = 0.
        CONTINUE.
     else.

     IF  lines( gt_groupa ) LT 4  .
*        if ls_bag-team_country eq gt_groupa-team_country.

        APPEND ls_bag TO gt_groupa.

        SORT gt_groupa BY team_country.
      DELETE ADJACENT DUPLICATES FROM gt_groupa COMPARING team_country.
      if sy-subrc = 0.
        continue.
      endif.
      SORT gt_groupa BY team_bag.
      DELETE ADJACENT DUPLICATES FROM gt_groupa COMPARING team_bag.
      if sy-subrc = 0.
        continue.
      endif.

        delete lt_bag where team_id = randnum16.
        clear ls_bag.

  ELSEIF lines( gt_groupb ) LT 4 .

      APPEND ls_bag TO gt_groupb.
             SORT gt_groupb BY team_country.
      DELETE ADJACENT DUPLICATES FROM gt_groupb COMPARING team_country.
      if sy-subrc = 0.
        continue.
      endif.
      SORT gt_groupb BY team_bag.
      DELETE ADJACENT DUPLICATES FROM gt_groupb COMPARING team_bag.
      if sy-subrc = 0.
        continue.
      endif.
      delete lt_bag where team_id = randnum16.
     clear ls_bag.

  ELSEIF lines( gt_groupc ) LT 4 .

      APPEND ls_bag TO gt_groupc.
             SORT gt_groupc BY team_country.
      DELETE ADJACENT DUPLICATES FROM gt_groupc COMPARING team_country.
      if sy-subrc = 0.
        continue.
      endif.
      SORT gt_groupc BY team_bag.
      DELETE ADJACENT DUPLICATES FROM gt_groupc COMPARING team_bag.
      if sy-subrc = 0.
        continue.
      endif.
      delete lt_bag where team_id = randnum16.
      clear ls_bag.
  ELSEIF lines( gt_groupd ) LT 4 .
       APPEND ls_bag TO gt_groupd.
              SORT gt_groupd BY team_country.
      DELETE ADJACENT DUPLICATES FROM gt_groupd COMPARING team_country.
      if sy-subrc = 0.
        continue.
      endif.
      SORT gt_groupd BY team_bag.
      DELETE ADJACENT DUPLICATES FROM gt_groupd COMPARING team_bag.
      if sy-subrc = 0.
        continue.
      endif.
       delete lt_bag where team_id = randnum16.
       clear ls_bag.
  ENDIF.


endif.

enddo.

sort gt_groupa by team_id ASCENDING.
sort gt_groupb by team_id ASCENDING.
sort gt_groupc by team_id ASCENDING.
sort gt_groupd by team_id ASCENDING.

cl_demo_output=>write_data( gt_groupa ).
cl_demo_output=>write_data( gt_groupb ).
cl_demo_output=>write_data( gt_groupc ).
cl_demo_output=>write_data( gt_groupd ).
cl_demo_output=>display( ).
*        BREAK-POINT.

*loop at lt_bag into DATA(ls_bag).
*read table gt_groupa into data(ls_groupa).
*endloop.
*

*
*DO lv_do TIMES.
*
*call FUNCTION 'GENERAL_GET_RANDOM_INT'
*  EXPORTING
*    range  = 100
*  IMPORTING
*   random = randnum .
*
*   randnum16 = randnum mod 17.
*
*    if randnum16 eq 0.
*
*     randnum16 += 1.
*endif.
*
*  SELECT SINGLE team_id, team_name, team_country
*         FROM @lt_bag AS sport
*         WHERE team_id = @randnum16
*         INTO @ls_final.
*
*
*  IF  lines( gt_groupa ) LT 4  .
*
*    DELETE ADJACENT DUPLICATES FROM gt_groupa.
*
*
*   APPEND ls_final TO gt_groupa.
*
*
*
*
*  ELSEIF lines( gt_groupb ) LT 4 .
*
*   DELETE ADJACENT DUPLICATES FROM gt_groupa .
*  DELETE ADJACENT DUPLICATES FROM gt_groupb .
*    APPEND ls_final TO gt_groupb.
*
*  ELSEIF lines( gt_groupc ) LT 4 .
*   DELETE ADJACENT DUPLICATES FROM gt_groupa .
*  DELETE ADJACENT DUPLICATES FROM gt_groupb .
*   DELETE ADJACENT DUPLICATES FROM gt_groupc .
*
*    APPEND ls_final TO gt_groupc.
*
*  ELSEIF lines( gt_groupd ) LT 4 .
*  DELETE ADJACENT DUPLICATES FROM gt_groupa .
*  DELETE ADJACENT DUPLICATES FROM gt_groupb .
*   DELETE ADJACENT DUPLICATES FROM gt_groupc .
*    DELETE ADJACENT DUPLICATES FROM gt_groupd .
*    APPEND ls_final TO gt_groupd.
*  ENDIF.
*
*ENDDO.
*
*cl_demo_output=>write_data( gt_groupa ).
*cl_demo_output=>write_data( gt_groupb ).
*cl_demo_output=>write_data( gt_groupc ).
*cl_demo_output=>write_data( gt_groupd ).
*cl_demo_output=>display( ).
