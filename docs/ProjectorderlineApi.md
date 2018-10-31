# TripletexApi::ProjectorderlineApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](ProjectorderlineApi.md#delete) | **DELETE** /project/orderline/{id} | [BETA] Delete order line by ID.
[**get**](ProjectorderlineApi.md#get) | **GET** /project/orderline/{id} | [BETA] Get order line by ID.
[**post**](ProjectorderlineApi.md#post) | **POST** /project/orderline | [BETA] Create order line. When creating several order lines, use /list for better performance.
[**post_list**](ProjectorderlineApi.md#post_list) | **POST** /project/orderline/list | [BETA] Create multiple order lines.
[**put**](ProjectorderlineApi.md#put) | **PUT** /project/orderline/{id} | [BETA] Update project orderline.


# **delete**
> delete(id)

[BETA] Delete order line by ID.



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

api_instance = TripletexApi::ProjectorderlineApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete order line by ID.
  api_instance.delete(id)
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProjectorderlineApi->delete: #{e}"
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
> ResponseWrapperProjectOrderLine get(id, opts)

[BETA] Get order line by ID.



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

api_instance = TripletexApi::ProjectorderlineApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Get order line by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProjectorderlineApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProjectOrderLine**](ResponseWrapperProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProjectOrderLine post(opts)

[BETA] Create order line. When creating several order lines, use /list for better performance.



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

api_instance = TripletexApi::ProjectorderlineApi.new

opts = { 
  body: TripletexApi::ProjectOrderLine.new # ProjectOrderLine | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create order line. When creating several order lines, use /list for better performance.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProjectorderlineApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**ProjectOrderLine**](ProjectOrderLine.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProjectOrderLine**](ResponseWrapperProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseProjectOrderLine post_list(opts)

[BETA] Create multiple order lines.



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

api_instance = TripletexApi::ProjectorderlineApi.new

opts = { 
  body: [TripletexApi::ProjectOrderLine.new] # Array<ProjectOrderLine> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #[BETA] Create multiple order lines.
  result = api_instance.post_list(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProjectorderlineApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;ProjectOrderLine&gt;**](ProjectOrderLine.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseProjectOrderLine**](ListResponseProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperProjectOrderLine put(id, opts)

[BETA] Update project orderline.



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

api_instance = TripletexApi::ProjectorderlineApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexApi::ProjectOrderLine.new # ProjectOrderLine | Partial object describing what should be updated
}

begin
  #[BETA] Update project orderline.
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProjectorderlineApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**ProjectOrderLine**](ProjectOrderLine.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperProjectOrderLine**](ResponseWrapperProjectOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



