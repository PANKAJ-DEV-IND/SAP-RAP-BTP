@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_OVERALLSTATUS_PANKAJ_STAT'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YCDS_OVERALLSTATUS_PANKAJ_STAT
  as select from /dmo/oall_stat
  association [0..*] to YCDS_OVERALLSTATUS_PANKAJ_TEXT as _overalltxt on $projection.OverallStatus = _overalltxt.OverallStatus
{
  key overall_status as OverallStatus,
  _overalltxt
}
