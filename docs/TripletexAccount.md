# TripletexApi::TripletexAccount

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**company** | [**Company**](Company.md) | Information about the company to create. Supply as much info as you have, but at least name, type and address. | 
**administrator** | [**Employee**](Employee.md) | Employee to create. Department on this object will also be created if supplied. If null a dummy user and department will be created instead | [optional] 
**account_type** | **String** | Is this a test account or a paying account? | 
**modules** | [**Modules**](Modules.md) | Modules (functionality in the application) to activate for the newly created account. Some modules have extra costs. | 
**administrator_password** | **String** | Password for the administrator user to create. Not a part of the administrator employee object since this is a value that never can be read (it is salted and hashed before storing) | 
**send_emails** | **BOOLEAN** | Should the regular creation emails be sent to the company created and its users? If false you probably want to set autoValidateUserLogin to true | [optional] [default to false]
**auto_validate_user_login** | **BOOLEAN** | If true, the users created will be allowed to log in without validating their email address. ONLY USE THIS IF YOU ALREADY HAVE VALIDATED THE USER EMAILS. | [optional] [default to false]
**create_administrator_api_token** | **BOOLEAN** | Create an API token for the administrator user for the consumer token used during this call. The token will be returned in the response. | [optional] [default to false]
**create_company_owned_api_token** | **BOOLEAN** | Create an API token for the company to use to call their clients, only possible for accounting and auditor accounts. The token will be returned in the response. | [optional] [default to false]
**may_create_tripletex_accounts** | **BOOLEAN** | Should the company we are creating be able to create new Tripletex accounts? | [optional] [default to false]
**number_of_vouchers** | **String** | Used to calculate prices. | 
**accounting_office** | **BOOLEAN** |  | [optional] [default to false]
**auditor** | **BOOLEAN** |  | [optional] [default to false]
**reseller** | **BOOLEAN** |  | [optional] [default to false]


