@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel CDS'

define root view entity YCDS_TRAVEL_PAN_UNMANAGED
  //as select from y21_travel
  as select from zfe_atrav_001001
  association [0..1] to /DMO/I_Agency                  as _Agency       on $projection.AgencyId = _Agency.AgencyID
  association [1..1] to YCDS_OVERALLSTATUS_PANKAJ_TEXT as _TravelStatus on $projection.OverallStatus = _TravelStatus.OverallStatus
  association [1..1] to ycds_pankaj_img_cds            as _Image        on $projection.OverallStatus = _Image.TravelStatuId
  association [1..1] to YCDS_curr_text_pankaj          as _CurrText     on $projection.CurrencyCode = _CurrText.Currency
//  composition [0..*] of YCDS_BOOKING_PANKAJ_UNMANAGED            as _Booking
association [0..*] to YCDS_BOOKING_PANKAJ_UNMANAGED as _booking on $projection.TravelUuid = _booking.TravelUuid

{

  key zfe_atrav_001001.travel_uuid           as TravelUuid,
      zfe_atrav_001001.travel_id             as TravelId,
      zfe_atrav_001001.agency_id             as AgencyId,
      zfe_atrav_001001.customer_id           as CustomerId,
      zfe_atrav_001001.begin_date            as BeginDate,
      zfe_atrav_001001.end_date              as EndDate,
      zfe_atrav_001001.booking_fee           as BookingFee,
      zfe_atrav_001001.total_price           as TotalPrice,
      zfe_atrav_001001.currency_code         as CurrencyCode,
      _CurrText.CurrencyText                 as CurrencyText,
      zfe_atrav_001001.description           as Description,
      zfe_atrav_001001.overall_status        as OverallStatus,
      case overall_status
           when'O' then 2
           when 'A' then 3
           when 'X' then 1
           else 0
           end                               as overallcriticality,
      zfe_atrav_001001.created_by            as CreatedBy,
      zfe_atrav_001001.created_at            as CreatedAt,
      zfe_atrav_001001.last_changed_by       as LastChangedBy,
      zfe_atrav_001001.last_changed_at       as LastChangedAt,
      zfe_atrav_001001.local_last_changed_at as LocalLastChangedAt,
      _Agency,
      _TravelStatus,
      _Image,
      _booking
//      _Booking

}
