class ZCL_ZSD_ODATA_KASA_DPC_EXT definition
  public
  inheriting from ZCL_ZSD_ODATA_KASA_DPC
  create public .

public section.

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_EXPANDED_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_STREAM
    redefinition .
protected section.

  methods BARCODE_TO_PRODUCT
    importing
      !BARKOD_NO type STRING
    exporting
      !ES_URUN type ZSD_URUN_STRUCTUR .
  methods CREATE_ORDER
    changing
      !CS_SIPARIS type ZFIORI_SIPARIS
      !CV_VBELN type VBELN
      !CV_ERROR type FLAG .
  methods CREATE_ORDER_V2
    importing
      !IV_MUSTERI_NO type KUNNR
      !IV_GENEL_ISKONTO_YUZDE type BAPIKBETR1 optional
      !IV_GENEL_ISKONTO_TUTAR type BAPINETWR optional
      !IV_FINAL_ISKONTO_TUTAR type BAPINETWR
      !IV_PAYMENT type CHAR1
      !IV_BOLGE type ZDKASA_KODU
      !IV_SATIS_SORUMLUSU type ZKUNVE
      !IV_FARK_YUVARLA type BAPIKBETR1
      !IV_SON_TOPLAM_TUTAR type BAPINETWR
    exporting
      !EV_ERROR type FLAG
      !EV_VBELN type VBELN
      !ES_TUTAR type ZSD_GENEL_TUTAR_PDF_DATA_ST
      !ET_RETURN type BAPIRET2_TT
    changing
      !CT_ITEMS type ZSD_FIYAT_ISKONTO_ITEM_TT .
  methods CREATE_PDF
    importing
      !IV_VBELN type VBELN
      !IS_MUSTERI type ZSD_MUSTERI_PDF_DATA_ST
      !IV_TEKLIF type FLAG optional
      !IT_MALZEME type ZSD_MALZEME_PDF_DATA_TT
      !IS_TUTAR type ZSD_GENEL_TUTAR_PDF_DATA_ST
      !IV_PAYMENT type CHAR1
      !IV_BOLGE type ZDKASA_KODU
      !IV_SATIS_SORUMLUSU type ZKUNVE
    exporting
      !EV_PDF type XSTRING .
  methods CREATE_PDF_V2
    importing
      !IV_VBELN type VBELN optional
      !IV_MUSTERI_NO type KUNNR
      !IV_TEKLIF type FLAG optional
      !IV_TEKLIF_NO type CHAR10 optional
      !IT_MALZEME type ZSD_MALZEME_PDF_DATA_TT
      !IS_TUTAR type ZSD_GENEL_TUTAR_PDF_DATA_ST
      !IV_PAYMENT type CHAR1
      !IV_BOLGE type ZDKASA_KODU
      !IV_SATIS_SORUMLUSU type ZKUNVE
    exporting
      !EV_PDF type XSTRING .
  methods DISCOUNT_PRICE_SIMULATION
    importing
      !IV_MUSTERI_NO type KUNNR
      !IV_GENEL_ISKONTO_YUZDE type BAPIKBETR optional
      !IV_GENEL_ISKONTO_TUTAR type BAPINETWR optional
      !IV_PAYMENT type CHAR1
    exporting
      !EV_NET_TUTAR type BAPINETWR
      !EV_KDV type BAPIWMWST
      !EV_TOPLAM_TUTAR type BAPINETWR
      !EV_TOPLAM_INDIRIM_TUTAR type BAPINETWR
      !EV_ERROR type FLAG
      !ET_RETURN type BAPIRET2_TT
    changing
      !CT_ITEMS type ZSD_FIYAT_ISKONTO_ITEM_TT .
  methods DISCOUNT_PRICE_SIMULATION_V2
    importing
      !IV_MUSTERI_NO type KUNNR
      !IV_GENEL_ISKONTO_YUZDE type BAPIKBETR1 optional
      !IV_GENEL_ISKONTO_TUTAR type BAPINETWR optional
      !IV_FINAL_ISKONTO_TUTAR type BAPINETWR optional
      !IV_PAYMENT type CHAR1
      !IV_BOLGE type ZDKASA_KODU
      !IV_SATIS_SORUMLUSU type ZKUNVE
      !IV_FARK_YUVARLA type BAPIKBETR1 optional
      !IV_CREATE_ORDER type BAPIFLAG-BAPIFLAG optional
      !IV_VBELN type VBELN optional
    exporting
      !EV_NET_TUTAR type BAPINETWR
      !EV_KDV type BAPIWMWST
      !EV_TOPLAM_TUTAR type BAPINETWR
      !EV_TOPLAM_INDIRIM_TUTAR type BAPINETWR
      !EV_ERROR type FLAG
      !EV_VBELN type VBELN
      !ET_RETURN type BAPIRET2_TT
    changing
      !CV_ILK_ITEM_KDV_YUZDE type PRZNT optional
      !CV_ZDIF_DEGER type BAPIKBETR1 optional
      !CT_ITEMS type ZSD_FIYAT_ISKONTO_ITEM_TT .
  methods HANDLE_ERROR
    importing
      !IT_BAPI_RETURN type BAPIRET2_TT optional
      !IS_BAPI_RETURN type BAPIRET2 optional
      !IV_MESSAGE type BAPI_MSG optional
    exporting
      !EO_MESSAGE_CONTAINER type ref to /IWBEP/IF_MESSAGE_CONTAINER .
  methods PRODUCT_DETAIL
    importing
      !IV_MATNR type AUSP-ATWRT
    exporting
      !ET_BAGLI_URUNLER type ZSD_T_URUN_STRUCTUR .
  methods PRODUCT_LIST_GET
    importing
      !IV_REF_TREE type STRING
    exporting
      !ET_URUNLER type ZSD_T_URUN_STRUCTUR .
  methods PRODUCT_LIST_GET_V2
    importing
      !IV_SEARCH_PARAMETER type STRING
    exporting
      !ET_URUNLER type ZSD_T_URUN_STRUCTUR .
  methods PRODUCT_PRICE_GET
    importing
      !IV_MATNR type MATNR
    exporting
      !EV_TOPLAM_TUTAR type BAPINETWR
      !EV_KDV type BAPIWMWST
      !EV_NET_TUTAR type BAPINETWR
      !EV_CURRENCY type WAERK
      !EV_KDV_YUZDE type PRZNT .
  methods TREE_GET
    exporting
      !ET_TREE type ZSD_UI5_TREE_TT .

  methods BARKODURUNSET_GET_ENTITY
    redefinition .
  methods FIYATISKONTOHEAD_GET_ENTITYSET
    redefinition .
  methods FIYATISKONTOITEM_GET_ENTITYSET
    redefinition .
  methods FIYATSET_GET_ENTITY
    redefinition .
  methods FIYATSET_GET_ENTITYSET
    redefinition .
  methods HEADERBAGLIURUNL_GET_ENTITY
    redefinition .
  methods HEADERBAGLIURUNL_GET_ENTITYSET
    redefinition .
  methods HEADERBOLGESET_GET_ENTITY
    redefinition .
  methods HEADERBOLGESET_GET_ENTITYSET
    redefinition .
  methods ITEMBAGLIURUNLER_GET_ENTITY
    redefinition .
  methods ITEMBAGLIURUNLER_GET_ENTITYSET
    redefinition .
  methods ITEMSATSORSET_GET_ENTITYSET
    redefinition .
  methods MUSTERIHEADERSET_CREATE_ENTITY
    redefinition .
  methods MUSTERIHEADERSET_GET_ENTITY
    redefinition .
  methods MUSTERIHEADERSET_GET_ENTITYSET
    redefinition .
  methods MUSTERIITEMSET_GET_ENTITYSET
    redefinition .
  methods PERSONELGIRISSET_GET_ENTITY
    redefinition .
  methods PERSONELGIRISSET_GET_ENTITYSET
    redefinition .
  methods REFTREESET_GET_ENTITY
    redefinition .
  methods REFTREESET_GET_ENTITYSET
    redefinition .
  methods SALESCREATEHEA01_GET_ENTITY
    redefinition .
  methods SALESCREATEHEA01_GET_ENTITYSET
    redefinition .
  methods SALESCREATEHEADE_GET_ENTITY
    redefinition .
  methods SALESCREATEHEADE_GET_ENTITYSET
    redefinition .
  methods SALESCREATEITEMS_GET_ENTITY
    redefinition .
  methods SALESCREATEITEMS_GET_ENTITYSET
    redefinition .
  methods TREESET_GET_ENTITYSET
    redefinition .
  methods URUNLERSET_GET_ENTITYSET
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZSD_ODATA_KASA_DPC_EXT IMPLEMENTATION.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.

    "SalesCreateHeaderSet
    DATA : ls_sales_create_deep TYPE zcl_zsd_odata_kasa_mpc_ext=>ty_sales_create_deep,
           lt_salesitem         TYPE TABLE OF zcl_zsd_odata_kasa_mpc_ext=>ts_salescreateitem,
           ls_salesheader       TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_salescreateheader.

    "SalesCreateHeaderSet_v2
    DATA : ls_sales_create_deep_v2 TYPE zcl_zsd_odata_kasa_mpc_ext=>ty_sales_create_deep_v2,
           lt_salesitems_v2        TYPE TABLE OF zcl_zsd_odata_kasa_mpc_ext=>ts_salescreateitems_v2,
           ls_salesheader_v2       TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_salescreateheader_v2.


    DATA : ls_siparis TYPE zfiori_siparis,
           lv_error   TYPE flag,
           lv_vbeln   TYPE vbeln.


    DATA : ls_sip_log TYPE zfiori_t_sip_log,
           lt_sip_log TYPE TABLE OF zfiori_t_sip_log.

    "FiyatIskontoHeaderSet
    DATA : ls_fiyat_iskonto_deep   TYPE zcl_zsd_odata_kasa_mpc_ext=>ty_fiyat_iskonto_deep,
           lt_fiyat_iskonto_item   TYPE TABLE OF zcl_zsd_odata_kasa_mpc_ext=>ts_fiyatiskontoitem,
           ls_fiyat_iskonto_header TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_fiyatiskontoheader.

    DATA : lt_deep_fiyat_iskonto_item TYPE zsd_fiyat_iskonto_item_tt,
           lv_iskonto_error           TYPE flag,
           lt_bapi_return             TYPE bapiret2_tt,
           lv_son_indirim_yuzde       TYPE bapikbetr,
           lv_son_indirim_yuzde_v2    TYPE bapikbetr1.

*    PDF data
    DATA : lv_pdf              TYPE xstring,
           ls_musteri_pdf_data TYPE zsd_musteri_pdf_data_st,
           ls_malzeme_pdf_data TYPE zsd_malzeme_pdf_data_st,
           lt_malzeme_pdf_data TYPE zsd_malzeme_pdf_data_tt,
           ls_tutar_pdf_data   TYPE zsd_genel_tutar_pdf_data_st.

    "Hata Log
    DATA : ls_error_log TYPE bapiret2,
           lt_error_log TYPE TABLE OF bapiret2.

    DATA : ls_s_log             TYPE bal_s_msg,
           lo_message_container TYPE REF TO /iwbep/if_message_container.



    CASE iv_entity_set_name.
      WHEN 'SalesCreateHeaderSet'.

        TRY .
            CALL METHOD io_data_provider->read_entry_data
              IMPORTING
                es_data = ls_sales_create_deep.

            IF ls_sales_create_deep IS NOT INITIAL.

              ls_siparis-header-sipkey = ls_sales_create_deep-sipkey.
              ls_siparis-header-simul = ls_sales_create_deep-simul.
              ls_siparis-header-bolge = ls_sales_create_deep-bolge.
              ls_siparis-header-musteri = ls_sales_create_deep-musteri.
              ls_siparis-header-musteri_type = ls_sales_create_deep-musteri_type.
              ls_siparis-header-payment_type = ls_sales_create_deep-payment_type.
*              ls_siparis-header-genel_iskonto_tutar = ls_sales_create_deep-genel_iskonto_tutar.
              ls_siparis-header-genel_iskonto_yuzde = ls_sales_create_deep-genel_iskonto_yuzde.
              ls_siparis-header-satis_sorumlusu = ls_sales_create_deep-satis_sorumlusu.
              ls_siparis-header-odeme_sekli = ls_sales_create_deep-odeme_sekli.
              ls_siparis-header-fark_yuvarla = ls_sales_create_deep-fark_yuvarla.

              ls_siparis-lines = CORRESPONDING #( ls_sales_create_deep-salesheadertoitemnav ).


              create_order(
                CHANGING
                  cs_siparis = ls_siparis
                  cv_vbeln   = lv_vbeln
                  cv_error   = lv_error ).

              IF lv_error EQ 'X'.

                z_sd_fiori_app_log=>create_dyn_log(
                                   EXPORTING
                                     object    = 'ZSD_FIORI'
                                     subobject = 'ZSD_SIPARIS'
                                     t_return  = ls_siparis-return ).

              ELSE.
                ls_sales_create_deep-vbeln = lv_vbeln.

                me->copy_data_to_ref(
                  EXPORTING
                    is_data = ls_sales_create_deep
                  CHANGING
                    cr_data = er_deep_entity ).

                SELECT SINGLE * FROM kna1 INTO @DATA(ls_name)
                  WHERE kunnr = @ls_siparis-header-musteri.

                CONCATENATE ls_name-name1 ls_name-name2 INTO ls_sip_log-musteri_adi SEPARATED BY ' '.

                SELECT SINGLE * FROM zsatis_sorumlusu INTO @DATA(ls_satsor)
                  WHERE pernr = @ls_siparis-header-satis_sorumlusu.

                CONCATENATE ls_satsor-vorna ls_satsor-nachn INTO ls_sip_log-satis_sorumlusu_adi SEPARATED BY ' '.

                SELECT SINGLE kasa_kodu_tn FROM zkasa_t_kod INTO ls_sip_log-bolge_adi
                  WHERE kasa_kodu = ls_siparis-header-bolge.


                ls_musteri_pdf_data = VALUE #( siparis_no          = lv_vbeln
                                               musteri_adi         = ls_sip_log-musteri_adi
                                               musteri_no          = ls_siparis-header-musteri
                                               satis_sorumlusu_adi = ls_sip_log-satis_sorumlusu_adi
                                               bolge_adi           = ls_sip_log-bolge_adi
                                              ).


                ls_tutar_pdf_data-genel_iskonto_yuzde = ls_siparis-header-genel_iskonto_yuzde / 10.

                CLEAR ls_malzeme_pdf_data.
                REFRESH lt_malzeme_pdf_data.
                LOOP AT ls_sales_create_deep-salesheadertoitemnav INTO DATA(ls_items).
                  ls_malzeme_pdf_data-kalem = ls_items-kbf_item.
                  ls_malzeme_pdf_data-malzeme_no = ls_items-material.

                  SELECT SINGLE maktx FROM makt INTO ls_malzeme_pdf_data-malzeme_adi
                    WHERE matnr = ls_items-material.

                  ls_malzeme_pdf_data-miktar = ls_items-quantity.
                  ls_malzeme_pdf_data-para_birimi = ls_items-currency.

                  ls_malzeme_pdf_data-iskonto_yuzde = ls_items-iskonto_yuzde / 100.
*                  ls_malzeme_pdf_data-iskonto_tutar = ls_items-iskonto_tutar.

                  APPEND ls_malzeme_pdf_data TO lt_malzeme_pdf_data.
                  CLEAR ls_malzeme_pdf_data.
                ENDLOOP.


                CLEAR : lv_pdf.

                create_pdf(
                  EXPORTING
                    iv_vbeln   = lv_vbeln
                    is_musteri = ls_musteri_pdf_data
                    it_malzeme = lt_malzeme_pdf_data
                    is_tutar   = ls_tutar_pdf_data
                    iv_payment = ls_sales_create_deep-payment_type
                    iv_bolge = ''
                    iv_satis_sorumlusu = ''
                  IMPORTING
                    ev_pdf     = lv_pdf ).


                IF lv_pdf IS NOT INITIAL.
                  ls_sip_log-pdf = lv_pdf.
                ELSE.

                  ls_s_log = VALUE #( msgid = 'ZFIORI_SALES'
                                      msgno = '001'
                                      msgv1 = lv_vbeln
                                    ).

                  z_sd_fiori_app_log=>create_dyn_log(
                                     EXPORTING
                                       object    = 'ZSD_FIORI'
                                       subobject = 'ZSD_SIPARIS'
                                       s_log     = ls_s_log ).

                ENDIF.

                ls_sip_log-vbeln = lv_vbeln.
                ls_sip_log-musteri_no = ls_siparis-header-musteri.
                ls_sip_log-satis_sorumlusu_no = ls_siparis-header-satis_sorumlusu.
                ls_sip_log-bolge_no = ls_siparis-header-bolge.
                ls_sip_log-saat  = sy-uzeit.
                ls_sip_log-tarih = sy-datum.
                ls_sip_log-odeme_turu = ls_siparis-header-odeme_sekli.

                APPEND ls_sip_log TO lt_sip_log.
                MODIFY zfiori_t_sip_log FROM TABLE lt_sip_log.

                CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
                  EXPORTING
                    wait = abap_true.

              ENDIF.

            ENDIF.
          CATCH /iwbep/cx_mgw_tech_exception.

        ENDTRY.

      WHEN 'FiyatIskontoHeaderSet'.
        TRY .
            CALL METHOD io_data_provider->read_entry_data
              IMPORTING
                es_data = ls_fiyat_iskonto_deep.

            IF ls_fiyat_iskonto_deep IS NOT INITIAL.

              CLEAR : lv_iskonto_error, ls_fiyat_iskonto_deep-net_tutar, ls_fiyat_iskonto_deep-kdv, ls_fiyat_iskonto_deep-toplam_tutar, ls_fiyat_iskonto_deep-toplam_indirim_tutar.

              lt_deep_fiyat_iskonto_item = CORRESPONDING #( ls_fiyat_iskonto_deep-fiyatiskontoheadertoitemnav ).

              discount_price_simulation_v2(
              EXPORTING
                iv_musteri_no           = ls_fiyat_iskonto_deep-musteri_no
                iv_genel_iskonto_yuzde  = ls_fiyat_iskonto_deep-genel_iskonto_yuzde
                iv_payment              = ls_fiyat_iskonto_deep-odeme_turu
                iv_bolge                = ls_fiyat_iskonto_deep-bolge
                iv_satis_sorumlusu      = ls_fiyat_iskonto_deep-satis_sorumlusu
              IMPORTING
                ev_net_tutar            = ls_fiyat_iskonto_deep-net_tutar
                ev_kdv                  = ls_fiyat_iskonto_deep-kdv
                ev_toplam_tutar         = ls_fiyat_iskonto_deep-toplam_tutar
                ev_toplam_indirim_tutar = ls_fiyat_iskonto_deep-toplam_indirim_tutar
                ev_error                = lv_iskonto_error
                et_return               = lt_bapi_return
              CHANGING
                ct_items                = lt_deep_fiyat_iskonto_item ).



***** YUVARLAMA ISLEMLERI KAPATILDI
*****              "IKINCI tur HEADER YUZDE GIREREK FIYAT INDIRME -------------------------------------------------------------------------------
*****              CLEAR lv_son_indirim_yuzde_v2.
*****              IF ls_fiyat_iskonto_deep-son_toplam_tutar > 0.
******                lv_son_indirim_yuzde_v2 = 100 - ( ( 100 - ls_fiyat_iskonto_deep-genel_iskonto_yuzde ) * ls_fiyat_iskonto_deep-son_toplam_tutar ) / ls_fiyat_iskonto_deep-toplam_tutar.
*****                lv_son_indirim_yuzde_v2 = 100 - ( ( 100 - 0 ) * ls_fiyat_iskonto_deep-son_toplam_tutar ) / ls_fiyat_iskonto_deep-toplam_tutar.
*****
*****                ls_fiyat_iskonto_deep-genel_iskonto_yuzde = lv_son_indirim_yuzde_v2.
*****                DATA : lv_ilk_item_kdv_yuzde TYPE prznt.
*****
*****                discount_price_simulation_v2(
*****                EXPORTING
*****                  iv_musteri_no           = ls_fiyat_iskonto_deep-musteri_no
*****                  iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*****                  iv_payment              = ls_fiyat_iskonto_deep-odeme_turu
*****                  iv_bolge                = ls_fiyat_iskonto_deep-bolge
*****                  iv_satis_sorumlusu      = ls_fiyat_iskonto_deep-satis_sorumlusu
*****                IMPORTING
*****                  ev_net_tutar            = ls_fiyat_iskonto_deep-net_tutar
*****                  ev_kdv                  = ls_fiyat_iskonto_deep-kdv
*****                  ev_toplam_tutar         = ls_fiyat_iskonto_deep-toplam_tutar
*****                  ev_toplam_indirim_tutar = ls_fiyat_iskonto_deep-toplam_indirim_tutar
*****                  ev_error                = lv_iskonto_error
*****                  et_return               = lt_bapi_return
*****                CHANGING
*****                  ct_items                = lt_deep_fiyat_iskonto_item
*****                  cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde ).
*****
*****
*****
*****                DATA : lv_fark_yuvarla TYPE bapikbetr1.
*****
*****                "ucuncu tur son sifirlama---VARSA KALAN FARKI ------------------------------------------------------------------
*****                CLEAR lv_fark_yuvarla.
*****                IF ls_fiyat_iskonto_deep-son_toplam_tutar NE ls_fiyat_iskonto_deep-toplam_tutar.
*****
*****
*****                  lv_fark_yuvarla = ls_fiyat_iskonto_deep-son_toplam_tutar - ls_fiyat_iskonto_deep-toplam_tutar.
*****
*****                  DATA(lv_do_fark_yuvarla) = lv_fark_yuvarla .
*****                  DATA : lv_zdif_deger TYPE bapikbetr1.
*****                  DO.
*****
*****                    discount_price_simulation_v2(
*****                  EXPORTING
*****                    iv_musteri_no           = ls_fiyat_iskonto_deep-musteri_no
*****                    iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*****                    iv_payment              = ls_fiyat_iskonto_deep-odeme_turu
*****                    iv_bolge                = ls_fiyat_iskonto_deep-bolge
*****                    iv_satis_sorumlusu      = ls_fiyat_iskonto_deep-satis_sorumlusu
*****                    iv_fark_yuvarla         = lv_do_fark_yuvarla
*****                  IMPORTING
*****                    ev_net_tutar            = ls_fiyat_iskonto_deep-net_tutar
*****                    ev_kdv                  = ls_fiyat_iskonto_deep-kdv
*****                    ev_toplam_tutar         = ls_fiyat_iskonto_deep-toplam_tutar
*****                    ev_toplam_indirim_tutar = ls_fiyat_iskonto_deep-toplam_indirim_tutar
*****                    ev_error                = lv_iskonto_error
*****                    et_return               = lt_bapi_return
*****                  CHANGING
*****                    ct_items                = lt_deep_fiyat_iskonto_item
*****                    cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde
*****                    cv_zdif_deger           = lv_zdif_deger ).
*****
*****
*****                    IF ls_fiyat_iskonto_deep-son_toplam_tutar =  ls_fiyat_iskonto_deep-toplam_tutar.
*****                      ls_fiyat_iskonto_deep-fark_yuvarla = lv_do_fark_yuvarla.
*****                      EXIT.
*****                    ELSEIF ls_fiyat_iskonto_deep-toplam_tutar GT ls_fiyat_iskonto_deep-son_toplam_tutar.
*****                      "istenen fiyatin üzerinde geldi
*****                      lv_do_fark_yuvarla = lv_do_fark_yuvarla - '0.01'.
*****                    ELSE.
*****                      "istenen fiyatin altinda geldi
*****                      lv_do_fark_yuvarla = lv_do_fark_yuvarla + '0.01'.
*****                    ENDIF.
*****
*****                    IF sy-index GE 10.
*****                      DATA lv_toplam_tutar TYPE string.
*****                      lv_toplam_tutar = ls_fiyat_iskonto_deep-toplam_tutar.
*****                      DATA(lv_lengt) = strlen( lv_toplam_tutar ).
*****                      DATA(lv_off) = lv_lengt - 5.
*****                      DATA(lv_last_digit) = lv_toplam_tutar+lv_off(2).
*****                      IF lv_last_digit EQ '99'.
*****                        ls_fiyat_iskonto_deep-fark_yuvarla = lv_do_fark_yuvarla.
*****                        EXIT.
*****                      ENDIF.
*****                    ELSEIF sy-index GE 15.
*****                      ls_fiyat_iskonto_deep-fark_yuvarla = lv_do_fark_yuvarla.
*****                      EXIT.
*****                    ENDIF.
*****
*****
*****
*****                  ENDDO.
*****
*****                ENDIF.
*****
*****              ENDIF.

              IF lv_iskonto_error EQ 'X'.

                z_sd_fiori_app_log=>create_dyn_log(
                   EXPORTING
                     object    = 'ZSD_FIORI'
                     subobject = 'ZSD_FIYAT'
                     t_return  = lt_bapi_return ).


                FREE lo_message_container.
                handle_error(
                  EXPORTING
                    it_bapi_return =   lt_bapi_return
                  IMPORTING
                    eo_message_container   = lo_message_container
                ).

                RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
                  EXPORTING
                    message_container = lo_message_container.


              ELSE.

