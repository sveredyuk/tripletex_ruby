# TripletexApi::EmployeenextOfKinApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](EmployeenextOfKinApi.md#get) | **GET** /employee/nextOfKin/{id} | [BETA] Find next of kin by ID.
[**post**](EmployeenextOfKinApi.md#post) | **POST** /employee/nextOfKin | [BETA] Create next of kin.
[**put**](EmployeenextOfKinApi.md#put) | **PUT** /employee/nextOfKin/{id} | [BETA] Update next of kin. 
[**search**](EmployeenextOfKinApi.md#search) | **GET** /employee/nextOfKin | Find all next of kin for employee.


# **get**
> ResponseWrapperNextOfKin get(id, opts)

[BETA] Find next of kin by ID.



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

api_instance = TripletexApi::EmployeenextOfKinApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find next of kin by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeenextOfKinApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperNextOfKin**](ResponseWrapperNextOfKin.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperNextOfKin post(opts)

[BETA] Create next of kin.



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

api_instance = TripletexApi::EmployeenextOfKinApi.new

opts = { 
  body: TripletexApi::NextOfKin.new # NextOfKin | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create next of kin.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeenextOfKinApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**NextOfKin**](NextOfKin.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperNextOfKin**](ResponseWrapperNextOfKin.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperNextOfKin put(id, opts)

[BETA] Update next of kin. 



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

api_instance = TripletexApi::EmployeenextOfKinApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexApi::NextOfKin.new # NextOfKin | Partial object describing what should be updated
}

begin
  #[BETA] Update next of kin. 
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeenextOfKinApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**NextOfKin**](NextOfKin.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperNextOfKin**](ResponseWrapperNextOfKin.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseNextOfKin search(opts)

Find all next of kin for employee.



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

api_instance = TripletexApi::EmployeenextOfKinApi.new

opts = { 
  employee_id: 56, # Integer | Employee ID. Defaults to ID of token owner.
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find all next of kin for employee.
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeenextOfKinApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **employee_id** | **Integer**| Employee ID. Defaults to ID of token owner. | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseNextOfKin**](ListResponseNextOfKin.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



