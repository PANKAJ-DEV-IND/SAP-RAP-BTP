CLASS ycl_demo_abap_basic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_demo_abap_basic IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA : lv_date TYPE d VALUE '20230801'.

*    DATA(lv_dateformat) = |Date:- { lv_date DATE = ISO }|.
    DATA(lv_dateformat) = | { TEXT-abc } | && | { lv_date DATE = USER } |.

    out->write(
      EXPORTING
        data   = lv_dateformat
*      name   =
*    RECEIVING
*      output =
    ).
*    out->write(
*      EXPORTING
*        data   = 'Hello World'
**      name   =
**    RECEIVING
**      output =
*    ).

*    DATA : lt_table TYPE TABLE OF ybooking_demo.
*    GET TIME STAMP FIELD DATA(lv_time).
*    lt_table = VALUE #( (  bookingid = '1'
*                         customer = 'Pankaj'
*                         passengers = 5
*                         email = 'pankaj@demo.com'
*                         country = 'India'
*                         bookingdate = cl_abap_context_info=>get_system_date( )
*                         traveldate = cl_abap_context_info=>get_system_date( ) + 7
*                         fee = 3000
*                         currency = 'INR'
*                         lastchange = lv_time
*                          )
*                          (  bookingid = '2'
*                         customer = 'Vikas'
*                         passengers = 3
*                         email = 'vikas@demo.com'
*                         country = 'India'
*                         bookingdate = cl_abap_context_info=>get_system_date( )
*                         traveldate = cl_abap_context_info=>get_system_date( ) + 14
*                         fee = 2000
*                         currency = 'INR'
*                         lastchange = lv_time
*                          ) ).
*
**    DELETE FROM ybooking_demo.
**    INSERT ybooking_demo FROM TABLE @lt_table.
*    TRY.
*        INSERT ybooking_demo FROM TABLE @lt_table ."ACCEPTING DUPLICATE KEYS.
*      CATCH cx_root INTO DATA(lo_root).
*        DATA(lv_msg) = lo_root->get_longtext( ).
*        out->write(
*          EXPORTING
*            data   = lv_msg
**        name   =
**      RECEIVING
**        output =
*        ).
*    ENDTRY.
*    IF sy-subrc EQ 0.
*      SELECT * FROM ybooking_demo INTO TABLE @DATA(lt_dbtable).
*      IF lt_dbtable IS NOT INITIAL.
*        out->write(
*          EXPORTING
*            data   = lt_dbtable
**        name   =
**      RECEIVING
**        output =
*        ).
*      ENDIF.
*    ELSE.
*      out->write(
*        EXPORTING
*          data   = 'Failing'
**      name   =
**    RECEIVING
**      output =
*    ).
*    ENDIF.
  ENDMETHOD.
ENDCLASS.
