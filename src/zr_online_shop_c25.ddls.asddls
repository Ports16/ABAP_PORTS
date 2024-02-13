@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data model for online shop'
define root view entity ZR_ONLINE_SHOP_C25
  as select from zonlineshop_c25 
  association [1..1] to zshop_as_c25 as _Shop on  
  $projection.Order_Uuid = _Shop.order_uuid 
{ 
 
  key order_uuid   as Order_Uuid, 
      order_id     as Order_Id, 
      deliverydate as Deliverydate, 
      creationdate as Creationdate, 
      pkgid        as PackageId, 
      _Shop.costcenter as CostCenter, 
 
      /*Associations*/ 
      _Shop 
} 
