# TripletexApi::ImportReportDTO

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company_id** | **Integer** |  | [optional] 
**company_name** | **String** |  | [optional] 
**agreement_number** | **String** |  | [optional] 
**agreement_type** | **String** |  | [optional] 
**accountant_company_id** | **Integer** |  | [optional] 
**accountant_agreement_number** | **String** |  | [optional] 
**start_date** | **DateTime** |  | [optional] 
**end_date** | **DateTime** |  | [optional] 
**success** | **BOOLEAN** |  | [optional] [default to false]
**config** | [**ImportConfigDTO**](ImportConfigDTO.md) |  | [optional] 
**admins** | **Array&lt;String&gt;** |  | [optional] 
**summary** | **Hash&lt;String, Hash&lt;String, Integer&gt;&gt;** |  | [optional] 
**errors** | [**Array&lt;Result&gt;**](Result.md) |  | [optional] 
**messages** | **Array&lt;String&gt;** |  | [optional] 
**results** | [**Array&lt;Result&gt;**](Result.md) |  | [optional] 


