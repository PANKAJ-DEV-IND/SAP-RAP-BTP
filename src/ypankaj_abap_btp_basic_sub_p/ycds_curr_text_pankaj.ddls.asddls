@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'YCDS_curr_text_pankaj'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity YCDS_curr_text_pankaj
  as select from ycurrency_text_p
{
  key spras         as Spras,
  key currency      as Currency,
      currency_text as CurrencyText
}

where
  spras = $session.system_language
