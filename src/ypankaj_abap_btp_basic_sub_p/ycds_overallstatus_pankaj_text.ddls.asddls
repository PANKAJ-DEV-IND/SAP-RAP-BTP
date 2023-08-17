@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_OVERALLSTATUS_PANKAJ'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YCDS_OVERALLSTATUS_PANKAJ_TEXT
  as select from /dmo/oall_stat_t
  association [0..1] to YCDS_OVERALLSTATUS_PANKAJ_STAT as _overalltxt on $projection.OverallStatus = _overalltxt.OverallStatus
{
      @ObjectModel.text.element: ['TEXT']
  key overall_status as OverallStatus,
      @Semantics.language: true
  key language       as Language,
      @Semantics.text: true
      text           as Text,
      _overalltxt
}
