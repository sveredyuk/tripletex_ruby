# tripletex_api

TripletexApi - the Ruby gem for the Tripletex API

The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/swagger-api/swagger-codegen). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2.26.2
- Package version: 1.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation

### Build a gem

To build the Ruby code into a gem:

```shell
gem build tripletex_api.gemspec
```

Then either install the gem locally:

```shell
gem install ./tripletex_api-1.0.0.gem
```
(for development, run `gem install --dev ./tripletex_api-1.0.0.gem` to install the development dependencies)

or publish the gem to a gem hosting service, e.g. [RubyGems](https://rubygems.org/).

Finally add this to the Gemfile:

    gem 'tripletex_api', '~> 1.0.0'

### Install from Git

If the Ruby gem is hosted at a git repository: https://github.com/GIT_USER_ID/GIT_REPO_ID, then add the following in the Gemfile:

    gem 'tripletex_api', :git => 'https://github.com/GIT_USER_ID/GIT_REPO_ID.git'

### Include the Ruby code directly

Include the Ruby code directly using `-I` as follows:

```shell
ruby -Ilib script.rb
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'tripletex_api'

# Setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::ActivityApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find activity by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ActivityApi->get: #{e}"
end

```

## Documentation for API Endpoints

All URIs are relative to *https://tripletex.no/v2*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*TripletexApi::ActivityApi* | [**get**](docs/ActivityApi.md#get) | **GET** /activity/{id} | Find activity by ID.
*TripletexApi::ActivityApi* | [**get_for_time_sheet**](docs/ActivityApi.md#get_for_time_sheet) | **GET** /activity/&gt;forTimeSheet | Find applicable time sheet activities for an employee on a specific day.
*TripletexApi::ActivityApi* | [**search**](docs/ActivityApi.md#search) | **GET** /activity | Find activities corresponding with sent data.
*TripletexApi::AddressApi* | [**get**](docs/AddressApi.md#get) | **GET** /address/{id} | Get address by ID.
*TripletexApi::AddressApi* | [**put**](docs/AddressApi.md#put) | **PUT** /address/{id} | Update address. 
*TripletexApi::AddressApi* | [**search**](docs/AddressApi.md#search) | **GET** /address | Find addresses corresponding with sent data.
*TripletexApi::BankApi* | [**search**](docs/BankApi.md#search) | **GET** /bank | [BETA] Find bank corresponding with sent data.
*TripletexApi::BankreconciliationApi* | [**adjustment**](docs/BankreconciliationApi.md#adjustment) | **PUT** /bank/reconciliation/{id}/:adjustment | [BETA] Add an adjustment to reconciliation by ID.
*TripletexApi::BankreconciliationApi* | [**delete**](docs/BankreconciliationApi.md#delete) | **DELETE** /bank/reconciliation/{id} | [BETA] Delete bank reconciliation by ID.
*TripletexApi::BankreconciliationApi* | [**get**](docs/BankreconciliationApi.md#get) | **GET** /bank/reconciliation/{id} | [BETA] Get bank reconciliation.
*TripletexApi::BankreconciliationApi* | [**last_closed**](docs/BankreconciliationApi.md#last_closed) | **GET** /bank/reconciliation/&gt;lastClosed | [BETA] Get last closed reconciliation by account ID.
*TripletexApi::BankreconciliationApi* | [**post**](docs/BankreconciliationApi.md#post) | **POST** /bank/reconciliation | [BETA] Post a bank reconciliation.
*TripletexApi::BankreconciliationApi* | [**put**](docs/BankreconciliationApi.md#put) | **PUT** /bank/reconciliation/{id} | [BETA] Update a bank reconciliation.
*TripletexApi::BankreconciliationApi* | [**search**](docs/BankreconciliationApi.md#search) | **GET** /bank/reconciliation | [BETA] Find bank reconciliation corresponding with sent data.
*TripletexApi::BankreconciliationmatchApi* | [**delete**](docs/BankreconciliationmatchApi.md#delete) | **DELETE** /bank/reconciliation/match/{id} | [BETA] Delete a bank reconciliation match by ID.
*TripletexApi::BankreconciliationmatchApi* | [**get**](docs/BankreconciliationmatchApi.md#get) | **GET** /bank/reconciliation/match/{id} | [BETA] Get bank reconciliation match by ID.
*TripletexApi::BankreconciliationmatchApi* | [**post**](docs/BankreconciliationmatchApi.md#post) | **POST** /bank/reconciliation/match | [BETA] Create a bank reconciliation match.
*TripletexApi::BankreconciliationmatchApi* | [**put**](docs/BankreconciliationmatchApi.md#put) | **PUT** /bank/reconciliation/match/{id} | [BETA] Update a bank reconciliation match by ID.
*TripletexApi::BankreconciliationmatchApi* | [**search**](docs/BankreconciliationmatchApi.md#search) | **GET** /bank/reconciliation/match | [BETA] Find bank reconciliation match corresponding with sent data.
*TripletexApi::BankreconciliationmatchApi* | [**suggest**](docs/BankreconciliationmatchApi.md#suggest) | **PUT** /bank/reconciliation/match/:suggest | [BETA] Suggest matches for a bank reconciliation by ID.
*TripletexApi::BankreconciliationpaymentTypeApi* | [**get**](docs/BankreconciliationpaymentTypeApi.md#get) | **GET** /bank/reconciliation/paymentType/{id} | [BETA] Get payment type by ID.
*TripletexApi::BankreconciliationpaymentTypeApi* | [**search**](docs/BankreconciliationpaymentTypeApi.md#search) | **GET** /bank/reconciliation/paymentType | [BETA] Find payment type corresponding with sent data.
*TripletexApi::BankstatementApi* | [**delete**](docs/BankstatementApi.md#delete) | **DELETE** /bank/statement/{id} | [BETA] Delete bank statement by ID.
*TripletexApi::BankstatementApi* | [**get**](docs/BankstatementApi.md#get) | **GET** /bank/statement/{id} | [BETA] Get bank statement.
*TripletexApi::BankstatementApi* | [**import_bank_statement**](docs/BankstatementApi.md#import_bank_statement) | **POST** /bank/statement/import | [BETA] Upload bank statement file.
*TripletexApi::BankstatementApi* | [**search**](docs/BankstatementApi.md#search) | **GET** /bank/statement | [BETA] Find bank statement corresponding with sent data.
*TripletexApi::BankstatementtransactionApi* | [**get**](docs/BankstatementtransactionApi.md#get) | **GET** /bank/statement/transaction/{id} | [BETA] Get bank transaction by ID.
*TripletexApi::BankstatementtransactionApi* | [**get_details**](docs/BankstatementtransactionApi.md#get_details) | **GET** /bank/statement/transaction/{id}/details | [BETA] Get additional details about transaction by ID.
*TripletexApi::BankstatementtransactionApi* | [**search**](docs/BankstatementtransactionApi.md#search) | **GET** /bank/statement/transaction | [BETA] Find bank transaction corresponding with sent data.
*TripletexApi::CompanyApi* | [**get**](docs/CompanyApi.md#get) | **GET** /company/{id} | Find company by ID.
*TripletexApi::CompanyApi* | [**get_divisions**](docs/CompanyApi.md#get_divisions) | **GET** /company/divisions | Find divisions.
*TripletexApi::CompanyApi* | [**get_with_login_access**](docs/CompanyApi.md#get_with_login_access) | **GET** /company/&gt;withLoginAccess | Returns client customers (with accountant/auditor relation) where the current user has login access (proxy login).
*TripletexApi::ContactApi* | [**get**](docs/ContactApi.md#get) | **GET** /contact/{id} | Get contact by ID.
*TripletexApi::ContactApi* | [**post**](docs/ContactApi.md#post) | **POST** /contact | Create contact.
*TripletexApi::ContactApi* | [**put**](docs/ContactApi.md#put) | **PUT** /contact/{id} | [BETA] Update contact.
*TripletexApi::ContactApi* | [**search**](docs/ContactApi.md#search) | **GET** /contact | Find contacts corresponding with sent data.
*TripletexApi::CountryApi* | [**get**](docs/CountryApi.md#get) | **GET** /country/{id} | Get country by ID.
*TripletexApi::CountryApi* | [**search**](docs/CountryApi.md#search) | **GET** /country | Find countries corresponding with sent data.
*TripletexApi::CrmprospectApi* | [**get**](docs/CrmprospectApi.md#get) | **GET** /crm/prospect/{id} | Get prospect by ID.
*TripletexApi::CrmprospectApi* | [**search**](docs/CrmprospectApi.md#search) | **GET** /crm/prospect | Find prospects corresponding with sent data.
*TripletexApi::CurrencyApi* | [**get**](docs/CurrencyApi.md#get) | **GET** /currency/{id} | Get currency by ID.
*TripletexApi::CurrencyApi* | [**search**](docs/CurrencyApi.md#search) | **GET** /currency | Find currencies corresponding with sent data.
*TripletexApi::CustomerApi* | [**get**](docs/CustomerApi.md#get) | **GET** /customer/{id} | Get customer by ID.
*TripletexApi::CustomerApi* | [**post**](docs/CustomerApi.md#post) | **POST** /customer | Create customer. Related customer addresses may also be created.
*TripletexApi::CustomerApi* | [**post_list**](docs/CustomerApi.md#post_list) | **POST** /customer/list | [BETA] Create multiple customers. Related supplier addresses may also be created.
*TripletexApi::CustomerApi* | [**put**](docs/CustomerApi.md#put) | **PUT** /customer/{id} | Update customer. 
*TripletexApi::CustomerApi* | [**put_list**](docs/CustomerApi.md#put_list) | **PUT** /customer/list | [BETA] Update multiple customers. Addresses can also be updated.
*TripletexApi::CustomerApi* | [**search**](docs/CustomerApi.md#search) | **GET** /customer | Find customers corresponding with sent data.
*TripletexApi::CustomercategoryApi* | [**get**](docs/CustomercategoryApi.md#get) | **GET** /customer/category/{id} | Find customer/supplier category by ID.
*TripletexApi::CustomercategoryApi* | [**post**](docs/CustomercategoryApi.md#post) | **POST** /customer/category | Add new customer/supplier category.
*TripletexApi::CustomercategoryApi* | [**put**](docs/CustomercategoryApi.md#put) | **PUT** /customer/category/{id} | Update customer/supplier category.
*TripletexApi::CustomercategoryApi* | [**search**](docs/CustomercategoryApi.md#search) | **GET** /customer/category | Find customer/supplier categories corresponding with sent data.
*TripletexApi::DepartmentApi* | [**get**](docs/DepartmentApi.md#get) | **GET** /department/{id} | Get department by ID.
*TripletexApi::DepartmentApi* | [**post**](docs/DepartmentApi.md#post) | **POST** /department | [BETA] Add new department.
*TripletexApi::DepartmentApi* | [**post_list**](docs/DepartmentApi.md#post_list) | **POST** /department/list | [BETA] Register new departments.
*TripletexApi::DepartmentApi* | [**put**](docs/DepartmentApi.md#put) | **PUT** /department/{id} | [BETA] Update department.
*TripletexApi::DepartmentApi* | [**put_list**](docs/DepartmentApi.md#put_list) | **PUT** /department/list | [BETA] Update multiple departments.
*TripletexApi::DepartmentApi* | [**search**](docs/DepartmentApi.md#search) | **GET** /department | Find department corresponding with sent data.
*TripletexApi::DocumentApi* | [**download_content**](docs/DocumentApi.md#download_content) | **GET** /document/{id}/content | [BETA] Get content of document given by ID.
*TripletexApi::DocumentApi* | [**get**](docs/DocumentApi.md#get) | **GET** /document/{id} | [BETA] Get document by ID.
*TripletexApi::EmployeeApi* | [**get**](docs/EmployeeApi.md#get) | **GET** /employee/{id} | Get employee by ID.
*TripletexApi::EmployeeApi* | [**post**](docs/EmployeeApi.md#post) | **POST** /employee | [BETA] Create one employee.
*TripletexApi::EmployeeApi* | [**post_list**](docs/EmployeeApi.md#post_list) | **POST** /employee/list | [BETA] Create several employees.
*TripletexApi::EmployeeApi* | [**put**](docs/EmployeeApi.md#put) | **PUT** /employee/{id} | Update employee.
*TripletexApi::EmployeeApi* | [**search**](docs/EmployeeApi.md#search) | **GET** /employee | Find employees corresponding with sent data.
*TripletexApi::EmployeeemploymentApi* | [**get**](docs/EmployeeemploymentApi.md#get) | **GET** /employee/employment/{id} | Find employment by ID.
*TripletexApi::EmployeeemploymentApi* | [**post**](docs/EmployeeemploymentApi.md#post) | **POST** /employee/employment | [BETA] Create employment.
*TripletexApi::EmployeeemploymentApi* | [**put**](docs/EmployeeemploymentApi.md#put) | **PUT** /employee/employment/{id} | [BETA] Update employemnt. 
*TripletexApi::EmployeeemploymentApi* | [**search**](docs/EmployeeemploymentApi.md#search) | **GET** /employee/employment | Find all employments for employee.
*TripletexApi::EmployeeemploymentdetailsApi* | [**get**](docs/EmployeeemploymentdetailsApi.md#get) | **GET** /employee/employment/details/{id} | [BETA] Find employment details by ID.
*TripletexApi::EmployeeemploymentdetailsApi* | [**post**](docs/EmployeeemploymentdetailsApi.md#post) | **POST** /employee/employment/details | [BETA] Create employment details.
*TripletexApi::EmployeeemploymentdetailsApi* | [**put**](docs/EmployeeemploymentdetailsApi.md#put) | **PUT** /employee/employment/details/{id} | [BETA] Update employment details. 
*TripletexApi::EmployeeemploymentdetailsApi* | [**search**](docs/EmployeeemploymentdetailsApi.md#search) | **GET** /employee/employment/details | [BETA] Find all employmentdetails for employment.
*TripletexApi::EmployeeemploymentemploymentTypeApi* | [**search**](docs/EmployeeemploymentemploymentTypeApi.md#search) | **GET** /employee/employment/employmentType | [BETA] Find all employment type IDs.
*TripletexApi::EmployeeemploymentleaveOfAbsenceApi* | [**get**](docs/EmployeeemploymentleaveOfAbsenceApi.md#get) | **GET** /employee/employment/leaveOfAbsence/{id} | [BETA] Find leave of absence by ID.
*TripletexApi::EmployeeemploymentleaveOfAbsenceApi* | [**post**](docs/EmployeeemploymentleaveOfAbsenceApi.md#post) | **POST** /employee/employment/leaveOfAbsence | [BETA] Create leave of absence.
*TripletexApi::EmployeeemploymentleaveOfAbsenceApi* | [**put**](docs/EmployeeemploymentleaveOfAbsenceApi.md#put) | **PUT** /employee/employment/leaveOfAbsence/{id} | [BETA] Update leave of absence. 
*TripletexApi::EmployeeemploymentleaveOfAbsenceTypeApi* | [**search**](docs/EmployeeemploymentleaveOfAbsenceTypeApi.md#search) | **GET** /employee/employment/leaveOfAbsenceType | [BETA] Find all leave of absence type IDs.
*TripletexApi::EmployeeemploymentoccupationCodeApi* | [**search**](docs/EmployeeemploymentoccupationCodeApi.md#search) | **GET** /employee/employment/occupationCode | [BETA] Find all profession codes.
*TripletexApi::EmployeeemploymentremunerationTypeApi* | [**search**](docs/EmployeeemploymentremunerationTypeApi.md#search) | **GET** /employee/employment/remunerationType | [BETA] Find all remuneration type IDs.
*TripletexApi::EmployeeemploymentworkingHoursSchemeApi* | [**search**](docs/EmployeeemploymentworkingHoursSchemeApi.md#search) | **GET** /employee/employment/workingHoursScheme | [BETA] Find working hours scheme ID.
*TripletexApi::EmployeeentitlementApi* | [**client**](docs/EmployeeentitlementApi.md#client) | **GET** /employee/entitlement/client | [BETA] Find all entitlements at client for user.
*TripletexApi::EmployeeentitlementApi* | [**get**](docs/EmployeeentitlementApi.md#get) | **GET** /employee/entitlement/{id} | Get entitlement by ID.
*TripletexApi::EmployeeentitlementApi* | [**grant_client_entitlements_by_template**](docs/EmployeeentitlementApi.md#grant_client_entitlements_by_template) | **PUT** /employee/entitlement/:grantClientEntitlementsByTemplate | [BETA] Update employee entitlements in client account.
*TripletexApi::EmployeeentitlementApi* | [**grant_entitlements_by_template**](docs/EmployeeentitlementApi.md#grant_entitlements_by_template) | **PUT** /employee/entitlement/:grantEntitlementsByTemplate | [BETA] Update employee entitlements.
*TripletexApi::EmployeeentitlementApi* | [**search**](docs/EmployeeentitlementApi.md#search) | **GET** /employee/entitlement | Find all entitlements for user.
*TripletexApi::EmployeestandardTimeApi* | [**get**](docs/EmployeestandardTimeApi.md#get) | **GET** /employee/standardTime/{id} | [BETA] Find standard time by ID.
*TripletexApi::EmployeestandardTimeApi* | [**post**](docs/EmployeestandardTimeApi.md#post) | **POST** /employee/standardTime | [BETA] Create standard time.
*TripletexApi::EmployeestandardTimeApi* | [**put**](docs/EmployeestandardTimeApi.md#put) | **PUT** /employee/standardTime/{id} | [BETA] Update standard time. 
*TripletexApi::EmployeestandardTimeApi* | [**search**](docs/EmployeestandardTimeApi.md#search) | **GET** /employee/standardTime | [BETA] Find all standard times for employee.
*TripletexApi::EventApi* | [**get**](docs/EventApi.md#get) | **GET** /event | [BETA] Get all (WebHook) event keys.
*TripletexApi::EventsubscriptionApi* | [**delete**](docs/EventsubscriptionApi.md#delete) | **DELETE** /event/subscription/{id} | [BETA] Delete the given subscription.
*TripletexApi::EventsubscriptionApi* | [**get**](docs/EventsubscriptionApi.md#get) | **GET** /event/subscription/{id} | [BETA] Get subscription by ID.
*TripletexApi::EventsubscriptionApi* | [**post**](docs/EventsubscriptionApi.md#post) | **POST** /event/subscription | [BETA] Create a new subscription for current EmployeeToken.
*TripletexApi::EventsubscriptionApi* | [**put**](docs/EventsubscriptionApi.md#put) | **PUT** /event/subscription/{id} | [BETA] Change a current subscription, based on id.
*TripletexApi::EventsubscriptionApi* | [**search**](docs/EventsubscriptionApi.md#search) | **GET** /event/subscription | [BETA] Find all ongoing subscriptions.
*TripletexApi::InventoryApi* | [**get**](docs/InventoryApi.md#get) | **GET** /inventory/{id} | Get inventory by ID.
*TripletexApi::InventoryApi* | [**search**](docs/InventoryApi.md#search) | **GET** /inventory | Find inventory corresponding with sent data.
*TripletexApi::InvoiceApi* | [**create_credit_note**](docs/InvoiceApi.md#create_credit_note) | **PUT** /invoice/{id}/:createCreditNote | [BETA] Creates a new Invoice representing a credit memo that nullifies the given invoice. Updates this invoice and any pre-existing inverse invoice.
*TripletexApi::InvoiceApi* | [**create_reminder**](docs/InvoiceApi.md#create_reminder) | **PUT** /invoice/{id}/:createReminder | [BETA] Create invoice reminder and sends it by the given dispatch type. Supports the reminder types SOFT_REMINDER, REMINDER and NOTICE_OF_DEBT_COLLECTION. DispatchType NETS_PRINT must have type NOTICE_OF_DEBT_COLLECTION. SMS and NETS_PRINT must be activated prior to usage in the API.
*TripletexApi::InvoiceApi* | [**download_pdf**](docs/InvoiceApi.md#download_pdf) | **GET** /invoice/{invoiceId}/pdf | Get invoice document by invoice ID.
*TripletexApi::InvoiceApi* | [**get**](docs/InvoiceApi.md#get) | **GET** /invoice/{id} | Get invoice by ID.
*TripletexApi::InvoiceApi* | [**payment**](docs/InvoiceApi.md#payment) | **PUT** /invoice/{id}/:payment | Update invoice. The invoice is updated with payment information. The amount is in the invoice’s currency.
*TripletexApi::InvoiceApi* | [**post**](docs/InvoiceApi.md#post) | **POST** /invoice | Create invoice.
*TripletexApi::InvoiceApi* | [**search**](docs/InvoiceApi.md#search) | **GET** /invoice | Find invoices corresponding with sent data. Includes charged outgoing invoices only.
*TripletexApi::InvoiceApi* | [**send**](docs/InvoiceApi.md#send) | **PUT** /invoice/{id}/:send | [BETA] Send invoice by ID and sendType. Optionally override email recipient.
*TripletexApi::InvoicedetailsApi* | [**get**](docs/InvoicedetailsApi.md#get) | **GET** /invoice/details/{id} | [BETA] Get ProjectInvoiceDetails by ID.
*TripletexApi::InvoicepaymentTypeApi* | [**get**](docs/InvoicepaymentTypeApi.md#get) | **GET** /invoice/paymentType/{id} | Get payment type by ID.
*TripletexApi::InvoicepaymentTypeApi* | [**search**](docs/InvoicepaymentTypeApi.md#search) | **GET** /invoice/paymentType | Find payment type corresponding with sent data.
*TripletexApi::LedgerApi* | [**open_post**](docs/LedgerApi.md#open_post) | **GET** /ledger/openPost | Find open posts corresponding with sent data.
*TripletexApi::LedgerApi* | [**search**](docs/LedgerApi.md#search) | **GET** /ledger | Get ledger (hovedbok).
*TripletexApi::LedgeraccountApi* | [**delete**](docs/LedgeraccountApi.md#delete) | **DELETE** /ledger/account/{id} | [BETA] Delete account.
*TripletexApi::LedgeraccountApi* | [**delete_by_ids**](docs/LedgeraccountApi.md#delete_by_ids) | **DELETE** /ledger/account/list | [BETA] Delete multiple accounts.
*TripletexApi::LedgeraccountApi* | [**get**](docs/LedgeraccountApi.md#get) | **GET** /ledger/account/{id} | Get account by ID.
*TripletexApi::LedgeraccountApi* | [**post**](docs/LedgeraccountApi.md#post) | **POST** /ledger/account | [BETA] Create a new account.
*TripletexApi::LedgeraccountApi* | [**post_list**](docs/LedgeraccountApi.md#post_list) | **POST** /ledger/account/list | [BETA] Create several accounts.
*TripletexApi::LedgeraccountApi* | [**put**](docs/LedgeraccountApi.md#put) | **PUT** /ledger/account/{id} | [BETA] Update account.
*TripletexApi::LedgeraccountApi* | [**put_list**](docs/LedgeraccountApi.md#put_list) | **PUT** /ledger/account/list | [BETA] Update multiple accounts.
*TripletexApi::LedgeraccountApi* | [**search**](docs/LedgeraccountApi.md#search) | **GET** /ledger/account | Find accounts corresponding with sent data.
*TripletexApi::LedgeraccountingPeriodApi* | [**get**](docs/LedgeraccountingPeriodApi.md#get) | **GET** /ledger/accountingPeriod/{id} | Get accounting period by ID.
*TripletexApi::LedgeraccountingPeriodApi* | [**search**](docs/LedgeraccountingPeriodApi.md#search) | **GET** /ledger/accountingPeriod | Find accounting periods corresponding with sent data.
*TripletexApi::LedgerannualAccountApi* | [**get**](docs/LedgerannualAccountApi.md#get) | **GET** /ledger/annualAccount/{id} | Get annual account by ID.
*TripletexApi::LedgerannualAccountApi* | [**search**](docs/LedgerannualAccountApi.md#search) | **GET** /ledger/annualAccount | Find annual accounts corresponding with sent data.
*TripletexApi::LedgercloseGroupApi* | [**get**](docs/LedgercloseGroupApi.md#get) | **GET** /ledger/closeGroup/{id} | Get close group by ID.
*TripletexApi::LedgercloseGroupApi* | [**search**](docs/LedgercloseGroupApi.md#search) | **GET** /ledger/closeGroup | Find close groups corresponding with sent data.
*TripletexApi::LedgerpaymentTypeOutApi* | [**delete**](docs/LedgerpaymentTypeOutApi.md#delete) | **DELETE** /ledger/paymentTypeOut/{id} | [BETA] Delete payment type for outgoing payments by ID.
*TripletexApi::LedgerpaymentTypeOutApi* | [**get**](docs/LedgerpaymentTypeOutApi.md#get) | **GET** /ledger/paymentTypeOut/{id} | [BETA] Get payment type for outgoing payments by ID.
*TripletexApi::LedgerpaymentTypeOutApi* | [**post**](docs/LedgerpaymentTypeOutApi.md#post) | **POST** /ledger/paymentTypeOut | [BETA] Create new payment type for outgoing payments
*TripletexApi::LedgerpaymentTypeOutApi* | [**post_list**](docs/LedgerpaymentTypeOutApi.md#post_list) | **POST** /ledger/paymentTypeOut/list | [BETA] Create multiple payment types for outgoing payments at once
*TripletexApi::LedgerpaymentTypeOutApi* | [**put**](docs/LedgerpaymentTypeOutApi.md#put) | **PUT** /ledger/paymentTypeOut/{id} | [BETA] Update existing payment type for outgoing payments
*TripletexApi::LedgerpaymentTypeOutApi* | [**put_list**](docs/LedgerpaymentTypeOutApi.md#put_list) | **PUT** /ledger/paymentTypeOut/list | [BETA] Update multiple payment types for outgoing payments at once
*TripletexApi::LedgerpaymentTypeOutApi* | [**search**](docs/LedgerpaymentTypeOutApi.md#search) | **GET** /ledger/paymentTypeOut | [BETA] Gets payment types for outgoing payments
*TripletexApi::LedgerpostingApi* | [**get**](docs/LedgerpostingApi.md#get) | **GET** /ledger/posting/{id} | Find postings by ID.
*TripletexApi::LedgerpostingApi* | [**open_post**](docs/LedgerpostingApi.md#open_post) | **GET** /ledger/posting/openPost | Find open posts corresponding with sent data.
*TripletexApi::LedgerpostingApi* | [**search**](docs/LedgerpostingApi.md#search) | **GET** /ledger/posting | Find postings corresponding with sent data.
*TripletexApi::LedgervatTypeApi* | [**get**](docs/LedgervatTypeApi.md#get) | **GET** /ledger/vatType/{id} | Get vat type by ID.
*TripletexApi::LedgervatTypeApi* | [**search**](docs/LedgervatTypeApi.md#search) | **GET** /ledger/vatType | Find vat types corresponding with sent data.
*TripletexApi::LedgervoucherApi* | [**delete**](docs/LedgervoucherApi.md#delete) | **DELETE** /ledger/voucher/{id} | [BETA] Delete voucher by ID.
*TripletexApi::LedgervoucherApi* | [**download_pdf**](docs/LedgervoucherApi.md#download_pdf) | **GET** /ledger/voucher/{voucherId}/pdf | Get attachment by voucher ID.
*TripletexApi::LedgervoucherApi* | [**get**](docs/LedgervoucherApi.md#get) | **GET** /ledger/voucher/{id} | Get voucher by ID.
*TripletexApi::LedgervoucherApi* | [**import_document**](docs/LedgervoucherApi.md#import_document) | **POST** /ledger/voucher/importDocument | [BETA] Upload a document to create one or more vouchers. Valid document formats are PDF, PNG, JPEG, TIFF and EHF. Send as multipart form.
*TripletexApi::LedgervoucherApi* | [**import_gbat10**](docs/LedgervoucherApi.md#import_gbat10) | **POST** /ledger/voucher/importGbat10 | Import GBAT10. Send as multipart form.
*TripletexApi::LedgervoucherApi* | [**non_posted**](docs/LedgervoucherApi.md#non_posted) | **GET** /ledger/voucher/&gt;nonPosted | [BETA] Find non-posted vouchers.
*TripletexApi::LedgervoucherApi* | [**post**](docs/LedgervoucherApi.md#post) | **POST** /ledger/voucher | Add new voucher. IMPORTANT: Also creates postings. Only the gross amounts will be used
*TripletexApi::LedgervoucherApi* | [**put**](docs/LedgervoucherApi.md#put) | **PUT** /ledger/voucher/{id} | [BETA] Update voucher. Postings with guiRow==0 will be deleted and regenerated.
*TripletexApi::LedgervoucherApi* | [**put_list**](docs/LedgervoucherApi.md#put_list) | **PUT** /ledger/voucher/list | [BETA] Update multiple vouchers. Postings with guiRow==0 will be deleted and regenerated.
*TripletexApi::LedgervoucherApi* | [**reverse**](docs/LedgervoucherApi.md#reverse) | **PUT** /ledger/voucher/{id}/:reverse | Reverses the voucher, and returns the reversed voucher. Supports reversing most voucher types, except salary transactions.
*TripletexApi::LedgervoucherApi* | [**search**](docs/LedgervoucherApi.md#search) | **GET** /ledger/voucher | Find vouchers corresponding with sent data.
*TripletexApi::LedgervoucherApi* | [**send_to_inbox**](docs/LedgervoucherApi.md#send_to_inbox) | **PUT** /ledger/voucher/{id}/:sendToInbox | [BETA] Send voucher to inbox.
*TripletexApi::LedgervoucherApi* | [**send_to_ledger**](docs/LedgervoucherApi.md#send_to_ledger) | **PUT** /ledger/voucher/{id}/:sendToLedger | [BETA] Send voucher to ledger.
*TripletexApi::LedgervoucherApi* | [**upload_pdf**](docs/LedgervoucherApi.md#upload_pdf) | **POST** /ledger/voucher/{voucherId}/pdf/{fileName} | Upload attachment to voucher. Send as multipart form.
*TripletexApi::LedgervoucherTypeApi* | [**get**](docs/LedgervoucherTypeApi.md#get) | **GET** /ledger/voucherType/{id} | Get voucher type by ID.
*TripletexApi::LedgervoucherTypeApi* | [**search**](docs/LedgervoucherTypeApi.md#search) | **GET** /ledger/voucherType | Find voucher types corresponding with sent data.
*TripletexApi::OrderApi* | [**get**](docs/OrderApi.md#get) | **GET** /order/{id} | Get order by ID.
*TripletexApi::OrderApi* | [**invoice**](docs/OrderApi.md#invoice) | **PUT** /order/{id}/:invoice | Create new invoice from order.
*TripletexApi::OrderApi* | [**post**](docs/OrderApi.md#post) | **POST** /order | Create order.
*TripletexApi::OrderApi* | [**put**](docs/OrderApi.md#put) | **PUT** /order/{id} | Update order.
*TripletexApi::OrderApi* | [**search**](docs/OrderApi.md#search) | **GET** /order | Find orders corresponding with sent data.
*TripletexApi::OrderorderlineApi* | [**delete**](docs/OrderorderlineApi.md#delete) | **DELETE** /order/orderline/{id} | [BETA] Delete order line by ID.
*TripletexApi::OrderorderlineApi* | [**get**](docs/OrderorderlineApi.md#get) | **GET** /order/orderline/{id} | Get order line by ID.
*TripletexApi::OrderorderlineApi* | [**post**](docs/OrderorderlineApi.md#post) | **POST** /order/orderline | Create order line. When creating several order lines, use /list for better performance.
*TripletexApi::OrderorderlineApi* | [**post_list**](docs/OrderorderlineApi.md#post_list) | **POST** /order/orderline/list | Create multiple order lines.
*TripletexApi::ProductApi* | [**get**](docs/ProductApi.md#get) | **GET** /product/{id} | Get product by ID.
*TripletexApi::ProductApi* | [**post**](docs/ProductApi.md#post) | **POST** /product | Create new product.
*TripletexApi::ProductApi* | [**put**](docs/ProductApi.md#put) | **PUT** /product/{id} | Update product.
*TripletexApi::ProductApi* | [**search**](docs/ProductApi.md#search) | **GET** /product | Find products corresponding with sent data.
*TripletexApi::ProductunitApi* | [**get**](docs/ProductunitApi.md#get) | **GET** /product/unit/{id} | Get product unit by ID.
*TripletexApi::ProductunitApi* | [**search**](docs/ProductunitApi.md#search) | **GET** /product/unit | Find product units corresponding with sent data.
*TripletexApi::ProjectApi* | [**delete**](docs/ProjectApi.md#delete) | **DELETE** /project/{id} | [BETA] Delete project.
*TripletexApi::ProjectApi* | [**delete_by_ids**](docs/ProjectApi.md#delete_by_ids) | **DELETE** /project/list | [BETA] Delete projects.
*TripletexApi::ProjectApi* | [**delete_list**](docs/ProjectApi.md#delete_list) | **DELETE** /project | [BETA] Delete multiple projects.
*TripletexApi::ProjectApi* | [**get**](docs/ProjectApi.md#get) | **GET** /project/{id} | Find project by ID.
*TripletexApi::ProjectApi* | [**get_for_time_sheet**](docs/ProjectApi.md#get_for_time_sheet) | **GET** /project/&gt;forTimeSheet | Find projects applicable for time sheet registration on a specific day.
*TripletexApi::ProjectApi* | [**post**](docs/ProjectApi.md#post) | **POST** /project | [BETA] Add new project.
*TripletexApi::ProjectApi* | [**post_list**](docs/ProjectApi.md#post_list) | **POST** /project/list | [BETA] Register new projects. Multiple projects for different users can be sent in the same request.
*TripletexApi::ProjectApi* | [**put**](docs/ProjectApi.md#put) | **PUT** /project/{id} | [BETA] Update project.
*TripletexApi::ProjectApi* | [**put_list**](docs/ProjectApi.md#put_list) | **PUT** /project/list | [BETA] Update multiple projects.
*TripletexApi::ProjectApi* | [**search**](docs/ProjectApi.md#search) | **GET** /project | Find projects corresponding with sent data.
*TripletexApi::ProjectcategoryApi* | [**get**](docs/ProjectcategoryApi.md#get) | **GET** /project/category/{id} | Find project category by ID.
*TripletexApi::ProjectcategoryApi* | [**post**](docs/ProjectcategoryApi.md#post) | **POST** /project/category | Add new project category.
*TripletexApi::ProjectcategoryApi* | [**put**](docs/ProjectcategoryApi.md#put) | **PUT** /project/category/{id} | Update project category.
*TripletexApi::ProjectcategoryApi* | [**search**](docs/ProjectcategoryApi.md#search) | **GET** /project/category | Find project categories corresponding with sent data.
*TripletexApi::ProjectorderlineApi* | [**delete**](docs/ProjectorderlineApi.md#delete) | **DELETE** /project/orderline/{id} | [BETA] Delete order line by ID.
*TripletexApi::ProjectorderlineApi* | [**get**](docs/ProjectorderlineApi.md#get) | **GET** /project/orderline/{id} | [BETA] Get order line by ID.
*TripletexApi::ProjectorderlineApi* | [**post**](docs/ProjectorderlineApi.md#post) | **POST** /project/orderline | [BETA] Create order line. When creating several order lines, use /list for better performance.
*TripletexApi::ProjectorderlineApi* | [**post_list**](docs/ProjectorderlineApi.md#post_list) | **POST** /project/orderline/list | [BETA] Create multiple order lines.
*TripletexApi::ProjectorderlineApi* | [**put**](docs/ProjectorderlineApi.md#put) | **PUT** /project/orderline/{id} | [BETA] Update project orderline.
*TripletexApi::ProjectparticipantApi* | [**delete_by_ids**](docs/ProjectparticipantApi.md#delete_by_ids) | **DELETE** /project/participant/list | [BETA] Delete project participants.
*TripletexApi::ProjectparticipantApi* | [**get**](docs/ProjectparticipantApi.md#get) | **GET** /project/participant/{id} | [BETA] Find project participant by ID.
*TripletexApi::ProjectparticipantApi* | [**post**](docs/ProjectparticipantApi.md#post) | **POST** /project/participant | [BETA] Add new project participant.
*TripletexApi::ProjectparticipantApi* | [**post_list**](docs/ProjectparticipantApi.md#post_list) | **POST** /project/participant/list | [BETA] Register new projects. Multiple projects for different users can be sent in the same request.
*TripletexApi::ProjectparticipantApi* | [**put**](docs/ProjectparticipantApi.md#put) | **PUT** /project/participant/{id} | [BETA] Update project participant.
*TripletexApi::ReminderApi* | [**get**](docs/ReminderApi.md#get) | **GET** /reminder/{id} | Get reminder by ID.
*TripletexApi::ReminderApi* | [**search**](docs/ReminderApi.md#search) | **GET** /reminder | Find reminders corresponding with sent data.
*TripletexApi::SalarypayslipApi* | [**download_pdf**](docs/SalarypayslipApi.md#download_pdf) | **GET** /salary/payslip/{id}/pdf | [BETA] Find payslip (PDF document) by ID.
*TripletexApi::SalarypayslipApi* | [**get**](docs/SalarypayslipApi.md#get) | **GET** /salary/payslip/{id} | [BETA] Find payslip by ID.
*TripletexApi::SalarypayslipApi* | [**search**](docs/SalarypayslipApi.md#search) | **GET** /salary/payslip | [BETA] Find payslips corresponding with sent data.
*TripletexApi::SalarytransactionApi* | [**delete**](docs/SalarytransactionApi.md#delete) | **DELETE** /salary/transaction/{id} | [BETA] Delete salary transaction by ID.
*TripletexApi::SalarytransactionApi* | [**get**](docs/SalarytransactionApi.md#get) | **GET** /salary/transaction/{id} | [BETA] Find salary transaction by ID.
*TripletexApi::SalarytransactionApi* | [**post**](docs/SalarytransactionApi.md#post) | **POST** /salary/transaction | [BETA] Create a new salary transaction.
*TripletexApi::SalarytypeApi* | [**get**](docs/SalarytypeApi.md#get) | **GET** /salary/type/{id} | [BETA] Find salary type by ID.
*TripletexApi::SalarytypeApi* | [**search**](docs/SalarytypeApi.md#search) | **GET** /salary/type | [BETA] Find salary type corresponding with sent data.
*TripletexApi::SupplierApi* | [**get**](docs/SupplierApi.md#get) | **GET** /supplier/{id} | Get supplier by ID.
*TripletexApi::SupplierApi* | [**post**](docs/SupplierApi.md#post) | **POST** /supplier | Create supplier. Related supplier addresses may also be created.
*TripletexApi::SupplierApi* | [**post_list**](docs/SupplierApi.md#post_list) | **POST** /supplier/list | [BETA] Create multiple suppliers. Related supplier addresses may also be created.
*TripletexApi::SupplierApi* | [**put**](docs/SupplierApi.md#put) | **PUT** /supplier/{id} | Update supplier. 
*TripletexApi::SupplierApi* | [**put_list**](docs/SupplierApi.md#put_list) | **PUT** /supplier/list | [BETA] Update multiple suppliers. Addresses can also be updated.
*TripletexApi::SupplierApi* | [**search**](docs/SupplierApi.md#search) | **GET** /supplier | Find suppliers corresponding with sent data.
*TripletexApi::TimesheetentryApi* | [**delete**](docs/TimesheetentryApi.md#delete) | **DELETE** /timesheet/entry/{id} | Delete timesheet entry by ID.
*TripletexApi::TimesheetentryApi* | [**get**](docs/TimesheetentryApi.md#get) | **GET** /timesheet/entry/{id} | Find timesheet entry by ID.
*TripletexApi::TimesheetentryApi* | [**get_recent_activities**](docs/TimesheetentryApi.md#get_recent_activities) | **GET** /timesheet/entry/&gt;recentActivities | Find recently used timesheet activities.
*TripletexApi::TimesheetentryApi* | [**get_recent_projects**](docs/TimesheetentryApi.md#get_recent_projects) | **GET** /timesheet/entry/&gt;recentProjects | Find projects with recent activities (timesheet entry registered).
*TripletexApi::TimesheetentryApi* | [**get_total_hours**](docs/TimesheetentryApi.md#get_total_hours) | **GET** /timesheet/entry/&gt;totalHours | Find total hours registered on an employee in a specific period.
*TripletexApi::TimesheetentryApi* | [**post**](docs/TimesheetentryApi.md#post) | **POST** /timesheet/entry | Add new timesheet entry. Only one entry per employee/date/activity/project combination is supported.
*TripletexApi::TimesheetentryApi* | [**post_list**](docs/TimesheetentryApi.md#post_list) | **POST** /timesheet/entry/list | Add new timesheet entry. Multiple objects for several users can be sent in the same request.
*TripletexApi::TimesheetentryApi* | [**put**](docs/TimesheetentryApi.md#put) | **PUT** /timesheet/entry/{id} | Update timesheet entry by ID. Note: Timesheet entry object fields which are present but not set, or set to 0, will be nulled.
*TripletexApi::TimesheetentryApi* | [**put_list**](docs/TimesheetentryApi.md#put_list) | **PUT** /timesheet/entry/list | Update timesheet entry. Multiple objects for different users can be sent in the same request.
*TripletexApi::TimesheetentryApi* | [**search**](docs/TimesheetentryApi.md#search) | **GET** /timesheet/entry | Find timesheet entry corresponding with sent data.
*TripletexApi::TimesheettimeClockApi* | [**get**](docs/TimesheettimeClockApi.md#get) | **GET** /timesheet/timeClock/{id} | Find time clock entry by ID.
*TripletexApi::TimesheettimeClockApi* | [**get_present**](docs/TimesheettimeClockApi.md#get_present) | **GET** /timesheet/timeClock/present | Find a user’s present running time clock.
*TripletexApi::TimesheettimeClockApi* | [**put**](docs/TimesheettimeClockApi.md#put) | **PUT** /timesheet/timeClock/{id} | Update time clock by ID.
*TripletexApi::TimesheettimeClockApi* | [**search**](docs/TimesheettimeClockApi.md#search) | **GET** /timesheet/timeClock | Find time clock entries corresponding with sent data.
*TripletexApi::TimesheettimeClockApi* | [**start**](docs/TimesheettimeClockApi.md#start) | **PUT** /timesheet/timeClock/:start | Start time clock.
*TripletexApi::TimesheettimeClockApi* | [**stop**](docs/TimesheettimeClockApi.md#stop) | **PUT** /timesheet/timeClock/{id}/:stop | Stop time clock.
*TripletexApi::TokenconsumerApi* | [**get_by_token**](docs/TokenconsumerApi.md#get_by_token) | **GET** /token/consumer/byToken | Get consumer token by token string.
*TripletexApi::TokenemployeeApi* | [**create**](docs/TokenemployeeApi.md#create) | **PUT** /token/employee/:create | Create an employee token. Only selected consumers are allowed
*TripletexApi::TokensessionApi* | [**create**](docs/TokensessionApi.md#create) | **PUT** /token/session/:create | Create session token.
*TripletexApi::TokensessionApi* | [**delete**](docs/TokensessionApi.md#delete) | **DELETE** /token/session/{token} | Delete session token.
*TripletexApi::TokensessionApi* | [**who_am_i**](docs/TokensessionApi.md#who_am_i) | **GET** /token/session/&gt;whoAmI | Find information about the current user.
*TripletexApi::TravelExpenseApi* | [**approve**](docs/TravelExpenseApi.md#approve) | **PUT** /travelExpense/:approve | [BETA] Approve travel expenses.
*TripletexApi::TravelExpenseApi* | [**copy**](docs/TravelExpenseApi.md#copy) | **PUT** /travelExpense/:copy | [BETA] Copy travel expense.
*TripletexApi::TravelExpenseApi* | [**create_vouchers**](docs/TravelExpenseApi.md#create_vouchers) | **PUT** /travelExpense/:createVouchers | [BETA] Create vouchers
*TripletexApi::TravelExpenseApi* | [**delete**](docs/TravelExpenseApi.md#delete) | **DELETE** /travelExpense/{id} | [BETA] Delete travel expense.
*TripletexApi::TravelExpenseApi* | [**deliver**](docs/TravelExpenseApi.md#deliver) | **PUT** /travelExpense/:deliver | [BETA] Deliver travel expenses.
*TripletexApi::TravelExpenseApi* | [**get**](docs/TravelExpenseApi.md#get) | **GET** /travelExpense/{id} | [BETA] Get travel expense by ID.
*TripletexApi::TravelExpenseApi* | [**post**](docs/TravelExpenseApi.md#post) | **POST** /travelExpense | [BETA] Create travel expense.
*TripletexApi::TravelExpenseApi* | [**put**](docs/TravelExpenseApi.md#put) | **PUT** /travelExpense/{id} | [BETA] Update travel expense.
*TripletexApi::TravelExpenseApi* | [**search**](docs/TravelExpenseApi.md#search) | **GET** /travelExpense | [BETA] Find travel expenses corresponding with sent data.
*TripletexApi::TravelExpenseApi* | [**unapprove**](docs/TravelExpenseApi.md#unapprove) | **PUT** /travelExpense/:unapprove | [BETA] Unapprove travel expenses.
*TripletexApi::TravelExpenseApi* | [**undeliver**](docs/TravelExpenseApi.md#undeliver) | **PUT** /travelExpense/:undeliver | [BETA] Undeliver travel expenses.
*TripletexApi::TravelExpenseaccommodationAllowanceApi* | [**delete**](docs/TravelExpenseaccommodationAllowanceApi.md#delete) | **DELETE** /travelExpense/accommodationAllowance/{id} | [BETA] Delete accommodation allowance.
*TripletexApi::TravelExpenseaccommodationAllowanceApi* | [**get**](docs/TravelExpenseaccommodationAllowanceApi.md#get) | **GET** /travelExpense/accommodationAllowance/{id} | [BETA] Get travel accommodation allowance by ID.
*TripletexApi::TravelExpenseaccommodationAllowanceApi* | [**post**](docs/TravelExpenseaccommodationAllowanceApi.md#post) | **POST** /travelExpense/accommodationAllowance | [BETA] Create accommodation allowance.
*TripletexApi::TravelExpenseaccommodationAllowanceApi* | [**put**](docs/TravelExpenseaccommodationAllowanceApi.md#put) | **PUT** /travelExpense/accommodationAllowance/{id} | [BETA] Update accommodation allowance.
*TripletexApi::TravelExpenseaccommodationAllowanceApi* | [**search**](docs/TravelExpenseaccommodationAllowanceApi.md#search) | **GET** /travelExpense/accommodationAllowance | [BETA] Find accommodation allowances corresponding with sent data.
*TripletexApi::TravelExpensecostApi* | [**delete**](docs/TravelExpensecostApi.md#delete) | **DELETE** /travelExpense/cost/{id} | [BETA] Delete cost.
*TripletexApi::TravelExpensecostApi* | [**get**](docs/TravelExpensecostApi.md#get) | **GET** /travelExpense/cost/{id} | [BETA] Get cost by ID.
*TripletexApi::TravelExpensecostApi* | [**post**](docs/TravelExpensecostApi.md#post) | **POST** /travelExpense/cost | [BETA] Create cost.
*TripletexApi::TravelExpensecostApi* | [**put**](docs/TravelExpensecostApi.md#put) | **PUT** /travelExpense/cost/{id} | [BETA] Update cost.
*TripletexApi::TravelExpensecostApi* | [**search**](docs/TravelExpensecostApi.md#search) | **GET** /travelExpense/cost | [BETA] Find costs corresponding with sent data.
*TripletexApi::TravelExpensecostCategoryApi* | [**get**](docs/TravelExpensecostCategoryApi.md#get) | **GET** /travelExpense/costCategory/{id} | [BETA] Get cost category by ID.
*TripletexApi::TravelExpensecostCategoryApi* | [**search**](docs/TravelExpensecostCategoryApi.md#search) | **GET** /travelExpense/costCategory | [BETA] Find cost category corresponding with sent data.
*TripletexApi::TravelExpensemileageAllowanceApi* | [**delete**](docs/TravelExpensemileageAllowanceApi.md#delete) | **DELETE** /travelExpense/mileageAllowance/{id} | [BETA] Delete mileage allowance.
*TripletexApi::TravelExpensemileageAllowanceApi* | [**get**](docs/TravelExpensemileageAllowanceApi.md#get) | **GET** /travelExpense/mileageAllowance/{id} | [BETA] Get mileage allowance by ID.
*TripletexApi::TravelExpensemileageAllowanceApi* | [**post**](docs/TravelExpensemileageAllowanceApi.md#post) | **POST** /travelExpense/mileageAllowance | [BETA] Create mileage allowance.
*TripletexApi::TravelExpensemileageAllowanceApi* | [**put**](docs/TravelExpensemileageAllowanceApi.md#put) | **PUT** /travelExpense/mileageAllowance/{id} | [BETA] Update mileage allowance.
*TripletexApi::TravelExpensemileageAllowanceApi* | [**search**](docs/TravelExpensemileageAllowanceApi.md#search) | **GET** /travelExpense/mileageAllowance | [BETA] Find mileage allowances corresponding with sent data.
*TripletexApi::TravelExpensepassengerApi* | [**delete**](docs/TravelExpensepassengerApi.md#delete) | **DELETE** /travelExpense/passenger/{id} | [BETA] Delete passenger.
*TripletexApi::TravelExpensepassengerApi* | [**get**](docs/TravelExpensepassengerApi.md#get) | **GET** /travelExpense/passenger/{id} | [BETA] Get passenger by ID.
*TripletexApi::TravelExpensepassengerApi* | [**post**](docs/TravelExpensepassengerApi.md#post) | **POST** /travelExpense/passenger | [BETA] Create passenger.
*TripletexApi::TravelExpensepassengerApi* | [**put**](docs/TravelExpensepassengerApi.md#put) | **PUT** /travelExpense/passenger/{id} | [BETA] Update passenger.
*TripletexApi::TravelExpensepassengerApi* | [**search**](docs/TravelExpensepassengerApi.md#search) | **GET** /travelExpense/passenger | [BETA] Find passengers corresponding with sent data.
*TripletexApi::TravelExpensepaymentTypeApi* | [**get**](docs/TravelExpensepaymentTypeApi.md#get) | **GET** /travelExpense/paymentType/{id} | [BETA] Get payment type by ID.
*TripletexApi::TravelExpensepaymentTypeApi* | [**search**](docs/TravelExpensepaymentTypeApi.md#search) | **GET** /travelExpense/paymentType | [BETA] Find payment type corresponding with sent data.
*TripletexApi::TravelExpenseperDiemCompensationApi* | [**delete**](docs/TravelExpenseperDiemCompensationApi.md#delete) | **DELETE** /travelExpense/perDiemCompensation/{id} | [BETA] Delete per diem compensation.
*TripletexApi::TravelExpenseperDiemCompensationApi* | [**get**](docs/TravelExpenseperDiemCompensationApi.md#get) | **GET** /travelExpense/perDiemCompensation/{id} | [BETA] Get per diem compensation by ID.
*TripletexApi::TravelExpenseperDiemCompensationApi* | [**post**](docs/TravelExpenseperDiemCompensationApi.md#post) | **POST** /travelExpense/perDiemCompensation | [BETA] Create per diem compensation.
*TripletexApi::TravelExpenseperDiemCompensationApi* | [**put**](docs/TravelExpenseperDiemCompensationApi.md#put) | **PUT** /travelExpense/perDiemCompensation/{id} | [BETA] Update per diem compensation.
*TripletexApi::TravelExpenseperDiemCompensationApi* | [**search**](docs/TravelExpenseperDiemCompensationApi.md#search) | **GET** /travelExpense/perDiemCompensation | [BETA] Find per diem compensations corresponding with sent data.
*TripletexApi::TravelExpenserateApi* | [**get**](docs/TravelExpenserateApi.md#get) | **GET** /travelExpense/rate/{id} | [BETA] Get travel expense rate by ID.
*TripletexApi::TravelExpenserateApi* | [**search**](docs/TravelExpenserateApi.md#search) | **GET** /travelExpense/rate | [BETA] Find rates corresponding with sent data.
*TripletexApi::TravelExpenserateCategoryApi* | [**get**](docs/TravelExpenserateCategoryApi.md#get) | **GET** /travelExpense/rateCategory/{id} | [BETA] Get travel expense rate category by ID.
*TripletexApi::TravelExpenserateCategoryApi* | [**search**](docs/TravelExpenserateCategoryApi.md#search) | **GET** /travelExpense/rateCategory | [BETA] Find rate categories corresponding with sent data.
*TripletexApi::TravelExpenserateCategoryGroupApi* | [**get**](docs/TravelExpenserateCategoryGroupApi.md#get) | **GET** /travelExpense/rateCategoryGroup/{id} | [BETA] Get travel report rate category group by ID.
*TripletexApi::TravelExpenserateCategoryGroupApi* | [**search**](docs/TravelExpenserateCategoryGroupApi.md#search) | **GET** /travelExpense/rateCategoryGroup | [BETA] Find rate categoriy groups corresponding with sent data.


## Documentation for Models

 - [TripletexApi::AbstractDTO](docs/AbstractDTO.md)
 - [TripletexApi::AccommodationAllowance](docs/AccommodationAllowance.md)
 - [TripletexApi::Account](docs/Account.md)
 - [TripletexApi::AccountingPeriod](docs/AccountingPeriod.md)
 - [TripletexApi::Activity](docs/Activity.md)
 - [TripletexApi::Address](docs/Address.md)
 - [TripletexApi::AnnualAccount](docs/AnnualAccount.md)
 - [TripletexApi::ApiConsumer](docs/ApiConsumer.md)
 - [TripletexApi::ApiError](docs/ApiError.md)
 - [TripletexApi::ApiValidationMessage](docs/ApiValidationMessage.md)
 - [TripletexApi::AppSpecific](docs/AppSpecific.md)
 - [TripletexApi::Bank](docs/Bank.md)
 - [TripletexApi::BankReconciliation](docs/BankReconciliation.md)
 - [TripletexApi::BankReconciliationMatch](docs/BankReconciliationMatch.md)
 - [TripletexApi::BankReconciliationPaymentType](docs/BankReconciliationPaymentType.md)
 - [TripletexApi::BankStatement](docs/BankStatement.md)
 - [TripletexApi::BankTransaction](docs/BankTransaction.md)
 - [TripletexApi::Banner](docs/Banner.md)
 - [TripletexApi::CSVRecord](docs/CSVRecord.md)
 - [TripletexApi::Change](docs/Change.md)
 - [TripletexApi::CloseGroup](docs/CloseGroup.md)
 - [TripletexApi::Company](docs/Company.md)
 - [TripletexApi::CompanyAutoCompleteDTO](docs/CompanyAutoCompleteDTO.md)
 - [TripletexApi::ConsumerToken](docs/ConsumerToken.md)
 - [TripletexApi::Contact](docs/Contact.md)
 - [TripletexApi::Cost](docs/Cost.md)
 - [TripletexApi::Country](docs/Country.md)
 - [TripletexApi::Currency](docs/Currency.md)
 - [TripletexApi::Customer](docs/Customer.md)
 - [TripletexApi::CustomerCategory](docs/CustomerCategory.md)
 - [TripletexApi::CustomerTripletexAccount](docs/CustomerTripletexAccount.md)
 - [TripletexApi::Department](docs/Department.md)
 - [TripletexApi::Document](docs/Document.md)
 - [TripletexApi::Employee](docs/Employee.md)
 - [TripletexApi::EmployeeToken](docs/EmployeeToken.md)
 - [TripletexApi::Employment](docs/Employment.md)
 - [TripletexApi::EmploymentDetails](docs/EmploymentDetails.md)
 - [TripletexApi::EmploymentType](docs/EmploymentType.md)
 - [TripletexApi::Entitlement](docs/Entitlement.md)
 - [TripletexApi::EventInfoDescription](docs/EventInfoDescription.md)
 - [TripletexApi::ImportConfigDTO](docs/ImportConfigDTO.md)
 - [TripletexApi::ImportReportDTO](docs/ImportReportDTO.md)
 - [TripletexApi::Inventory](docs/Inventory.md)
 - [TripletexApi::Invoice](docs/Invoice.md)
 - [TripletexApi::Job](docs/Job.md)
 - [TripletexApi::JobDetailDTO](docs/JobDetailDTO.md)
 - [TripletexApi::LeaveOfAbsence](docs/LeaveOfAbsence.md)
 - [TripletexApi::LeaveOfAbsenceType](docs/LeaveOfAbsenceType.md)
 - [TripletexApi::LedgerAccount](docs/LedgerAccount.md)
 - [TripletexApi::Link](docs/Link.md)
 - [TripletexApi::ListResponseAccommodationAllowance](docs/ListResponseAccommodationAllowance.md)
 - [TripletexApi::ListResponseAccount](docs/ListResponseAccount.md)
 - [TripletexApi::ListResponseAccountingPeriod](docs/ListResponseAccountingPeriod.md)
 - [TripletexApi::ListResponseActivity](docs/ListResponseActivity.md)
 - [TripletexApi::ListResponseAddress](docs/ListResponseAddress.md)
 - [TripletexApi::ListResponseAnnualAccount](docs/ListResponseAnnualAccount.md)
 - [TripletexApi::ListResponseBank](docs/ListResponseBank.md)
 - [TripletexApi::ListResponseBankReconciliation](docs/ListResponseBankReconciliation.md)
 - [TripletexApi::ListResponseBankReconciliationMatch](docs/ListResponseBankReconciliationMatch.md)
 - [TripletexApi::ListResponseBankReconciliationPaymentType](docs/ListResponseBankReconciliationPaymentType.md)
 - [TripletexApi::ListResponseBankStatement](docs/ListResponseBankStatement.md)
 - [TripletexApi::ListResponseBankTransaction](docs/ListResponseBankTransaction.md)
 - [TripletexApi::ListResponseBanner](docs/ListResponseBanner.md)
 - [TripletexApi::ListResponseCloseGroup](docs/ListResponseCloseGroup.md)
 - [TripletexApi::ListResponseCompany](docs/ListResponseCompany.md)
 - [TripletexApi::ListResponseCompanyAutoCompleteDTO](docs/ListResponseCompanyAutoCompleteDTO.md)
 - [TripletexApi::ListResponseContact](docs/ListResponseContact.md)
 - [TripletexApi::ListResponseCost](docs/ListResponseCost.md)
 - [TripletexApi::ListResponseCountry](docs/ListResponseCountry.md)
 - [TripletexApi::ListResponseCurrency](docs/ListResponseCurrency.md)
 - [TripletexApi::ListResponseCustomer](docs/ListResponseCustomer.md)
 - [TripletexApi::ListResponseCustomerCategory](docs/ListResponseCustomerCategory.md)
 - [TripletexApi::ListResponseDepartment](docs/ListResponseDepartment.md)
 - [TripletexApi::ListResponseEmployee](docs/ListResponseEmployee.md)
 - [TripletexApi::ListResponseEmployment](docs/ListResponseEmployment.md)
 - [TripletexApi::ListResponseEmploymentDetails](docs/ListResponseEmploymentDetails.md)
 - [TripletexApi::ListResponseEmploymentType](docs/ListResponseEmploymentType.md)
 - [TripletexApi::ListResponseEntitlement](docs/ListResponseEntitlement.md)
 - [TripletexApi::ListResponseInventory](docs/ListResponseInventory.md)
 - [TripletexApi::ListResponseInvoice](docs/ListResponseInvoice.md)
 - [TripletexApi::ListResponseLeaveOfAbsenceType](docs/ListResponseLeaveOfAbsenceType.md)
 - [TripletexApi::ListResponseLedgerAccount](docs/ListResponseLedgerAccount.md)
 - [TripletexApi::ListResponseMileageAllowance](docs/ListResponseMileageAllowance.md)
 - [TripletexApi::ListResponseNotification](docs/ListResponseNotification.md)
 - [TripletexApi::ListResponseOccupationCode](docs/ListResponseOccupationCode.md)
 - [TripletexApi::ListResponseOrder](docs/ListResponseOrder.md)
 - [TripletexApi::ListResponseOrderLine](docs/ListResponseOrderLine.md)
 - [TripletexApi::ListResponseOrderOffer](docs/ListResponseOrderOffer.md)
 - [TripletexApi::ListResponsePassenger](docs/ListResponsePassenger.md)
 - [TripletexApi::ListResponsePaymentType](docs/ListResponsePaymentType.md)
 - [TripletexApi::ListResponsePaymentTypeOut](docs/ListResponsePaymentTypeOut.md)
 - [TripletexApi::ListResponsePayslip](docs/ListResponsePayslip.md)
 - [TripletexApi::ListResponsePerDiemCompensation](docs/ListResponsePerDiemCompensation.md)
 - [TripletexApi::ListResponsePersonAutoCompleteDTO](docs/ListResponsePersonAutoCompleteDTO.md)
 - [TripletexApi::ListResponsePosting](docs/ListResponsePosting.md)
 - [TripletexApi::ListResponseProduct](docs/ListResponseProduct.md)
 - [TripletexApi::ListResponseProductUnit](docs/ListResponseProductUnit.md)
 - [TripletexApi::ListResponseProject](docs/ListResponseProject.md)
 - [TripletexApi::ListResponseProjectCategory](docs/ListResponseProjectCategory.md)
 - [TripletexApi::ListResponseProjectOrderLine](docs/ListResponseProjectOrderLine.md)
 - [TripletexApi::ListResponseProjectParticipant](docs/ListResponseProjectParticipant.md)
 - [TripletexApi::ListResponseProspect](docs/ListResponseProspect.md)
 - [TripletexApi::ListResponseReminder](docs/ListResponseReminder.md)
 - [TripletexApi::ListResponseRemunerationType](docs/ListResponseRemunerationType.md)
 - [TripletexApi::ListResponseSalarySpecification](docs/ListResponseSalarySpecification.md)
 - [TripletexApi::ListResponseSalaryTransaction](docs/ListResponseSalaryTransaction.md)
 - [TripletexApi::ListResponseSalaryType](docs/ListResponseSalaryType.md)
 - [TripletexApi::ListResponseSearchCompletionDTO](docs/ListResponseSearchCompletionDTO.md)
 - [TripletexApi::ListResponseStandardTime](docs/ListResponseStandardTime.md)
 - [TripletexApi::ListResponseSubscription](docs/ListResponseSubscription.md)
 - [TripletexApi::ListResponseSupplier](docs/ListResponseSupplier.md)
 - [TripletexApi::ListResponseSupplierBalance](docs/ListResponseSupplierBalance.md)
 - [TripletexApi::ListResponseTimeClock](docs/ListResponseTimeClock.md)
 - [TripletexApi::ListResponseTimesheetEntry](docs/ListResponseTimesheetEntry.md)
 - [TripletexApi::ListResponseTravelCostCategory](docs/ListResponseTravelCostCategory.md)
 - [TripletexApi::ListResponseTravelExpense](docs/ListResponseTravelExpense.md)
 - [TripletexApi::ListResponseTravelExpenseRate](docs/ListResponseTravelExpenseRate.md)
 - [TripletexApi::ListResponseTravelExpenseRateCategory](docs/ListResponseTravelExpenseRateCategory.md)
 - [TripletexApi::ListResponseTravelExpenseRateCategoryGroup](docs/ListResponseTravelExpenseRateCategoryGroup.md)
 - [TripletexApi::ListResponseTravelPaymentType](docs/ListResponseTravelPaymentType.md)
 - [TripletexApi::ListResponseVatType](docs/ListResponseVatType.md)
 - [TripletexApi::ListResponseVoucher](docs/ListResponseVoucher.md)
 - [TripletexApi::ListResponseVoucherType](docs/ListResponseVoucherType.md)
 - [TripletexApi::ListResponseWeeklyStatus](docs/ListResponseWeeklyStatus.md)
 - [TripletexApi::ListResponseWorkingHoursScheme](docs/ListResponseWorkingHoursScheme.md)
 - [TripletexApi::LoggedInUserInfoDTO](docs/LoggedInUserInfoDTO.md)
 - [TripletexApi::MaventaEventDataDTO](docs/MaventaEventDataDTO.md)
 - [TripletexApi::MaventaStatusDTO](docs/MaventaStatusDTO.md)
 - [TripletexApi::MileageAllowance](docs/MileageAllowance.md)
 - [TripletexApi::MobileAppLogin](docs/MobileAppLogin.md)
 - [TripletexApi::Modules](docs/Modules.md)
 - [TripletexApi::MonthlyStatus](docs/MonthlyStatus.md)
 - [TripletexApi::Notification](docs/Notification.md)
 - [TripletexApi::OccupationCode](docs/OccupationCode.md)
 - [TripletexApi::Order](docs/Order.md)
 - [TripletexApi::OrderLine](docs/OrderLine.md)
 - [TripletexApi::OrderOffer](docs/OrderOffer.md)
 - [TripletexApi::Passenger](docs/Passenger.md)
 - [TripletexApi::PaymentType](docs/PaymentType.md)
 - [TripletexApi::PaymentTypeOut](docs/PaymentTypeOut.md)
 - [TripletexApi::Payslip](docs/Payslip.md)
 - [TripletexApi::PerDiemCompensation](docs/PerDiemCompensation.md)
 - [TripletexApi::PersonAutoCompleteDTO](docs/PersonAutoCompleteDTO.md)
 - [TripletexApi::Posting](docs/Posting.md)
 - [TripletexApi::Product](docs/Product.md)
 - [TripletexApi::ProductUnit](docs/ProductUnit.md)
 - [TripletexApi::Project](docs/Project.md)
 - [TripletexApi::ProjectCategory](docs/ProjectCategory.md)
 - [TripletexApi::ProjectInvoiceDetails](docs/ProjectInvoiceDetails.md)
 - [TripletexApi::ProjectOrderLine](docs/ProjectOrderLine.md)
 - [TripletexApi::ProjectParticipant](docs/ProjectParticipant.md)
 - [TripletexApi::Prospect](docs/Prospect.md)
 - [TripletexApi::Reminder](docs/Reminder.md)
 - [TripletexApi::RemunerationType](docs/RemunerationType.md)
 - [TripletexApi::ResponseWrapperAccommodationAllowance](docs/ResponseWrapperAccommodationAllowance.md)
 - [TripletexApi::ResponseWrapperAccount](docs/ResponseWrapperAccount.md)
 - [TripletexApi::ResponseWrapperAccountingPeriod](docs/ResponseWrapperAccountingPeriod.md)
 - [TripletexApi::ResponseWrapperActivity](docs/ResponseWrapperActivity.md)
 - [TripletexApi::ResponseWrapperAddress](docs/ResponseWrapperAddress.md)
 - [TripletexApi::ResponseWrapperAnnualAccount](docs/ResponseWrapperAnnualAccount.md)
 - [TripletexApi::ResponseWrapperApiConsumer](docs/ResponseWrapperApiConsumer.md)
 - [TripletexApi::ResponseWrapperAppSpecific](docs/ResponseWrapperAppSpecific.md)
 - [TripletexApi::ResponseWrapperBankReconciliation](docs/ResponseWrapperBankReconciliation.md)
 - [TripletexApi::ResponseWrapperBankReconciliationMatch](docs/ResponseWrapperBankReconciliationMatch.md)
 - [TripletexApi::ResponseWrapperBankReconciliationPaymentType](docs/ResponseWrapperBankReconciliationPaymentType.md)
 - [TripletexApi::ResponseWrapperBankStatement](docs/ResponseWrapperBankStatement.md)
 - [TripletexApi::ResponseWrapperBankTransaction](docs/ResponseWrapperBankTransaction.md)
 - [TripletexApi::ResponseWrapperBanner](docs/ResponseWrapperBanner.md)
 - [TripletexApi::ResponseWrapperBoolean](docs/ResponseWrapperBoolean.md)
 - [TripletexApi::ResponseWrapperCloseGroup](docs/ResponseWrapperCloseGroup.md)
 - [TripletexApi::ResponseWrapperCompany](docs/ResponseWrapperCompany.md)
 - [TripletexApi::ResponseWrapperConsumerToken](docs/ResponseWrapperConsumerToken.md)
 - [TripletexApi::ResponseWrapperContact](docs/ResponseWrapperContact.md)
 - [TripletexApi::ResponseWrapperCost](docs/ResponseWrapperCost.md)
 - [TripletexApi::ResponseWrapperCountry](docs/ResponseWrapperCountry.md)
 - [TripletexApi::ResponseWrapperCurrency](docs/ResponseWrapperCurrency.md)
 - [TripletexApi::ResponseWrapperCustomer](docs/ResponseWrapperCustomer.md)
 - [TripletexApi::ResponseWrapperCustomerCategory](docs/ResponseWrapperCustomerCategory.md)
 - [TripletexApi::ResponseWrapperDepartment](docs/ResponseWrapperDepartment.md)
 - [TripletexApi::ResponseWrapperDocument](docs/ResponseWrapperDocument.md)
 - [TripletexApi::ResponseWrapperDouble](docs/ResponseWrapperDouble.md)
 - [TripletexApi::ResponseWrapperEmployee](docs/ResponseWrapperEmployee.md)
 - [TripletexApi::ResponseWrapperEmployeeToken](docs/ResponseWrapperEmployeeToken.md)
 - [TripletexApi::ResponseWrapperEmployment](docs/ResponseWrapperEmployment.md)
 - [TripletexApi::ResponseWrapperEmploymentDetails](docs/ResponseWrapperEmploymentDetails.md)
 - [TripletexApi::ResponseWrapperEntitlement](docs/ResponseWrapperEntitlement.md)
 - [TripletexApi::ResponseWrapperInteger](docs/ResponseWrapperInteger.md)
 - [TripletexApi::ResponseWrapperInventory](docs/ResponseWrapperInventory.md)
 - [TripletexApi::ResponseWrapperInvoice](docs/ResponseWrapperInvoice.md)
 - [TripletexApi::ResponseWrapperLeaveOfAbsence](docs/ResponseWrapperLeaveOfAbsence.md)
 - [TripletexApi::ResponseWrapperListJob](docs/ResponseWrapperListJob.md)
 - [TripletexApi::ResponseWrapperLoggedInUserInfoDTO](docs/ResponseWrapperLoggedInUserInfoDTO.md)
 - [TripletexApi::ResponseWrapperMapStringEventInfoDescription](docs/ResponseWrapperMapStringEventInfoDescription.md)
 - [TripletexApi::ResponseWrapperMileageAllowance](docs/ResponseWrapperMileageAllowance.md)
 - [TripletexApi::ResponseWrapperModules](docs/ResponseWrapperModules.md)
 - [TripletexApi::ResponseWrapperMonthlyStatus](docs/ResponseWrapperMonthlyStatus.md)
 - [TripletexApi::ResponseWrapperNotification](docs/ResponseWrapperNotification.md)
 - [TripletexApi::ResponseWrapperObject](docs/ResponseWrapperObject.md)
 - [TripletexApi::ResponseWrapperOrder](docs/ResponseWrapperOrder.md)
 - [TripletexApi::ResponseWrapperOrderLine](docs/ResponseWrapperOrderLine.md)
 - [TripletexApi::ResponseWrapperOrderOffer](docs/ResponseWrapperOrderOffer.md)
 - [TripletexApi::ResponseWrapperPassenger](docs/ResponseWrapperPassenger.md)
 - [TripletexApi::ResponseWrapperPaymentType](docs/ResponseWrapperPaymentType.md)
 - [TripletexApi::ResponseWrapperPaymentTypeOut](docs/ResponseWrapperPaymentTypeOut.md)
 - [TripletexApi::ResponseWrapperPayslip](docs/ResponseWrapperPayslip.md)
 - [TripletexApi::ResponseWrapperPerDiemCompensation](docs/ResponseWrapperPerDiemCompensation.md)
 - [TripletexApi::ResponseWrapperPosting](docs/ResponseWrapperPosting.md)
 - [TripletexApi::ResponseWrapperProduct](docs/ResponseWrapperProduct.md)
 - [TripletexApi::ResponseWrapperProductUnit](docs/ResponseWrapperProductUnit.md)
 - [TripletexApi::ResponseWrapperProject](docs/ResponseWrapperProject.md)
 - [TripletexApi::ResponseWrapperProjectCategory](docs/ResponseWrapperProjectCategory.md)
 - [TripletexApi::ResponseWrapperProjectInvoiceDetails](docs/ResponseWrapperProjectInvoiceDetails.md)
 - [TripletexApi::ResponseWrapperProjectOrderLine](docs/ResponseWrapperProjectOrderLine.md)
 - [TripletexApi::ResponseWrapperProjectParticipant](docs/ResponseWrapperProjectParticipant.md)
 - [TripletexApi::ResponseWrapperProspect](docs/ResponseWrapperProspect.md)
 - [TripletexApi::ResponseWrapperReminder](docs/ResponseWrapperReminder.md)
 - [TripletexApi::ResponseWrapperSalarySpecification](docs/ResponseWrapperSalarySpecification.md)
 - [TripletexApi::ResponseWrapperSalaryTransaction](docs/ResponseWrapperSalaryTransaction.md)
 - [TripletexApi::ResponseWrapperSalaryType](docs/ResponseWrapperSalaryType.md)
 - [TripletexApi::ResponseWrapperSessionToken](docs/ResponseWrapperSessionToken.md)
 - [TripletexApi::ResponseWrapperStandardTime](docs/ResponseWrapperStandardTime.md)
 - [TripletexApi::ResponseWrapperString](docs/ResponseWrapperString.md)
 - [TripletexApi::ResponseWrapperSubscription](docs/ResponseWrapperSubscription.md)
 - [TripletexApi::ResponseWrapperSupplier](docs/ResponseWrapperSupplier.md)
 - [TripletexApi::ResponseWrapperSystemMessage](docs/ResponseWrapperSystemMessage.md)
 - [TripletexApi::ResponseWrapperTimeClock](docs/ResponseWrapperTimeClock.md)
 - [TripletexApi::ResponseWrapperTimesheetEntry](docs/ResponseWrapperTimesheetEntry.md)
 - [TripletexApi::ResponseWrapperTravelCostCategory](docs/ResponseWrapperTravelCostCategory.md)
 - [TripletexApi::ResponseWrapperTravelExpense](docs/ResponseWrapperTravelExpense.md)
 - [TripletexApi::ResponseWrapperTravelExpenseRate](docs/ResponseWrapperTravelExpenseRate.md)
 - [TripletexApi::ResponseWrapperTravelExpenseRateCategory](docs/ResponseWrapperTravelExpenseRateCategory.md)
 - [TripletexApi::ResponseWrapperTravelExpenseRateCategoryGroup](docs/ResponseWrapperTravelExpenseRateCategoryGroup.md)
 - [TripletexApi::ResponseWrapperTravelPaymentType](docs/ResponseWrapperTravelPaymentType.md)
 - [TripletexApi::ResponseWrapperTripDTO](docs/ResponseWrapperTripDTO.md)
 - [TripletexApi::ResponseWrapperTripletexAccountReturn](docs/ResponseWrapperTripletexAccountReturn.md)
 - [TripletexApi::ResponseWrapperUnreadCountDTO](docs/ResponseWrapperUnreadCountDTO.md)
 - [TripletexApi::ResponseWrapperVatType](docs/ResponseWrapperVatType.md)
 - [TripletexApi::ResponseWrapperVoucher](docs/ResponseWrapperVoucher.md)
 - [TripletexApi::ResponseWrapperVoucherType](docs/ResponseWrapperVoucherType.md)
 - [TripletexApi::ResponseWrapperWeeklyStatus](docs/ResponseWrapperWeeklyStatus.md)
 - [TripletexApi::Result](docs/Result.md)
 - [TripletexApi::SalarySpecification](docs/SalarySpecification.md)
 - [TripletexApi::SalaryTransaction](docs/SalaryTransaction.md)
 - [TripletexApi::SalaryType](docs/SalaryType.md)
 - [TripletexApi::SearchCompletionDTO](docs/SearchCompletionDTO.md)
 - [TripletexApi::SessionToken](docs/SessionToken.md)
 - [TripletexApi::SmartScanWebhook](docs/SmartScanWebhook.md)
 - [TripletexApi::StandardTime](docs/StandardTime.md)
 - [TripletexApi::Subscription](docs/Subscription.md)
 - [TripletexApi::Supplier](docs/Supplier.md)
 - [TripletexApi::SupplierBalance](docs/SupplierBalance.md)
 - [TripletexApi::SystemMessage](docs/SystemMessage.md)
 - [TripletexApi::TimeClock](docs/TimeClock.md)
 - [TripletexApi::TimesheetEntry](docs/TimesheetEntry.md)
 - [TripletexApi::TimesheetEntrySearchResponse](docs/TimesheetEntrySearchResponse.md)
 - [TripletexApi::TravelCostCategory](docs/TravelCostCategory.md)
 - [TripletexApi::TravelDetails](docs/TravelDetails.md)
 - [TripletexApi::TravelExpense](docs/TravelExpense.md)
 - [TripletexApi::TravelExpenseRate](docs/TravelExpenseRate.md)
 - [TripletexApi::TravelExpenseRateCategory](docs/TravelExpenseRateCategory.md)
 - [TripletexApi::TravelExpenseRateCategoryGroup](docs/TravelExpenseRateCategoryGroup.md)
 - [TripletexApi::TravelPaymentType](docs/TravelPaymentType.md)
 - [TripletexApi::TriggerDTO](docs/TriggerDTO.md)
 - [TripletexApi::TripDTO](docs/TripDTO.md)
 - [TripletexApi::TripletexAccount](docs/TripletexAccount.md)
 - [TripletexApi::TripletexAccountReturn](docs/TripletexAccountReturn.md)
 - [TripletexApi::UnreadCountDTO](docs/UnreadCountDTO.md)
 - [TripletexApi::VNTCStatusDTO](docs/VNTCStatusDTO.md)
 - [TripletexApi::VatType](docs/VatType.md)
 - [TripletexApi::Voucher](docs/Voucher.md)
 - [TripletexApi::VoucherSearchResponse](docs/VoucherSearchResponse.md)
 - [TripletexApi::VoucherType](docs/VoucherType.md)
 - [TripletexApi::WeeklyStatus](docs/WeeklyStatus.md)
 - [TripletexApi::WorkingHoursScheme](docs/WorkingHoursScheme.md)


## Documentation for Authorization


### tokenAuthScheme

- **Type**: HTTP basic authentication