*                  lv_son_indirim_yuzde = 100 - ( ( 100 - ls_fiyat_iskonto_deep-genel_iskonto_yuzde ) * ls_fiyat_iskonto_deep-son_toplam_tutar ) / ls_fiyat_iskonto_deep-toplam_tutar.
*                  lv_son_indirim = 100 - ( ( 100 * ( ls_fiyat_iskonto_deep-toplam_tutar - ls_fiyat_iskonto_deep-son_toplam_tutar ) ) / ls_fiyat_iskonto_deep-toplam_tutar ).


                REFRESH lt_malzeme_pdf_data.
                CLEAR ls_tutar_pdf_data.

                lt_malzeme_pdf_data = CORRESPONDING #( lt_deep_fiyat_iskonto_item ).

                ls_tutar_pdf_data = VALUE #( genel_iskonto_yuzde = ls_fiyat_iskonto_deep-genel_iskonto_yuzde
                                        net_tutar = ls_fiyat_iskonto_deep-net_tutar
                                        kdv = ls_fiyat_iskonto_deep-kdv
                                        toplam_tutar = ls_fiyat_iskonto_deep-toplam_tutar
                                        total_indirim_tutar = ls_fiyat_iskonto_deep-toplam_indirim_tutar
                                        waerk = 'TRY').

                LOOP AT lt_malzeme_pdf_data ASSIGNING FIELD-SYMBOL(<ls_malzeme>).
                  SELECT SINGLE maktx FROM makt INTO <ls_malzeme>-malzeme_adi
                    WHERE matnr = <ls_malzeme>-malzeme_no.
                ENDLOOP.

                IF ls_fiyat_iskonto_deep-teklif_no IS INITIAL.

                  DATA : gv_number TYPE num6.

                  CALL FUNCTION 'NUMBER_GET_NEXT'
                    EXPORTING
                      nr_range_nr             = '01'
                      object                  = 'ZTEKLIF_NO'
                    IMPORTING
                      number                  = gv_number
                    EXCEPTIONS
                      interval_not_found      = 1
                      number_range_not_intern = 2
                      object_not_found        = 3
                      quantity_is_0           = 4
                      quantity_is_not_1       = 5
                      interval_overflow       = 6
                      buffer_overflow         = 7.

                  ls_fiyat_iskonto_deep-teklif_no = |{ sy-datum+2(2) }{ sy-datum+4(2) }{ gv_number }|.

                ENDIF.

                create_pdf_v2(
                  EXPORTING
                    iv_musteri_no      = ls_fiyat_iskonto_deep-musteri_no
                    iv_teklif          = 'X'
                    iv_teklif_no       = ls_fiyat_iskonto_deep-teklif_no
                    it_malzeme         = lt_malzeme_pdf_data
                    is_tutar           = ls_tutar_pdf_data
                    iv_payment         = ls_fiyat_iskonto_deep-odeme_turu
                    iv_bolge           = ls_fiyat_iskonto_deep-bolge
                    iv_satis_sorumlusu = ls_fiyat_iskonto_deep-satis_sorumlusu
                  IMPORTING
                    ev_pdf             = DATA(lv_pdf_xstring)
                   ).

                DATA : lt_teklif_header TYPE TABLE OF zsd_t_teklif_hed,
                       ls_teklif_header LIKE LINE OF lt_teklif_header,
                       lt_teklif_item   TYPE TABLE OF zsd_t_teklif_ite,
                       ls_teklif_item   LIKE LINE OF lt_teklif_item.


                IF lv_pdf_xstring IS NOT INITIAL.

                  DATA lv_musteri_no TYPE char10.
                  lv_musteri_no = ls_fiyat_iskonto_deep-musteri_no.
                  SHIFT lv_musteri_no LEFT DELETING LEADING '0'.


                  ls_teklif_header = VALUE #( mandt = sy-mandt
                                              simkey = ls_fiyat_iskonto_deep-teklif_no
                                              musteri_no = ls_fiyat_iskonto_deep-musteri_no
                                              odeme_turu = ls_fiyat_iskonto_deep-odeme_turu
                                              satis_sorumlusu = ls_fiyat_iskonto_deep-satis_sorumlusu
                                              bolge = ls_fiyat_iskonto_deep-bolge
                                              genel_iskonto_yuzde = ls_fiyat_iskonto_deep-genel_iskonto_yuzde
                                              pdf = lv_pdf_xstring
                                              dosya_adi = |{ lv_musteri_no }_{ sy-datum }|
                                              tarih = sy-datum
                                              saat = sy-uzeit
                                             ).

                  MODIFY zsd_t_teklif_hed FROM ls_teklif_header.

                  CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
                    EXPORTING
                      wait = abap_true.

                  LOOP AT lt_deep_fiyat_iskonto_item ASSIGNING FIELD-SYMBOL(<ls_iskonto_item>).
                    ls_teklif_item = VALUE #( mandt = sy-mandt
                                              simkey = ls_fiyat_iskonto_deep-teklif_no
                                              kalem = <ls_iskonto_item>-kalem
                                              malzeme_no = <ls_iskonto_item>-malzeme_no
                                              miktar = <ls_iskonto_item>-miktar
                                              iskonto_yuzde = <ls_iskonto_item>-iskonto_yuzde
                                              tarih = sy-datum
                                              saat = sy-uzeit
                                              ).
                    APPEND ls_teklif_item TO lt_teklif_item.
                  ENDLOOP.

                  MODIFY zsd_t_teklif_ite FROM TABLE lt_teklif_item.

                  CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
                    EXPORTING
                      wait = abap_true.

                ENDIF.

                MOVE-CORRESPONDING lt_deep_fiyat_iskonto_item TO ls_fiyat_iskonto_deep-fiyatiskontoheadertoitemnav.

                me->copy_data_to_ref(
                  EXPORTING
                    is_data = ls_fiyat_iskonto_deep
                  CHANGING
                    cr_data = er_deep_entity ).

              ENDIF.

            ENDIF.

          CATCH /iwbep/cx_mgw_tech_exception.

        ENDTRY.

      WHEN 'SalesCreateHeader_v2Set'.

        TRY .

            CALL METHOD io_data_provider->read_entry_data
              IMPORTING
                es_data = ls_sales_create_deep_v2.

            DATA : lv_deep_v2_error          TYPE flag,
                   lv_vbeln_v2               TYPE vbeln,
                   lt_return_deep_v2         TYPE bapiret2_tt,
                   lt_deep_create_order_item TYPE zsd_fiyat_iskonto_item_tt.

            IF ls_sales_create_deep_v2 IS NOT INITIAL.

              lt_deep_fiyat_iskonto_item = CORRESPONDING #( ls_sales_create_deep_v2-salesheadertoitemnav_v2 ).

              create_order_v2(
                EXPORTING
                  iv_musteri_no          =  ls_sales_create_deep_v2-musteri_no
                  iv_genel_iskonto_yuzde =  ls_sales_create_deep_v2-genel_iskonto_yuzde
                  iv_final_iskonto_tutar =  ls_sales_create_deep_v2-son_toplam_tutar
                  iv_payment             =  ls_sales_create_deep_v2-odeme_turu
                  iv_bolge               =  ls_sales_create_deep_v2-bolge
                  iv_satis_sorumlusu     =  ls_sales_create_deep_v2-satis_sorumlusu
                  iv_fark_yuvarla        =  ls_sales_create_deep_v2-fark_yuvarla
                  iv_son_toplam_tutar    =  ls_sales_create_deep_v2-son_toplam_tutar
                IMPORTING
                  ev_error               = lv_deep_v2_error
                  ev_vbeln               = lv_vbeln_v2
                  es_tutar               = ls_tutar_pdf_data
                  et_return              = lt_return_deep_v2
                CHANGING
                  ct_items               = lt_deep_fiyat_iskonto_item ).


              IF lv_deep_v2_error EQ 'X'.

                z_sd_fiori_app_log=>create_dyn_log(
                                   EXPORTING
                                     object    = 'ZSD_FIORI'
                                     subobject = 'ZSD_SIPARIS'
                                     t_return  = lt_return_deep_v2 ).

                FREE lo_message_container.
                handle_error(
                  EXPORTING
                    it_bapi_return =   lt_return_deep_v2
                  IMPORTING
                    eo_message_container   = lo_message_container
                ).

                RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
                  EXPORTING
                    message_container = lo_message_container.

              ELSE.
                ls_sales_create_deep_v2-vbeln = lv_vbeln_v2.

                me->copy_data_to_ref(
                  EXPORTING
                    is_data = ls_sales_create_deep_v2
                  CHANGING
                    cr_data = er_deep_entity ).

                CLEAR ls_sip_log.

                SELECT SINGLE * FROM kna1 INTO ls_name
                  WHERE kunnr = ls_sales_create_deep_v2-musteri_no.

                CONCATENATE ls_name-name1 ls_name-name2 INTO ls_sip_log-musteri_adi SEPARATED BY ' '.

                SELECT SINGLE * FROM zsatis_sorumlusu INTO ls_satsor
                  WHERE pernr = ls_sales_create_deep_v2-satis_sorumlusu.

                CONCATENATE ls_satsor-vorna ls_satsor-nachn INTO ls_sip_log-satis_sorumlusu_adi SEPARATED BY ' '.

                SELECT SINGLE kasa_kodu_tn FROM zkasa_t_kod INTO ls_sip_log-bolge_adi
                  WHERE kasa_kodu = ls_sales_create_deep_v2-bolge.


                CLEAR : lv_pdf.

                lt_malzeme_pdf_data = CORRESPONDING #( lt_deep_fiyat_iskonto_item ).

                LOOP AT lt_malzeme_pdf_data ASSIGNING FIELD-SYMBOL(<ls_malzeme_data>).
                  SELECT SINGLE maktx FROM makt INTO <ls_malzeme_data>-malzeme_adi
                    WHERE matnr = <ls_malzeme_data>-malzeme_no.
                ENDLOOP.


                create_pdf_v2(
                  EXPORTING
                    iv_vbeln           = ls_sales_create_deep_v2-vbeln
                    iv_musteri_no      = ls_sales_create_deep_v2-musteri_no
                    it_malzeme         = lt_malzeme_pdf_data
                    is_tutar           = ls_tutar_pdf_data
                    iv_payment         = ls_sales_create_deep_v2-odeme_turu
                    iv_bolge           = ls_sales_create_deep_v2-bolge
                    iv_satis_sorumlusu = ls_sales_create_deep_v2-satis_sorumlusu
                  IMPORTING
                    ev_pdf             = lv_pdf
                   ).


                IF lv_pdf IS NOT INITIAL.
                  ls_sip_log-pdf = lv_pdf.
                ELSE.

                  ls_s_log = VALUE #( msgid = 'ZFIORI_SALES'
                                      msgno = '001'
                                      msgv1 = lv_vbeln_v2
                                    ).

                  z_sd_fiori_app_log=>create_dyn_log(
                                     EXPORTING
                                       object    = 'ZSD_FIORI'
                                       subobject = 'ZSD_SIPARIS'
                                       s_log     = ls_s_log ).

                ENDIF.

                ls_sip_log-vbeln = lv_vbeln_v2.
                ls_sip_log-musteri_no = ls_sales_create_deep_v2-musteri_no.
                ls_sip_log-satis_sorumlusu_no = ls_sales_create_deep_v2-satis_sorumlusu.
                ls_sip_log-bolge_no = ls_sales_create_deep_v2-bolge.
                ls_sip_log-saat  = sy-uzeit.
                ls_sip_log-tarih = sy-datum.

                IF ls_sales_create_deep_v2-odeme_turu EQ '1'.
                  ls_sip_log-odeme_turu = 'Nakit'.
                ELSEIF ls_sales_create_deep_v2-odeme_turu EQ '2'.
                  ls_sip_log-odeme_turu = 'Kredi Kartı'.
                ENDIF.

                APPEND ls_sip_log TO lt_sip_log.
                MODIFY zfiori_t_sip_log FROM TABLE lt_sip_log.

                CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
                  EXPORTING
                    wait = abap_true.

              ENDIF.

            ENDIF.

          CATCH /iwbep/cx_mgw_tech_exception.

        ENDTRY.

    ENDCASE.

  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_expanded_entityset.

    "DATA DECLERATION

    "HeaderBagliUrunlerSet
    DATA : lt_deep_entity   TYPE TABLE OF zcl_zsd_odata_kasa_mpc_ext=>ts_bagli_urunler, "Deep Entity Type
           ls_deep_entity   TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_bagli_urunler,          "Deep Entity Type
           lt_bagli_urunler TYPE zsd_t_urun_structur.


    "refTreeSet
    DATA : lt_out_tab      TYPE TABLE OF zcl_zsd_odata_kasa_mpc_ext=>ts_tree_urun, "Deep Entity Type
           ls_out_tab      TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_tree_urun,          "Deep Entity Type
           lt_urunler      TYPE zsd_t_urun_structur,
           lt_urunler_temp TYPE zsd_t_urun_structur.
    DATA : lv_matnr TYPE ausp-atwrt.
    DATA : lv_refno TYPE char4.


    "SalesCreateHeaderSet
*    DATA : ls_sales_create_deep TYPE zcl_zdeep_create_mpc_ext=>ty_sales_create_deep,
*           lt_sales_create_deep TYPE TABLE OF zcl_zdeep_create_mpc_ext=>ty_sales_create_deep,
*           lt_salesitem         TYPE TABLE OF zcl_zdeep_create_mpc_ext=>ts_salescreateitem.



    LOOP AT it_filter_select_options INTO DATA(ls_filter).
      LOOP AT ls_filter-select_options INTO DATA(ls_filter_range).
        EXIT .
      ENDLOOP.
    ENDLOOP.

    CASE iv_entity_set_name.
      WHEN 'HeaderBagliUrunlerSet'. " To Be Continued

*        lv_matnr  =  ls_filter_range-low  .
*
*        CALL METHOD product_detail
*          EXPORTING
*            iv_matnr         = lv_matnr
*          IMPORTING
*            et_bagli_urunler = lt_urunler.

**        CALL FUNCTION 'Z_URUN_DETAYI'
**          EXPORTING
**            iv_matnr         = lv_matnr
**          IMPORTING
**            et_bagli_urunler = lt_urunler.

*        ls_deep_entity-matnr = lv_matnr.
*        ls_deep_entity-headertoitemnav = lt_urunler.
*
*        APPEND ls_deep_entity TO lt_deep_entity.
*
*        CALL METHOD me->/iwbep/if_mgw_conv_srv_runtime~copy_data_to_ref
*          EXPORTING
*            is_data = lt_deep_entity
*          CHANGING
*            cr_data = er_entityset.


      WHEN 'refTreeSet'.
*        lv_refno = ls_filter_range-low.

*        CALL METHOD product_list_get
*          EXPORTING
*            iv_ref_tree = lv_refno
*          IMPORTING
*            et_urunler  = lt_urunler.


*        CALL FUNCTION 'Z_URUN_LISTESI'
*          EXPORTING
*            iv_ref_tree = lv_refno
*          IMPORTING
*            et_urunler  = lt_urunler.

        " Satış Kodu olmayan ürünlerin listede görünmemesi için:
*        LOOP AT lt_urunler INTO DATA(ls_urunler).
*
*          CLEAR lt_urunler_temp[].
*
*          CALL FUNCTION 'Z_URUN_DETAYI'
*            EXPORTING
*              iv_matnr         = ls_urunler-metacode
*            IMPORTING
*              et_bagli_urunler = lt_urunler_temp.
*
*          IF lt_urunler_temp IS INITIAL.
*            DELETE lt_urunler WHERE matnr = ls_urunler-metacode.
*          ENDIF.
*
*        ENDLOOP.

*        ls_out_tab-ref_tree = lv_refno.
*        ls_out_tab-tree_to_urunler = lt_urunler.
*        APPEND ls_out_tab TO lt_out_tab.
*
*
*        CALL METHOD me->/iwbep/if_mgw_conv_srv_runtime~copy_data_to_ref
*          EXPORTING
*            is_data = lt_out_tab
*          CHANGING
*            cr_data = er_entityset.

    ENDCASE.


  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_stream.

    DATA : ls_stream       TYPE ty_s_media_resource,
           ls_header       TYPE ihttpnvp,
           lv_file_name    TYPE string,
           lv_db_dosya_adi TYPE string,
           lv_pdf_xstring  TYPE xstring.

    DATA lo_message_container TYPE REF TO /iwbep/if_message_container.


    IF it_key_tab IS NOT INITIAL.
      DATA(lv_pdfkey) = VALUE #( it_key_tab[ 1 ]-value ).
      DATA(lv_teklif) = VALUE #( it_key_tab[ 2 ]-value ).

      IF lv_teklif EQ 'true'.

        SELECT SINGLE pdf dosya_adi FROM zsd_t_teklif_hed INTO ( lv_pdf_xstring, lv_db_dosya_adi )
            WHERE simkey EQ lv_pdfkey.
        IF sy-subrc EQ 0.
          lv_file_name = |{ lv_db_dosya_adi }.pdf|.
        ENDIF.

      ELSE.

        SELECT SINGLE pdf FROM zfiori_t_sip_log INTO lv_pdf_xstring
            WHERE vbeln EQ lv_pdfkey.
        IF sy-subrc EQ 0.
          lv_file_name = |{ lv_pdfkey }.pdf|.
        ENDIF.

      ENDIF.

      IF sy-subrc EQ 0.

        ls_stream = VALUE #( mime_type = 'application/pdf'
                             value = lv_pdf_xstring
                           ).


        ls_header = VALUE #( name = 'Content-Disposition'
