# TripletexApi::MileageAllowance

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**travel_expense** | [**TravelExpense**](TravelExpense.md) |  | [optional] 
**rate_type** | [**TravelExpenseRate**](TravelExpenseRate.md) |  | [optional] 
**rate_category** | [**TravelExpenseRateCategory**](TravelExpenseRateCategory.md) |  | [optional] 
**date** | **String** |  | 
**departure_location** | **String** |  | 
**destination** | **String** |  | 
**km** | **Float** |  | [optional] 
**rate** | **Float** |  | [optional] 
**amount** | **Float** |  | [optional] 
**is_company_car** | **BOOLEAN** |  | [optional] [default to false]
**passengers** | [**Array&lt;Passenger&gt;**](Passenger.md) | Link to individual passengers. | [optional] 


