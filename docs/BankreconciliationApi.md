# TripletexApi::BankreconciliationApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adjustment**](BankreconciliationApi.md#adjustment) | **PUT** /bank/reconciliation/{id}/:adjustment | [BETA] Add an adjustment to reconciliation by ID.
[**delete**](BankreconciliationApi.md#delete) | **DELETE** /bank/reconciliation/{id} | [BETA] Delete bank reconciliation by ID.
[**get**](BankreconciliationApi.md#get) | **GET** /bank/reconciliation/{id} | [BETA] Get bank reconciliation.
[**last_closed**](BankreconciliationApi.md#last_closed) | **GET** /bank/reconciliation/&gt;lastClosed | [BETA] Get last closed reconciliation by account ID.
[**post**](BankreconciliationApi.md#post) | **POST** /bank/reconciliation | [BETA] Post a bank reconciliation.
[**put**](BankreconciliationApi.md#put) | **PUT** /bank/reconciliation/{id} | [BETA] Update a bank reconciliation.
[**search**](BankreconciliationApi.md#search) | **GET** /bank/reconciliation | [BETA] Find bank reconciliation corresponding with sent data.


# **adjustment**
> ListResponsePosting adjustment(id, payment_type_id, posting_date, amount)

[BETA] Add an adjustment to reconciliation by ID.



### Example
```ruby
# load the gem
require 'tripletex_api'
# setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::BankreconciliationApi.new

id = 56 # Integer | Element ID

payment_type_id = 56 # Integer | Bank reconciliation PaymentType ID.

posting_date = "posting_date_example" # String | Format is yyyy-MM-dd

amount = 8.14 # Float | Amount


begin
  #[BETA] Add an adjustment to reconciliation by ID.
  result = api_instance.adjustment(id, payment_type_id, posting_date, amount)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankreconciliationApi->adjustment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **payment_type_id** | **Integer**| Bank reconciliation PaymentType ID. | 
 **posting_date** | **String**| Format is yyyy-MM-dd | 
 **amount** | **Float**| Amount | 

### Return type

[**ListResponsePosting**](ListResponsePosting.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **delete**
> delete(id)

[BETA] Delete bank reconciliation by ID.



### Example
```ruby
# load the gem
require 'tripletex_api'
# setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::BankreconciliationApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete bank reconciliation by ID.
  api_instance.delete(id)
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankreconciliationApi->delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperBankReconciliation get(id, opts)

[BETA] Get bank reconciliation.



### Example
```ruby
# load the gem
require 'tripletex_api'
# setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::BankreconciliationApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Get bank reconciliation.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankreconciliationApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperBankReconciliation**](ResponseWrapperBankReconciliation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **last_closed**
> ResponseWrapperBankReconciliation last_closed(account_id, opts)

[BETA] Get last closed reconciliation by account ID.



### Example
```ruby
# load the gem
require 'tripletex_api'
# setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::BankreconciliationApi.new

account_id = 56 # Integer | Account ID

opts = { 
  after: "after_example", # String | Format is yyyy-MM-dd
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Get last closed reconciliation by account ID.
  result = api_instance.last_closed(account_id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankreconciliationApi->last_closed: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **Integer**| Account ID | 
 **after** | **String**| Format is yyyy-MM-dd | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperBankReconciliation**](ResponseWrapperBankReconciliation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperBankReconciliation post(opts)

[BETA] Post a bank reconciliation.



### Example
```ruby
# load the gem
require 'tripletex_api'
# setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::BankreconciliationApi.new

opts = { 
  body: TripletexApi::BankReconciliation.new # BankReconciliation | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Post a bank reconciliation.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankreconciliationApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**BankReconciliation**](BankReconciliation.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperBankReconciliation**](ResponseWrapperBankReconciliation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperBankReconciliation put(id, opts)

[BETA] Update a bank reconciliation.



### Example
```ruby
# load the gem
require 'tripletex_api'
# setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::BankreconciliationApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexApi::BankReconciliation.new # BankReconciliation | Partial object describing what should be updated
}

begin
  #[BETA] Update a bank reconciliation.
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankreconciliationApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**BankReconciliation**](BankReconciliation.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperBankReconciliation**](ResponseWrapperBankReconciliation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseBankReconciliation search(opts)

[BETA] Find bank reconciliation corresponding with sent data.



### Example
```ruby
# load the gem
require 'tripletex_api'
# setup authorization
TripletexApi.configure do |config|
  # Configure HTTP basic authorization: tokenAuthScheme
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = TripletexApi::BankreconciliationApi.new

opts = { 
  id: "id_example", # String | List of IDs
  accounting_period_id: "accounting_period_id_example", # String | List of IDs
  account_id: "account_id_example", # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find bank reconciliation corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankreconciliationApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **accounting_period_id** | **String**| List of IDs | [optional] 
 **account_id** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseBankReconciliation**](ListResponseBankReconciliation.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



