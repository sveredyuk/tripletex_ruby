# TripletexApi::InvoicedetailsApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](InvoicedetailsApi.md#get) | **GET** /invoice/details/{id} | [BETA] Get ProjectInvoiceDetails by ID.
[**search**](InvoicedetailsApi.md#search) | **GET** /invoice/details | Find ProjectInvoiceDetails corresponding with sent data.


# **get**
> ResponseWrapperProjectInvoiceDetails get(id, opts)

[BETA] Get ProjectInvoiceDetails by ID.



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

api_instance = TripletexApi::InvoicedetailsApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Get ProjectInvoiceDetails by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling InvoicedetailsApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProjectInvoiceDetails**](ResponseWrapperProjectInvoiceDetails.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> ListResponseProjectInvoiceDetails search(invoice_date_from, invoice_date_to, opts)

Find ProjectInvoiceDetails corresponding with sent data.



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

api_instance = TripletexApi::InvoicedetailsApi.new

invoice_date_from = "invoice_date_from_example" # String | From and including

invoice_date_to = "invoice_date_to_example" # String | To and excluding

opts = { 
  id: "id_example", # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find ProjectInvoiceDetails corresponding with sent data.
  result = api_instance.search(invoice_date_from, invoice_date_to, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling InvoicedetailsApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_date_from** | **String**| From and including | 
 **invoice_date_to** | **String**| To and excluding | 
 **id** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProjectInvoiceDetails**](ListResponseProjectInvoiceDetails.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



