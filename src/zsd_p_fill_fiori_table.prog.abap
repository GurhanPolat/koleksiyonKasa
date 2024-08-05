*&---------------------------------------------------------------------*
*& Report ZPM_P_FILL_FIORI_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsd_p_fill_fiori_table.

DATA ls_hier_f TYPE zmhier_fiori  .
DATA lt_hier_f TYPE TABLE OF zmhier_fiori  .
DATA lv_sayac TYPE numc4 VALUE 0 .

DATA : lt_ut_node TYPE zsd_t_urun_structur,
       ls_ut_node LIKE LINE OF lt_ut_node.

DATA : BEGIN OF wa_matnr,
         matnr TYPE mara-matnr,
       END OF wa_matnr,

       BEGIN OF wa_meta,
         matnr TYPE mara-matnr,
       END OF wa_meta.


DATA : lv_matnr_sinif TYPE matnr.

DATA : e_lines TYPE  zma_tt_tline,
       w_lines LIKE LINE OF e_lines.

DATA : lv_refno TYPE numc4.
DATA : lt_refno TYPE TABLE OF numc4.

DATA : lv_kanal   TYPE atwtb,
       lv_anagrup TYPE atwtb,
       lv_altgrup TYPE atwtb,
       lv_urunadi TYPE atwtb.

DATA : lv_fiyat TYPE bapinetwr,
       lv_kdv   TYPE bapiwmwst,
       lv_tutar TYPE  bapinetwr.


DATA : lt_zmhiertipmeta_fiori TYPE TABLE OF ztipmeta_fiori,
       ls_zmhiertipmeta_fiori LIKE LINE OF lt_zmhiertipmeta_fiori.

DATA : lt_zhimermetadata TYPE TABLE OF zmhiertipmeta,
       ls_zhimermetadata LIKE LINE OF lt_zhimermetadata.


TYPES: BEGIN OF ty_matnr,
         matnr TYPE matnr,
         maktx TYPE maktx,
       END OF ty_matnr.

DATA lt_matnr TYPE TABLE OF ty_matnr.

DATA ls_urunler TYPE zsd_urun_structur.

DATA lt_mat_price_chk TYPE zzmaterial_tt.
DATA ls_mat_price_chk TYPE zzmaterial.

DATA lt_mat_price_null TYPE zzmaterial_tt.

DATA : lv_ana_matnr TYPE ausp-atwrt.

DATA : lv_count TYPE i.

PARAMETERS : p_zhimer RADIOBUTTON GROUP gp1,
             p_ztipme RADIOBUTTON GROUP gp1.


START-OF-SELECTION.

  IF p_zhimer EQ 'X'.

    PERFORM zhiemer_fiori_update.

    SELECT COUNT(*) FROM zmhier_fiori.
    IF sy-subrc EQ 0.
      WRITE : 'ZMHIER_FIORI kayit basarili'.
    ELSE.
      WRITE : 'ZMHIER_FIORI kayit basarisiz. Lütfen tekrar deneyin'.
    ENDIF.

  ELSEIF p_ztipme EQ 'X'.

    PERFORM ztipmeta_fiori_update.

    SELECT COUNT(*) FROM ztipmeta_fiori.
    IF sy-subrc EQ 0.
      WRITE : 'ZTIPMETA_FIORI kayit basarili'.
    ELSE.
      WRITE : 'ZTIPMETA_FIORI kayit basarisiz. Lütfen tekrar deneyin'.
    ENDIF.

  ENDIF.


*&---------------------------------------------------------------------*
*&      Form  ZHIEMER_FIORI_UPDATE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM zhiemer_fiori_update .

  CLEAR ls_hier_f.
  REFRESH lt_hier_f.

  SELECT * FROM zmhier INTO  TABLE @DATA(lt_hier).
  IF sy-subrc = 0 .
    DELETE FROM zmhier_fiori .
    COMMIT WORK AND WAIT.
    SORT lt_hier BY zmkanal zmanagrup zmaltgrup ASCENDING.
    LOOP AT lt_hier INTO DATA(ls_hier) .
      MOVE-CORRESPONDING ls_hier TO ls_hier_f .

      ADD 10 TO lv_sayac .

      ls_hier_f-urunid = lv_sayac .
      APPEND ls_hier_f TO lt_hier_f.
    ENDLOOP.

    MODIFY zmhier_fiori FROM TABLE lt_hier_f.
    COMMIT WORK AND WAIT.

  ENDIF.

