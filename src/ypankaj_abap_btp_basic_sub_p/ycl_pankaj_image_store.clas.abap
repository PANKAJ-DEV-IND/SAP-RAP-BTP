CLASS ycl_pankaj_image_store DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_pankaj_image_store IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA : lt_table TYPE TABLE OF ycds_pankaj_img,
           lt_curr  TYPE TABLE OF ycurrency_text_p.

    lt_curr = VALUE #( ( spras = 'E' currency = 'INR' currency_text = 'Indian Currency')
                       ( spras = 'E' currency = 'USD' currency_text = 'US Dollar')
                       ( spras = 'E' currency = 'EUR' currency_text = 'Europian Currency')
                     ).

    lt_table = VALUE #( ( travel_statu_id = 'O' travel_status_text = 'Open'
                        pic_url = 'https://raw.githubusercontent.com/SAP-samples/fiori-elements-opensap/main/week1/images/airlines/Fly-Africa-logo.png'
                         )
                         ( travel_statu_id = 'A' travel_status_text = 'Accepted'
                        pic_url = 'https://raw.githubusercontent.com/SAP-samples/fiori-elements-opensap/main/week1/images/airlines/Green-Albatross-logo.png'
                         )
                         ( travel_statu_id = 'X' travel_status_text = 'Rejected'
                        pic_url = 'https://raw.githubusercontent.com/SAP-samples/fiori-elements-opensap/main/week1/images/airlines/European-Airlines-logo.png'
                         )
                         ).

    DELETE FROM ycds_pankaj_img .
    DELETE FROM ycurrency_text_p.

    INSERT ycds_pankaj_img FROM TABLE @lt_table.
    INSERT ycurrency_text_p FROM TABLE @lt_curr.

    SELECT * FROM ycds_pankaj_img INTO TABLE @DATA(lt_dbtab).
    IF   sy-subrc EQ 0.

      out->write(
        EXPORTING
          data   = lt_dbtab
*        name   =
*      RECEIVING
*        output =
      ).
    ELSE.
      out->write(
        EXPORTING
          data   = 'NO DATA FOUND!'
*        name   =
*      RECEIVING
*        output =
      ).
    ENDIF.


    SELECT * FROM ycurrency_text_p INTO TABLE @DATA(lt_curr_text).
    IF   sy-subrc EQ 0.

      out->write(
        EXPORTING
          data   = lt_curr_text
*        name   =
*      RECEIVING
*        output =
      ).
    ELSE.
      out->write(
        EXPORTING
          data   = 'NO DATA FOUND in Currency!'
*        name   =
*      RECEIVING
*        output =
      ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
