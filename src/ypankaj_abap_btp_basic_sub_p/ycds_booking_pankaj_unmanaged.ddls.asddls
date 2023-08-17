@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_BOOKING_PANKAJ'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YCDS_BOOKING_PANKAJ_UNMANAGED
  as select from zfe_abook_001001
  association [1..1] to YCDS_TRAVEL_PAN_UNMANAGED as _Travel  on $projection.TravelUuid = _Travel.TravelUuid
  association [1..1] to zi_fe_carr_001001         as _Carrier on $projection.CarrierId = _Carrier.AirlineID
{
  key booking_uuid          as BookingUuid,
      travel_uuid           as TravelUuid,
      booking_id            as BookingId,
      booking_date          as BookingDate,
      customer_id           as CustomerId,
      carrier_id            as CarrierId,
      connection_id         as ConnectionId,
      flight_date           as FlightDate,
      @Semantics.amount.currencyCode : 'CurrencyCode'
      flight_price          as FlightPrice,
      currency_code         as CurrencyCode,
      created_by            as CreatedBy,
      last_changed_by       as LastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      _Travel,
      _Carrier
}
