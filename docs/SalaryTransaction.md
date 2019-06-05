# TripletexApi::SalaryTransaction

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**date** | **String** | Voucher date. | [optional] 
**year** | **Integer** |  | 
**month** | **Integer** |  | 
**is_historical** | **BOOLEAN** | With historical wage vouchers you can update the wage system with information dated before the opening balance. | [optional] [default to false]
**payslips** | [**Array&lt;Payslip&gt;**](Payslip.md) | Link to individual payslip objects. | 