*                             value = |' outline; filename={ lv_file_name };'|
                             value = |'inline; filename={ lv_file_name }|
                           ).

        /iwbep/if_mgw_conv_srv_runtime~set_header( ls_header ).


        set_header( is_header = ls_header ).

        me->copy_data_to_ref(
          EXPORTING
            is_data = ls_stream
          CHANGING
            cr_data = er_stream ).


      ELSE.
        FREE lo_message_container.
        handle_error(
          EXPORTING
            iv_message = 'Pdf bulunmamaktadır.'
          IMPORTING
            eo_message_container   = lo_message_container
        ).

        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
          EXPORTING
            message_container = lo_message_container.
      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD barcode_to_product.

    TYPES: BEGIN OF ty_matnr,
             matnr TYPE matnr,
             maktx TYPE maktx,
           END OF ty_matnr.

    DATA lt_matnr TYPE TABLE OF ty_matnr.
    DATA lv_mtart TYPE mara-mtart.

    DATA ls_urunler TYPE zsd_urun_structur.

    DATA: e_lines TYPE zma_tt_tline,
          w_lines LIKE LINE OF e_lines.

    DATA: lv_kanal   TYPE atwtb,
          lv_anagrup TYPE atwtb,
          lv_altgrup TYPE atwtb,
          lv_urunadi TYPE atwtb.

    "fiyat data
    DATA : lv_tutar	TYPE bapinetwr,
           lv_kdv   TYPE bapiwmwst,
           lv_fiyat TYPE bapinetwr.

    DATA : lv_ean11 TYPE mara-ean11,
           lv_matnr TYPE matnr.


    IF barkod_no+0(1) EQ 3.
      lv_matnr = barkod_no.
    ELSE.
      lv_ean11 = barkod_no.
      SELECT SINGLE matnr FROM mara INTO lv_matnr WHERE ean11 = lv_ean11.
    ENDIF.

    IF sy-subrc = 0.
      IF NOT lv_matnr CS '0000000'.
        CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
          EXPORTING
            input  = lv_matnr
          IMPORTING
            output = es_urun-metacode.
      ELSE.
        es_urun-metacode = lv_matnr.
      ENDIF.

      es_urun-matnr = lv_matnr.

      "Resim 1
      CALL FUNCTION 'ZBA_F_GET_DOC_LINK_BY_MATNR'
        EXPORTING
          matnr = es_urun-metacode
        IMPORTING
          link  = es_urun-resim.
      "Resim 2
      CALL FUNCTION 'ZMA_F_GET_DOC_LINK_BY_MATNR_B'
        EXPORTING
          matnr = es_urun-metacode
        IMPORTING
          link  = es_urun-resim_buyuk.

      SELECT SINGLE maktx FROM makt INTO es_urun-maktx
      WHERE matnr = es_urun-metacode AND spras = sy-langu.

      "Fiyat
      product_price_get(
        EXPORTING
          iv_matnr        = es_urun-metacode
        IMPORTING
          ev_toplam_tutar = lv_tutar
          ev_kdv          = lv_kdv
          ev_net_tutar    = lv_fiyat ).

      es_urun-price = lv_fiyat.
      es_urun-kdv = lv_kdv.
      es_urun-tutar = lv_tutar.


      "Boyutlar
      CALL FUNCTION 'ZMA_F_GET_DIMENSION_BY_MATNR_M'
        EXPORTING
          i_matnr         = es_urun-metacode
        IMPORTING
          e_boy           = es_urun-boy
          e_en            = es_urun-en
          e_yukseklik     = es_urun-yukseklik
          e_cap           = es_urun-cap
          e_en_max        = es_urun-en_max
          e_yukseklik_max = es_urun-yukseklik_max
          e_boy_max       = es_urun-boy_max.


      "Ağırlık ve Hacim
      CALL FUNCTION 'ZMA_F_GET_AGIRL_HACIM_BY_MATNR'
        EXPORTING
          i_matnr   = es_urun-metacode
        IMPORTING
          e_agirlik = es_urun-brgew
          e_hacim   = es_urun-volum.

      REFRESH e_lines.

      "Uzun Metin
      CALL FUNCTION 'ZMA_F_GET_LONGTEXT_BY_MATNR'
        EXPORTING
          i_matnr    = es_urun-metacode
          i_language = sy-langu
        TABLES
          e_lines    = e_lines.

      CLEAR es_urun-maktxuz.
      LOOP AT e_lines INTO w_lines.
        es_urun-maktxuz = |{ es_urun-maktxuz }{ w_lines-tdline }|.
      ENDLOOP.

      IF sy-langu = 'T'.
        "Ürün ağacı
        CALL FUNCTION 'ZMA_F_GET_CHARACTRSTC_BY_MATNR'
          EXPORTING
            i_matnr   = es_urun-metacode
          IMPORTING
            e_kanal   = lv_kanal
            e_anagrup = lv_anagrup
            e_altgrup = lv_altgrup
            e_urunadi = lv_urunadi.
      ELSE.
        "Ürün ağacı
        CALL FUNCTION 'ZMA_F_GET_CHARACTRSEN_BY_MATNR'
          EXPORTING
            i_matnr   = es_urun-metacode
          IMPORTING
            e_kanal   = lv_kanal
            e_anagrup = lv_anagrup
            e_altgrup = lv_altgrup
            e_urunadi = lv_urunadi.
      ENDIF.

      es_urun-sinif = |{ lv_kanal } -> { lv_anagrup } -> { lv_altgrup } -> { lv_urunadi }|.

    ENDIF.

  ENDMETHOD.


  METHOD barkodurunset_get_entity.

    DATA : ls_keys TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_barkodurun.

    io_tech_request_context->get_converted_keys(
     IMPORTING
       es_key_values = ls_keys ).
    IF sy-subrc EQ 0.

      barcode_to_product(
        EXPORTING
          barkod_no = ls_keys-barkod_no
        IMPORTING
          es_urun   = er_entity ).

    ENDIF.
  ENDMETHOD.


  METHOD create_order.

    DATA : ls_param         TYPE zetickas_t_param.
*    DATA : ls_knvv          TYPE knvv.
    DATA : ls_return        TYPE bapiret2.
    DATA : lv_posnr         TYPE posnr.
    DATA : lv_lgort         TYPE lgort_d.
    DATA : lv_kunnr         TYPE kunnr .
    DATA : ls_mlan TYPE mlan.
    DATA : lv_tax_yuzde  TYPE kbetr.
    DATA : lv_vbeln TYPE vbeln .
    DATA : lt_return  TYPE  bapiret2_tt  .

    DATA : ls_header_in        TYPE bapisdhd1,
           lt_partners         TYPE TABLE OF bapiparnr,
           ls_partners         LIKE LINE OF lt_partners,
           lt_partneraddresses TYPE TABLE OF bapiaddr1,
           ls_partneraddresses LIKE LINE OF lt_partneraddresses,
           lt_extensionin      TYPE TABLE OF bapiparex,
           ls_extensionin      LIKE LINE OF lt_extensionin,
           ls_bape_vbak        TYPE bape_vbak,
           ls_bape_vbakx       TYPE bape_vbakx,


           lt_order_items_in   TYPE TABLE OF bapisditm,
           t_order_items_in    TYPE TABLE OF bapisditm,
           ls_order_items_in   LIKE LINE OF lt_order_items_in,
           lt_schedules_in     TYPE TABLE OF bapischdl,
           t_schedules_in      TYPE TABLE OF bapischdl,
           ls_schedules_in     LIKE LINE OF lt_schedules_in,
           lt_conditions_in    TYPE TABLE OF bapicond,
           t_conditions_in     TYPE TABLE OF bapicond,
           ls_conditions_in    LIKE LINE OF lt_conditions_in.


    CLEAR lv_kunnr.
    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
      EXPORTING
        input  = cs_siparis-header-musteri
      IMPORTING
        output = lv_kunnr.

**  CLEAR ls_knvv.
**  SELECT SINGLE * INTO ls_knvv FROM knvv
**         WHERE kunnr = lv_kunnr
**           AND vkorg = '2001'
**           AND vtweg = 'K2'
**           AND spart = '01'.


    "Sipariş parametreleri
    CLEAR ls_param.
    SELECT SINGLE * INTO ls_param FROM zetickas_t_param
           WHERE etic_kasa = 'K' AND kdgrp = cs_siparis-header-bolge.


    SELECT * FROM zkasa_t_kod INTO TABLE @DATA(lt_kasa_t_kod).

    DATA(lv_lgort_bolge) = lt_kasa_t_kod[ kasa_kodu = cs_siparis-header-bolge ]-lgort.

**********************************************************************

    "Satış siparişi oluştur
    "-----------------------------
    ls_header_in-doc_type = ls_param-auart.
    ls_header_in-sd_doc_cat = 'C'.
    ls_header_in-doc_date = sy-datum.
    ls_header_in-sales_org = ls_param-vkorg.
    ls_header_in-distr_chan = ls_param-vtweg.
    ls_header_in-division = ls_param-spart.
    ls_header_in-sales_grp = ls_param-vkgrp.
    ls_header_in-sales_off  = ls_param-vkbur.
    ls_header_in-purch_date = sy-datum.
    ls_header_in-price_date = sy-datum.
    ls_header_in-req_date_h = sy-datum.
    ls_header_in-alttax_cls = '1'.
    ls_header_in-currency = 'TRY'.
    ls_header_in-taxdep_cty = 'TR'.
    ls_header_in-ref_1 = lv_kunnr. "Müşteri ref.

    IF cs_siparis-header-payment_type IS NOT INITIAL.
      CASE cs_siparis-header-payment_type.
        WHEN '1'.ls_header_in-pmnttrms = 'A001'.
        WHEN '2'.ls_header_in-pmnttrms = 'A002'.
      ENDCASE.
    ENDIF.

    IF ls_header_in-pmnttrms IS INITIAL.
      ls_header_in-pmnttrms = 'A001'.
    ENDIF.

    "Sipariş veren
    CLEAR : ls_partners,ls_partneraddresses.
    ls_partners-partn_numb = lv_kunnr.
    ls_partners-addr_link = '1'.
    ls_partners-partn_role = 'AG'.
    SELECT SINGLE adrnr FROM kna1 INTO ls_partneraddresses-addr_no
                                    WHERE kunnr EQ lv_kunnr.

    APPEND: ls_partners TO lt_partners,
            ls_partneraddresses TO lt_partneraddresses.

    "Satış sorumlusu
    CLEAR : ls_partners,ls_partneraddresses.
    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
      EXPORTING
        input  = cs_siparis-header-satis_sorumlusu
      IMPORTING
        output = ls_partners-partn_numb.

    ls_partners-addr_link = '2'.
    ls_partners-partn_role = 'VE'.
*  ls_partneraddresses-addr_no = '2'.
    APPEND: ls_partners TO lt_partners,
            ls_partneraddresses TO lt_partneraddresses.

    "EXTENSIONIN
    ls_extensionin-structure = 'BAPE_VBAK'.
    ls_bape_vbak-zzkunve = ls_partners-partn_numb.
    ls_extensionin+30 = ls_bape_vbak.
    APPEND ls_extensionin TO lt_extensionin.
    CLEAR ls_extensionin.

    ls_extensionin-structure = 'BAPE_VBAKX'.
    ls_bape_vbakx-zzkunve = 'X'.
    ls_extensionin+30 = ls_bape_vbakx.
    APPEND ls_extensionin TO lt_extensionin.
    CLEAR ls_extensionin.

    IF cs_siparis-header-genel_iskonto_tutar GT 0.
      "Header indirim(tutar)
      ls_conditions_in-cond_type = 'ZBKT'.
      ls_conditions_in-itm_number = 000000.
      ls_conditions_in-cond_value = cs_siparis-header-genel_iskonto_tutar.
      ls_conditions_in-cond_p_unt = 1.
      ls_conditions_in-currency = 'TRY'.
      APPEND ls_conditions_in TO lt_conditions_in.
    ENDIF.

    IF cs_siparis-header-genel_iskonto_yuzde GT 0.
      "Header indirim(yüzde)
      ls_conditions_in-cond_type = 'ZBK1'.
      ls_conditions_in-itm_number = 000000.
      ls_conditions_in-cond_value = cs_siparis-header-genel_iskonto_yuzde * 10. "gelen sayiyi 10 ile carparak vermek gerekiyor
      ls_conditions_in-cond_p_unt = 1.
      ls_conditions_in-currency = 'TRY'.
      APPEND ls_conditions_in TO lt_conditions_in.
    ENDIF.

    "Kalemler
    LOOP AT cs_siparis-lines INTO DATA(ls_items).
      SHIFT ls_items-material LEFT DELETING LEADING '0'.

      CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
        EXPORTING
          input  = ls_items-material
        IMPORTING
          output = ls_items-material.

      ADD 10 TO lv_posnr.
      CLEAR : ls_order_items_in,ls_schedules_in,ls_schedules_in.

      ls_order_items_in-itm_number = ls_schedules_in-itm_number = ls_conditions_in-itm_number = lv_posnr.
      ls_order_items_in-material = ls_items-material.
      ls_order_items_in-plant = '2000'.
      ls_order_items_in-target_qty = ls_items-quantity.

      "Vergi
      CLEAR : ls_mlan,ls_return.
      ls_return-type = 'E'.
      ls_return-id = 'ZKASA'.
      ls_return-number = '042'.
      MESSAGE ID ls_return-id TYPE 'E' NUMBER '042'
              WITH ls_items-material INTO ls_return-message.

      SELECT SINGLE * FROM mlan INTO ls_mlan
             WHERE matnr = ls_items-material AND
                   aland = 'TR'.

      IF sy-subrc IS NOT INITIAL OR
       ( ls_mlan-taxm1 IS INITIAL AND ls_mlan-taxm1 NE '0' ).
        APPEND ls_return TO lt_return.
        CONTINUE.
      ELSE.
        CASE ls_mlan-taxm1.
          WHEN '0'.  lv_tax_yuzde =  0.
          WHEN '1'.  lv_tax_yuzde = 18.
          WHEN '2'.  lv_tax_yuzde =  1.
          WHEN '4'.  lv_tax_yuzde =  8.
          WHEN OTHERS.
            APPEND ls_return TO lt_return.
            CONTINUE.
        ENDCASE.
      ENDIF.
      ls_order_items_in-tax_class1 = ls_mlan-taxm1.


      " MATERIALIN BULUNDUGU LGORTLARIN TESPITI
*      SELECT lgort FROM mard INTO TABLE @DATA(lt_lgorts_material)
*        FOR ALL ENTRIES IN @lt_kasa_t_kod
*        WHERE matnr = @ls_order_items_in-material
*          AND werks = @ls_order_items_in-plant.
*          AND lgort = @lt_kasa_t_kod-lgort.

*      IF sy-subrc = 0.
*        IF line_exists( lt_lgorts_material[ lgort = lv_lgort_bolge ] ).
*          lv_lgort = lv_lgort_bolge.
*        ELSE.
*          lv_lgort = lt_lgorts_material[ 1 ]-lgort.
*        ENDIF.
*      ENDIF.


      SELECT * FROM mard INTO TABLE @DATA(lt_mard)
        WHERE matnr = @ls_order_items_in-material
          AND werks = @ls_order_items_in-plant.

      IF sy-subrc = 0.
        IF line_exists( lt_mard[ lgort = lv_lgort_bolge ] ).

          " MARD tablosunda DISKZ (Depo yeri için MİP göstergesi) alanı kontrolü. Eğer alan dolu geliyorsa sipariş oluşturmuyor.
          LOOP AT lt_mard INTO DATA(ls_mard).
            IF ls_mard-lgort EQ lv_lgort_bolge AND ls_mard-diskz EQ ''.
              lv_lgort = lv_lgort_bolge.
              EXIT.
            ELSEIF ls_mard-diskz EQ ''.
              lv_lgort = ls_mard-lgort.
              EXIT.
            ENDIF.
          ENDLOOP.

        ELSE.

          LOOP AT lt_mard INTO ls_mard.
            IF ls_mard-diskz EQ ''.
              lv_lgort = ls_mard-lgort.
              EXIT.
            ENDIF.
          ENDLOOP.

        ENDIF.

      ENDIF.


      ls_order_items_in-store_loc = lv_lgort.
      APPEND ls_order_items_in TO lt_order_items_in.

      ls_schedules_in-req_qty = ls_items-quantity.
      APPEND ls_schedules_in TO lt_schedules_in.

      "Fiyat
      ls_conditions_in-cond_type  = 'PR00'.
      ls_conditions_in-cond_value = ls_items-price.
      ls_conditions_in-cond_p_unt = 1.
      ls_conditions_in-currency   = ls_items-currency.
      APPEND ls_conditions_in TO lt_conditions_in.

**    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
**      EXPORTING
**        input  = ls_items-kbf_item
**      IMPORTING
**        output = ls_items-kbf_item.


      IF ls_items-iskonto_tutar GT 0.
        "Item indirim(tutar)
        ls_conditions_in-cond_type = 'RB00'.
        ls_conditions_in-itm_number = ls_items-kbf_item * 10.
        ls_conditions_in-cond_value = ls_items-iskonto_tutar. "ne verilirse olur carpmadan
        ls_conditions_in-cond_p_unt = 1.
        ls_conditions_in-currency = ls_items-currency.
        APPEND ls_conditions_in TO lt_conditions_in.
      ENDIF.

      IF ls_items-iskonto_yuzde GT 0.
        "Item indirim(yüzde)
        ls_conditions_in-cond_type = 'ZKM1'.
        ls_conditions_in-itm_number = ls_items-kbf_item * 10.
        ls_conditions_in-cond_value = ls_items-iskonto_yuzde * 10. "gelen sayiyi 10 ile carparak vermek gerekiyor
        ls_conditions_in-cond_p_unt = 1.
        ls_conditions_in-currency = ls_items-currency.
        APPEND ls_conditions_in TO lt_conditions_in.
      ENDIF.



      IF cs_siparis-header-fark_yuvarla NE 0 AND lv_posnr EQ 000010.

        DATA : lv_indirimsiz_tutar TYPE bapinetwr.
        DATA : lv_malzeme_kdv_yuzde TYPE prznt.
        DATA : lv_zdif_deger TYPE bapikbetr1.

        CLEAR : lv_indirimsiz_tutar, lv_malzeme_kdv_yuzde, lv_zdif_deger.

        product_price_get(
          EXPORTING
            iv_matnr        = ls_items-material
          IMPORTING
            ev_toplam_tutar = lv_indirimsiz_tutar
            ev_kdv_yuzde = lv_malzeme_kdv_yuzde ).

        lv_zdif_deger =  cs_siparis-header-fark_yuvarla.
        lv_zdif_deger = ( lv_zdif_deger / ( 1 + lv_malzeme_kdv_yuzde / 100 )  ) / 10.

        ls_conditions_in-cond_type = 'ZDIF'.
        ls_conditions_in-itm_number = ls_items-kbf_item * 10.
        ls_conditions_in-cond_value = lv_zdif_deger.
        ls_conditions_in-cond_p_unt = 1.
        ls_conditions_in-currency = ls_items-currency.
        APPEND ls_conditions_in TO lt_conditions_in.

      ENDIF.

    ENDLOOP.

    CHECK lt_return[] IS INITIAL.

    CALL FUNCTION 'DIALOG_SET_NO_DIALOG'.


    CALL FUNCTION 'BAPI_SALESORDER_CREATEFROMDAT2'
      EXPORTING
        order_header_in     = ls_header_in
      IMPORTING
        salesdocument       = lv_vbeln
      TABLES
        return              = lt_return
        order_items_in      = lt_order_items_in
        order_partners      = lt_partners
        order_schedules_in  = lt_schedules_in
        order_conditions_in = lt_conditions_in
        extensionin         = lt_extensionin
        partneraddresses    = lt_partneraddresses.



    LOOP AT lt_return TRANSPORTING NO FIELDS WHERE type CA 'EAX'.

    ENDLOOP.
    IF sy-subrc EQ 0.
      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.
      cv_error = 'X'.
      MOVE-CORRESPONDING lt_return TO cs_siparis-return.

    ELSE.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT' .

      READ TABLE lt_return INTO DATA(ls_bapi_return) WITH KEY number = '311'.
      IF sy-subrc EQ 0.
        cv_vbeln = ls_bapi_return-message_v2.
      ENDIF.

      cv_error = ''.
    ENDIF.

  ENDMETHOD.


  METHOD create_order_v2.

    DATA : BEGIN OF ls_price,
             net_tutar            TYPE bapinetwr,
             kdv                  TYPE bapiwmwst,
             toplam_tutar         TYPE bapinetwr,
             toplam_indirim_tutar TYPE bapinetwr,
           END OF ls_price.

    DATA : lt_bapi_return          TYPE bapiret2_tt,
           lv_son_indirim_yuzde_v2 TYPE bapikbetr1,
           lv_create_order         TYPE bapiflag-bapiflag.

    IF iv_son_toplam_tutar EQ 0.
      lv_create_order = 'X'.
    ENDIF.

    discount_price_simulation_v2(
    EXPORTING
      iv_musteri_no           = iv_musteri_no
      iv_genel_iskonto_yuzde  = iv_genel_iskonto_yuzde
      iv_payment              = iv_payment
      iv_bolge                = iv_bolge
      iv_satis_sorumlusu      = iv_satis_sorumlusu
      iv_create_order         = lv_create_order
    IMPORTING
      ev_net_tutar            = ls_price-net_tutar
      ev_kdv                  = ls_price-kdv
      ev_toplam_tutar         = ls_price-toplam_tutar
      ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
      ev_error                = ev_error
      ev_vbeln                = ev_vbeln
      et_return               = lt_bapi_return
    CHANGING
      ct_items                = ct_items ).

    "create sonrasinda pdf degerlerini alabilmek icin simulasyon yapmak gerekli.
    "Eger asagidaki islemler ileride acilacaksa buradaki islem kapatilabilir.
    IF ev_error NE 'X'.

      CLEAR : ls_price.

      lv_create_order = ''.

      discount_price_simulation_v2(
      EXPORTING
        iv_vbeln                = ev_vbeln
        iv_musteri_no           = iv_musteri_no
        iv_genel_iskonto_yuzde  = iv_genel_iskonto_yuzde
        iv_payment              = iv_payment
        iv_bolge                = iv_bolge
        iv_satis_sorumlusu      = iv_satis_sorumlusu
        iv_create_order         = lv_create_order
      IMPORTING
        ev_net_tutar            = ls_price-net_tutar
        ev_kdv                  = ls_price-kdv
        ev_toplam_tutar         = ls_price-toplam_tutar
        ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
        ev_error                = ev_error
        ev_vbeln                = ev_vbeln
        et_return               = lt_bapi_return
      CHANGING
        ct_items                = ct_items ).

    ENDIF.
    "-------------------------------------------------------------------------------

    "IKINCI tur HEADER YUZDE GIREREK FIYAT INDIRME -------------------------------------------------------------------------------
*    CLEAR lv_son_indirim_yuzde_v2.
*    IF iv_son_toplam_tutar > 0.
*      lv_son_indirim_yuzde_v2 = 100 - ( ( 100 - 0 ) * iv_son_toplam_tutar ) / ls_price-toplam_tutar.
*
*      DATA : lv_ilk_item_kdv_yuzde TYPE prznt.
*
*
*      discount_price_simulation_v2(
*      EXPORTING
*        iv_musteri_no           = iv_musteri_no
*        iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*        iv_payment              = iv_payment
*        iv_bolge                = iv_bolge
*        iv_satis_sorumlusu      = iv_satis_sorumlusu
*      IMPORTING
*        ev_net_tutar            = ls_price-net_tutar
*        ev_kdv                  = ls_price-kdv
*        ev_toplam_tutar         = ls_price-toplam_tutar
*        ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
*        ev_error                = ev_error
*        et_return               = lt_bapi_return
*      CHANGING
*        ct_items                = ct_items
*        cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde ).
*
*
*      DATA : lv_fark_yuvarla TYPE bapikbetr1.
*
*      "ucuncu tur son sifirlama---VARSA KALAN FARKI ------------------------------------------------------------------
*      CLEAR lv_fark_yuvarla.
*      IF iv_son_toplam_tutar NE ls_price-toplam_tutar.
*
*
*        lv_fark_yuvarla = iv_son_toplam_tutar - ls_price-toplam_tutar.
*
*        DATA(lv_do_fark_yuvarla) = lv_fark_yuvarla .
*        DATA : lv_zdif_deger TYPE bapikbetr1.
*
*        DO.
*
*          discount_price_simulation_v2(
*          EXPORTING
*            iv_musteri_no           = iv_musteri_no
*            iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*            iv_payment              = iv_payment
*            iv_bolge                = iv_bolge
*            iv_satis_sorumlusu      = iv_satis_sorumlusu
*            iv_fark_yuvarla         = lv_do_fark_yuvarla
*          IMPORTING
*            ev_net_tutar            = ls_price-net_tutar
*            ev_kdv                  = ls_price-kdv
*            ev_toplam_tutar         = ls_price-toplam_tutar
*            ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
*            ev_error                = ev_error
*            et_return               = lt_bapi_return
*          CHANGING
*            ct_items                = ct_items
*            cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde ).
** cv_zdif_deger           = lv_zdif_deger ).
*
*
*
*          IF iv_son_toplam_tutar =  ls_price-toplam_tutar.
**            ls_fiyat_iskonto_deep-fark_yuvarla = lv_do_fark_yuvarla.
*
*            lv_create_order = 'X'.
*
*            discount_price_simulation_v2(
*            EXPORTING
*              iv_musteri_no           = iv_musteri_no
*              iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*              iv_payment              = iv_payment
*              iv_bolge                = iv_bolge
*              iv_satis_sorumlusu      = iv_satis_sorumlusu
*              iv_fark_yuvarla         = lv_do_fark_yuvarla
*              iv_create_order         = lv_create_order
*            IMPORTING
*              ev_net_tutar            = ls_price-net_tutar
*              ev_kdv                  = ls_price-kdv
*              ev_toplam_tutar         = ls_price-toplam_tutar
*              ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
*              ev_error                = ev_error
*              ev_vbeln                = ev_vbeln
*              et_return               = lt_bapi_return
*            CHANGING
*              ct_items                = ct_items
*              cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde ).
*
*            EXIT.
*
*          ELSEIF ls_price-toplam_tutar GT iv_son_toplam_tutar.
*            "istenen fiyatin üzerinde geldi
*            lv_do_fark_yuvarla = lv_do_fark_yuvarla - '0.01'.
*          ELSE.
*            "istenen fiyatin altinda geldi
*            lv_do_fark_yuvarla = lv_do_fark_yuvarla + '0.01'.
*
*          ENDIF.
*
*          IF sy-index GE 10.
*            DATA lv_toplam_tutar TYPE string.
*            lv_toplam_tutar = ls_price-toplam_tutar.
*            DATA(lv_lengt) = strlen( lv_toplam_tutar ).
*            DATA(lv_off) = lv_lengt - 5.
*            DATA(lv_last_digit) = lv_toplam_tutar+lv_off(2).
*            IF lv_last_digit EQ '99'.
*
*              lv_create_order = 'X'.
*
*              discount_price_simulation_v2(
*              EXPORTING
*                iv_musteri_no           = iv_musteri_no
*                iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*                iv_payment              = iv_payment
*                iv_bolge                = iv_bolge
*                iv_satis_sorumlusu      = iv_satis_sorumlusu
*                iv_fark_yuvarla         = lv_do_fark_yuvarla
*                iv_create_order         = lv_create_order
*              IMPORTING
*                ev_net_tutar            = ls_price-net_tutar
*                ev_kdv                  = ls_price-kdv
*                ev_toplam_tutar         = ls_price-toplam_tutar
*                ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
*                ev_error                = ev_error
*                ev_vbeln                = ev_vbeln
*                et_return               = lt_bapi_return
*              CHANGING
*                ct_items                = ct_items
*                cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde ).
*
*              EXIT.
*            ENDIF.
*          ENDIF.
*
*          IF sy-index GE 15.
*
*            lv_create_order = 'X'.
*
*            discount_price_simulation_v2(
*            EXPORTING
*              iv_musteri_no           = iv_musteri_no
*              iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*              iv_payment              = iv_payment
*              iv_bolge                = iv_bolge
*              iv_satis_sorumlusu      = iv_satis_sorumlusu
*              iv_fark_yuvarla         = lv_do_fark_yuvarla
*              iv_create_order         = lv_create_order
*            IMPORTING
*              ev_net_tutar            = ls_price-net_tutar
*              ev_kdv                  = ls_price-kdv
*              ev_toplam_tutar         = ls_price-toplam_tutar
*              ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
*              ev_error                = ev_error
*              ev_vbeln                = ev_vbeln
*              et_return               = lt_bapi_return
*            CHANGING
*              ct_items                = ct_items
*              cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde ).
*
*            EXIT.
*          ENDIF.
*
*        ENDDO.
*
*
*      ELSE.
*        lv_create_order = 'X'.
*
*        discount_price_simulation_v2(
*        EXPORTING
*          iv_musteri_no           = iv_musteri_no
*          iv_genel_iskonto_yuzde  = lv_son_indirim_yuzde_v2
*          iv_payment              = iv_payment
*          iv_bolge                = iv_bolge
*          iv_satis_sorumlusu      = iv_satis_sorumlusu
*          iv_fark_yuvarla         = lv_do_fark_yuvarla
*          iv_create_order         = lv_create_order
*        IMPORTING
*          ev_net_tutar            = ls_price-net_tutar
*          ev_kdv                  = ls_price-kdv
*          ev_toplam_tutar         = ls_price-toplam_tutar
*          ev_toplam_indirim_tutar = ls_price-toplam_indirim_tutar
*          ev_error                = ev_error
*          ev_vbeln                = ev_vbeln
*          et_return               = lt_bapi_return
*        CHANGING
*          ct_items                = ct_items
*          cv_ilk_item_kdv_yuzde   = lv_ilk_item_kdv_yuzde ).
*      ENDIF.
*    ENDIF.


    IF ev_error EQ 'X'.
      et_return = CORRESPONDING #( lt_bapi_return ).
    ELSE.
*  yuvarlamada gerekli
*      es_tutar-genel_iskonto_yuzde = lv_son_indirim_yuzde_v2.
      es_tutar-genel_iskonto_yuzde = iv_genel_iskonto_yuzde.
      es_tutar-kdv = ls_price-kdv.
      es_tutar-net_tutar = ls_price-net_tutar.
      es_tutar-toplam_tutar = ls_price-toplam_tutar.
      es_tutar-total_indirim_tutar = ls_price-toplam_indirim_tutar.
      es_tutar-waerk = 'TRY'.
    ENDIF.

  ENDMETHOD.


  METHOD create_pdf.
    "form data
    DATA : lv_form TYPE fpname.
    DATA : lv_funcname TYPE funcname.
    DATA : lv_interface_type TYPE fpinterfacetype.
    DATA : ls_outputparams TYPE sfpoutputparams.
    DATA : lv_formout TYPE fpformoutput.

    DATA : lv_iskonto_error TYPE flag.
    DATA : lt_bapi_return TYPE  bapiret2_tt.
    DATA : lt_malzeme_items TYPE  zsd_fiyat_iskonto_item_tt.
    DATA : ls_malzeme_items TYPE  zsd_fiyat_iskonto_item_st.
    DATA : lt_malzeme TYPE zsd_malzeme_pdf_data_tt.
*    DATA : lt_malzeme2 TYPE TABLE OF zsd_malzeme_pdf_data_st_2.
    DATA : ls_malzeme TYPE zsd_malzeme_pdf_data_st.
*    DATA : ls_malzeme2 TYPE zsd_malzeme_pdf_data_st_2.
    DATA : ls_musteri TYPE zsd_musteri_pdf_data_st.
    DATA : ls_tutar TYPE zsd_genel_tutar_pdf_data_st.
*    DATA : ls_tutar2 TYPE zsd_genel_tutar_pdf_data_st_2.

    IF iv_teklif EQ abap_true.
      lv_form = ''.
    ELSE.
      lv_form = 'ZSD_FIORI_KASA_FR'.
    ENDIF.


    ls_tutar = CORRESPONDING #( is_tutar ).
    ls_musteri = CORRESPONDING #( is_musteri ).


    SELECT SINGLE * FROM zsd_vcustomer INTO @DATA(ls_customer)
      WHERE kunnr EQ @is_musteri-musteri_no.
    IF sy-subrc EQ 0.
      ls_musteri-adres = |{ ls_customer-str_suppl1 } { ls_customer-str_suppl2 } { ls_customer-str_suppl3 } { ls_customer-city2 }/{ ls_customer-city1 }|.
    ENDIF.

    SELECT SINGLE smtp_addr FROM adr6 INTO ls_musteri-email
      WHERE addrnumber EQ ls_customer-addrnumber.

    LOOP AT it_malzeme INTO ls_malzeme.
      ls_malzeme_items-kalem = ls_malzeme-kalem.
      ls_malzeme_items-malzeme_no = ls_malzeme-malzeme_no.
      ls_malzeme_items-miktar = ls_malzeme-miktar.
      ls_malzeme_items-iskonto_yuzde = ls_malzeme-iskonto_yuzde.
      ls_malzeme_items-iskonto_tutar = ls_malzeme-iskonto_tutar.
      APPEND ls_malzeme_items TO lt_malzeme_items.
    ENDLOOP.


    CALL METHOD discount_price_simulation_v2
      EXPORTING
        iv_musteri_no          = is_musteri-musteri_no
        iv_genel_iskonto_yuzde = ls_tutar-genel_iskonto_yuzde
        iv_genel_iskonto_tutar = ls_tutar-genel_iskonto_tutar
        iv_payment             = iv_payment
        iv_bolge               = iv_bolge
        iv_satis_sorumlusu     = iv_satis_sorumlusu
      IMPORTING
        ev_net_tutar            = ls_tutar-net_tutar
        ev_kdv                  = ls_tutar-kdv
        ev_toplam_tutar         = ls_tutar-toplam_tutar
        ev_toplam_indirim_tutar = ls_tutar-total_indirim_tutar
        ev_error                = lv_iskonto_error
        et_return               = lt_bapi_return
      CHANGING
        ct_items                = lt_malzeme_items.



    REFRESH  lt_malzeme.
    LOOP AT lt_malzeme_items INTO ls_malzeme_items.
      ls_malzeme-kalem = ls_malzeme_items-kalem.
      ls_malzeme-malzeme_no = ls_malzeme_items-malzeme_no.
      ls_malzeme-miktar = ls_malzeme_items-miktar.
      ls_malzeme-para_birimi = ls_malzeme_items-para_birimi.
      ls_malzeme-net_tutar = ls_malzeme_items-net_tutar.
      ls_malzeme-kdv = ls_malzeme_items-kdv.
      ls_malzeme-toplam_tutar = ls_malzeme_items-toplam_tutar.
      ls_malzeme-iskonto_yuzde = ls_malzeme_items-iskonto_yuzde.
*      ls_malzeme-iskonto_yuzde = |{ ls_malzeme_items-iskonto_yuzde }|.
      ls_malzeme-iskonto_tutar = ls_malzeme_items-iskonto_tutar.
      READ TABLE it_malzeme INTO DATA(ls_malzeme_temp) WITH KEY malzeme_no = ls_malzeme_items-malzeme_no.
      IF sy-subrc EQ 0.
        ls_malzeme-malzeme_adi = ls_malzeme_temp-malzeme_adi.
      ENDIF.
      APPEND ls_malzeme TO lt_malzeme.
    ENDLOOP.


    TRY.
* Namen des Funktionsbausteins für ein Formular bestimmen
        CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
          EXPORTING
            i_name           = lv_form
          IMPORTING
            e_funcname       = lv_funcname
            e_interface_type = lv_interface_type.


        CLEAR ls_outputparams.
* PDF XSTRING anfordern
        ls_outputparams-getpdf   = 'X'.


* Formularprozessierung: Job beginnen
        CALL FUNCTION 'FP_JOB_OPEN'
          CHANGING
            ie_outputparams = ls_outputparams
          EXCEPTIONS
            cancel          = 1
            usage_error     = 2
            system_error    = 3
            internal_error  = 4
            OTHERS          = 5.

        IF sy-subrc = 0.

          DATA(ls_docparams) = VALUE sfpdocparams( langu = 'T'
                                                   country  = 'TR'
                                                  ).

*          MOVE-CORRESPONDING ls_tutar TO ls_tutar2.
*      ls_tutar2-genel_iskonto_yuzde = |{ ls_tutar-genel_iskonto_yuzde }|.



* Funtionsbaustein aufrufen
          CALL FUNCTION lv_funcname
            EXPORTING
              /1bcdwb/docparams  = ls_docparams
              iv_vbeln           = iv_vbeln
              is_musteri         = ls_musteri
              it_malzeme         = lt_malzeme
              is_tutar           = ls_tutar
            IMPORTING
              /1bcdwb/formoutput = lv_formout
            EXCEPTIONS
              usage_error        = 1
              system_error       = 2
              internal_error     = 3
              OTHERS             = 4.

          IF sy-subrc = 0.

* xstring mit PDF-Daten
            DATA(lv_pdf_raw) = lv_formout-pdf.
            ev_pdf = lv_formout-pdf.
          ENDIF.


          DATA: ls_result TYPE sfpjoboutput.
* Formularprozessierung: Job beenden
          CALL FUNCTION 'FP_JOB_CLOSE'
            IMPORTING
              e_result       = ls_result
            EXCEPTIONS
              usage_error    = 1
              system_error   = 2
              internal_error = 3
              OTHERS         = 4.

        ENDIF.

      CATCH cx_root INTO DATA(lo_root).
        lo_root->get_longtext( ).
    ENDTRY.



  ENDMETHOD.


  METHOD create_pdf_v2.
    "form data
    DATA : lv_form           TYPE fpname,
           lv_funcname       TYPE funcname,
           lv_interface_type TYPE fpinterfacetype,
           ls_outputparams   TYPE sfpoutputparams,
           lv_formout        TYPE fpformoutput.

    DATA : ls_musteri_pdf_data TYPE zsd_musteri_pdf_data_st.

    IF iv_teklif EQ abap_true.
      lv_form = 'ZSD_FIORI_KASA_TEKLIF_FR'.
    ELSE.
      lv_form = 'ZSD_FIORI_KASA_SIPARIS_FR'.
    ENDIF.


    ls_musteri_pdf_data-musteri_no = iv_musteri_no.

    SELECT SINGLE * FROM kna1 INTO @DATA(ls_name)
      WHERE kunnr = @iv_musteri_no.

    CONCATENATE ls_name-name1 ls_name-name2 INTO ls_musteri_pdf_data-musteri_adi SEPARATED BY ' '.

    SELECT SINGLE * FROM zsatis_sorumlusu INTO @DATA(ls_satsor)
      WHERE pernr = @iv_satis_sorumlusu.

    CONCATENATE ls_satsor-vorna ls_satsor-nachn INTO ls_musteri_pdf_data-satis_sorumlusu_adi SEPARATED BY ' '.


    SELECT SINGLE * FROM zsd_vcustomer INTO @DATA(ls_customer)
      WHERE kunnr EQ @iv_musteri_no.
    IF sy-subrc EQ 0.
      ls_musteri_pdf_data-adres = |{ ls_customer-str_suppl1 } { ls_customer-str_suppl2 } { ls_customer-str_suppl3 } { ls_customer-city2 }/{ ls_customer-city1 }|.
      ls_musteri_pdf_data-telefon_no = ls_customer-tel_number.
    ENDIF.

    SELECT SINGLE smtp_addr FROM adr6 INTO ls_musteri_pdf_data-email
      WHERE addrnumber EQ ls_customer-addrnumber.


    SELECT SINGLE kasa_kodu_tn FROM zkasa_t_kod INTO ls_musteri_pdf_data-bolge_adi
      WHERE kasa_kodu = iv_bolge.


    TRY.
* Namen des Funktionsbausteins für ein Formular bestimmen
        CALL FUNCTION 'FP_FUNCTION_MODULE_NAME'
          EXPORTING
            i_name           = lv_form
          IMPORTING
            e_funcname       = lv_funcname
            e_interface_type = lv_interface_type.


        CLEAR ls_outputparams.
* PDF XSTRING anfordern
        ls_outputparams-getpdf   = 'X'.


* Formularprozessierung: Job beginnen
        CALL FUNCTION 'FP_JOB_OPEN'
          CHANGING
            ie_outputparams = ls_outputparams
          EXCEPTIONS
            cancel          = 1
            usage_error     = 2
            system_error    = 3
            internal_error  = 4
            OTHERS          = 5.

        IF sy-subrc = 0.

          DATA(ls_docparams) = VALUE sfpdocparams( langu = 'T'
                                                   country  = 'TR'
                                                  ).

* Funtionsbaustein aufrufen

          IF iv_teklif EQ abap_true.

            CALL FUNCTION lv_funcname
              EXPORTING
                /1bcdwb/docparams  = ls_docparams
                iv_teklif_no       = iv_teklif_no
                is_musteri         = ls_musteri_pdf_data
                it_malzeme         = it_malzeme
                is_tutar           = is_tutar
              IMPORTING
                /1bcdwb/formoutput = lv_formout
              EXCEPTIONS
                usage_error        = 1
                system_error       = 2
                internal_error     = 3
                OTHERS             = 4.

          ELSE.

            CALL FUNCTION lv_funcname
              EXPORTING
                /1bcdwb/docparams  = ls_docparams
                iv_vbeln           = iv_vbeln
                is_musteri         = ls_musteri_pdf_data
                it_malzeme         = it_malzeme
                is_tutar           = is_tutar
              IMPORTING
                /1bcdwb/formoutput = lv_formout
              EXCEPTIONS
                usage_error        = 1
                system_error       = 2
                internal_error     = 3
                OTHERS             = 4.


          ENDIF.

          IF sy-subrc = 0.

* xstring mit PDF-Daten
            DATA(lv_pdf_raw) = lv_formout-pdf.
            ev_pdf = lv_formout-pdf.
          ENDIF.


          DATA: ls_result TYPE sfpjoboutput.
* Formularprozessierung: Job beenden
          CALL FUNCTION 'FP_JOB_CLOSE'
            IMPORTING
              e_result       = ls_result
            EXCEPTIONS
              usage_error    = 1
              system_error   = 2
              internal_error = 3
              OTHERS         = 4.

        ENDIF.

      CATCH cx_root INTO DATA(lo_root).
        lo_root->get_longtext( ).
    ENDTRY.

  ENDMETHOD.


  METHOD discount_price_simulation.

    DATA : gs_header_in          TYPE bapisdhead,
           gv_vbeln              TYPE  bapivbeln-vbeln,
           gs_sold_to_party      TYPE  bapisoldto,
           gs_ship_to_party      TYPE  bapishipto,
           gs_billing_party      TYPE  bapipayer,
           gs_return             TYPE  bapireturn,
           it_order_items_in     TYPE TABLE OF bapiitemin,
           is_order_items_in     TYPE  bapiitemin,
           it_order_partners     TYPE TABLE OF bapipartnr,
           is_order_partners     TYPE bapipartnr,
           et_order_items_out    TYPE TABLE OF bapiitemex,
           it_order_cfgs_ref     TYPE TABLE OF bapicucfg,
           it_order_cfgs_inst    TYPE TABLE OF bapicuins,
           it_order_cfgs_part_of TYPE TABLE OF bapicuprt,
           it_order_cfgs_value   TYPE TABLE OF bapicuval,
           et_order_condition_ex TYPE TABLE OF bapicond,
           et_bapi_return        TYPE TABLE OF bapiret2,
           it_extensionin        TYPE TABLE OF bapiparex,
           ls_extensionin        LIKE LINE OF  it_extensionin,
           it_partneraddresses   TYPE TABLE OF bapiaddr1,
           ls_bape_vbak          TYPE bape_vbak,
           ls_bape_vbakx         TYPE bape_vbakx.

    DATA : lv_indirimsiz_tutar TYPE bapinetwr.

    gs_header_in = VALUE #( doc_type   = 'TA'    "satis belgesi türü
                            sales_org  = '2001'  "Satış organizasyonu
                            distr_chan = 'K2'    "Dağıtım kanalı
                            division   = '01'    "Bölüm
                            cd_type1   = 'ZBK1'  "Header Iskonto yuzde
                            cd_value1  = iv_genel_iskonto_yuzde
                            cd_type2   = 'ZBKT'  "Header Iskonto tutar
                            cd_value2  = iv_genel_iskonto_tutar / 10
****                            cd_value2  = ( iv_genel_iskonto_tutar / 10 ) * 100 / 108
***                            cd_value2  = ( iv_genel_iskonto_tutar / 10 )
                          ).

    IF iv_payment IS NOT INITIAL.
      CASE iv_payment.
        WHEN '1'.gs_header_in-pmnttrms = 'A001'.
        WHEN '2'.gs_header_in-pmnttrms = 'A002'.
      ENDCASE.
    ENDIF.

    IF gs_header_in-pmnttrms IS INITIAL.
      gs_header_in-pmnttrms = 'A001'.
    ENDIF.

    LOOP AT ct_items INTO DATA(ls_items).

      is_order_items_in = VALUE #( material = ls_items-malzeme_no
                                   req_qty = ls_items-miktar * 1000
                                   cond_type = 'ZKM1'
                                   cond_value = ls_items-iskonto_yuzde
                                   cd_type2 = 'RB00'
                                   cd_value2 =   ls_items-iskonto_tutar
                                   ) .
      APPEND is_order_items_in TO it_order_items_in. CLEAR is_order_items_in .

      is_order_partners-partn_role = 'AG'.
      UNPACK iv_musteri_no TO is_order_partners-partn_numb.
      APPEND is_order_partners TO it_order_partners.


      ls_extensionin-structure = 'BAPE_VBAK'.
      ls_bape_vbak-zzkunve = iv_musteri_no.
      ls_extensionin+30 = ls_bape_vbak.
      ls_extensionin-valuepart1 = ''.
      APPEND ls_extensionin TO it_extensionin.
      CLEAR ls_extensionin.

      ls_extensionin-structure = 'BAPE_VBAKX'.
      ls_bape_vbakx-zzkunve = 'X'.
      ls_extensionin+30 = ls_bape_vbakx.
      APPEND ls_extensionin TO it_extensionin.
      CLEAR ls_extensionin.

      CLEAR : ls_items, is_order_items_in, is_order_partners, ls_extensionin.

    ENDLOOP.


    CALL FUNCTION 'BAPI_SALESORDER_SIMULATE'
      EXPORTING
        order_header_in    = gs_header_in
      IMPORTING
        salesdocument      = gv_vbeln
        sold_to_party      = gs_sold_to_party
        ship_to_party      = gs_ship_to_party
        billing_party      = gs_billing_party
        return             = gs_return
      TABLES
        order_items_in     = it_order_items_in
        order_partners     = it_order_partners
        order_items_out    = et_order_items_out
        order_cfgs_ref     = it_order_cfgs_ref
        order_cfgs_inst    = it_order_cfgs_inst
        order_cfgs_part_of = it_order_cfgs_part_of
        order_cfgs_value   = it_order_cfgs_value
        order_condition_ex = et_order_condition_ex
        messagetable       = et_bapi_return
        extensionin        = it_extensionin
        partneraddresses   = it_partneraddresses.



    LOOP AT et_bapi_return TRANSPORTING NO FIELDS WHERE type CA 'EAX'.
      EXIT.
    ENDLOOP.
    IF sy-subrc EQ 0.
      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.
      ev_error = 'X'.
      MOVE-CORRESPONDING et_bapi_return TO et_return.
      EXIT.
    ELSE.
      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT' .

      CLEAR : ev_net_tutar , ev_kdv  , ev_toplam_tutar ,  ev_toplam_indirim_tutar .

      LOOP AT ct_items ASSIGNING FIELD-SYMBOL(<ls_item>).

        READ TABLE et_order_items_out INTO DATA(ls_order_items_out)
                                            WITH KEY material = <ls_item>-malzeme_no
                                                     itm_number = <ls_item>-kalem.
        IF sy-subrc = 0.
          <ls_item>-net_tutar    = ls_order_items_out-net_value1.
          <ls_item>-kdv          = ls_order_items_out-tx_doc_cur.
          <ls_item>-toplam_tutar = ls_order_items_out-net_value1 + ls_order_items_out-tx_doc_cur.
          <ls_item>-birim_indirim_tutar = ( ls_order_items_out-net_value1 + ls_order_items_out-tx_doc_cur ) / <ls_item>-miktar.

          CLEAR : lv_indirimsiz_tutar.

          product_price_get(
            EXPORTING
              iv_matnr        = <ls_item>-malzeme_no
            IMPORTING
              ev_toplam_tutar = lv_indirimsiz_tutar ).

          ev_net_tutar    = <ls_item>-net_tutar + ev_net_tutar.
          ev_kdv          = <ls_item>-kdv + ev_kdv.
          ev_toplam_tutar = <ls_item>-toplam_tutar + ev_toplam_tutar.
          ev_toplam_indirim_tutar = lv_indirimsiz_tutar * <ls_item>-miktar - <ls_item>-toplam_tutar + ev_toplam_indirim_tutar.

        ENDIF.

      ENDLOOP.

      ev_error = ''.
    ENDIF.

  ENDMETHOD.


  METHOD discount_price_simulation_v2.

    DATA : ls_param         TYPE zetickas_t_param.
    DATA : ls_return        TYPE bapiret2.
    DATA : lv_posnr         TYPE posnr.
    DATA : lv_lgort         TYPE lgort_d.
    DATA : lv_kunnr         TYPE kunnr .
    DATA : ls_mlan TYPE mlan.
    DATA : lv_tax_yuzde  TYPE kbetr.
    DATA : lv_vbeln TYPE vbeln .
    DATA : lt_return  TYPE  bapiret2_tt  .

    DATA : ls_header_in        TYPE bapisdhd1,
           lt_partners         TYPE TABLE OF bapiparnr,
           ls_partners         LIKE LINE OF lt_partners,
           lt_partneraddresses TYPE TABLE OF bapiaddr1,
           ls_partneraddresses LIKE LINE OF lt_partneraddresses,
           lt_extensionin      TYPE TABLE OF bapiparex,
           ls_extensionin      LIKE LINE OF lt_extensionin,
           ls_bape_vbak        TYPE bape_vbak,
           ls_bape_vbakx       TYPE bape_vbakx,


           lt_order_items_in   TYPE TABLE OF bapisditm,
           t_order_items_in    TYPE TABLE OF bapisditm,
           ls_order_items_in   LIKE LINE OF lt_order_items_in,
           lt_schedules_in     TYPE TABLE OF bapischdl,
           t_schedules_in      TYPE TABLE OF bapischdl,
           ls_schedules_in     LIKE LINE OF lt_schedules_in,
           lt_conditions_in    TYPE TABLE OF bapicond,
           t_conditions_in     TYPE TABLE OF bapicond,
           ls_conditions_in    LIKE LINE OF lt_conditions_in.


    DATA lt_items_ex           TYPE TABLE OF bapisdit.
    DATA lt_schedule_ex        TYPE TABLE OF bapisdhedu.
    DATA lt_conditions_ex      TYPE TABLE OF bapicond.
    DATA lt_conditions_konv_ex TYPE TABLE OF konv_ext.

    DATA: lt_error_log TYPE TABLE OF bapiret2.


    DATA : lv_testrun TYPE bapiflag-bapiflag.

    CLEAR lv_kunnr.
    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
      EXPORTING
        input  = iv_musteri_no
      IMPORTING
        output = lv_kunnr.


    "Sipariş parametreleri

    CLEAR ls_param.
    SELECT SINGLE * INTO ls_param FROM zetickas_t_param
           WHERE etic_kasa = 'K' AND kdgrp = iv_bolge.


    SELECT * FROM zkasa_t_kod INTO TABLE @DATA(lt_kasa_t_kod).

    DATA(lv_lgort_bolge) = lt_kasa_t_kod[ kasa_kodu = iv_bolge ]-lgort.

**********************************************************************

    "Satış siparişi oluştur
    "-----------------------------
    ls_header_in-doc_type = ls_param-auart.
    ls_header_in-sd_doc_cat = 'C'.
    ls_header_in-doc_date = sy-datum.
    ls_header_in-sales_org = ls_param-vkorg.
    ls_header_in-distr_chan = ls_param-vtweg.
    ls_header_in-division = ls_param-spart.
    ls_header_in-sales_grp = ls_param-vkgrp.
    ls_header_in-sales_off  = ls_param-vkbur.
    ls_header_in-purch_date = sy-datum.
    ls_header_in-price_date = sy-datum.
    ls_header_in-req_date_h = sy-datum.
    ls_header_in-alttax_cls = '1'.
    ls_header_in-currency = 'TRY'.
    ls_header_in-taxdep_cty = 'TR'.
    ls_header_in-ref_1 = lv_kunnr. "Müşteri ref.

    IF iv_payment IS NOT INITIAL.
      CASE iv_payment.
        WHEN '1'.ls_header_in-pmnttrms = 'A001'.
        WHEN '2'.ls_header_in-pmnttrms = 'A002'.
      ENDCASE.
    ENDIF.

    IF ls_header_in-pmnttrms IS INITIAL.
      ls_header_in-pmnttrms = 'A001'.
    ENDIF.

    "Sipariş veren
    CLEAR : ls_partners,ls_partneraddresses.
    ls_partners-partn_numb = lv_kunnr.
    ls_partners-addr_link = '1'.
    ls_partners-partn_role = 'AG'.
    SELECT SINGLE adrnr FROM kna1 INTO ls_partneraddresses-addr_no
                                    WHERE kunnr EQ lv_kunnr.

    APPEND: ls_partners TO lt_partners,
            ls_partneraddresses TO lt_partneraddresses.

    "Satış sorumlusu
    CLEAR : ls_partners,ls_partneraddresses.
    CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
      EXPORTING
        input  = iv_satis_sorumlusu
      IMPORTING
        output = ls_partners-partn_numb.

    ls_partners-addr_link = '2'.
    ls_partners-partn_role = 'VE'.
*  ls_partneraddresses-addr_no = '2'.
    APPEND: ls_partners TO lt_partners,
            ls_partneraddresses TO lt_partneraddresses.

    "EXTENSIONIN
    ls_extensionin-structure = 'BAPE_VBAK'.
    ls_bape_vbak-zzkunve = ls_partners-partn_numb.
    ls_extensionin+30 = ls_bape_vbak.
    APPEND ls_extensionin TO lt_extensionin.
    CLEAR ls_extensionin.

    ls_extensionin-structure = 'BAPE_VBAKX'.
    ls_bape_vbakx-zzkunve = 'X'.
    ls_extensionin+30 = ls_bape_vbakx.
    APPEND ls_extensionin TO lt_extensionin.
    CLEAR ls_extensionin.


    IF iv_genel_iskonto_yuzde GT 0.
      "Header indirim(yüzde)
      ls_conditions_in-cond_type = 'ZBK1'.
      ls_conditions_in-itm_number = 000000.
      ls_conditions_in-cond_value = iv_genel_iskonto_yuzde * 10. "gelen sayiyi 10 ile carparak vermek gerekiyor
      ls_conditions_in-cond_p_unt = 1.
      ls_conditions_in-currency = 'TRY'.
      APPEND ls_conditions_in TO lt_conditions_in.
    ENDIF.


    "Kalemler
    LOOP AT ct_items INTO DATA(ls_items).
      SHIFT ls_items-malzeme_no LEFT DELETING LEADING '0'.

      CALL FUNCTION 'CONVERSION_EXIT_MATN1_INPUT'
        EXPORTING
          input  = ls_items-malzeme_no
        IMPORTING
          output = ls_items-malzeme_no.

      ADD 10 TO lv_posnr.
      CLEAR : ls_order_items_in,ls_schedules_in,ls_schedules_in.

      ls_order_items_in-itm_number = ls_schedules_in-itm_number = ls_conditions_in-itm_number = lv_posnr.
      ls_order_items_in-material = ls_items-malzeme_no.
      ls_order_items_in-plant = '2000'.
      ls_order_items_in-target_qty = ls_items-miktar.

      "Vergi
      CLEAR : ls_mlan,ls_return.
      ls_return-type = 'E'.
      ls_return-id = 'ZKASA'.
      ls_return-number = '042'.
      MESSAGE ID ls_return-id TYPE 'E' NUMBER '042'
              WITH ls_items-malzeme_no INTO ls_return-message.

      SELECT SINGLE * FROM mlan INTO ls_mlan
             WHERE matnr = ls_items-malzeme_no AND
                   aland = 'TR'.

      IF sy-subrc IS NOT INITIAL OR
       ( ls_mlan-taxm1 IS INITIAL AND ls_mlan-taxm1 NE '0' ).
        APPEND ls_return TO lt_return.
        CONTINUE.
      ELSE.
        CASE ls_mlan-taxm1.
          WHEN '0'.  lv_tax_yuzde =  0.
          WHEN '1'.  lv_tax_yuzde = 18.
          WHEN '2'.  lv_tax_yuzde =  1.
          WHEN '4'.  lv_tax_yuzde =  8.
          WHEN OTHERS.
            APPEND ls_return TO lt_return.
            CONTINUE.
        ENDCASE.
      ENDIF.
      ls_order_items_in-tax_class1 = ls_mlan-taxm1.


      SELECT * FROM mard INTO TABLE @DATA(lt_mard)
        WHERE matnr = @ls_order_items_in-material
          AND werks = @ls_order_items_in-plant.

      IF sy-subrc = 0.
        IF line_exists( lt_mard[ lgort = lv_lgort_bolge ] ).

          " MARD tablosunda DISKZ (Depo yeri için MİP göstergesi) alanı kontrolü. Eğer alan dolu geliyorsa sipariş oluşturmuyor.
          LOOP AT lt_mard INTO DATA(ls_mard).
            IF ls_mard-lgort EQ lv_lgort_bolge AND ls_mard-diskz EQ ''.
              lv_lgort = lv_lgort_bolge.
              EXIT.
            ELSEIF ls_mard-diskz EQ ''.
              lv_lgort = ls_mard-lgort.
              EXIT.
            ENDIF.
          ENDLOOP.

        ELSE.

          LOOP AT lt_mard INTO ls_mard.
            IF ls_mard-diskz EQ ''.
              lv_lgort = ls_mard-lgort.
              EXIT.
            ENDIF.
          ENDLOOP.

        ENDIF.

      ENDIF.


      ls_order_items_in-store_loc = lv_lgort.
      APPEND ls_order_items_in TO lt_order_items_in.

      ls_schedules_in-req_qty = ls_items-miktar.
      APPEND ls_schedules_in TO lt_schedules_in.


      IF ls_items-iskonto_yuzde GT 0 .
        "Item indirim(yüzde)
        ls_conditions_in-cond_type = 'ZKM1'.
        ls_conditions_in-itm_number = ls_items-kalem.
        IF iv_create_order EQ 'X' OR iv_vbeln IS NOT INITIAL  .
          ls_conditions_in-cond_value = ls_items-iskonto_yuzde * 10.
        ELSE.
          ls_conditions_in-cond_value = ls_items-iskonto_yuzde.
        ENDIF.

        ls_conditions_in-cond_p_unt = 1.
        ls_conditions_in-currency = ls_items-para_birimi.
        APPEND ls_conditions_in TO lt_conditions_in.
      ENDIF.


      DATA : lv_zdif_deger TYPE bapikbetr1.

      CLEAR lv_zdif_deger.

      IF iv_fark_yuvarla NE 0 AND lv_posnr EQ 000010.
*        cv_zdif_deger = lv_zdif_deger =  iv_fark_yuvarla / 10.

        lv_zdif_deger =  iv_fark_yuvarla.
        cv_zdif_deger = lv_zdif_deger = ( lv_zdif_deger / ( 1 + cv_ilk_item_kdv_yuzde / 100 )  ) / 10.
        ls_conditions_in-cond_type = 'ZDIF'.
        ls_conditions_in-itm_number = ls_items-kalem.
        ls_conditions_in-cond_value = lv_zdif_deger.
        ls_conditions_in-cond_p_unt = 1.
        ls_conditions_in-currency = ls_items-para_birimi.
        APPEND ls_conditions_in TO lt_conditions_in.

      ENDIF.

    ENDLOOP.


    IF lt_return IS NOT INITIAL.
      ev_error = 'X'.
      et_return = CORRESPONDING #( lt_return ).
      EXIT.
    ENDIF.


    CALL FUNCTION 'DIALOG_SET_NO_DIALOG'.

    IF iv_create_order EQ 'X'.
      lv_testrun = ''.

      " Include MV45AFZZ - ZZ_ENH_SAPMV45A   line-->2161
      DATA : lv_export TYPE c VALUE 'X'.
      EXPORT lv_sent FROM lv_export TO MEMORY ID 'FIORI_CREATE_ORDER'.
      " Include MV45AFZZ - ZZ_ENH_SAPMV45A   line-->2161
    ELSE.
      lv_testrun = 'X'.
    ENDIF.

    CALL FUNCTION 'SD_SALESDOCUMENT_CREATE'
      EXPORTING
        sales_header_in     = ls_header_in
        business_object     = 'BUS2032'
        testrun             = lv_testrun
      IMPORTING
        salesdocument_ex    = lv_vbeln
      TABLES
        return              = lt_return
        sales_items_in      = lt_order_items_in
        sales_partners      = lt_partners
        sales_schedules_in  = lt_schedules_in
        sales_conditions_in = lt_conditions_in
        extensionin         = lt_extensionin
        partneraddresses    = lt_partneraddresses
        items_ex            = lt_items_ex
        schedule_ex         = lt_schedule_ex
        conditions_ex       = lt_conditions_ex.

    LOOP AT lt_return INTO DATA(ls_return_log) WHERE type = 'E' OR type = 'A' OR type = 'X'.
      APPEND ls_return_log TO lt_error_log.
      CLEAR ls_return_log.
    ENDLOOP.


    LOOP AT lt_return TRANSPORTING NO FIELDS WHERE type CA 'EAX'.
      EXIT.
    ENDLOOP.

    IF sy-subrc EQ 0.

      CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.
      ev_error = 'X'.
      et_return = CORRESPONDING #( lt_return ).
      EXIT.

    ELSE.

      CALL FUNCTION 'BAPI_TRANSACTION_COMMIT' .

      CLEAR : ev_net_tutar , ev_kdv  , ev_toplam_tutar ,  ev_toplam_indirim_tutar.

      LOOP AT ct_items ASSIGNING FIELD-SYMBOL(<ls_item>).

        READ TABLE lt_conditions_ex INTO DATA(ls_conditions_ex) WITH KEY itm_number = <ls_item>-kalem
                                                                         cond_type = 'MWST'.
        IF sy-subrc EQ 0.
          <ls_item>-net_tutar = ls_conditions_ex-conbaseval.
          <ls_item>-kdv = ls_conditions_ex-condvalue.
          <ls_item>-toplam_tutar = ls_conditions_ex-conbaseval + ls_conditions_ex-condvalue.

          CLEAR ls_conditions_ex.
          READ TABLE lt_conditions_ex INTO ls_conditions_ex WITH KEY itm_number = <ls_item>-kalem
                                                                     cond_type = 'ZKM1'.
          IF sy-subrc EQ 0.
            <ls_item>-birim_indirim_tutar = ls_conditions_ex-condvalue + <ls_item>-birim_indirim_tutar.
          ENDIF.

          CLEAR ls_conditions_ex.
          READ TABLE lt_conditions_ex INTO ls_conditions_ex WITH KEY itm_number = <ls_item>-kalem
                                                                     cond_type = 'ZBK1'.
          IF sy-subrc EQ 0.
            <ls_item>-birim_indirim_tutar = ls_conditions_ex-condvalue + <ls_item>-birim_indirim_tutar.
          ENDIF.

          DATA : lv_indirimsiz_tutar TYPE bapinetwr.
          DATA : lv_malzeme_kdv_yuzde TYPE prznt.

          CLEAR : lv_indirimsiz_tutar, lv_malzeme_kdv_yuzde.

          product_price_get(
            EXPORTING
              iv_matnr        = <ls_item>-malzeme_no
            IMPORTING
              ev_toplam_tutar = lv_indirimsiz_tutar
              ev_kdv_yuzde = lv_malzeme_kdv_yuzde ).

          IF <ls_item>-kalem EQ 000010.
            cv_ilk_item_kdv_yuzde = lv_malzeme_kdv_yuzde.
          ENDIF.

          ev_net_tutar    = <ls_item>-net_tutar + ev_net_tutar.
          ev_kdv          = <ls_item>-kdv + ev_kdv.
          ev_toplam_tutar = <ls_item>-toplam_tutar + ev_toplam_tutar.
          ev_toplam_indirim_tutar = <ls_item>-birim_indirim_tutar + ev_toplam_indirim_tutar.

        ENDIF.

      ENDLOOP.

      ev_error = ''.

      IF iv_create_order EQ 'X'.
        CLEAR ev_vbeln.
        READ TABLE lt_return INTO DATA(ls_bapi_return) WITH KEY number = '311'.
        IF sy-subrc EQ 0.
          ev_vbeln = ls_bapi_return-message_v2.
        ENDIF.
      ENDIF.

    ENDIF.

  ENDMETHOD.


  method FIYATISKONTOHEAD_GET_ENTITYSET.
**TRY.
*CALL METHOD SUPER->FIYATISKONTOHEAD_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  method FIYATISKONTOITEM_GET_ENTITYSET.
**TRY.
*CALL METHOD SUPER->FIYATISKONTOITEM_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  METHOD fiyatset_get_entity.

    DATA : lv_matnr        TYPE matnr,
           lv_net_tutar    TYPE bapinetwr,
           lv_kdv          TYPE bapiwmwst,
           lv_toplam_tutar TYPE bapinetwr,
           lv_currency     TYPE waerk.

    LOOP AT it_key_tab INTO DATA(ls_key_tab) WHERE name = 'Matnr'.
      IF ls_key_tab-value IS NOT INITIAL .
        EXIT.
      ENDIF.
    ENDLOOP.

    lv_matnr = ls_key_tab-value.

    CALL METHOD product_price_get
      EXPORTING
        iv_matnr        = lv_matnr
      IMPORTING
        ev_toplam_tutar = lv_toplam_tutar
        ev_kdv          = lv_kdv
        ev_net_tutar    = lv_net_tutar
        ev_currency     = lv_currency.

*    CALL FUNCTION 'Z_URUN_FIYAT'
*      EXPORTING
*        iv_matnr        = lv_matnr
*      IMPORTING
*        ev_net_tutar    = lv_net_tutar "kdv dahil tutar getirir
*        ev_kdv          = lv_kdv
*        ev_toplam_tutar = lv_toplam_tutar
*        ev_currency     = lv_currency.


    er_entity-net_tutar = lv_net_tutar.
    er_entity-currency = lv_currency.
    er_entity-matnr = ls_key_tab-value.

  ENDMETHOD.


  method FIYATSET_GET_ENTITYSET.
**TRY.
*CALL METHOD SUPER->FIYATSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  METHOD handle_error.

    DATA : lo_message_container TYPE REF TO /iwbep/if_message_container,
           lv_message_target    TYPE /iwbep/sup_mc_message_target,
           ls_bapi_return       TYPE bapiret2.


    lo_message_container = mo_context->get_message_container( ).

    IF iv_message IS NOT INITIAL.

      lo_message_container->add_message_text_only(
        EXPORTING
          iv_msg_type = 'E'
          iv_msg_text = iv_message ).

    ELSE.

      CLEAR ls_bapi_return.
      IF is_bapi_return IS INITIAL.
        TRY.
            ls_bapi_return = VALUE #( it_bapi_return[ type = 'E' ] ).
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
      ELSE.
        ls_bapi_return = CORRESPONDING #( is_bapi_return ).
      ENDIF.

      lv_message_target = ls_bapi_return-system.

      lo_message_container->add_message_from_bapi(
      EXPORTING
        is_bapi_message           = ls_bapi_return
        iv_message_target         = lv_message_target ).

    ENDIF.

    eo_message_container = lo_message_container.








***    CLEAR ls_bapi_return.
***    IF is_bapi_return IS INITIAL.
***      TRY.
***          ls_bapi_return = VALUE #( it_bapi_return[ type = 'E' ] ).
***        CATCH cx_sy_itab_line_not_found.
***      ENDTRY.
***    ELSE.
***      ls_bapi_return = CORRESPONDING #( is_bapi_return ).
***    ENDIF.
***
***    lv_message_target = ls_bapi_return-system.
***
***    lo_message_container = mo_context->get_message_container( ).
***
***
***    lo_message_container->add_message_from_bapi(
***    EXPORTING
***      is_bapi_message           = ls_bapi_return
***      iv_message_target         = lv_message_target ).
***
***
***    eo_message_container = lo_message_container.

    "ikinci yöntem. tüm tabloyu göndermek icin
*    DATA(lo_exception) = NEW /iwbep/cx_mgw_tech_exception( ).
*    lo_exception->get_msg_container( )->add_messages_from_bapi(
*                                          it_bapi_messages = lt_bapi_return ).
*    RAISE EXCEPTION lo_exception.

  ENDMETHOD.


  METHOD headerbagliurunl_get_entity.

    DATA ls_keys TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_urunler.


    DATA : lt_deep_entity   TYPE TABLE OF zcl_zsd_odata_kasa_mpc_ext=>ts_bagli_urunler, "Deep Entity Type
           ls_deep_entity   TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_bagli_urunler,          "Deep Entity Type
           lt_bagli_urunler TYPE zsd_t_urun_structur.

    io_tech_request_context->get_converted_keys(
    IMPORTING
      es_key_values = ls_keys ).
    IF sy-subrc EQ 0.

      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
        EXPORTING
          input  = ls_keys-matnr
        IMPORTING
          output = er_entity-matnr.

      IF sy-subrc NE 0.

        DATA lo_exception TYPE REF TO /iwbep/cx_mgw_busi_exception.
        DATA lt_return_log TYPE TABLE OF bapiret2.

        CREATE OBJECT lo_exception.

        lo_exception->get_msg_container( )->add_messages_from_bapi( it_bapi_messages = lt_return_log ).

        "SLG1 Hata Log
        CALL METHOD z_sd_fiori_app_log=>create_dyn_log
          EXPORTING
            object    = 'ZSD_FIORI'
            subobject = 'ZSD_URUNLER'
*           s_log     =
            t_return  = lt_return_log
*           s_return  =
          .

        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
          EXPORTING
            message = 'No Data Found'.
      ENDIF.
    ELSE.
      RETURN.
    ENDIF.
  ENDMETHOD.


  method HEADERBAGLIURUNL_GET_ENTITYSET.



  endmethod.


  METHOD headerbolgeset_get_entity.

*    DATA ls_keys TYPE zcl_zsd_odata_kasa_mpc=>ts_headerbolge.
*
*    io_tech_request_context->get_converted_keys(
*    IMPORTING
*      es_key_values = ls_keys ).
*
*    IF sy-subrc = 0.
*      SELECT SINGLE * FROM t151t INTO er_entity
*        WHERE spras = 'TR' AND kdgrp = ls_keys-kdgrp.
*      IF sy-subrc NE 0.
*        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
*          EXPORTING
*            message = 'No Data Found'.
*      ENDIF.
*    ELSE.
*      RETURN.
*    ENDIF.

  ENDMETHOD.


  METHOD headerbolgeset_get_entityset.
    SELECT * FROM t151t INTO TABLE et_entityset WHERE spras = 'T'.

    IF sy-subrc NE 0.

    DATA lo_exception TYPE REF TO /iwbep/cx_mgw_tech_exception.
    DATA lt_return_log TYPE TABLE OF bapiret2.

    CREATE OBJECT lo_exception.

    lo_exception->get_msg_container( )->add_messages_from_bapi( it_bapi_messages = lt_return_log ).

    "SLG1 Hata Log
    CALL METHOD z_sd_fiori_app_log=>create_dyn_log
    EXPORTING
      object    = 'ZSD_FIORI'
      subobject = 'ZSD_DIGER'
*           s_log     =
      t_return  = lt_return_log
*           s_return  =
      .
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          message = 'Not data found'.
    ENDIF.
  ENDMETHOD.


  method ITEMBAGLIURUNLER_GET_ENTITY.
**TRY.
*CALL METHOD SUPER->ITEMBAGLIURUNLER_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  IMPORTING
**    er_entity               =
**    es_response_context     =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  METHOD itembagliurunler_get_entityset.

    DATA : ls_keys    TYPE zcl_zsd_odata_kasa_mpc=>ts_urunler.
    DATA : lt_urunler TYPE zsd_t_urun_structur.
    DATA : lv_matnr   TYPE ausp-atwrt.


    CASE io_tech_request_context->get_source_entity_type_name( ).

      WHEN 'HeaderBagliUrunler'.  "Called from Association

        io_tech_request_context->get_converted_source_keys(
        IMPORTING es_key_values = ls_keys ).


        lv_matnr = ls_keys-matnr .
        SHIFT lv_matnr LEFT DELETING LEADING '0'.

        CALL METHOD product_detail
          EXPORTING
            iv_matnr         = lv_matnr
          IMPORTING
            et_bagli_urunler = lt_urunler.


*        CALL FUNCTION 'Z_URUN_DETAYI'
*          EXPORTING
*            iv_matnr         = lv_matnr
*          IMPORTING
*            et_bagli_urunler = lt_urunler.

        MOVE-CORRESPONDING lt_urunler TO et_entityset .

    ENDCASE.

  ENDMETHOD.


  METHOD itemsatsorset_get_entityset.

    DATA ls_keys TYPE zcl_zsd_odata_kasa_mpc=>ts_headerbolge.

    CASE io_tech_request_context->get_source_entity_type_name( ).

      WHEN 'HeaderBolge'.  "Called from Association

        io_tech_request_context->get_converted_source_keys(
        IMPORTING es_key_values = ls_keys ).

        IF ls_keys-kdgrp IS NOT INITIAL.

          SELECT * FROM zsatis_sorumlusu INTO TABLE @et_entityset "WHERE stat2 = '3' AND
            WHERE kdgrp = @ls_keys-kdgrp .

*          SORT et_entityset BY pernr.
*          DELETE ADJACENT DUPLICATES FROM et_entityset COMPARING pernr.

        ELSE.

          SELECT * FROM zsatis_sorumlusu INTO TABLE @et_entityset.
            "WHERE stat2 = '3'.

*          SORT et_entityset BY pernr.
*          DELETE ADJACENT DUPLICATES FROM et_entityset COMPARING pernr.

        ENDIF.

    ENDCASE.

  ENDMETHOD.


  METHOD musteriheaderset_create_entity.


    DATA : ls_header TYPE zcl_zsd_odata_kasa_mpc=>ts_musteriheader.

    DATA : ls_personaldata  TYPE bapikna101_1,
           ls_companydata   TYPE bapikna106,
           ls_copyreference TYPE bapikna102,
           lv_customerno    TYPE bapikna103-customer,
           ls_bapi_return   TYPE bapireturn1,
           ls_return        TYPE bapiret2,
           lt_return        TYPE bapiret2_tt.

    DATA lo_message_container TYPE REF TO /iwbep/if_message_container.

    DATA : ls_address_data TYPE  addr1_data,
           lt_error        TYPE TABLE OF addr_error.

    DATA ls_kna1 TYPE kna1.
    DATA ls_bapiaddr1 TYPE bapiaddr1.
    DATA ls_bapiaddr2 TYPE bapiaddr2.
    DATA et_return TYPE bapiret2_t.
    DATA lv_name TYPE string.
    DATA length_name TYPE i.

    "Hata Log
    DATA : ls_error_log TYPE bapiret2,
           lt_error_log TYPE TABLE OF bapiret2.

    DATA : lo_exception TYPE REF TO /iwbep/cx_mgw_tech_exception.

    DATA ls_s_log TYPE bal_s_msg.

    TRY .

        io_data_provider->read_entry_data(
            IMPORTING es_data = ls_header ).

        IF ls_header-musteri_no IS INITIAL. "Müşteri oluştur

          IF ls_header-gercek_kisi = 'X'.
            "Müşteri veri girişleri

            ls_personaldata-country = 'TR'.
            ls_personaldata-firstname = ls_header-adi.
            ls_personaldata-lastname = ls_header-soyadi.
            ls_personaldata-city  = ls_header-il.
            ls_personaldata-district = ls_header-ilce.
            ls_personaldata-postl_cod1 = ls_header-posta_kodu.
*        ls_personaldata-street = ls_header-mahalle_sokak.
            ls_personaldata-tel1_numbr = ls_header-telefon.
            ls_personaldata-e_mail  =  ls_header-email.
            ls_personaldata-langu_p = 'T'.
            ls_personaldata-langup_iso = 'TR'.
            ls_personaldata-currency = 'TRY' .
            ls_personaldata-currency_iso = 'TRY'.

            ls_copyreference-salesorg = '2001'.
            ls_copyreference-distr_chan = 'K2'.
            ls_copyreference-division = '01'.
            UNPACK '400642' TO ls_copyreference-ref_custmr.



            CALL FUNCTION 'BAPI_CUSTOMER_CREATEFROMDATA1'
              EXPORTING
                pi_personaldata  = ls_personaldata
                pi_copyreference = ls_copyreference
              IMPORTING
                customerno       = lv_customerno
                return           = ls_bapi_return.

          ELSE.

*            CLEAR ls_personaldata.

            CONCATENATE ls_header-adi ls_header-soyadi INTO lv_name SEPARATED BY ' '.
            length_name = strlen( lv_name ).

            IF length_name <= 40.
              ls_companydata-name = lv_name.
            ELSEIF 40 < length_name AND length_name <= 80.
              ls_companydata-name = lv_name+0(40).
              ls_companydata-name_2 = lv_name+40.
            ELSEIF 80 < length_name AND length_name <= 120.
              ls_companydata-name = lv_name+0(40).
              ls_companydata-name_2 = lv_name+40(40).
              ls_companydata-name_3 = lv_name+80.
            ELSEIF 120 < length_name.
              ls_companydata-name = lv_name+0(40).
              ls_companydata-name_2 = lv_name+40(40).
              ls_companydata-name_3 = lv_name+80(40).
              ls_companydata-name_4 = lv_name+120.
            ENDIF.

            ls_companydata-country = 'TR'.
            ls_companydata-city  = ls_header-il.
            ls_companydata-district = ls_header-ilce.
            ls_companydata-postl_cod1 = ls_header-posta_kodu.
            ls_companydata-tel1_numbr = ls_header-telefon.
            ls_companydata-e_mail  =  ls_header-email.
            ls_companydata-langu = 'T'.
            ls_companydata-langu_iso = 'TR'.
            ls_companydata-currency = 'TRY' .
            ls_companydata-currency_iso = 'TRY'.

            ls_copyreference-salesorg = '2001'.
            ls_copyreference-distr_chan = 'K2'.
            ls_copyreference-division = '01'.
            UNPACK '102557' TO ls_copyreference-ref_custmr.

            CALL FUNCTION 'BAPI_CUSTOMER_CREATEFROMDATA1'
              EXPORTING
                pi_personaldata  = ls_personaldata
                pi_companydata   = ls_companydata
                pi_copyreference = ls_copyreference
              IMPORTING
                customerno       = lv_customerno
                return           = ls_bapi_return.

          ENDIF.

          IF ls_bapi_return-type CA 'EAX'.

            CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.


            ls_return = CORRESPONDING #( ls_bapi_return ).

            z_sd_fiori_app_log=>create_dyn_log(
              EXPORTING
                object    = 'ZSD_FIORI'
                subobject = 'ZSD_MUSTERI'
                s_return  = ls_return
            ).


            FREE lo_message_container.
            handle_error(
              EXPORTING
                is_bapi_return =   ls_return
              IMPORTING
                eo_message_container   = lo_message_container
            ).

            RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
              EXPORTING
                message_container = lo_message_container.


          ELSE.
            CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
              EXPORTING
                wait = abap_true.

            CONCATENATE ls_header-adi ls_header-soyadi INTO lv_name SEPARATED BY ' '.
            length_name = strlen( lv_name ).


            IF ls_header-gercek_kisi = ' '.
              IF length_name <= 40.
                ls_address_data-name1 = lv_name.
              ELSEIF 40 < length_name AND length_name <= 80.
                ls_address_data-name1 = lv_name+0(40).
                ls_address_data-name2 = lv_name+40.
              ELSEIF 80 < length_name AND length_name <= 120.
                ls_address_data-name1 = lv_name+0(40).
                ls_address_data-name2 = lv_name+40(40).
                ls_address_data-name3 = lv_name+80.
              ELSEIF 120 < length_name.
                ls_address_data-name1 = lv_name+0(40).
                ls_address_data-name2 = lv_name+40(40).
                ls_address_data-name3 = lv_name+80(40).
                ls_address_data-name4 = lv_name+120.
              ENDIF.
            ELSE.
              ls_address_data-name1 = ls_header-adi.
              ls_address_data-name2 = ls_header-soyadi.
            ENDIF.

            ls_address_data-city1      = ls_header-il.
            ls_address_data-city2      = ls_header-ilce.
            ls_address_data-str_suppl1 = ls_header-mahalle.
            ls_address_data-street     = ls_header-sokak.
            ls_address_data-house_num1 = ls_header-no.
            ls_address_data-country    = 'TR'.
            ls_address_data-post_code1 = ls_header-posta_kodu.


            SELECT  SINGLE  adrnr FROM kna1 INTO @DATA(lv_adrnr) WHERE kunnr EQ @lv_customerno.
            IF sy-subrc EQ 0.

              CALL FUNCTION 'ADDR_UPDATE'
                EXPORTING
                  address_data      = ls_address_data
                  address_number    = lv_adrnr
                TABLES
                  error_table       = lt_error
                EXCEPTIONS
                  address_not_exist = 1
                  parameter_error   = 2
                  version_not_exist = 3
                  internal_error    = 4
                  address_blocked   = 5
                  OTHERS            = 6.

              IF lt_error IS INITIAL.
                CALL FUNCTION 'ADDR_MEMORY_SAVE'
                  EXCEPTIONS
                    address_number_missing = 1
                    person_number_missing  = 2
                    internal_error         = 3
                    database_error         = 4
                    reference_missing      = 5
                    OTHERS                 = 6.

                IF sy-subrc <> 0.
                  ls_s_log-msgid = sy-msgid.
                  ls_s_log-msgno = sy-msgno.
                  ls_s_log-msgty = sy-msgty.
                  ls_s_log-msgv1 = sy-msgv1.
                  ls_s_log-msgv2 = sy-msgv2.
                  ls_s_log-msgv3 = sy-msgv3.
                  ls_s_log-msgv4 = sy-msgv4.

                  CALL METHOD z_sd_fiori_app_log=>create_dyn_log
                    EXPORTING
                      object    = 'ZSD_FIORI'
                      subobject = 'ZSD_MUSTERI'
                      s_log     = ls_s_log.

                ENDIF.

              ELSE.

                LOOP AT lt_error INTO DATA(ls_error) WHERE msg_type = 'E' OR msg_type = 'A' OR msg_type = 'X'.
                  ls_s_log-msgid = ls_error-msg_id.
                  ls_s_log-msgno = ls_error-msg_number.
                  ls_s_log-msgty = ls_error-msg_type.
                  ls_s_log-msgv1 = ls_error-msg_var1.
                  ls_s_log-msgv2 = ls_error-msg_var2.
                  ls_s_log-msgv3 = ls_error-msg_var3.
                  ls_s_log-msgv4 = ls_error-msg_var4.

                  CALL METHOD z_sd_fiori_app_log=>create_dyn_log
                    EXPORTING
                      object    = 'ZSD_FIORI'
                      subobject = 'ZSD_MUSTERI'
                      s_log     = ls_s_log.

                  CLEAR ls_s_log.
                ENDLOOP.

              ENDIF.

            ENDIF.

            er_entity = CORRESPONDING #( ls_header ).
            er_entity-musteri_no = lv_customerno.

          ENDIF.


*******************  MUSTERI UPDATE  *****************************************************************
        ELSE. "Mevcut müşterinin bilgilerini güncelleme

          DATA ls_personaldatax TYPE bapikna101_1x.
          DATA ls_companydatax  TYPE bapikna106x.

          DATA: lv_salesorg   TYPE bapikna102-salesorg,
                pi_distr_chan TYPE bapikna102-distr_chan,
                pi_division   TYPE bapikna102-division,
                customerno    TYPE bapikna103-customer.

          SELECT SINGLE * FROM kna1 INTO ls_kna1 WHERE kunnr = ls_header-musteri_no.

          CLEAR lv_name.
          CLEAR length_name.
          CONCATENATE ls_header-adi ls_header-soyadi INTO lv_name SEPARATED BY ' '.
          length_name = strlen( lv_name ).

          CLEAR ls_personaldata.


          IF ls_kna1-stkzn = 'X'. "Gercek Kisi

            IF length_name <= 40.
              ls_personaldata-firstname = ls_header-adi.
              ls_personaldata-lastname  = ls_header-soyadi.
            ELSEIF 40 < length_name AND length_name <= 80.
              ls_personaldata-firstname = lv_name+0(40).
              ls_personaldata-lastname = lv_name+40.

            ELSEIF 80 < length_name AND length_name <= 120.
              ls_personaldata-firstname = lv_name+0(40).
              ls_personaldata-lastname = lv_name+40(40).
              ls_personaldata-middlename = lv_name+80.
            ELSEIF 120 < length_name.
              ls_personaldata-firstname = lv_name+0(40).
              ls_personaldata-lastname = lv_name+40(40).
              ls_personaldata-middlename = lv_name+80(40).
              ls_personaldata-secondname = lv_name+120.
            ENDIF.

            ls_personaldata-city = ls_header-il.
            ls_personaldata-country = 'TR'.
            ls_personaldata-e_mail = ls_header-email.
            ls_personaldata-house_no = ls_header-no.
            ls_personaldata-tel1_numbr = ls_header-telefon.
            ls_personaldata-postl_cod1 = ls_header-posta_kodu.
            ls_personaldata-district = ls_header-ilce.
            ls_personaldata-langu_p = 'T'.
            ls_personaldata-langup_iso = 'TR'.
            ls_personaldata-currency = 'TRY' .
            ls_personaldata-currency_iso = 'TRY'.

            lv_salesorg   = '2001'.
            pi_distr_chan = 'K2'.
            pi_division   = '01'.
            customerno    = ls_header-musteri_no.

            ls_personaldatax-city = 'X'.
            ls_personaldatax-country = 'X'.
            ls_personaldatax-e_mail = 'X'.
            ls_personaldatax-house_no = 'X'.
            ls_personaldatax-tel1_numbr = 'X'.
            ls_personaldatax-postl_cod1 = 'X'.
            ls_personaldatax-district = 'X'.
            ls_personaldatax-langu_p = 'X'.
            ls_personaldatax-langup_iso = 'X'.
            ls_personaldatax-currency = 'X'.
            ls_personaldatax-currency_iso = 'X'.


            CALL FUNCTION 'BAPI_CUSTOMER_CHANGEFROMDATA1'
              EXPORTING
                pi_personaldata  = ls_personaldata
                pi_personaldatax = ls_personaldatax
                pi_salesorg      = lv_salesorg
                pi_distr_chan    = pi_distr_chan
                pi_division      = pi_division
                customerno       = customerno
              IMPORTING
                return           = ls_bapi_return.


          ELSE. "Tüzel Kisi

            CONCATENATE ls_header-adi ls_header-soyadi INTO lv_name SEPARATED BY ' '.
            length_name = strlen( lv_name ).

            IF length_name <= 40.
              ls_companydata-name = lv_name.

              ls_companydatax-name = 'X'.
            ELSEIF 40 < length_name AND length_name <= 80.
              ls_companydata-name = lv_name+0(40).
              ls_companydata-name_2 = lv_name+40.

              ls_companydatax-name = 'X'.
              ls_companydatax-name_2 = 'X'.
            ELSEIF 80 < length_name AND length_name <= 120.
              ls_companydata-name = lv_name+0(40).
              ls_companydata-name_2 = lv_name+40(40).
              ls_companydata-name_3 = lv_name+80.

              ls_companydatax-name = 'X'.
              ls_companydatax-name_2 = 'X'.
              ls_companydatax-name_3 = 'X'.
            ELSEIF 120 < length_name.
              ls_companydata-name = lv_name+0(40).
              ls_companydata-name_2 = lv_name+40(40).
              ls_companydata-name_3 = lv_name+80(40).
              ls_companydata-name_4 = lv_name+120.

              ls_companydatax-name = 'X'.
              ls_companydatax-name_2 = 'X'.
              ls_companydatax-name_3 = 'X'.
              ls_companydatax-name_4 = 'X'.
            ENDIF.

            ls_companydata-country = 'TR'.
            ls_companydatax-country = 'X'.
            ls_companydata-city  = ls_header-il.
            ls_companydatax-city  = 'X'.
            ls_companydata-district = ls_header-ilce.
            ls_companydatax-district = 'X'.
            ls_companydata-postl_cod1 = ls_header-posta_kodu.
            ls_companydatax-postl_cod1 = 'X'.
            ls_companydata-tel1_numbr = ls_header-telefon.
            ls_companydatax-tel1_numbr = 'X'.
            ls_companydata-e_mail  =  ls_header-email.
            ls_companydatax-e_mail  =  'X'.
            ls_companydata-langu = 'T'.
            ls_companydatax-langu = 'X'.
            ls_companydata-langu_iso = 'TR'.
            ls_companydatax-langu_iso = 'X'.
            ls_companydata-currency = 'TRY' .
            ls_companydatax-currency = 'X' .
            ls_companydata-currency_iso = 'TRY'.
            ls_companydatax-currency_iso = 'X'.
            ls_companydata-house_no = ls_header-no.
            ls_companydatax-house_no = 'X'.
            ls_companydata-street = ls_header-sokak.
            ls_companydatax-street  = 'X'.

            lv_salesorg   = '2001'.
            pi_distr_chan = 'K2'.
            pi_division   = '01'.
            customerno    = ls_header-musteri_no.

            CALL FUNCTION 'BAPI_CUSTOMER_CHANGEFROMDATA1'
              EXPORTING
                pi_personaldata  = ls_personaldata
                pi_personaldatax = ls_personaldatax
                pi_companydata   = ls_companydata
                pi_companydatax  = ls_companydatax
                pi_salesorg      = lv_salesorg
                pi_distr_chan    = pi_distr_chan
                pi_division      = pi_division
                customerno       = customerno
              IMPORTING
                return           = ls_bapi_return.

          ENDIF.

          IF ls_bapi_return-type CA 'EAX'.


            CALL FUNCTION 'BAPI_TRANSACTION_ROLLBACK'.


            ls_return = CORRESPONDING #( ls_bapi_return ).

            z_sd_fiori_app_log=>create_dyn_log(
              EXPORTING
                object    = 'ZSD_FIORI'
                subobject = 'ZSD_MUSTERI'
                s_return  = ls_return
            ).


            "HATA Log Frontend'e gönderilir.
            FREE lo_message_container.
            handle_error(
              EXPORTING
                is_bapi_return =   ls_return
              IMPORTING
                eo_message_container   = lo_message_container
            ).

            RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
              EXPORTING
                message_container = lo_message_container.

          ELSE.
            CALL FUNCTION 'BAPI_TRANSACTION_COMMIT'
              EXPORTING
                wait = abap_true.


            CONCATENATE ls_header-adi ls_header-soyadi INTO lv_name SEPARATED BY ' '.
            CLEAR length_name.
            length_name = strlen( lv_name ).

            IF ls_kna1-stkzn = ' '.
              IF length_name <= 40.
                ls_address_data-name1 = lv_name.
              ELSEIF 40 < length_name AND length_name <= 80.
                ls_address_data-name1 = lv_name+0(40).
                ls_address_data-name2 = lv_name+40.
              ELSEIF 80 < length_name AND length_name <= 120.
                ls_address_data-name1 = lv_name+0(40).
                ls_address_data-name2 = lv_name+40(40).
                ls_address_data-name3 = lv_name+80.
              ELSEIF 120 < length_name.
                ls_address_data-name1 = lv_name+0(40).
                ls_address_data-name2 = lv_name+40(40).
                ls_address_data-name3 = lv_name+80(40).
                ls_address_data-name4 = lv_name+120.
              ENDIF.
            ELSE.
              ls_address_data-name1 = ls_header-adi.
              ls_address_data-name2 = ls_header-soyadi.
            ENDIF.

            ls_address_data-city1 = ls_header-il.
            ls_address_data-city2 = ls_header-ilce.
            ls_address_data-str_suppl1 = ls_header-mahalle.
            ls_address_data-street = ls_header-sokak.
            ls_address_data-house_num1 = ls_header-no.
            ls_address_data-country = 'TR'.
            ls_address_data-post_code1 = ls_header-posta_kodu.

            CLEAR lv_adrnr.
            SELECT  SINGLE  adrnr FROM kna1 INTO lv_adrnr WHERE kunnr EQ ls_header-musteri_no.
            IF sy-subrc EQ 0.
              CALL FUNCTION 'ADDR_UPDATE'
                EXPORTING
                  address_data      = ls_address_data
                  address_number    = lv_adrnr
                TABLES
                  error_table       = lt_error
                EXCEPTIONS
                  address_not_exist = 1
                  parameter_error   = 2
                  version_not_exist = 3
                  internal_error    = 4
                  address_blocked   = 5
                  OTHERS            = 6.



              IF lt_error IS INITIAL.
                CALL FUNCTION 'ADDR_MEMORY_SAVE'
                  EXCEPTIONS
                    address_number_missing = 1
                    person_number_missing  = 2
                    internal_error         = 3
                    database_error         = 4
                    reference_missing      = 5
                    OTHERS                 = 6.

                IF sy-subrc <> 0.
                  ls_s_log-msgid = sy-msgid.
                  ls_s_log-msgno = sy-msgno.
                  ls_s_log-msgty = sy-msgty.
                  ls_s_log-msgv1 = sy-msgv1.
                  ls_s_log-msgv2 = sy-msgv2.
                  ls_s_log-msgv3 = sy-msgv3.
                  ls_s_log-msgv4 = sy-msgv4.

                  CALL METHOD z_sd_fiori_app_log=>create_dyn_log
                    EXPORTING
                      object    = 'ZSD_FIORI'
                      subobject = 'ZSD_MUSTERI'
                      s_log     = ls_s_log.

                ENDIF.

              ELSE.

