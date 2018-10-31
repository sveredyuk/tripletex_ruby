# TripletexApi::Supplier

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | 
**organization_number** | **String** |  | [optional] 
**supplier_number** | **Integer** |  | [optional] 
**customer_number** | **Integer** |  | [optional] 
**is_supplier** | **BOOLEAN** |  | [optional] [default to false]
**is_customer** | **BOOLEAN** |  | [optional] [default to false]
**is_inactive** | **BOOLEAN** |  | [optional] [default to false]
**email** | **String** |  | [optional] 
**bank_accounts** | **Array&lt;String&gt;** | List of the bank account numbers for this supplier.  Norwegian bank account numbers only. | [optional] 
**invoice_email** | **String** |  | [optional] 
**phone_number** | **String** |  | [optional] 
**phone_number_mobile** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**is_private_individual** | **BOOLEAN** |  | [optional] [default to false]
**account_manager** | [**Employee**](Employee.md) |  | [optional] 
**postal_address** | [**Address**](Address.md) |  | [optional] 
**physical_address** | [**Address**](Address.md) |  | [optional] 
**delivery_address** | [**Address**](Address.md) |  | [optional] 
**category1** | [**CustomerCategory**](CustomerCategory.md) | Category 1 of this supplier | [optional] 
**category2** | [**CustomerCategory**](CustomerCategory.md) | Category 2 of this supplier | [optional] 
**category3** | [**CustomerCategory**](CustomerCategory.md) | Category 3 of this supplier | [optional] 


