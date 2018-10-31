# TripletexApi::BankstatementApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](BankstatementApi.md#delete) | **DELETE** /bank/statement/{id} | [BETA] Delete bank statement by ID.
[**get**](BankstatementApi.md#get) | **GET** /bank/statement/{id} | [BETA] Get bank statement.
[**import_bank_statement**](BankstatementApi.md#import_bank_statement) | **POST** /bank/statement/import | [BETA] Upload bank statement file.
[**search**](BankstatementApi.md#search) | **GET** /bank/statement | [BETA] Find bank statement corresponding with sent data.


# **delete**
> delete(id)

[BETA] Delete bank statement by ID.



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

api_instance = TripletexApi::BankstatementApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete bank statement by ID.
  api_instance.delete(id)
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankstatementApi->delete: #{e}"
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
> ResponseWrapperBankStatement get(id, opts)

[BETA] Get bank statement.



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

api_instance = TripletexApi::BankstatementApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Get bank statement.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankstatementApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperBankStatement**](ResponseWrapperBankStatement.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **import_bank_statement**
> ResponseWrapperBankStatement import_bank_statement(file_format, file, opts)

[BETA] Upload bank statement file.



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

api_instance = TripletexApi::BankstatementApi.new

file_format = "file_format_example" # String | File format

file = File.new("/path/to/file.txt") # File | The bank statement file

opts = { 
  bank_id: 56 # Integer | Bank ID
}

begin
  #[BETA] Upload bank statement file.
  result = api_instance.import_bank_statement(file_format, file, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankstatementApi->import_bank_statement: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file_format** | **String**| File format | 
 **file** | **File**| The bank statement file | 
 **bank_id** | **Integer**| Bank ID | [optional] 

### Return type

[**ResponseWrapperBankStatement**](ResponseWrapperBankStatement.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



# **search**
> ListResponseBankStatement search(opts)

[BETA] Find bank statement corresponding with sent data.



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

api_instance = TripletexApi::BankstatementApi.new

opts = { 
  id: "id_example", # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find bank statement corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling BankstatementApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseBankStatement**](ListResponseBankStatement.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