ENDFORM.

*&---------------------------------------------------------------------*
*&      Form  ZTIPMETA_FIORI_UPDATE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM ztipmeta_fiori_update .

  SELECT * FROM zmhiertipmeta INTO TABLE lt_zhimermetadata.
  IF sy-subrc EQ 0.

    CLEAR lv_count.

    LOOP AT lt_zhimermetadata INTO ls_zhimermetadata.
      lv_count = lv_count + 1.
      MOVE-CORRESPONDING ls_zhimermetadata TO ls_zmhiertipmeta_fiori.


      SELECT SINGLE maktx FROM makt INTO ls_zmhiertipmeta_fiori-kurz_text
          WHERE matnr = ls_zmhiertipmeta_fiori-metacode
            AND spras = sy-langu.

      REFRESH e_lines.
      CALL FUNCTION 'ZMA_F_GET_LONGTEXT_BY_MATNR'
        EXPORTING
          i_matnr    = ls_zhimermetadata-metacode
          i_language = sy-langu
        TABLES
          e_lines    = e_lines.
      CLEAR: ls_ut_node-maktxuz, w_lines.
      LOOP AT e_lines INTO w_lines.
        IF w_lines-tdline IS NOT INITIAL.
          IF ls_ut_node-maktxuz IS INITIAL.
            MOVE w_lines-tdline TO ls_ut_node-maktxuz.
          ELSE.
            CONCATENATE ls_ut_node-maktxuz w_lines-tdline INTO ls_ut_node-maktxuz.
          ENDIF.
        ENDIF.
      ENDLOOP.

      ls_zmhiertipmeta_fiori-long_text = ls_zmhiertipmeta_fiori-long_text && ls_ut_node-maktxuz.

      SHIFT ls_zmhiertipmeta_fiori-metacode LEFT DELETING LEADING '0'.
      ls_zmhiertipmeta_fiori-matnr = ls_zmhiertipmeta_fiori-matnr && ls_zmhiertipmeta_fiori-metacode.


      lv_ana_matnr = ls_zmhiertipmeta_fiori-metacode.
      SHIFT lv_ana_matnr LEFT DELETING LEADING '0'.

      CALL FUNCTION 'ZMA_F_GET_MATNR_BY_METACODE'
        EXPORTING
          i_metacode = lv_ana_matnr
        IMPORTING
          e_it_matnr = lt_matnr.

      IF lt_matnr IS NOT INITIAL.

        LOOP AT lt_matnr INTO DATA(ls_mat).
          ls_mat_price_chk-matnr = ls_mat-matnr.
          APPEND ls_mat_price_chk TO lt_mat_price_chk.
          CLEAR ls_mat_price_chk.
        ENDLOOP.


        CALL FUNCTION 'ZZSD_GECERLI_FIYATI_YOK'
          EXPORTING
            it_material  = lt_mat_price_chk
          IMPORTING
            et_materials = lt_mat_price_null.


        LOOP AT lt_mat_price_null INTO DATA(ls_mat_price_null) .
          DELETE lt_matnr WHERE matnr = ls_mat_price_null-matnr .
        ENDLOOP .

        LOOP AT lt_matnr INTO DATA(ls_matnr).
          ls_zmhiertipmeta_fiori-matnr = ls_zmhiertipmeta_fiori-matnr && '/' && ls_matnr-matnr.
        ENDLOOP.

      ENDIF.

      APPEND ls_zmhiertipmeta_fiori TO lt_zmhiertipmeta_fiori.
      CLEAR ls_zmhiertipmeta_fiori.
      REFRESH : lt_matnr, lt_mat_price_chk, lt_mat_price_null.
    ENDLOOP.

  ENDIF.

  MODIFY ztipmeta_fiori FROM TABLE lt_zmhiertipmeta_fiori.
  COMMIT WORK AND WAIT.

ENDFORM.
