# TripletexApi::SalarysettingsApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](SalarysettingsApi.md#get) | **GET** /salary/settings | [BETA] Get salary settings of logged in company.
[**put**](SalarysettingsApi.md#put) | **PUT** /salary/settings | [BETA] Update settings of logged in company.


# **get**
> ResponseWrapperSalarySettings get(opts)

[BETA] Get salary settings of logged in company.



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

api_instance = TripletexApi::SalarysettingsApi.new

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Get salary settings of logged in company.
  result = api_instance.get(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling SalarysettingsApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperSalarySettings**](ResponseWrapperSalarySettings.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **put**
> ResponseWrapperSalarySettings put(opts)

[BETA] Update settings of logged in company.



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

api_instance = TripletexApi::SalarysettingsApi.new

opts = { 
  body: TripletexApi::SalarySettings.new # SalarySettings | Partial object describing what should be updated
}

begin
  #[BETA] Update settings of logged in company.
  result = api_instance.put(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling SalarysettingsApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**SalarySettings**](SalarySettings.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperSalarySettings**](ResponseWrapperSalarySettings.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



