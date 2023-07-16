*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZOT_15_T_P_AILE.................................*
DATA:  BEGIN OF STATUS_ZOT_15_T_P_AILE               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_15_T_P_AILE               .
CONTROLS: TCTRL_ZOT_15_T_P_AILE
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZOT_15_T_P_EGTM.................................*
DATA:  BEGIN OF STATUS_ZOT_15_T_P_EGTM               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_15_T_P_EGTM               .
CONTROLS: TCTRL_ZOT_15_T_P_EGTM
            TYPE TABLEVIEW USING SCREEN '0004'.
*...processing: ZOT_15_T_P_ILTSM................................*
DATA:  BEGIN OF STATUS_ZOT_15_T_P_ILTSM              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_15_T_P_ILTSM              .
CONTROLS: TCTRL_ZOT_15_T_P_ILTSM
            TYPE TABLEVIEW USING SCREEN '0002'.
*...processing: ZOT_15_T_P_MAST.................................*
DATA:  BEGIN OF STATUS_ZOT_15_T_P_MAST               .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_15_T_P_MAST               .
CONTROLS: TCTRL_ZOT_15_T_P_MAST
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZOT_15_T_P_TWEET................................*
DATA:  BEGIN OF STATUS_ZOT_15_T_P_TWEET              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_15_T_P_TWEET              .
CONTROLS: TCTRL_ZOT_15_T_P_TWEET
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZOT_15_T_ZMN....................................*
DATA:  BEGIN OF STATUS_ZOT_15_T_ZMN                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZOT_15_T_ZMN                  .
CONTROLS: TCTRL_ZOT_15_T_ZMN
            TYPE TABLEVIEW USING SCREEN '0006'.
*.........table declarations:.................................*
TABLES: *ZOT_15_T_P_AILE               .
TABLES: *ZOT_15_T_P_EGTM               .
TABLES: *ZOT_15_T_P_ILTSM              .
TABLES: *ZOT_15_T_P_MAST               .
TABLES: *ZOT_15_T_P_TWEET              .
TABLES: *ZOT_15_T_ZMN                  .
TABLES: ZOT_15_T_P_AILE                .
TABLES: ZOT_15_T_P_EGTM                .
TABLES: ZOT_15_T_P_ILTSM               .
TABLES: ZOT_15_T_P_MAST                .
TABLES: ZOT_15_T_P_TWEET               .
TABLES: ZOT_15_T_ZMN                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
