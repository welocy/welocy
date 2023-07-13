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
*.........table declarations:.................................*
TABLES: *ZOT_15_T_P_AILE               .
TABLES: *ZOT_15_T_P_EGTM               .
TABLES: *ZOT_15_T_P_ILTSM              .
TABLES: *ZOT_15_T_P_MAST               .
TABLES: ZOT_15_T_P_AILE                .
TABLES: ZOT_15_T_P_EGTM                .
TABLES: ZOT_15_T_P_ILTSM               .
TABLES: ZOT_15_T_P_MAST                .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .