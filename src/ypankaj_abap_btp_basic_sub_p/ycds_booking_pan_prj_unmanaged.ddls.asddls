@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_BOOKING_PAN_PROJECTION'
@Metadata.allowExtensions: true
define view entity YCDS_BOOKING_PAN_PRJ_UNMANAGED
  as select from YCDS_BOOKING_PANKAJ_UNMANAGED
  association to parent YCDS_TRAVEL_PAN_PRJ_UNMANAGED as _travel on $projection.TravelUuid = _travel.TravelUuid

{
  key BookingUuid,
      TravelUuid,
      BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      FlightPrice,
      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      _travel,
//      _Travel : redirected to parent YCDS_TRAVEL_PAN_PRJ_UNMANAGED,
      LocalLastChangedAt,
      // @Semantics.imageUrl: true
      _Carrier.AirlinePicURL as image_url


}
