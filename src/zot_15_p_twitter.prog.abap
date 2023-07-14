*&---------------------------------------------------------------------*
*& Report zot_15_p_twitter
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zot_15_p_twitter.
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_t_id TYPE int2 OBLIGATORY,
              p_tweet TYPE char240 OBLIGATORY.
SELECTION-SCREEN END OF BLOCK b1.

SELECTION-SCREEN BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-002.
  PARAMETERS: p_t_at RADIOBUTTON GROUP g1,
              p_t_degi RADIOBUTTON GROUP g1,
              p_t_sil  RADIOBUTTON GROUP g1,
              p_t_gost   RADIOBUTTON GROUP g1.
SELECTION-SCREEN END OF BLOCK b2.

START-OF-SELECTION.

DATA : gs_twitter TYPE TABLE OF zot_15_t_p_tweet.



if p_t_at = 'X'.


 TRY.
        APPEND VALUE #( tweet_id = p_t_id
                        tweet = p_tweet
                      ) TO gs_twitter .
        INSERT zot_15_t_p_tweet  FROM TABLE gs_twitter .
        cl_demo_output=>display( | { p_t_id } ID'li tweet başarıyla atıldı | ).

      CATCH cx_sy_open_sql_db.
        cl_demo_output=>display( | { p_t_id } ID zaten mevcut. | ).
    ENDTRY.



elseif p_t_degi = 'X'.
gs_twitter = VALUE #( ( tweet_id = p_t_id
                        tweet    = p_tweet )
                    ).

                      MODIFY zot_15_t_p_tweet FROM TABLE @gs_twitter.
                      cl_demo_output=>display( 'Tweet başarıyla değiştirildi.' ).
                      COMMIT WORK AND WAIT.

elseif p_t_sil = 'X'.

DELETE FROM zot_15_t_p_tweet where tweet_id = p_t_id.
COMMIT WORK AND WAIT.
 IF sy-subrc = 0.
      cl_demo_output=>display( | { p_t_id } ID'li tweet başarıyla silindi. | ).
    ELSE.
      cl_demo_output=>display( | { p_t_id } ID'li tweet silinirken hata oluştu. | ).
    ENDIF.




elseif p_t_gost = 'X'.

SELECT * FROM zot_15_t_p_tweet INTO TABLE @gs_twitter.
cl_demo_output=>display( gs_twitter ).
endif.
