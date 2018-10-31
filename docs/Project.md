# TripletexApi::Project

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**name** | **String** |  | 
**number** | **String** |  | [optional] 
**display_name** | **String** |  | [optional] 
**description** | **String** |  | [optional] 
**project_manager** | [**Employee**](Employee.md) |  | 
**department** | [**Department**](Department.md) |  | [optional] 
**main_project** | [**Project**](Project.md) |  | [optional] 
**start_date** | **String** |  | 
**end_date** | **String** |  | [optional] 
**customer** | [**Customer**](Customer.md) | The project&#39;s customer | [optional] 
**is_closed** | **BOOLEAN** |  | [optional] [default to false]
**is_ready_for_invoicing** | **BOOLEAN** |  | [optional] [default to false]
**is_internal** | **BOOLEAN** | Must be set to true. | [default to false]
**is_offer** | **BOOLEAN** |  | [optional] [default to false]
**project_category** | [**ProjectCategory**](ProjectCategory.md) |  | [optional] 
**delivery_address** | [**Address**](Address.md) |  | [optional] 
**display_name_format** | **String** | Defines project name presentation in overviews. | [optional] 
**external_accounts_number** | **String** |  | [optional] 
**discount_percentage** | **Float** | Project discount percentage. | [optional] 
**order_lines** | [**Array&lt;ProjectOrderLine&gt;**](ProjectOrderLine.md) | Order lines tied to the order | [optional] 
**participants** | [**Array&lt;ProjectParticipant&gt;**](ProjectParticipant.md) | Link to individual project participants. | [optional] 


