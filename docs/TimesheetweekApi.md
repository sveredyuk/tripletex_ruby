# TripletexApi::TimesheetweekApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**approve**](TimesheetweekApi.md#approve) | **PUT** /timesheet/week/:approve | Approve week. By ID or (ISO-8601 week and employeeId combination).
[**complete**](TimesheetweekApi.md#complete) | **PUT** /timesheet/week/:complete | Complete week. By ID or (ISO-8601 week and employeeId combination).
[**reopen**](TimesheetweekApi.md#reopen) | **PUT** /timesheet/week/:reopen | Reopen week. By ID or (ISO-8601 week and employeeId combination).
[**search**](TimesheetweekApi.md#search) | **GET** /timesheet/week | Find weekly status By ID, week/year combination, employeeId. or an approver
[**unapprove**](TimesheetweekApi.md#unapprove) | **PUT** /timesheet/week/:unapprove | Unapprove week. By ID or (ISO-8601 week and employeeId combination).


# **approve**
> ResponseWrapperWeek approve(opts)

Approve week. By ID or (ISO-8601 week and employeeId combination).



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

api_instance = TripletexApi::TimesheetweekApi.new

opts = { 
  id: 56, # Integer | Equals
  employee_id: 56, # Integer | Equals
  week_year: "\"2018-12\"" # String | ISO-8601 week-year
}

begin
  #Approve week. By ID or (ISO-8601 week and employeeId combination).
  result = api_instance.approve(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling TimesheetweekApi->approve: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Equals | [optional] 
 **employee_id** | **Integer**| Equals | [optional] 
 **week_year** | **String**| ISO-8601 week-year | [optional] 

### Return type

[**ResponseWrapperWeek**](ResponseWrapperWeek.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **complete**
> ResponseWrapperWeek complete(opts)

Complete week. By ID or (ISO-8601 week and employeeId combination).



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

api_instance = TripletexApi::TimesheetweekApi.new

opts = { 
  id: 56, # Integer | Equals
  employee_id: 56, # Integer | Equals
  week_year: "\"2018-12\"" # String | ISO-8601 week-year
}

begin
  #Complete week. By ID or (ISO-8601 week and employeeId combination).
  result = api_instance.complete(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling TimesheetweekApi->complete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Equals | [optional] 
 **employee_id** | **Integer**| Equals | [optional] 
 **week_year** | **String**| ISO-8601 week-year | [optional] 

### Return type

[**ResponseWrapperWeek**](ResponseWrapperWeek.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **reopen**
> ResponseWrapperWeek reopen(opts)

Reopen week. By ID or (ISO-8601 week and employeeId combination).



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

api_instance = TripletexApi::TimesheetweekApi.new

opts = { 
  id: 56, # Integer | Equals
  employee_id: 56, # Integer | Equals
  week_year: "\"2018-12\"" # String | ISO-8601 week-year
}

begin
  #Reopen week. By ID or (ISO-8601 week and employeeId combination).
  result = api_instance.reopen(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling TimesheetweekApi->reopen: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Equals | [optional] 
 **employee_id** | **Integer**| Equals | [optional] 
 **week_year** | **String**| ISO-8601 week-year | [optional] 

### Return type

[**ResponseWrapperWeek**](ResponseWrapperWeek.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseWeek search(opts)

Find weekly status By ID, week/year combination, employeeId. or an approver



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

api_instance = TripletexApi::TimesheetweekApi.new

opts = { 
  ids: "ids_example", # String | List of IDs
  employee_ids: "employee_ids_example", # String | List of IDs
  week_year: "\"2018-12\"", # String | ISO-8601 week-year
  approved_by: 56, # Integer | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find weekly status By ID, week/year combination, employeeId. or an approver
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling TimesheetweekApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**| List of IDs | [optional] 
 **employee_ids** | **String**| List of IDs | [optional] 
 **week_year** | **String**| ISO-8601 week-year | [optional] 
 **approved_by** | **Integer**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseWeek**](ListResponseWeek.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **unapprove**
> ResponseWrapperWeek unapprove(opts)

Unapprove week. By ID or (ISO-8601 week and employeeId combination).



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

api_instance = TripletexApi::TimesheetweekApi.new

opts = { 
  id: 56, # Integer | Equals
  employee_id: 56, # Integer | Equals
  week_year: "\"2018-12\"" # String | ISO-8601 week-year
}

begin
  #Unapprove week. By ID or (ISO-8601 week and employeeId combination).
  result = api_instance.unapprove(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling TimesheetweekApi->unapprove: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Equals | [optional] 
 **employee_id** | **Integer**| Equals | [optional] 
 **week_year** | **String**| ISO-8601 week-year | [optional] 

### Return type

[**ResponseWrapperWeek**](ResponseWrapperWeek.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