*                DATA ls_s_log TYPE bal_s_msg.
                CLEAR ls_error.
                LOOP AT lt_error INTO ls_error WHERE msg_type = 'E' OR msg_type = 'A'.
                  ls_s_log-msgid = ls_error-msg_id.
                  ls_s_log-msgno = ls_error-msg_number.
                  ls_s_log-msgty = ls_error-msg_type.
                  ls_s_log-msgv1 = ls_error-msg_var1.
                  ls_s_log-msgv2 = ls_error-msg_var2.
                  ls_s_log-msgv3 = ls_error-msg_var3.
                  ls_s_log-msgv4 = ls_error-msg_var4.

                  CALL METHOD z_sd_fiori_app_log=>create_dyn_log
                    EXPORTING
                      object    = 'ZSD_FIORI'
                      subobject = 'ZSD_MUSTERI'
                      s_log     = ls_s_log.

                  CLEAR ls_s_log.
                ENDLOOP.

              ENDIF.

            ENDIF.

          ENDIF.
        ENDIF.

      CATCH /iwbep/cx_mgw_tech_exception.

    ENDTRY.
  ENDMETHOD.


  METHOD musteriheaderset_get_entity.

    DATA : ls_keys    TYPE zcl_zsd_odata_kasa_mpc=>ts_musteriheader.

    DATA : ls_personaldata         TYPE bapikna101_1,
           ls_opt_personaldata     TYPE bapikna105,
           ls_personaldata_new     TYPE bapikna101_1,
           ls_opt_personaldata_new TYPE  bapikna105,
           ls_companydata          TYPE bapikna106,
           ls_opt_companydata      TYPE bapikna105,
           lv_consumer_flag        TYPE bapikna107-consumer_flag,
           ls_addresstype_no       TYPE bapikna109,
           ls_return               TYPE bapireturn1.

    DATA : lv_kunnr TYPE kunnr.


    LOOP AT it_key_tab INTO DATA(ls_key_tab).
      IF ls_key_tab-value IS NOT INITIAL .
        EXIT.
      ENDIF.
    ENDLOOP.

    UNPACK ls_key_tab-value TO lv_kunnr.

    SELECT SINGLE * FROM zsd_vcustomer INTO @DATA(ls_customer) WHERE kunnr EQ @lv_kunnr.
    IF sy-subrc EQ 0.
      IF ls_customer-name1 IS NOT INITIAL.
        er_entity-adi = ls_customer-name1.
      ELSE.
        er_entity-adi = ls_customer-name2.
      ENDIF.
      er_entity-il = ls_customer-city1.
      er_entity-ilce = ls_customer-city2.
      er_entity-email = ls_customer-smtp_addr.
      er_entity-telefon = ls_customer-tel_number.
      er_entity-posta_kodu = ls_customer-post_code1.
      er_entity-mahalle = ls_customer-str_suppl1.
      er_entity-sokak = ls_customer-street.
      er_entity-no = ls_customer-house_num1.

    ENDIF.

  ENDMETHOD.


  METHOD musteriheaderset_get_entityset.

    SELECT * FROM zsd_vcustomer INTO CORRESPONDING FIELDS OF TABLE et_entityset where sperr = ' '.

  ENDMETHOD.


  METHOD musteriitemset_get_entityset.

    DATA : ls_key         TYPE zcl_zsd_odata_kasa_mpc=>ts_musteriheader,
           lt_customer    TYPE TABLE OF zsd_vcustomer,
           ls_customer    TYPE zsd_vcustomer,
           lv_gercek_kisi TYPE stkzn.

    CASE io_tech_request_context->get_source_entity_type_name( ).

      WHEN 'MusteriHeader'.

        io_tech_request_context->get_converted_source_keys(
         IMPORTING
           es_key_values = ls_key ).

        SELECT * FROM zsd_vcustomer INTO TABLE lt_customer.

        IF ls_key-adi IS NOT INITIAL.

          LOOP AT lt_customer INTO ls_customer WHERE name1 CS ls_key-adi OR
                                                     name2 CS ls_key-adi OR
                                                     name3 CS ls_key-adi OR
                                                     name4 CS ls_key-adi .

            ls_customer-tam_isim  = |{ ls_customer-name1 } { ls_customer-name2 } |.
            ls_customer-tam_adres = |{ ls_customer-str_suppl1 } { ls_customer-str_suppl2 } { ls_customer-str_suppl3 } { ls_customer-city2 }/{ ls_customer-city1 }|.
            APPEND ls_customer TO et_entityset.
          ENDLOOP.

            DELETE ADJACENT DUPLICATES FROM et_entityset COMPARING kunnr.

        ELSEIF ls_key-tc_vergino IS NOT INITIAL.

          LOOP AT lt_customer INTO ls_customer WHERE stcd2 CS ls_key-tc_vergino.

            ls_customer-tam_isim  = |{ ls_customer-name1 } { ls_customer-name2 } |.
            ls_customer-tam_adres = |{ ls_customer-str_suppl1 } { ls_customer-str_suppl2 } { ls_customer-str_suppl3 } { ls_customer-city2 }/{ ls_customer-city1 }|.
            APPEND ls_customer TO et_entityset.
          ENDLOOP.

          DELETE ADJACENT DUPLICATES FROM et_entityset COMPARING kunnr.

        ELSEIF ls_key-telefon IS NOT INITIAL.

          LOOP AT lt_customer INTO ls_customer WHERE tel_number CS ls_key-telefon
                                                  OR telf1 CS ls_key-telefon
                                                  OR telf2 CS ls_key-telefon.

            ls_customer-tam_isim  = |{ ls_customer-name1 } { ls_customer-name2 } |.
            ls_customer-tam_adres = |{ ls_customer-str_suppl1 } { ls_customer-str_suppl2 } { ls_customer-str_suppl3 } { ls_customer-city2 }/{ ls_customer-city1 }|.
            APPEND ls_customer TO et_entityset.
          ENDLOOP.

          DELETE ADJACENT DUPLICATES FROM et_entityset COMPARING kunnr.

        ENDIF.

    ENDCASE.
  ENDMETHOD.


  METHOD personelgirisset_get_entity.

    DATA: ls_keys TYPE zcl_zsd_odata_kasa_mpc=>ts_personelgiris.
    DATA: ls_log TYPE zfiori_user_log,
          lt_log TYPE TABLE OF zfiori_user_log.

    DATA: ls_s_log TYPE bal_s_msg.
    DATA: ls_pers TYPE zsatis_sorumlusu.


    io_tech_request_context->get_converted_keys(
     IMPORTING
       es_key_values = ls_keys ).

    IF ls_keys-personel_no IS NOT INITIAL AND ls_keys-sifre IS NOT INITIAL.


      SELECT SINGLE * FROM zfiori_user INTO @DATA(ls_user)
        WHERE personel_no = @ls_keys-personel_no
          AND sifre       = @ls_keys-sifre.

      IF sy-subrc = 0.

        SELECT SINGLE kdgrp FROM zsatis_sorumlusu INTO @DATA(lv_kdgrp)
          WHERE pernr = @ls_keys-personel_no.

        SELECT SINGLE * FROM zkasa_t_kod INTO @DATA(ls_kasa_kod)
          WHERE kasa_kodu = @lv_kdgrp.

        SELECT SINGLE * FROM zsatis_sorumlusu INTO ls_pers
          WHERE pernr = ls_keys-personel_no.

        IF ls_pers-vorna IS INITIAL .
          er_entity-personel_adi = ls_pers-nachn.
        ELSE.
          CONCATENATE ls_pers-vorna ls_pers-nachn INTO er_entity-personel_adi SEPARATED BY ' '.
        ENDIF.


        IF sy-sysid EQ 'KLT'.
          er_entity-sistem = 'DEV'.
        ELSEIF sy-sysid EQ 'KMQ'.
          er_entity-sistem = 'TEST'.
        ENDIF.

        er_entity-personel_no = ls_keys-personel_no.
        er_entity-bolge_no = lv_kdgrp.
        er_entity-bolge_adi = ls_kasa_kod-kasa_kodu_tn.
        er_entity-return_type = 'S'.
        er_entity-return_text = 'Sistem girişi başarılı.'.


        ls_log-personel_no = ls_keys-personel_no.
        ls_log-saat = sy-uzeit.
        ls_log-tarih = sy-datum.
        ls_log-sonuc = 'S'.
        ls_log-text = 'Sistem girişi başarılı.'.

        APPEND ls_log TO lt_log.
        MODIFY zfiori_user_log FROM TABLE lt_log.
        CLEAR ls_log.



        ls_s_log-msgid = 'ZFIORI_SALES'.
        ls_s_log-msgno = '004'.
        ls_s_log-msgty = 'S'.
        ls_s_log-msgv1 = ls_keys-personel_no.


        z_sd_fiori_app_log=>create_dyn_log(
          EXPORTING
            object    = 'ZSD_FIORI'
            subobject = 'ZSD_DIGER'
            s_log     = ls_s_log ).

      ELSE.

        ls_log-personel_no = ls_keys-personel_no.
        ls_log-saat = sy-uzeit.
        ls_log-tarih = sy-datum.
        ls_log-sonuc = 'E'.
        ls_log-text = 'Hatalı giriş!'.

        APPEND ls_log TO lt_log.
        MODIFY zfiori_user_log FROM TABLE lt_log.
        CLEAR ls_log.

        er_entity-personel_no = ls_keys-personel_no.
        er_entity-return_type = 'E'.
        er_entity-return_text = 'Hatalı giriş!'.


        ls_s_log-msgid = 'ZFIORI_SALES'.
        ls_s_log-msgno = '003'.
        ls_s_log-msgty = 'E'.
        ls_s_log-msgv1 = ls_keys-personel_no.


        z_sd_fiori_app_log=>create_dyn_log(
          EXPORTING
            object    = 'ZSD_FIORI'
            subobject = 'ZSD_DIGER'
            s_log     = ls_s_log ).

      ENDIF.

    ENDIF.

  ENDMETHOD.


  METHOD personelgirisset_get_entityset.

  ENDMETHOD.


  METHOD product_detail.


    TYPES: BEGIN OF ty_matnr,
             matnr TYPE matnr,
             maktx TYPE maktx,
           END OF ty_matnr.

    DATA lt_matnr TYPE TABLE OF ty_matnr.

    DATA ls_urunler TYPE zsd_urun_structur.

    DATA: e_lines TYPE zma_tt_tline,
          w_lines LIKE LINE OF e_lines.

    DATA: lv_kanal   TYPE atwtb,
          lv_anagrup TYPE atwtb,
          lv_altgrup TYPE atwtb,
          lv_urunadi TYPE atwtb.


    "fiyat data
    DATA : lv_matnr TYPE matnr,
           lv_fiyat TYPE bapinetwr,
           lv_kdv   TYPE bapiwmwst,
           lv_tutar TYPE bapinetwr.


    DATA lt_mat_price_chk TYPE zzmaterial_tt.
    DATA ls_mat_price_chk TYPE zzmaterial.

    DATA lt_mat_price_null TYPE zzmaterial_tt.

    CALL FUNCTION 'ZMA_F_GET_MATNR_BY_METACODE'
      EXPORTING
        i_metacode = iv_matnr
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


      LOOP AT lt_matnr INTO DATA(ls_matnr) .

        IF NOT ls_matnr-matnr CS '0000000'.
          CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
            EXPORTING
              input  = ls_matnr-matnr
            IMPORTING
              output = ls_urunler-metacode.
        ELSE.
          ls_urunler-metacode = ls_matnr-matnr.
        ENDIF.
        ls_urunler-matnr = iv_matnr.

        "Resim 1
        CALL FUNCTION 'ZBA_F_GET_DOC_LINK_BY_MATNR'
          EXPORTING
            matnr = ls_urunler-metacode
          IMPORTING
            link  = ls_urunler-resim.

        "Resim 2
        CALL FUNCTION 'ZMA_F_GET_DOC_LINK_BY_MATNR_B'
          EXPORTING
            matnr = ls_urunler-metacode
          IMPORTING
            link  = ls_urunler-resim_buyuk.

        SELECT SINGLE maktx FROM makt INTO ls_urunler-maktx
        WHERE matnr = ls_urunler-metacode AND spras = sy-langu.

        "Fiyat
        lv_matnr = ls_urunler-metacode.

        CALL METHOD product_price_get
          EXPORTING
            iv_matnr        = lv_matnr
          IMPORTING
            ev_toplam_tutar = lv_tutar
            ev_kdv          = lv_kdv
            ev_net_tutar    = lv_fiyat.


*    ls_urunler = VALUE #( price = lv_fiyat
*                          kdv   = lv_kdv
*                          tutar = lv_tutar
*                         ).

        ls_urunler-price = lv_fiyat.
        ls_urunler-kdv = lv_kdv.
        ls_urunler-tutar = lv_tutar.


        "Boyutlar
        CALL FUNCTION 'ZMA_F_GET_DIMENSION_BY_MATNR_M'
          EXPORTING
            i_matnr         = ls_urunler-metacode
          IMPORTING
            e_boy           = ls_urunler-boy
            e_en            = ls_urunler-en
            e_yukseklik     = ls_urunler-yukseklik
            e_cap           = ls_urunler-cap
            e_en_max        = ls_urunler-en_max
            e_yukseklik_max = ls_urunler-yukseklik_max
            e_boy_max       = ls_urunler-boy_max.


        "Ağırlık ve Hacim
        CALL FUNCTION 'ZMA_F_GET_AGIRL_HACIM_BY_MATNR'
          EXPORTING
            i_matnr   = ls_urunler-metacode
          IMPORTING
            e_agirlik = ls_urunler-brgew
            e_hacim   = ls_urunler-volum.

        REFRESH e_lines.

        "Uzun Metin
        CALL FUNCTION 'ZMA_F_GET_LONGTEXT_BY_MATNR'
          EXPORTING
            i_matnr    = ls_urunler-metacode
            i_language = sy-langu
          TABLES
            e_lines    = e_lines.

        CLEAR ls_urunler-maktxuz.
        LOOP AT e_lines INTO w_lines.

          ls_urunler-maktxuz = |{ ls_urunler-maktxuz }{ w_lines-tdline }|.
        ENDLOOP.

        IF sy-langu = 'T'.

          "Ürün ağacı
          CALL FUNCTION 'ZMA_F_GET_CHARACTRSTC_BY_MATNR'
            EXPORTING
              i_matnr   = ls_urunler-metacode
            IMPORTING
              e_kanal   = lv_kanal
              e_anagrup = lv_anagrup
              e_altgrup = lv_altgrup
              e_urunadi = lv_urunadi.
        ELSE.

          "Ürün ağacı
          CALL FUNCTION 'ZMA_F_GET_CHARACTRSEN_BY_MATNR'
            EXPORTING
              i_matnr   = ls_urunler-metacode
            IMPORTING
              e_kanal   = lv_kanal
              e_anagrup = lv_anagrup
              e_altgrup = lv_altgrup
              e_urunadi = lv_urunadi.
        ENDIF.

        ls_urunler-sinif = |{ lv_kanal } -> { lv_anagrup } -> { lv_altgrup } -> { lv_urunadi }|.

        APPEND ls_urunler TO et_bagli_urunler.

      ENDLOOP.

    ENDIF.

  ENDMETHOD.


  METHOD product_list_get.

    DATA : lt_ut_node TYPE zsd_t_urun_structur,
           ls_ut_node LIKE LINE OF lt_ut_node.

    DATA : BEGIN OF wa_hiertipmeta,
             tipkod      TYPE zmhiertipmeta-tipkod,
             metacode    TYPE zmhiertipmeta-metacode,
             resim       TYPE string,
             maktx       TYPE makt-maktx,
             resim_buyuk TYPE string,
             grup_sirasi TYPE int4,
           END OF wa_hiertipmeta,
           it_hiertipmeta_1 LIKE STANDARD TABLE OF wa_hiertipmeta,
           it_hiertipmeta   LIKE STANDARD TABLE OF wa_hiertipmeta.


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

    DATA : lv_fiyat       TYPE bapinetwr,
           lv_kdv         TYPE bapiwmwst,
           lv_tutar       TYPE  bapinetwr.

    SPLIT iv_ref_tree AT ',' INTO TABLE lt_refno.


    REFRESH: it_hiertipmeta.

    LOOP AT lt_refno INTO lv_refno.

      SELECT SINGLE * FROM zmhier_fiori INTO @DATA(ls_hier_f) WHERE urunid = @lv_refno .

      REFRESH it_hiertipmeta_1.
      SELECT tipkod metacode grup_sirasi FROM zmhiertipmeta INTO CORRESPONDING FIELDS OF TABLE it_hiertipmeta_1
         WHERE zmkanal = ls_hier_f-zmkanal
           AND zmanagrup = ls_hier_f-zmanagrup
           AND zmaltgrup = ls_hier_f-zmaltgrup
           AND zmurun  = ls_hier_f-zmurun.

      IF sy-subrc EQ 0.
        APPEND LINES OF it_hiertipmeta_1 TO it_hiertipmeta.
      ENDIF.

    ENDLOOP.

    SORT it_hiertipmeta BY tipkod metacode.
    DELETE ADJACENT DUPLICATES FROM it_hiertipmeta COMPARING tipkod metacode.

    LOOP AT it_hiertipmeta INTO wa_hiertipmeta.
      "Resim Linki Getir
      CALL FUNCTION 'ZBA_F_GET_DOC_LINK_BY_MATNR'
        EXPORTING
          matnr = wa_hiertipmeta-metacode
        IMPORTING
          link  = wa_hiertipmeta-resim.

      " Büyük Resim Getir
      CALL FUNCTION 'ZMA_F_GET_DOC_LINK_BY_MATNR_B'
        EXPORTING
          matnr = wa_hiertipmeta-metacode
        IMPORTING
          link  = wa_hiertipmeta-resim_buyuk.

      SELECT SINGLE maktx FROM makt INTO wa_hiertipmeta-maktx
      WHERE matnr = wa_hiertipmeta-metacode AND spras = sy-langu.

      MODIFY it_hiertipmeta FROM wa_hiertipmeta INDEX sy-tabix.
    ENDLOOP.

    SORT it_hiertipmeta BY grup_sirasi tipkod resim maktx.

    LOOP AT it_hiertipmeta INTO wa_hiertipmeta.
      CLEAR: ls_ut_node, lv_matnr_sinif.
      MOVE wa_hiertipmeta-metacode TO lv_matnr_sinif.
      ls_ut_node-show     = abap_true.
      ls_ut_node-resim    = wa_hiertipmeta-resim.
      ls_ut_node-resim_buyuk   = wa_hiertipmeta-resim_buyuk.
      ls_ut_node-tipkod   = wa_hiertipmeta-tipkod.


      product_price_get(
        EXPORTING
          iv_matnr        = wa_hiertipmeta-metacode
        IMPORTING
          ev_toplam_tutar = lv_tutar
          ev_kdv          = lv_kdv
          ev_net_tutar    = lv_fiyat ).


      ls_ut_node-price = lv_fiyat.
      ls_ut_node-kdv = lv_kdv.
      ls_ut_node-tutar = lv_tutar.

      CALL FUNCTION 'ZMA_F_GET_DIMENSION_BY_MATNR_M'
        EXPORTING
          i_matnr         = lv_matnr_sinif
        IMPORTING
          e_boy           = ls_ut_node-boy
          e_en            = ls_ut_node-en
          e_yukseklik     = ls_ut_node-yukseklik
          e_cap           = ls_ut_node-cap
          e_en_max        = ls_ut_node-en_max
          e_yukseklik_max = ls_ut_node-yukseklik_max
          e_boy_max       = ls_ut_node-boy_max.

      CALL FUNCTION 'ZMA_F_GET_AGIRL_HACIM_BY_MATNR'
        EXPORTING
          i_matnr   = lv_matnr_sinif
        IMPORTING
          e_agirlik = ls_ut_node-brgew
          e_hacim   = ls_ut_node-volum.



      REFRESH e_lines.
      CALL FUNCTION 'ZMA_F_GET_LONGTEXT_BY_MATNR'
        EXPORTING
          i_matnr    = wa_hiertipmeta-metacode
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

      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
        EXPORTING
          input  = wa_hiertipmeta-metacode
        IMPORTING
          output = wa_hiertipmeta-metacode.

      ls_ut_node-metacode = wa_hiertipmeta-metacode.
      ls_ut_node-maktx    = wa_hiertipmeta-maktx.


      IF sy-langu = 'T'.
        CALL FUNCTION 'ZMA_F_GET_CHARACTRSTC_BY_MATNR'
          EXPORTING
            i_matnr   = lv_matnr_sinif
          IMPORTING
            e_kanal   = lv_kanal
            e_anagrup = lv_anagrup
            e_altgrup = lv_altgrup
            e_urunadi = lv_urunadi.
      ELSE.
        CALL FUNCTION 'ZMA_F_GET_CHARACTRSEN_BY_MATNR'
          EXPORTING
            i_matnr   = lv_matnr_sinif
          IMPORTING
            e_kanal   = lv_kanal
            e_anagrup = lv_anagrup
            e_altgrup = lv_altgrup
            e_urunadi = lv_urunadi.
      ENDIF.
      CONCATENATE lv_kanal '->' lv_anagrup '->' lv_altgrup '->' lv_urunadi INTO ls_ut_node-sinif SEPARATED BY space.

      ls_ut_node-ref_tree = iv_ref_tree .
      APPEND ls_ut_node TO et_urunler.
    ENDLOOP.

  ENDMETHOD.


  METHOD product_list_get_v2.

    DATA : lt_ut_node TYPE zsd_t_urun_structur,
           ls_ut_node LIKE LINE OF lt_ut_node.

    DATA : BEGIN OF wa_hiertipmeta,
             tipkod      TYPE zmhiertipmeta-tipkod,
             metacode    TYPE zmhiertipmeta-metacode,
             resim       TYPE string,
             maktx       TYPE makt-maktx,
             resim_buyuk TYPE string,
             grup_sirasi TYPE int4,
           END OF wa_hiertipmeta,
           it_hiertipmeta_1 LIKE STANDARD TABLE OF wa_hiertipmeta,
           it_hiertipmeta   LIKE STANDARD TABLE OF wa_hiertipmeta.


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

