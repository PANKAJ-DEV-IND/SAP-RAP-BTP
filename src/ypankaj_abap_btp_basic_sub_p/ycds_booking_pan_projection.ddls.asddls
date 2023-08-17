@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_BOOKING_PAN_PROJECTION'
@Metadata.allowExtensions: true
define view entity YCDS_BOOKING_PAN_PROJECTION
  as projection on YCDS_BOOKING_PANKAJ

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
      _Travel : redirected to parent YCDS_TRAVEL_PAN_PROJECTION,
      LocalLastChangedAt,
     // @Semantics.imageUrl: true
      _Carrier.AirlinePicURL as image_url


}
