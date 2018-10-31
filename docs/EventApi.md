# TripletexApi::EventApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](EventApi.md#get) | **GET** /event | [BETA] Get all (WebHook) event keys.


# **get**
> ResponseWrapperMapStringEventInfoDescription get(opts)

[BETA] Get all (WebHook) event keys.



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

api_instance = TripletexApi::EventApi.new

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Get all (WebHook) event keys.
  result = api_instance.get(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling EventApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperMapStringEventInfoDescription**](ResponseWrapperMapStringEventInfoDescription.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