*    SPLIT iv_ref_tree AT ',' INTO TABLE lt_refno.

    DATA : lt_zmhiertipmeta_fiori TYPE TABLE OF ztipmeta_fiori,
           ls_zmhiertipmeta_fiori LIKE LINE OF lt_zmhiertipmeta_fiori.


    SELECT * FROM ztipmeta_fiori INTO TABLE lt_zmhiertipmeta_fiori.


    REFRESH: it_hiertipmeta.

    LOOP AT lt_zmhiertipmeta_fiori INTO ls_zmhiertipmeta_fiori WHERE kurz_text CS iv_search_parameter
                                                                  OR long_text CS iv_search_parameter.

*      APPEND ls_zmhiertipmeta_fiori TO lt_zmhiertipmeta_fiori.
*      APPEND LINES OF it_hiertipmeta_1 TO it_hiertipmeta.

      wa_hiertipmeta-grup_sirasi = ls_zmhiertipmeta_fiori-grup_sirasi.
*  wa_hiertipmeta-maktx       = ls_zmhiertipmeta_fiori-kurz_text.
      wa_hiertipmeta-metacode    = ls_zmhiertipmeta_fiori-metacode.
      wa_hiertipmeta-tipkod      = ls_zmhiertipmeta_fiori-tipkod.
*  wa_hiertipmeta-resim       = ???.
*  wa_hiertipmeta-resim_buyuk = ???.

      APPEND wa_hiertipmeta TO it_hiertipmeta.


    ENDLOOP.




    SORT it_hiertipmeta BY tipkod metacode.
    DELETE ADJACENT DUPLICATES FROM it_hiertipmeta COMPARING tipkod metacode.

    LOOP AT it_hiertipmeta INTO wa_hiertipmeta.

      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_INPUT'
        EXPORTING
          input  = wa_hiertipmeta-metacode
        IMPORTING
          output = wa_hiertipmeta-metacode.

      "Resim Linki Getir
      CALL FUNCTION 'ZBA_F_GET_DOC_LINK_BY_MATNR'
        EXPORTING
          matnr = wa_hiertipmeta-metacode
        IMPORTING
          link  = wa_hiertipmeta-resim.

      " Büyük Resim Getir
      CALL FUNCTION 'ZMA_F_GET_DOC_LINK_BY_MATNR_B'
        EXPORTING
          matnr = wa_hiertipmeta-metacode
        IMPORTING
          link  = wa_hiertipmeta-resim_buyuk.

      SELECT SINGLE maktx FROM makt INTO wa_hiertipmeta-maktx
      WHERE matnr = wa_hiertipmeta-metacode AND spras = sy-langu.

      MODIFY it_hiertipmeta FROM wa_hiertipmeta INDEX sy-tabix.
    ENDLOOP.

    SORT it_hiertipmeta BY grup_sirasi tipkod resim maktx.

    LOOP AT it_hiertipmeta INTO wa_hiertipmeta.


      CLEAR: ls_ut_node, lv_matnr_sinif.
      MOVE wa_hiertipmeta-metacode TO lv_matnr_sinif.
      ls_ut_node-show     = abap_true.
      ls_ut_node-resim    = wa_hiertipmeta-resim.
      ls_ut_node-resim_buyuk   = wa_hiertipmeta-resim_buyuk.
      ls_ut_node-tipkod   = wa_hiertipmeta-tipkod.


      product_price_get(
        EXPORTING
          iv_matnr        = wa_hiertipmeta-metacode
        IMPORTING
          ev_toplam_tutar = lv_tutar
          ev_kdv          = lv_kdv
          ev_net_tutar    = lv_fiyat ).


      ls_ut_node-price = lv_fiyat.
      ls_ut_node-kdv = lv_kdv.
      ls_ut_node-tutar = lv_tutar.

      CALL FUNCTION 'ZMA_F_GET_DIMENSION_BY_MATNR_M'
        EXPORTING
          i_matnr         = lv_matnr_sinif
        IMPORTING
          e_boy           = ls_ut_node-boy
          e_en            = ls_ut_node-en
          e_yukseklik     = ls_ut_node-yukseklik
          e_cap           = ls_ut_node-cap
          e_en_max        = ls_ut_node-en_max
          e_yukseklik_max = ls_ut_node-yukseklik_max
          e_boy_max       = ls_ut_node-boy_max.

      CALL FUNCTION 'ZMA_F_GET_AGIRL_HACIM_BY_MATNR'
        EXPORTING
          i_matnr   = lv_matnr_sinif
        IMPORTING
          e_agirlik = ls_ut_node-brgew
          e_hacim   = ls_ut_node-volum.



      REFRESH e_lines.
      CALL FUNCTION 'ZMA_F_GET_LONGTEXT_BY_MATNR'
        EXPORTING
          i_matnr    = wa_hiertipmeta-metacode
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

      CALL FUNCTION 'CONVERSION_EXIT_ALPHA_OUTPUT'
        EXPORTING
          input  = wa_hiertipmeta-metacode
        IMPORTING
          output = wa_hiertipmeta-metacode.

      ls_ut_node-metacode = wa_hiertipmeta-metacode.
      ls_ut_node-maktx    = wa_hiertipmeta-maktx.


      IF sy-langu = 'T'.
        CALL FUNCTION 'ZMA_F_GET_CHARACTRSTC_BY_MATNR'
          EXPORTING
            i_matnr   = lv_matnr_sinif
          IMPORTING
            e_kanal   = lv_kanal
            e_anagrup = lv_anagrup
            e_altgrup = lv_altgrup
            e_urunadi = lv_urunadi.
      ELSE.
        CALL FUNCTION 'ZMA_F_GET_CHARACTRSEN_BY_MATNR'
          EXPORTING
            i_matnr   = lv_matnr_sinif
          IMPORTING
            e_kanal   = lv_kanal
            e_anagrup = lv_anagrup
            e_altgrup = lv_altgrup
            e_urunadi = lv_urunadi.
      ENDIF.
      CONCATENATE lv_kanal '->' lv_anagrup '->' lv_altgrup '->' lv_urunadi INTO ls_ut_node-sinif SEPARATED BY space.

*      ls_ut_node-ref_tree = iv_ref_tree .
      APPEND ls_ut_node TO et_urunler.
    ENDLOOP.

  ENDMETHOD.


  METHOD product_price_get.

    DATA : gs_header_in          TYPE bapisdhead,
           gv_vbeln              TYPE  bapivbeln-vbeln,
           gs_sold_to_party      TYPE  bapisoldto,
           gs_ship_to_party      TYPE  bapishipto,
           gs_billing_party      TYPE  bapipayer,
           gs_return             TYPE  bapireturn,
           it_order_schedules_in TYPE TABLE OF bapischdl,
           is_order_schedules_in TYPE  bapischdl,
           it_order_items_in     TYPE TABLE OF bapiitemin,
           is_order_items_in     TYPE  bapiitemin,
           it_order_partners     TYPE TABLE OF bapipartnr,
           is_order_partners     TYPE bapipartnr,
           et_order_items_out    TYPE TABLE OF bapiitemex,
           it_order_cfgs_ref     TYPE TABLE OF bapicucfg,
           it_order_cfgs_inst    TYPE TABLE OF bapicuins,
           it_order_cfgs_part_of TYPE TABLE OF bapicuprt,
           it_order_cfgs_value   TYPE TABLE OF bapicuval,
           et_order_condition_ex TYPE TABLE OF bapicond,
           et_return             TYPE TABLE OF bapiret2,
           it_extensionin        TYPE TABLE OF bapiparex,
           it_partneraddresses   TYPE TABLE OF bapiaddr1.


    gs_header_in = VALUE #( doc_type = 'TA'    "satis belgesi türü
                            sales_org = '2001' "Satış organizasyonu
                            distr_chan = 'K2'  "Dağıtım kanalı
                            division = '01' ). "Bölüm

    UNPACK iv_matnr  TO is_order_items_in-material.
    is_order_items_in-req_qty  = 1000.              "miktar
    APPEND is_order_items_in TO it_order_items_in.

    is_order_partners-partn_role = 'AG'. "bu alan fm arayüzünde SV olarak veriliyor. Convertion sonrasi bu sekilde olmali
    UNPACK '400642' TO is_order_partners-partn_numb.
    APPEND is_order_partners TO it_order_partners.


    CALL FUNCTION 'BAPI_SALESORDER_SIMULATE'
      EXPORTING
        order_header_in    = gs_header_in
      IMPORTING
        salesdocument      = gv_vbeln
        sold_to_party      = gs_sold_to_party
        ship_to_party      = gs_ship_to_party
        billing_party      = gs_billing_party
        return             = gs_return
      TABLES
        order_items_in     = it_order_items_in
        order_partners     = it_order_partners
        order_items_out    = et_order_items_out
        order_cfgs_ref     = it_order_cfgs_ref
        order_cfgs_inst    = it_order_cfgs_inst
        order_cfgs_part_of = it_order_cfgs_part_of
        order_cfgs_value   = it_order_cfgs_value
        order_condition_ex = et_order_condition_ex
        messagetable       = et_return
        extensionin        = it_extensionin
        partneraddresses   = it_partneraddresses.

    TRY.
        ev_net_tutar = et_order_items_out[ 1 ]-net_value1.
        ev_kdv = et_order_items_out[ 1 ]-tx_doc_cur.
        ev_toplam_tutar = et_order_items_out[ 1 ]-net_value1 + et_order_items_out[ 1 ]-tx_doc_cur.
        ev_currency = et_order_items_out[ 1 ]-currency .

        ev_kdv_yuzde = ( ev_kdv / ev_net_tutar ) * 100.

      CATCH cx_sy_itab_line_not_found.

    ENDTRY .

  ENDMETHOD.


  METHOD reftreeset_get_entity.

    DATA : ls_keys TYPE zcl_zsd_odata_kasa_mpc_ext=>ts_reftree.
    DATA : lo_exception TYPE REF TO /iwbep/cx_mgw_busi_exception.
    DATA : lt_return_log TYPE TABLE OF bapiret2.

    io_tech_request_context->get_converted_keys(
    IMPORTING
      es_key_values = ls_keys ).

    IF sy-subrc EQ 0.

      er_entity-ref = ls_keys-ref.

      IF sy-subrc NE 0.

        lo_exception = NEW /iwbep/cx_mgw_busi_exception( ).

        lo_exception->get_msg_container( )->add_messages_from_bapi( it_bapi_messages = lt_return_log ).

        "SLG1 Hata Log
        z_sd_fiori_app_log=>create_dyn_log(
          EXPORTING
            object    = 'ZSD_FIORI'
            subobject = 'ZSD_DIGER'
            t_return  = lt_return_log ).


        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
          EXPORTING
            message = 'No Data Found'.
      ENDIF.

    ELSE.
      RETURN.
    ENDIF.

  ENDMETHOD.


  METHOD reftreeset_get_entityset.

  ENDMETHOD.


  method SALESCREATEHEA01_GET_ENTITY.
**TRY.
*CALL METHOD SUPER->SALESCREATEHEA01_GET_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_request_object       =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**  IMPORTING
**    er_entity               =
**    es_response_context     =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  method SALESCREATEHEA01_GET_ENTITYSET.
**TRY.
*CALL METHOD SUPER->SALESCREATEHEA01_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  METHOD salescreateheade_get_entity.

  ENDMETHOD.


  METHOD salescreateheade_get_entityset.

  ENDMETHOD.


  METHOD salescreateitems_get_entity.

  ENDMETHOD.


  METHOD salescreateitems_get_entityset.

  ENDMETHOD.


  METHOD treeset_get_entityset.

    tree_get(
      IMPORTING
        et_tree = et_entityset ).

  ENDMETHOD.


  METHOD tree_get.

    TYPES  : BEGIN OF lty_kanal,
               zmkanal TYPE atwtb,
               node_id TYPE char5,
             END OF lty_kanal.
    DATA : lt_kanal TYPE TABLE OF lty_kanal.

    TYPES : BEGIN OF lty_anagrup,
              zmkanal   TYPE atwtb,
              zmanagrup TYPE atwtb,
              node_id   TYPE char5,
            END OF lty_anagrup.
    DATA : lt_anagrup TYPE TABLE OF lty_anagrup.

    TYPES : BEGIN OF lty_altgrup,
              zmkanal   TYPE atwtb,
              zmanagrup TYPE atwtb,
              zmaltgrup TYPE atwtb,
              node_id   TYPE char5,
            END OF lty_altgrup.
    DATA : lt_altgrup TYPE TABLE OF lty_altgrup.

    TYPES : BEGIN OF lty_urun,
              urunid    TYPE char4,
              zmkanal   TYPE atwtb,
              zmanagrup TYPE atwtb,
              zmaltgrup TYPE atwtb,
              zmurun    TYPE atwtb,
              node_id   TYPE char5,

            END OF lty_urun.


    DATA : lt_urun TYPE TABLE OF lty_urun.


    SELECT * FROM zmhier_fiori INTO TABLE @DATA(gt_hier) .

    MOVE-CORRESPONDING gt_hier TO lt_kanal.
    MOVE-CORRESPONDING gt_hier TO lt_anagrup.
    MOVE-CORRESPONDING gt_hier TO lt_altgrup.
    MOVE-CORRESPONDING gt_hier TO lt_urun.


    SORT lt_kanal BY zmkanal.                       DELETE ADJACENT DUPLICATES FROM lt_kanal   COMPARING zmkanal.
    SORT lt_anagrup BY zmkanal zmanagrup.           DELETE ADJACENT DUPLICATES FROM lt_anagrup COMPARING zmkanal zmanagrup .
    SORT lt_altgrup BY zmkanal zmanagrup zmaltgrup. DELETE ADJACENT DUPLICATES FROM lt_altgrup COMPARING zmkanal zmanagrup zmaltgrup.


    DATA ls_tree TYPE zsd_ui5_tree_st.
    DATA lt_kanal_nv TYPE name2value_table.
    DATA ls_kanal_nv LIKE LINE OF lt_kanal_nv.
    DATA lv_node_id TYPE i.


    SELECT * FROM zmhiertipmeta INTO TABLE @DATA(it_hiertipmeta).

    LOOP AT lt_kanal INTO DATA(ls_kanal).
      ADD 1 TO lv_node_id .

      ls_tree-node_id = lv_node_id .
      ls_tree-h_level = '0' .
      ls_tree-aciklama = ls_kanal-zmkanal .
      ls_tree-pnode_id = 0 .
      ls_tree-status = 'expanded' .
      ls_kanal-node_id = lv_node_id.

      MODIFY lt_kanal FROM ls_kanal.
      APPEND ls_tree TO et_tree .   CLEAR ls_tree .

    ENDLOOP.


    LOOP AT lt_anagrup ASSIGNING FIELD-SYMBOL(<fs_anagrup>).  "INTO DATA(ls_anagrup) .
      ADD 1 TO lv_node_id .

      ls_tree-node_id = lv_node_id .
      ls_tree-h_level = '1' .
      ls_tree-aciklama = <fs_anagrup>-zmanagrup .


      READ TABLE lt_kanal INTO DATA(ls_kanal_index) WITH KEY zmkanal = <fs_anagrup>-zmkanal.
      IF sy-subrc = 0 .
        CONDENSE ls_kanal_index-node_id.
        ls_tree-pnode_id = ls_kanal_index-node_id.
      ENDIF.


      ls_tree-status = 'expanded' .
      <fs_anagrup>-node_id = lv_node_id.

*    MODIFY lt_anagrup FROM ls_anagrup.
      APPEND ls_tree TO et_tree .   CLEAR ls_tree .

    ENDLOOP.



    LOOP AT lt_altgrup INTO DATA(ls_altgrup) .
      ADD 1 TO lv_node_id .

      ls_tree-node_id = lv_node_id .
      ls_tree-h_level = '2' .
      ls_tree-aciklama = ls_altgrup-zmaltgrup.


      READ TABLE lt_anagrup INTO DATA(ls_anagrup_index) WITH KEY zmkanal   = ls_altgrup-zmkanal
                                                                 zmanagrup = ls_altgrup-zmanagrup.
      IF sy-subrc = 0 .
        CONDENSE ls_anagrup_index-node_id.
        ls_tree-pnode_id = ls_anagrup_index-node_id.
      ENDIF.

      ls_tree-status = 'expanded'.
      ls_altgrup-node_id = lv_node_id.

      MODIFY lt_altgrup FROM ls_altgrup.
      APPEND ls_tree TO et_tree.   CLEAR ls_tree.

    ENDLOOP.



    LOOP AT lt_urun INTO DATA(ls_urun) .
      ADD 1 TO lv_node_id .

      ls_tree-node_id = lv_node_id .
      ls_tree-h_level = '3' .
      ls_tree-aciklama = ls_urun-zmurun .
      ls_tree-ref_tree = ls_urun-urunid.


      READ TABLE lt_altgrup INTO DATA(ls_altgrup_index) WITH KEY zmkanal   = ls_urun-zmkanal
                                                                 zmanagrup = ls_urun-zmanagrup
                                                                 zmaltgrup = ls_urun-zmaltgrup.
      IF sy-subrc = 0 .
        CONDENSE ls_altgrup_index-node_id.
        ls_tree-pnode_id = ls_altgrup_index-node_id.
      ENDIF.

      ls_tree-status = 'leaf' .
      ls_altgrup-node_id = lv_node_id.

      MODIFY lt_urun FROM ls_urun.
      APPEND ls_tree TO et_tree.   CLEAR ls_tree.


**    DATA lv_loop_node TYPE i .
**    lv_loop_node = 0.

**    LOOP AT it_hiertipmeta INTO DATA(wa_hiertipmeta)
**       WHERE zmkanal   = ls_urun-zmkanal
**         AND zmanagrup = ls_urun-zmanagrup
**         AND zmaltgrup = ls_urun-zmaltgrup
**         AND zmurun    = ls_urun-zmurun.
**
**
**      ADD  1 TO lv_loop_node .
**      ls_tree-pnode_id = lv_node_id .
***      ls_tree-pnode_id = |{ ls_tree-pnode_id ALPHA = OUT }|.
**      ls_tree-status = 'leaf' .
**      ls_tree-node_id = lv_loop_node.
**      ls_tree-h_level = '4' .
***      ls_tree-matnr = wa_hiertipmeta-metacode.
**      ls_tree-aciklama = wa_hiertipmeta-tipkod.
**
**      APPEND ls_tree TO et_tree.   CLEAR ls_tree.
**
**    ENDLOOP.

    ENDLOOP.

  ENDMETHOD.


  METHOD urunlerset_get_entityset.

    DATA : ls_keys TYPE zcl_zsd_odata_kasa_mpc=>ts_reftree .
    DATA : lt_urunler TYPE zsd_t_urun_structur.
    DATA : lv_ref_tree TYPE  string .


    CASE io_tech_request_context->get_source_entity_type_name( ).

      WHEN 'refTree'.  "Called from Association

        io_tech_request_context->get_converted_source_keys(
        IMPORTING es_key_values = ls_keys ).

        IF ls_keys-search EQ 'false'.

          lv_ref_tree = ls_keys-ref .

          product_list_get(
            EXPORTING
              iv_ref_tree = lv_ref_tree
            IMPORTING
              et_urunler  = lt_urunler ).

        ELSEIF ls_keys-search EQ 'true'.

          DATA(lv_product_name) = ls_keys-ref .

          product_list_get_v2(
            EXPORTING
              iv_search_parameter = lv_product_name
            IMPORTING
              et_urunler  =  lt_urunler ).

        ENDIF.

        MOVE-CORRESPONDING lt_urunler TO et_entityset.

    ENDCASE.

  ENDMETHOD.
ENDCLASS.
