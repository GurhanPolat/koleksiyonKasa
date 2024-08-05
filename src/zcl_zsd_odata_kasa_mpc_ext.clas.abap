CLASS zcl_zsd_odata_kasa_mpc_ext DEFINITION
  PUBLIC
  INHERITING FROM zcl_zsd_odata_kasa_mpc
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES : BEGIN OF ty_sales_create_deep_v2,
              sipkey                  TYPE  char30,
              musteri_no              TYPE  kunnr,
              genel_iskonto_yuzde     TYPE  bapikbetr1,
              genel_iskonto_tutar     TYPE  bapinetwr,
              odeme_turu              TYPE  char1,
              son_toplam_tutar        TYPE  bapinetwr,
              fark_yuvarla            TYPE  bapikbetr1,
              bolge                   TYPE  zdkasa_kodu,
              satis_sorumlusu         TYPE  zkunve,
              vbeln                   TYPE vbeln,
              salesheadertoitemnav_v2 TYPE TABLE OF ts_salescreateitems_v2 WITH DEFAULT KEY,
            END OF ty_sales_create_deep_v2.
    TYPES:
      BEGIN OF ty_fiyat_iskonto_deep,
        simkey                      TYPE  char30,
        musteri_no                  TYPE  kunnr,
        genel_iskonto_yuzde         TYPE  bapikbetr1,
*              genel_iskonto_tutar         TYPE  bapinetwr,
        net_tutar                   TYPE  bapinetwr,
        kdv                         TYPE  bapiwmwst,
        toplam_tutar                TYPE  bapinetwr,
        toplam_indirim_tutar        TYPE  bapinetwr,
        odeme_turu                  TYPE  char1,
        son_toplam_tutar            TYPE  bapinetwr,
        fark_yuvarla                TYPE  bapikbetr1,
        bolge                       TYPE  zdkasa_kodu,
        satis_sorumlusu             TYPE  zkunve,
        teklif_no                   TYPE  char10,
        fiyatiskontoheadertoitemnav TYPE TABLE OF ts_fiyatiskontoitem WITH DEFAULT KEY,
      END OF ty_fiyat_iskonto_deep .
    TYPES:
      BEGIN OF ty_sales_create_deep,
        sipkey               TYPE  char30,
        vbeln                TYPE  vbeln,
        simul                TYPE  flag,
        bolge                TYPE  zdkasa_kodu,
        musteri              TYPE  kunnr,
        musteri_type         TYPE  char1,
        payment_type         TYPE  char1,
        satis_sorumlusu      TYPE  zkunve,
        genel_iskonto_yuzde  TYPE  kbetr,
        genel_iskonto_tutar  TYPE  bapinetwr,
        odeme_sekli          TYPE  char30,
        fark_yuvarla         TYPE  bapikbetr1,
        salesheadertoitemnav TYPE TABLE OF ts_salescreateitem WITH DEFAULT KEY,
      END OF ty_sales_create_deep .
    TYPES:
      BEGIN OF ts_tree_urun ,
        ref_tree        TYPE char4,
        tree_to_urunler TYPE zsd_t_urun_structur,
      END OF ts_tree_urun .
    TYPES:
      BEGIN OF ts_kbf_fiori ,
        kbf TYPE zkasa_kbf_structure,
      END OF ts_kbf_fiori .
    TYPES:
      BEGIN OF ts_bagli_urunler ,
        matnr           TYPE matnr,
        headertoitemnav TYPE  zsd_t_urun_structur,
      END OF ts_bagli_urunler .

    METHODS define
        REDEFINITION .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZSD_ODATA_KASA_MPC_EXT IMPLEMENTATION.


  METHOD define.

    super->define( ).

    DATA:
      lo_annotation   TYPE REF TO /iwbep/if_mgw_odata_annotation, "#EC NEEDED
      lo_entity_type  TYPE REF TO /iwbep/if_mgw_odata_entity_typ, "#EC NEEDED
*      lo_entity_type TYPE REF TO /iwbep/if_mgw_odata_entity_typ, "#EC NEEDED
      lo_complex_type TYPE REF TO /iwbep/if_mgw_odata_cmplx_type, "#EC NEEDED
      lo_property     TYPE REF TO /iwbep/if_mgw_odata_property, "#EC NEEDED
      lo_entity_set   TYPE REF TO /iwbep/if_mgw_odata_entity_set. "#EC NEEDED************************************************************************************************************************************   ENTITY -


    lo_entity_type = model->get_entity_type( iv_entity_name = 'refTree' ). "#EC NOTEXT

    lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZSD_ODATA_KASA_MPC_EXT=>TS_TREE_URUN' ). "#EC NOTEXT


*    lo_entity_type = model->get_entity_type( iv_entity_name = 'SIPBaslik' ). "#EC NOTEXT
*    lo_entity_type->bind_structure( iv_structure_name  = 'ZCL_ZSD_ODATA_KASA_MPC_EXT=>TS_SIPARIS_FIORI' ). "#EC NOTEXT
  ENDMETHOD.
ENDCLASS.
