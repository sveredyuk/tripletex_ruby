# TripletexApi::Product

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | [optional] 
**number** | **String** |  | [optional] 
**cost_excluding_vat_currency** | **Float** | Price purchase (cost) excluding VAT in the product&#39;s currency | [optional] 
**price_excluding_vat_currency** | **Float** | Price of purchase excluding VAT in the product&#39;s currency | [optional] 
**price_including_vat_currency** | **Float** | Price of purchase including VAT in the product&#39;s currency | [optional] 
**is_inactive** | **BOOLEAN** |  | [optional] [default to false]
**product_unit** | [**ProductUnit**](ProductUnit.md) |  | [optional] 
**is_stock_item** | **BOOLEAN** |  | [optional] [default to false]
**stock_of_goods** | **Float** |  | [optional] 
**vat_type** | [**VatType**](VatType.md) |  | [optional] 
**currency** | [**Currency**](Currency.md) |  | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**account** | [**Account**](Account.md) |  | [optional] 


