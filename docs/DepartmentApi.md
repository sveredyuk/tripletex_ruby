# TripletexApi::DepartmentApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](DepartmentApi.md#get) | **GET** /department/{id} | Get department by ID.
[**post**](DepartmentApi.md#post) | **POST** /department | [BETA] Add new department.
[**post_list**](DepartmentApi.md#post_list) | **POST** /department/list | [BETA] Register new departments.
[**put**](DepartmentApi.md#put) | **PUT** /department/{id} | [BETA] Update department.
[**put_list**](DepartmentApi.md#put_list) | **PUT** /department/list | [BETA] Update multiple departments.
[**search**](DepartmentApi.md#search) | **GET** /department | Find department corresponding with sent data.


# **get**
> ResponseWrapperDepartment get(id, opts)

Get department by ID.



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

api_instance = TripletexApi::DepartmentApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Get department by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling DepartmentApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperDepartment**](ResponseWrapperDepartment.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperDepartment post(opts)

[BETA] Add new department.



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

api_instance = TripletexApi::DepartmentApi.new

opts = { 
  body: TripletexApi::Department.new # Department | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Add new department.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling DepartmentApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Department**](Department.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperDepartment**](ResponseWrapperDepartment.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseDepartment post_list(opts)

[BETA] Register new departments.



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

api_instance = TripletexApi::DepartmentApi.new

opts = { 
  body: [TripletexApi::Department.new] # Array<Department> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Register new departments.
  result = api_instance.post_list(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling DepartmentApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Department&gt;**](Department.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseDepartment**](ListResponseDepartment.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperDepartment put(id, opts)

[BETA] Update department.



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

api_instance = TripletexApi::DepartmentApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexApi::Department.new # Department | Partial object describing what should be updated
}

begin
  #[BETA] Update department.
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling DepartmentApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Department**](Department.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperDepartment**](ResponseWrapperDepartment.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseDepartment put_list(opts)

[BETA] Update multiple departments.



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

api_instance = TripletexApi::DepartmentApi.new

opts = { 
  body: [TripletexApi::Department.new] # Array<Department> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple departments.
  result = api_instance.put_list(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling DepartmentApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;Department&gt;**](Department.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseDepartment**](ListResponseDepartment.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseDepartment search(opts)

Find department corresponding with sent data.



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

api_instance = TripletexApi::DepartmentApi.new

opts = { 
  id: "id_example", # String | List of IDs
  name: "name_example", # String | Containing
  department_number: "department_number_example", # String | Containing
  department_manager_id: "department_manager_id_example", # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find department corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling DepartmentApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| List of IDs | [optional] 
 **name** | **String**| Containing | [optional] 
 **department_number** | **String**| Containing | [optional] 
 **department_manager_id** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseDepartment**](ListResponseDepartment.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



