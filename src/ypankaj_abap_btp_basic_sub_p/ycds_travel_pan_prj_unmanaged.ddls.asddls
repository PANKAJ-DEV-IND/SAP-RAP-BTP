@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_TRAVEL_PROJECTION'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['TravelId']
@ObjectModel.resultSet.sizeCategory: #XS
@Search.searchable: true
define root view entity YCDS_TRAVEL_PAN_PRJ_UNMANAGED
  as select from YCDS_TRAVEL_PAN_UNMANAGED
  composition [0..*] of YCDS_BOOKING_PAN_PRJ_UNMANAGED as _booking
{
  key TravelUuid,
      @ObjectModel.text.element: ['Description']
      TravelId,
      _Agency.Name       as AgencyDesc,
      @ObjectModel.text.element: ['AgencyDesc']
      AgencyId,
      @Consumption.valueHelpDefinition: [{ entity : { name : 'YCDS_CUTOMER_PANKAJ_VH' , element: 'CustomerId' } }]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      CurrencyCode,
      CurrencyText,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      Description,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      _TravelStatus.Text as text,
      @Consumption.valueHelpDefinition: [{ entity : { name : 'YCDS_OVERALLSTATUS_PANKAJ_VH' , element: 'OverallStatus' } }]
      @ObjectModel.text.element: ['text']
      OverallStatus,
      overallcriticality,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      _booking,
//      _Booking : redirected to composition child YCDS_BOOKING_PAN_PROJECTION,
      _Image.PicUrl      as PicUrl
}
