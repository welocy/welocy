*&---------------------------------------------------------------------*
*& Report zot_15_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_internal_tables.

select matnr,
       maktx,
       matkl,
       menge,
       meins from ZOT_00_T_MATERIA
       into table @data(lt_material).

data lt_material2 type table of zot_00_t_materia.

 lt_material2 = value #( base lt_material2 ( matnr = '11'
                                             maktx = 'Eldiven'
                                             matkl = 'C'
                                             menge = 3
                                             meins = 'ST' )

                                           ( matnr = '12'
                                             maktx = 'Alyan'
                                             matkl = 'C'
                                             menge = 5
                                             meins = 'ST' )

                                           ( matnr = '13'
                                             maktx = 'Matkap'
                                             matkl = 'C'
                                             menge = 5
                                             meins = 'ST' )

                                           ( matnr = '14'
                                             maktx = 'Testere'
                                             matkl = 'C'
                                             menge = 14
                                             meins = 'ST' )

                                           ( matnr = '15'
                                             maktx = 'Terazi'
                                             matkl = 'C'
                                             menge = 7
                                             meins = 'ST' )
                                                           ).
loop at lt_material into data(ls_material).

read table lt_material2 into data(ls_material2) with key meins = ls_material-meins.

     if sy-subrc = 0.

      ls_material-menge += 10.

     endif.

endloop.

data lt_materialmix type table of zot_00_t_materia.

lt_materialmix = value #( base lt_materialmix ( lines of lt_material )
                                              ( lines of lt_material2 )
                                                                       ).
data: lt_material3 type table of zot_00_t_materia,
      ls_material3 type zot_00_t_materia.


loop at lt_materialmix into data(ls_materialmix).

collect ls_material3 into lt_material3.

endloop.

delete lt_materialmix where menge < 10.

sort lt_material3 ascending by menge.
sort lt_materialmix descending by menge.




cl_demo_output=>display( lt_material3 ).
cl_demo_output=>display( lt_materialmix ).




*cl_demo_output=>display( lt_material3 ).
*sort lt_material3 ascending by menge.
