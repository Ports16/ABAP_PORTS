CLASS zcl_material_information_c25_1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
   METHODS get_material_art
      IMPORTING
        matnr               TYPE i_product-producT
      RETURNING
        VALUE(material_art) TYPE i_product-producttype .
ENDCLASS.



CLASS zcl_material_information_c25_1 IMPLEMENTATION.


  METHOD get_material_art.
    DATA material TYPE i_product.
    DATA production_date TYPE datn.
    DATA bool_tmp TYPE ABAP_BOOLEAN .


DATA(sy_DATUM402) = cl_abap_context_info=>get_system_date( ).
    PRODUCTION_DATE = sy_DATUM402.

    SELECT SINGLE FROM i_product fields producttype
                    WHERE product = @MATNR INTO CORRESPONDING FIELDS OF @MATERIAL.

    MATERIAL_ART = MATERIAL-producttype.

  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO
zcl_material_informatioN_C25_1.
    material_info = NEW zcl_material_information_C25_1( ).
    DATA(material_art) = material_info->get_material_art(
'RM34' ).
    out->write( material_art ).
  ENDMETHOD.
ENDCLASS.
