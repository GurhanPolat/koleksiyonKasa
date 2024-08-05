*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZFIORI_USER.....................................*
DATA:  BEGIN OF STATUS_ZFIORI_USER                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZFIORI_USER                   .
CONTROLS: TCTRL_ZFIORI_USER
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZFIORI_USER                   .
TABLES: ZFIORI_USER                    .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
