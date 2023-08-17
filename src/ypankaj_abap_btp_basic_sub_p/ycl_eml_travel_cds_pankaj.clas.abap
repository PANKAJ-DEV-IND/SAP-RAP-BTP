CLASS ycl_eml_travel_cds_pankaj DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ycl_eml_travel_cds_pankaj IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA : lt_update TYPE TABLE FOR UPDATE ycds_travel_pan.
*
*    lt_update = VALUE #(  ( TravelUuid = '0028032098108F931800350A2E6BF3B2' CurrencyCode = 'USD' CurrencyText = 'US Dollar' ) ).
*
*    MODIFY ENTITIES OF ycds_travel_pan
**    IN LOCAL MODE
*    ENTITY ycds_travel_pan
*    UPDATE FIELDS ( CurrencyCode CurrencyText )
*    WITH lt_update.
*
*    COMMIT ENTITIES.
*
*    out->write(
*      EXPORTING
*        data   = 'Data Update by EML'
**        name   =
**      RECEIVING
**        output =
*    ).


**Case 1 : Read without key field
*    READ ENTITIES OF ycds_travel_pan
**    IN LOCAL MODE
*    ENTITY ycds_travel_pan
*    FROM VALUE #( ( TravelUuid = '0028032098108F931800350A2E6BF3B2' ) )
*    RESULT DATA(lt_currencykey).
*
*    out->write( lt_currencykey ).
*
**Case 2 : Read with KEY
*    READ ENTITIES OF ycds_travel_pan
**    IN LOCAL MODE
*       ENTITY ycds_travel_pan FIELDS ( TravelId AgencyId )
*       WITH VALUE #( ( TravelUuid = '0028032098108F931800350A2E6BF3B2' ) )
*       RESULT DATA(lt_travel).
*
*    out->write( lt_travel ).
*
**Case 3 : Raed all fields with KEY
*    READ ENTITIES OF ycds_travel_pan
**    IN LOCAL MODE
*     ENTITY ycds_travel_pan ALL FIELDS
*     WITH VALUE #( ( TravelUuid = '0028032098108F931800350A2E6BF3B2' ) )
*     RESULT DATA(lt_travel3).
*
*    out->write( lt_travel3 ).
*
**Case 4 : Read  with association keyword
*    READ ENTITIES OF ycds_travel_pan
**    IN LOCAL MODE
*   ENTITY ycds_travel_pan BY \_Booking
*   ALL FIELDS
*   WITH VALUE #( ( TravelUuid = '0028032098108F931800350A2E6BF3B2' ) )
*   RESULT DATA(lt_travel4).
*    out->write( 'Travel4' ).
*    out->write( lt_travel4 ).
*
**Case 5: Wrong input key
*    READ ENTITIES OF ycds_travel_pan
**    IN LOCAL MODE
*  ENTITY ycds_travel_pan BY \_Booking
*  ALL FIELDS
*  WITH VALUE #( ( TravelUuid = '1111111111111111111222222222222BBBBBB' ) )
*  RESULT DATA(lt_travel5)
*  FAILED DATA(lt_failed)
*  REPORTED DATA(lt_reported).
*    out->write( 'Travel5' ).
*    out->write( lt_travel5 ).
*    out->write( 'Travel5_FAILED' ).
*    out->write( lt_failed ).
*    out->write( 'Travel5_REPORTED' ).
*    out->write( lt_reported ).
*
**Delete the existing record
*    MODIFY ENTITIES OF ycds_travel_pan
*       ENTITY ycds_travel_pan
*       DELETE FROM
*       VALUE #( ( TravelUuid = '0028032098108F931800350A2E6BF3B2' ) )
*       FAILED DATA(lt_fail)
*       REPORTED DATA(lt_report).
*
*    COMMIT ENTITIES RESPONSE OF ycds_travel_pan
*    FAILED DATA(lt_commit_failed)
*    REPORTED DATA(lt_commit_report).
**
*
*    out->write( 'Record Delete the entry successfully' ).



**Case1 : Create Entity for Travel Entity Only
*    MODIFY ENTITY ycds_travel_pan
*    CREATE
*    SET FIELDS WITH VALUE #(  (  %cid = 'Dummy1'
*                                 AgencyId = '70039'
*                                 Description = 'New Entry 70039'
*                                 TotalPrice = 7689
*                                 OverallStatus = 'A'
*                                 BookingFee = 6767
*                                 CurrencyCode = 'INR'
*                                 currencytext = 'Indian Currency'
*                                 BeginDate = cl_abap_context_info=>get_system_date( )
*                                 EndDate = cl_abap_context_info=>get_system_date( ) + 7
*                           ) )
*                           FAILED DATA(lt_create_failed)
*                           REPORTED DATA(lt_create_report).
*
*    COMMIT ENTITIES
*    RESPONSE OF ycds_travel_pan
*    FAILED DATA(lt_commit_f)
*    REPORTED DATA(lt_commit_r).
*
*    out->write( 'New ENtry Created!!!' ).
*
*
**    Case2 : Create Entity for Travel Entity with Assoication Booking
*
*    MODIFY ENTITY ycds_travel_pan
*    CREATE
*    FIELDS ( AgencyId Description TotalPrice OverallStatus BookingFee CurrencyCode BeginDate EndDate  )
*    WITH VALUE #( ( %cid = 'Dummy2'
*                     AgencyId = '70015'
*                                     Description = 'New Entry 70015'
*                                     TotalPrice = 6666
*                                     OverallStatus = 'A'
*                                     BookingFee = 5454
*                                     CurrencyCode = 'USD'
*                                     BeginDate = cl_abap_context_info=>get_system_date( )
*                                     EndDate = cl_abap_context_info=>get_system_date( ) + 7
*                 ) )
*
*                 CREATE BY \_Booking FIELDS ( CarrierId FlightDate CustomerId ConnectionId  BookingDate BookingId )
*                 WITH VALUE #( (
*                              %cid_ref = 'Dummy2'
*                              %target = VALUE #(  (
*                                           %cid = 'Dummy_BOOK'
*                                            CarrierId = 'Test1'
*                                            FlightDate = cl_abap_context_info=>get_system_date( ) + 2
*                                            CustomerId = 'Customer12'
*                                            ConnectionId = 'Conn123'
*                                            BookingDate = cl_abap_context_info=>get_system_date( ) + 2
*                                            BookingId = 'Booking123'
*
*                               ) )
*                             ) )
*
*                             FAILED FINAL(lt_fail_mod)
*                           REPORTED FINAL(lt_report_mod)
*                           MAPPED FINAL(lt_mapped_mod).
*
*    COMMIT ENTITIES
*    RESPONSE OF ycds_travel_pan
*    FAILED DATA(lt_commit_fail)
*    REPORTED DATA(lt_report_commit).
*    out->write( 'New ENtry Created with Booking Association!!!' ).


