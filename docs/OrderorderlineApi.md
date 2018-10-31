# TripletexApi::OrderorderlineApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](OrderorderlineApi.md#delete) | **DELETE** /order/orderline/{id} | [BETA] Delete order line by ID.
[**get**](OrderorderlineApi.md#get) | **GET** /order/orderline/{id} | Get order line by ID.
[**post**](OrderorderlineApi.md#post) | **POST** /order/orderline | Create order line. When creating several order lines, use /list for better performance.
[**post_list**](OrderorderlineApi.md#post_list) | **POST** /order/orderline/list | Create multiple order lines.


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

api_instance = TripletexApi::OrderorderlineApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete order line by ID.
  api_instance.delete(id)
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderorderlineApi->delete: #{e}"
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
> ResponseWrapperOrderLine get(id, opts)

Get order line by ID.



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

api_instance = TripletexApi::OrderorderlineApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Get order line by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderorderlineApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperOrderLine**](ResponseWrapperOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperOrderLine post(opts)

Create order line. When creating several order lines, use /list for better performance.



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

api_instance = TripletexApi::OrderorderlineApi.new

opts = { 
  body: TripletexApi::OrderLine.new # OrderLine | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Create order line. When creating several order lines, use /list for better performance.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderorderlineApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**OrderLine**](OrderLine.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperOrderLine**](ResponseWrapperOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **post_list**
> ListResponseOrderLine post_list(opts)

Create multiple order lines.



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

api_instance = TripletexApi::OrderorderlineApi.new

opts = { 
  body: [TripletexApi::OrderLine.new] # Array<OrderLine> | JSON representing a list of new object to be created. Should not have ID and version set.
}

begin
  #Create multiple order lines.
  result = api_instance.post_list(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderorderlineApi->post_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Array&lt;OrderLine&gt;**](OrderLine.md)| JSON representing a list of new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ListResponseOrderLine**](ListResponseOrderLine.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



