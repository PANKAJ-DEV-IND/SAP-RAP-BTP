@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ycds_pankaj_img_cds'
define view entity ycds_pankaj_img_cds
  as select from ycds_pankaj_img
{
  key travel_statu_id    as TravelStatuId,
      travel_status_text as TravelStatusText,
     // @UI.textArrangement: #TEXT_ONLY
      @Semantics.imageUrl: true
      //@Semantics.mimeType: true
      pic_url            as PicUrl
}