***    Case3 : Create Entity for Travel Entity with Assoication Booking Multiple
**
**    MODIFY ENTITY ycds_travel_pan
**     CREATE
**     FIELDS ( AgencyId Description TotalPrice OverallStatus BookingFee CurrencyCode BeginDate EndDate  )
**     WITH VALUE #( ( %cid = 'Dummy2'
**                      AgencyId = '70004'
**                                      Description = 'New Entry 70004'
**                                      TotalPrice = 6666
**                                      OverallStatus = 'A'
**                                      BookingFee = 5454
**                                      CurrencyCode = 'USD'
**                                      BeginDate = cl_abap_context_info=>get_system_date( )
**                                      EndDate = cl_abap_context_info=>get_system_date( ) + 7
**                  )
**                  ( %cid = 'Dummy3'
**                      AgencyId = '70015'
**                                      Description = 'New Entry 70015'
**                                      TotalPrice = 6666
**                                      OverallStatus = 'A'
**                                      BookingFee = 5454
**                                      CurrencyCode = 'USD'
**                                      BeginDate = cl_abap_context_info=>get_system_date( )
**                                      EndDate = cl_abap_context_info=>get_system_date( ) + 7
**                  )
**
**                   )
**
**                  CREATE BY \_Booking FIELDS ( CarrierId FlightDate CustomerId ConnectionId  BookingDate BookingId )
**                  WITH VALUE #( (
**                               %cid_ref = 'Dummy2'
**                               %target = VALUE #(  (
**                                            %cid = 'Dummy_BOOK_1'
**                                             CarrierId = 'Test1_1'
**                                             FlightDate = cl_abap_context_info=>get_system_date( ) + 3
**                                             CustomerId = 'Customer12_1'
**                                             ConnectionId = 'Conn123_1'
**                                             BookingDate = cl_abap_context_info=>get_system_date( ) + 3
**                                             BookingId = 'Booking123_1'
**
**                                ) )
**                              )
**                              (
**                               %cid_ref = 'Dummy2'
**                               %target = VALUE #(  (
**                                            %cid = 'Dummy_BOOK_2'
**                                             CarrierId = 'Test1_2'
**                                             FlightDate = cl_abap_context_info=>get_system_date( ) + 4
**                                             CustomerId = 'Customer12_2'
**                                             ConnectionId = 'Conn123_2'
**                                             BookingDate = cl_abap_context_info=>get_system_date( ) + 5
**                                             BookingId = 'Booking123_2'
**
**                                ) )
**                              )
**
**                              (
**                               %cid_ref = 'Dummy3'
**                               %target = VALUE #(  (
**                                            %cid = 'Dummy_BOOK_3'
**                                             CarrierId = 'Test1_3'
**                                             FlightDate = cl_abap_context_info=>get_system_date( ) + 2
**                                             CustomerId = 'Customer12_3'
**                                             ConnectionId = 'Conn123'
**                                             BookingDate = cl_abap_context_info=>get_system_date( ) + 2
**                                             BookingId = 'Booking123_3'
**
**                                ) )
**                              )
**
**
**                              )
**
**                              FAILED FINAL(lt_fail_mod)
**                            REPORTED FINAL(lt_report_mod)
**                            MAPPED FINAL(lt_mapped_mod).
**
**    COMMIT ENTITIES
**    RESPONSE OF ycds_travel_pan
**    FAILED DATA(lt_commit_fail)
**    REPORTED DATA(lt_report_commit).
**    out->write( 'New ENtry Created with Booking Association with multiple!!!' ).



    MODIFY ENTITY ycds_travel_pan
    EXECUTE TotalPrice
    FROM VALUE #( ( TravelUuid = '0032032098108F931800350A2E6BF3B2' )
                  ( TravelUuid = '0033032098108F931800350A2E6BF3B2' )
                    )
    "0033032098108F931800350A2E6BF3B2
    RESULT FINAL(lt_result1)
    FAILED FINAL(lt_fail1)
    REPORTED FINAL(lt_final1).

    COMMIT ENTITIES RESPONSE OF ycds_travel_pan
    FAILED FINAL(lt_commit_f)
    REPORTED FINAL(lt_final_f).


    out->write( 'Execute Function Total Price' ).


  ENDMETHOD.
ENDCLASS.
