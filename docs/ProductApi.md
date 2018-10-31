# TripletexApi::ProductApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](ProductApi.md#get) | **GET** /product/{id} | Get product by ID.
[**post**](ProductApi.md#post) | **POST** /product | Create new product.
[**put**](ProductApi.md#put) | **PUT** /product/{id} | Update product.
[**search**](ProductApi.md#search) | **GET** /product | Find products corresponding with sent data.


# **get**
> ResponseWrapperProduct get(id, opts)

Get product by ID.



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

api_instance = TripletexApi::ProductApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Get product by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProductApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperProduct**](ResponseWrapperProduct.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperProduct post(opts)

Create new product.



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

api_instance = TripletexApi::ProductApi.new

opts = { 
  body: TripletexApi::Product.new # Product | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Create new product.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProductApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Product**](Product.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperProduct**](ResponseWrapperProduct.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperProduct put(id, opts)

Update product.



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

api_instance = TripletexApi::ProductApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexApi::Product.new # Product | Partial object describing what should be updated
}

begin
  #Update product.
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProductApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Product**](Product.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperProduct**](ResponseWrapperProduct.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseProduct search(opts)

Find products corresponding with sent data.



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

api_instance = TripletexApi::ProductApi.new

opts = { 
  number: "number_example", # String | DEPRECATED. List of product numbers (Integer only)
  product_number: ["product_number_example"], # Array<String> | List of valid product numbers
  name: "name_example", # String | Containing
  is_inactive: true, # BOOLEAN | Equals
  is_stock_item: true, # BOOLEAN | Equals
  currency_id: "currency_id_example", # String | Equals
  vat_type_id: "vat_type_id_example", # String | Equals
  product_unit_id: "product_unit_id_example", # String | Equals
  department_id: "department_id_example", # String | Equals
  account_id: "account_id_example", # String | Equals
  cost_excluding_vat_currency_from: 8.14, # Float | From and including
  cost_excluding_vat_currency_to: 8.14, # Float | To and excluding
  price_excluding_vat_currency_from: 8.14, # Float | From and including
  price_excluding_vat_currency_to: 8.14, # Float | To and excluding
  price_including_vat_currency_from: 8.14, # Float | From and including
  price_including_vat_currency_to: 8.14, # Float | To and excluding
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find products corresponding with sent data.
  result = api_instance.search(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling ProductApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **number** | **String**| DEPRECATED. List of product numbers (Integer only) | [optional] 
 **product_number** | [**Array&lt;String&gt;**](String.md)| List of valid product numbers | [optional] 
 **name** | **String**| Containing | [optional] 
 **is_inactive** | **BOOLEAN**| Equals | [optional] 
 **is_stock_item** | **BOOLEAN**| Equals | [optional] 
 **currency_id** | **String**| Equals | [optional] 
 **vat_type_id** | **String**| Equals | [optional] 
 **product_unit_id** | **String**| Equals | [optional] 
 **department_id** | **String**| Equals | [optional] 
 **account_id** | **String**| Equals | [optional] 
 **cost_excluding_vat_currency_from** | **Float**| From and including | [optional] 
 **cost_excluding_vat_currency_to** | **Float**| To and excluding | [optional] 
 **price_excluding_vat_currency_from** | **Float**| From and including | [optional] 
 **price_excluding_vat_currency_to** | **Float**| To and excluding | [optional] 
 **price_including_vat_currency_from** | **Float**| From and including | [optional] 
 **price_including_vat_currency_to** | **Float**| To and excluding | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseProduct**](ListResponseProduct.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



