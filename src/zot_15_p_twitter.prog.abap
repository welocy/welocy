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

gs_twitter = VALUE #(
                      ( tweet_id = p_t_id
                        tweet    = p_tweet )
                    ).

                      INSERT zot_15_t_p_tweet FROM TABLE @gs_twitter.
                      COMMIT WORK AND WAIT.



elseif p_t_degi = 'X'.
gs_twitter = VALUE #( ( tweet_id = p_t_id
                        tweet    = p_tweet )
                    ).

                      MODIFY zot_15_t_p_tweet FROM TABLE @gs_twitter.
                      COMMIT WORK AND WAIT.

elseif p_t_sil = 'X'.

DELETE FROM zot_15_t_p_tweet where tweet_id = p_t_id
                             and     tweet  = p_tweet.


elseif p_t_gost = 'X'.

SELECT * FROM zot_15_t_p_tweet INTO TABLE @gs_twitter.
cl_demo_output=>display( gs_twitter ).
endif.
