CLASS lhc_YCDS_TRAVEL_PAN_PRJ_UNMANA DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR ycds_travel_pan_prj_unmanaged RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE ycds_travel_pan_prj_unmanaged.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ycds_travel_pan_prj_unmanaged.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ycds_travel_pan_prj_unmanaged.

    METHODS read FOR READ
      IMPORTING keys FOR READ ycds_travel_pan_prj_unmanaged RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK ycds_travel_pan_prj_unmanaged.

    METHODS rba_Booking FOR READ
      IMPORTING keys_rba FOR READ ycds_travel_pan_prj_unmanaged\_Booking FULL result_requested RESULT result LINK association_links.

    METHODS cba_Booking FOR MODIFY
      IMPORTING entities_cba FOR CREATE ycds_travel_pan_prj_unmanaged\_Booking.

ENDCLASS.

CLASS lhc_YCDS_TRAVEL_PAN_PRJ_UNMANA IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Booking.
  ENDMETHOD.

  METHOD cba_Booking.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_YCDS_BOOKING_PAN_PRJ_UNMAN DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE ycds_booking_pan_prj_unmanaged.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE ycds_booking_pan_prj_unmanaged.

    METHODS read FOR READ
      IMPORTING keys FOR READ ycds_booking_pan_prj_unmanaged RESULT result.

    METHODS rba_Travel FOR READ
      IMPORTING keys_rba FOR READ ycds_booking_pan_prj_unmanaged\_Travel FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_YCDS_BOOKING_PAN_PRJ_UNMAN IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Travel.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_YCDS_TRAVEL_PAN_PRJ_UNMANA DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_YCDS_TRAVEL_PAN_PRJ_UNMANA IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
