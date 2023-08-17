@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_OVERALLSTATUS_PANKAJ_VH'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.resultSet.sizeCategory: #XS
define view entity YCDS_OVERALLSTATUS_PANKAJ_VH
  as select from /dmo/oall_stat

  association [0..*] to YCDS_OVERALLSTATUS_PANKAJ_TEXT as _Text on $projection.OverallStatus = _Text.OverallStatus
{
      @UI.textArrangement: #TEXT_ONLY
      @ObjectModel.text.association: '_Text'
  key /dmo/oall_stat.overall_status as OverallStatus,

      _Text
}
