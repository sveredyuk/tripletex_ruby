# TripletexApi::Employee

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**first_name** | **String** |  | 
**last_name** | **String** |  | 
**employee_number** | **String** |  | [optional] 
**date_of_birth** | **String** |  | [optional] 
**email** | **String** |  | [optional] 
**phone_number_mobile** | **String** |  | [optional] 
**phone_number_home** | **String** |  | [optional] 
**national_identity_number** | **String** |  | [optional] 
**dnumber** | **String** |  | [optional] 
**international_id** | [**InternationalId**](InternationalId.md) |  | [optional] 
**bank_account_number** | **String** |  | [optional] 
**user_type** | **String** | Define the employee&#39;s user type.&lt;br&gt;STANDARD: Reduced access. Users with limited system entitlements.&lt;br&gt;EXTENDED: Users can be given all system entitlements.&lt;br&gt;NO_ACCESS: User with no log on access.&lt;br&gt;Users with access to Tripletex must confirm the email address. | [optional] 
**allow_information_registration** | **BOOLEAN** | Determines if salary information can be registered on the user including hours, travel expenses and employee expenses. The user may also be selected as a project member on projects. | [optional] [default to false]
**is_contact** | **BOOLEAN** |  | [optional] [default to false]
**comments** | **String** |  | [optional] 
**address** | [**Address**](Address.md) | Address tied to the employee | [optional] 
**department** | [**Department**](Department.md) |  | [optional] 
**employments** | [**Array&lt;Employment&gt;**](Employment.md) | Employments tied to the employee | [optional] 


