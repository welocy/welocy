*&---------------------------------------------------------------------*
*& Report zot_15_p_internal_tables
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_internal_tables.


types: begin of lty_collect,
       matkl type matkl,
       menge type menge_d,
       end of lty_collect.

       data: lt_collect type table of lty_collect,
             ls_collect type lty_collect.


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

         modify lt_material from ls_material transporting menge.

      endif.

endloop.

data lt_materialmix type table of zot_00_t_materia.

lt_materialmix = value #( base lt_materialmix ( lines of lt_material )
                                              ( lines of lt_material2 )
                                                                       ).

loop at lt_materialmix into data(ls_materialmix).

        ls_collect-matkl = ls_materialmix-matkl.
        ls_collect-menge = ls_materialmix-menge.

        collect ls_collect into lt_collect.

endloop.

delete lt_materialmix where menge < 10.

sort lt_collect descending by menge.
sort lt_materialmix ascending by menge.

cl_demo_output=>write_data( lt_materialmix ).
cl_demo_output=>write_data( lt_collect ).

cl_demo_output=>display(  ).
