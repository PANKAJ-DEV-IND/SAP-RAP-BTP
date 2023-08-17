CLASS lhc_YCDS_TRAVEL_PAN DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ycds_travel_pan RESULT result.

    METHODS CalculateTravelID FOR DETERMINE ON SAVE
      IMPORTING keys FOR ycds_travel_pan~CalculateTravelID.
    METHODS ValCurrencyCode FOR VALIDATE ON SAVE
      IMPORTING keys FOR ycds_travel_pan~ValCurrencyCode.
    METHODS GetCurrCode FOR DETERMINE ON SAVE
      IMPORTING keys FOR ycds_travel_pan~GetCurrCode.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR ycds_travel_pan RESULT result.

    METHODS TotalPrice FOR MODIFY
      IMPORTING keys FOR ACTION ycds_travel_pan~TotalPrice RESULT result.

ENDCLASS.

CLASS lhc_YCDS_TRAVEL_PAN IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD CalculateTravelID.
  ENDMETHOD.

  METHOD ValCurrencyCode.

**    READ ENTITIES OF ycds_travel_pan IN LOCAL MODE ENTITY
**    ycds_travel_pan  FIELDS ( TravelUuid )
**    WITH CORRESPONDING #( keys )
**    RESULT DATA(lt_currencykey).
**
**    LOOP AT lt_currencykey INTO DATA(ls_currencykey).
**      SELECT FROM I_Currency FIELDS Currency
**      WHERE Currency = @ls_currencykey-CurrencyCode
**      INTO TABLE @DATA(lt_curr).
**
**      IF  lt_curr IS INITIAL.
**        DATA(message) = me->new_message(
**                          id       = 'YCL_MESSAGE_TRAVEL_P'
**                          number   = 001
**                          severity = ms-error
**                          v1       = ls_currencykey-CurrencyCode
**                        ).
**
**        DATA ls_record LIKE LINE OF reported-ycds_travel_pan.
**
**        ls_record-%msg = message.
**        ls_record-%element-currencycode = if_abap_behv=>mk-on.
**        APPEND ls_record TO reported-ycds_travel_pan.
**
**        DATA ls_fail LIKE LINE OF failed-ycds_travel_pan.
**        APPEND ls_fail TO failed-ycds_travel_pan.
**
**      ENDIF.
**
**    ENDLOOP.

  ENDMETHOD.

  METHOD GetCurrCode.
    DATA lt_curr TYPE TABLE FOR READ RESULT ycds_travel_pan.
    "It is using to read entity
    READ ENTITIES OF ycds_travel_pan
    IN LOCAL MODE ENTITY ycds_travel_pan
    FIELDS ( TravelUuid TravelId )
    WITH CORRESPONDING #(  keys )
    RESULT lt_curr.

    LOOP AT lt_curr INTO DATA(ls_curr).
      SELECT SINGLE FROM ycurrency_text_p FIELDS currency_text
      WHERE spras = @sy-langu
      AND currency = @ls_curr-CurrencyCode
      INTO (@ls_curr-CurrencyText ).
      IF sy-subrc EQ 0.
        MODIFY lt_curr FROM ls_curr.
      ENDIF.
    ENDLOOP.

    DATA lt_update TYPE TABLE FOR UPDATE ycds_travel_pan.

    lt_update = CORRESPONDING #( lt_curr ).
    " It is using to modify records in CDS
    MODIFY ENTITIES OF ycds_travel_pan IN LOCAL MODE
    ENTITY ycds_travel_pan UPDATE FIELDS ( CurrencyText )
    WITH lt_update REPORTED DATA(lt_report).

    reported-ycds_booking_pankaj = CORRESPONDING #( lt_report-ycds_travel_pan ).

  ENDMETHOD.

  METHOD get_instance_features.

    MOVE-CORRESPONDING keys TO result.

    READ ENTITIES OF ycds_travel_pan IN LOCAL MODE
   ENTITY ycds_travel_pan
   ALL FIELDS WITH
   CORRESPONDING #( keys )
   RESULT DATA(lt_travel).

    LOOP AT result ASSIGNING FIELD-SYMBOL(<ls_result>).
      READ TABLE lt_travel INTO DATA(ls_travel) WITH KEY TravelUuid = <ls_result>-TravelUuid.
      IF sy-subrc EQ 0.
        CASE ls_travel-OverallStatus.
          WHEN 'A'."Accepted
            <ls_result>-%action-TotalPrice = if_abap_behv=>fc-o-enabled.
          WHEN OTHERS.
            <ls_result>-%action-TotalPrice = if_abap_behv=>fc-o-disabled.
        ENDCASE.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD TotalPrice.
    READ ENTITIES OF ycds_travel_pan IN LOCAL MODE
    ENTITY ycds_travel_pan
    ALL FIELDS WITH
    CORRESPONDING #( keys )
    RESULT DATA(lt_travel).

    LOOP AT lt_travel ASSIGNING FIELD-SYMBOL(<ls_travel>).
      <ls_travel>-TotalPrice = <ls_travel>-BookingFee + <ls_travel>-TotalPrice.
      DATA(ls_tot) = <ls_travel>-TotalPrice.
      DATA(ls_tid) = <ls_travel>-TravelId.
    ENDLOOP.

    DATA lt_update TYPE TABLE FOR UPDATE ycds_travel_pan.

    lt_update = CORRESPONDING #( lt_travel ).

    MODIFY ENTITIES OF ycds_travel_pan
    IN LOCAL MODE
    ENTITY ycds_travel_pan
    UPDATE FIELDS
    ( TotalPrice )
    WITH lt_update
    REPORTED DATA(lt_reported).

    DATA(message) = me->new_message(
                      id       = 'YCL_MESSAGE_TRAVEL_P'
                      number   = '002'
                      severity = ms-information
                      v1       = ls_tot
                      v2       = ls_tid
*                      v3       =
*                      v4       =
                    ).

    DATA ls_record LIKE LINE OF reported-ycds_travel_pan.

    ls_record-%msg = message.
    ls_record-%element-totalprice = if_abap_behv=>mk-on.
    ls_record-%element-travelid = if_abap_behv=>mk-on.
    APPEND ls_record TO reported-ycds_travel_pan.
**

    result = VALUE #( FOR ycds_travel_pan IN lt_travel
                       ( %tky = ycds_travel_pan-%tky
                       %param = ycds_travel_pan )
                       ).

  ENDMETHOD.

ENDCLASS.

CLASS lhc_YCDS_BOOKING_PANKAJ DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS CalculateBookingId FOR DETERMINE ON SAVE
      IMPORTING keys FOR ycds_booking_pankaj~CalculateBookingId.

ENDCLASS.

CLASS lhc_YCDS_BOOKING_PANKAJ IMPLEMENTATION.

  METHOD CalculateBookingId.
  ENDMETHOD.

ENDCLASS.
