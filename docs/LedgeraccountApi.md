# TripletexApi::LedgeraccountApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](LedgeraccountApi.md#delete) | **DELETE** /ledger/account/{id} | [BETA] Delete account.
[**delete_by_ids**](LedgeraccountApi.md#delete_by_ids) | **DELETE** /ledger/account/list | [BETA] Delete multiple accounts.
[**get**](LedgeraccountApi.md#get) | **GET** /ledger/account/{id} | Get account by ID.
[**post**](LedgeraccountApi.md#post) | **POST** /ledger/account | [BETA] Create a new account.
[**post_list**](LedgeraccountApi.md#post_list) | **POST** /ledger/account/list | [BETA] Create several accounts.
[**put**](LedgeraccountApi.md#put) | **PUT** /ledger/account/{id} | [BETA] Update account.
[**put_list**](LedgeraccountApi.md#put_list) | **PUT** /ledger/account/list | [BETA] Update multiple accounts.
[**search**](LedgeraccountApi.md#search) | **GET** /ledger/account | Find accounts corresponding with sent data.


# **delete**
> delete(id)

[BETA] Delete account.



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

api_instance = TripletexApi::LedgeraccountApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete account.
  api_instance.delete(id)
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->delete: #{e}"
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



# **delete_by_ids**
> delete_by_ids(ids)

[BETA] Delete multiple accounts.



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

api_instance = TripletexApi::LedgeraccountApi.new

ids = "ids_example" # String | ID of the elements


begin
  #[BETA] Delete multiple accounts.
  api_instance.delete_by_ids(ids)
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->delete_by_ids: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**| ID of the elements | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get**
> ResponseWrapperAccount get(id, opts)

Get account by ID.



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

api_instance = TripletexApi::LedgeraccountApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Get account by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperAccount**](ResponseWrapperAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperAccount post(opts)

[BETA] Create a new account.



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

api_instance = TripletexApi::LedgeraccountApi.new

opts = { 
  body: TripletexApi::Account.new # Account | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create a new account.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Account**](Account.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperAccount**](ResponseWrapperAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseAccount post_list(opts)

[BETA] Create several accounts.



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

api_instance = TripletexApi::LedgeraccountApi.new

opts = { 
  body: [TripletexApi::Account.new] # Array<Account> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create several accounts.
  result = api_instance.post_list(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Account&gt;**](Account.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseAccount**](ListResponseAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperAccount put(id, opts)

[BETA] Update account.



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

api_instance = TripletexApi::LedgeraccountApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexApi::Account.new # Account | Partial object describing what should be updated
}

begin
  #[BETA] Update account.
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Account**](Account.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperAccount**](ResponseWrapperAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseAccount put_list(opts)

[BETA] Update multiple accounts.



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

api_instance = TripletexApi::LedgeraccountApi.new

opts = { 
  body: [TripletexApi::Account.new] # Array<Account> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple accounts.
  result = api_instance.put_list(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Account&gt;**](Account.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseAccount**](ListResponseAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseAccount search(opts)

Find accounts corresponding with sent data.



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

api_instance = TripletexApi::LedgeraccountApi.new

opts = { 
  id: "id_example", # String | List of IDs
  number: "number_example", # String | List of IDs
  is_bank_account: true, # BOOLEAN | Equals
  is_inactive: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find accounts corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgeraccountApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **number** | **String**| List of IDs | [optional] 
 **is_bank_account** | **BOOLEAN**| Equals | [optional] 
 **is_inactive** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseAccount**](ListResponseAccount.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



