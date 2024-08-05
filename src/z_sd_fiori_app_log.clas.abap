class Z_SD_FIORI_APP_LOG definition
  public
  final
  create public .

*"* public components of class Z_SD_FIORI_APP_LOG
*"* do not include other source files here!!!
public section.

  class-data GV_MESSAGE_HANDLE type BALLOGHNDL .

  class-methods REFRESH_LOG .
  class-methods CREATE_DYN_LOG
    importing
      !OBJECT type BALOBJ_D default 'ZSD_FIORI'
      !SUBOBJECT type BALSUBOBJ default 'ZSD_DIGER'
      !S_LOG type BAL_S_MSG optional
      !T_RETURN type BAPIRET2_TAB optional
      !S_RETURN type BAPIRET2 optional .
  class-methods CREATE_LOG .
protected section.
*"* protected components of class /CBAD/CL_MESAGE_LOG
*"* do not include other source files here!!!
private section.
*"* private components of class /CBAD/CL_MESAGE_LOG
*"* do not include other source files here!!!

  constants MC_SD_LOG_OBJECT type BALOBJ_D value 'ZSD_FIORI' ##NO_TEXT.
  constants MC_SD_LOG_diger type BALOBJ_D value 'ZSD_DIGER' ##NO_TEXT.
  constants MC_SD_LOG_fiyat type BALOBJ_D value 'ZSD_FIYAT' ##NO_TEXT.
  constants MC_SD_LOG_musteri type BALOBJ_D value 'ZSD_MUSTERI' ##NO_TEXT.
  constants MC_SD_LOG_siparis type BALOBJ_D value 'ZSD_SIPARIS' ##NO_TEXT.
ENDCLASS.



CLASS Z_SD_FIORI_APP_LOG IMPLEMENTATION.


METHOD create_dyn_log.

  DATA: lr_budget_log TYPE bal_s_log,
        ls_bal_msg    TYPE  bal_s_msg,
        lt_log_handle TYPE bal_t_logh,
        lt_lognumbers TYPE bal_t_lgnm.

  lr_budget_log = VALUE #( object = object
                           subobject = subobject
                           aluser = sy-uname
                           aldate = sy-datum
                           altime = sy-uzeit
                           alprog = sy-repid
                           altcode = sy-tcode ).


  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = lr_budget_log
    IMPORTING
      e_log_handle            = gv_message_handle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.

  IF s_log IS NOT INITIAL .

    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = gv_message_handle
        i_s_msg          = s_log
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.

  ENDIF.

  IF t_return IS NOT INITIAL .

    LOOP AT t_return INTO DATA(ls_t_return) .
      CLEAR ls_bal_msg .

      CALL METHOD cl_ops_ehp_mapping_helper=>map_bapiret2_to_bal_s_msg(
        EXPORTING
          is_messages  = ls_t_return
        IMPORTING
          es_bal_s_msg = ls_bal_msg ).

      CALL FUNCTION 'BAL_LOG_MSG_ADD'
        EXPORTING
          i_log_handle     = gv_message_handle
          i_s_msg          = ls_bal_msg
        EXCEPTIONS
          log_not_found    = 1
          msg_inconsistent = 2
          log_is_full      = 3
          OTHERS           = 4.

    ENDLOOP.

  ENDIF.

  IF s_return IS NOT INITIAL .

    CALL METHOD cl_ops_ehp_mapping_helper=>map_bapiret2_to_bal_s_msg(
      EXPORTING
        is_messages  = s_return
      IMPORTING
        es_bal_s_msg = ls_bal_msg ).

    CALL FUNCTION 'BAL_LOG_MSG_ADD'
      EXPORTING
        i_log_handle     = gv_message_handle
        i_s_msg          = ls_bal_msg
      EXCEPTIONS
        log_not_found    = 1
        msg_inconsistent = 2
        log_is_full      = 3
        OTHERS           = 4.

  ENDIF.



  APPEND gv_message_handle TO lt_log_handle.

  CALL FUNCTION 'BAL_DB_SAVE'
    EXPORTING
      i_client         = sy-mandt
      i_t_log_handle   = lt_log_handle
    IMPORTING
      e_new_lognumbers = lt_lognumbers
    EXCEPTIONS
      log_not_found    = 1
      save_not_allowed = 2
      numbering_error  = 3
      OTHERS           = 4.

  IF sy-subrc = 0.
    CALL FUNCTION 'BAPI_TRANSACTION_COMMIT' .
    REFRESH lt_log_handle.
  ENDIF.

  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
    WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDMETHOD.


METHOD CREATE_LOG.

  DATA: lr_budget_log TYPE bal_s_log.

  lr_budget_log-object = '/CBAD/'.
  lr_budget_log-subobject = 'BUDGET'.
  lr_budget_log-aldate = sy-datum.
  lr_budget_log-altime = sy-uzeit.

  CALL FUNCTION 'BAL_LOG_CREATE'
    EXPORTING
      i_s_log                 = lr_budget_log
    IMPORTING
      e_log_handle            = gv_message_handle
    EXCEPTIONS
      log_header_inconsistent = 1
      OTHERS                  = 2.

ENDMETHOD.


method REFRESH_LOG.

  IF GV_MESSAGE_HANDLE IS NOT INITIAL.
    CALL FUNCTION 'BAL_LOG_REFRESH'
      EXPORTING
        I_LOG_HANDLE  = GV_MESSAGE_HANDLE
      EXCEPTIONS
        LOG_NOT_FOUND = 1
        OTHERS        = 2.
  ENDIF.

endmethod.
ENDCLASS.
