# TripletexApi::BankReconciliation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**account** | [**Account**](Account.md) |  | 
**accounting_period** | [**AccountingPeriod**](AccountingPeriod.md) |  | 
**voucher** | [**Voucher**](Voucher.md) |  | [optional] 
**bank_statement** | [**BankStatement**](BankStatement.md) |  | [optional] 
**is_closed** | **BOOLEAN** |  | [optional] [default to false]
**outgoing_bank_account_balance_currency** | **Float** |  | [optional] 
**closed_date** | **String** |  | [optional] 
**closed_by_contact** | [**Contact**](Contact.md) |  | [optional] 
**closed_by_employee** | [**Employee**](Employee.md) |  | [optional] 


