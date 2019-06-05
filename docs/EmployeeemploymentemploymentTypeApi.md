# TripletexApi::EmployeeemploymentemploymentTypeApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_maritime_employment_type**](EmployeeemploymentemploymentTypeApi.md#get_maritime_employment_type) | **GET** /employee/employment/employmentType/maritimeEmploymentType | [BETA] Find all maritime employment type IDs.
[**get_salary_type**](EmployeeemploymentemploymentTypeApi.md#get_salary_type) | **GET** /employee/employment/employmentType/salaryType | [BETA] Find all salary type IDs.
[**get_schedule_type**](EmployeeemploymentemploymentTypeApi.md#get_schedule_type) | **GET** /employee/employment/employmentType/scheduleType | [BETA] Find all schedule type IDs.
[**search**](EmployeeemploymentemploymentTypeApi.md#search) | **GET** /employee/employment/employmentType | [BETA] Find all employment type IDs.


# **get_maritime_employment_type**
> ListResponseEmploymentType get_maritime_employment_type(opts)

[BETA] Find all maritime employment type IDs.



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

api_instance = TripletexApi::EmployeeemploymentemploymentTypeApi.new

opts = { 
  type: "type_example", # String | maritimeEmploymentType
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find all maritime employment type IDs.
  result = api_instance.get_maritime_employment_type(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeeemploymentemploymentTypeApi->get_maritime_employment_type: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**| maritimeEmploymentType | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseEmploymentType**](ListResponseEmploymentType.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_salary_type**
> ListResponseEmploymentType get_salary_type(opts)

[BETA] Find all salary type IDs.



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

api_instance = TripletexApi::EmployeeemploymentemploymentTypeApi.new

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find all salary type IDs.
  result = api_instance.get_salary_type(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeeemploymentemploymentTypeApi->get_salary_type: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseEmploymentType**](ListResponseEmploymentType.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **get_schedule_type**
> ListResponseEmploymentType get_schedule_type(opts)

[BETA] Find all schedule type IDs.



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

api_instance = TripletexApi::EmployeeemploymentemploymentTypeApi.new

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find all schedule type IDs.
  result = api_instance.get_schedule_type(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeeemploymentemploymentTypeApi->get_schedule_type: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseEmploymentType**](ListResponseEmploymentType.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseEmploymentType search(opts)

[BETA] Find all employment type IDs.



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

api_instance = TripletexApi::EmployeeemploymentemploymentTypeApi.new

opts = { 
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find all employment type IDs.
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EmployeeemploymentemploymentTypeApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseEmploymentType**](ListResponseEmploymentType.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



