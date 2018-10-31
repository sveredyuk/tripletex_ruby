# TripletexApi::OrderApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get**](OrderApi.md#get) | **GET** /order/{id} | Get order by ID.
[**invoice**](OrderApi.md#invoice) | **PUT** /order/{id}/:invoice | Create new invoice from order.
[**post**](OrderApi.md#post) | **POST** /order | Create order.
[**put**](OrderApi.md#put) | **PUT** /order/{id} | Update order.
[**search**](OrderApi.md#search) | **GET** /order | Find orders corresponding with sent data.


# **get**
> ResponseWrapperOrder get(id, opts)

Get order by ID.



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

api_instance = TripletexApi::OrderApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Get order by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperOrder**](ResponseWrapperOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **invoice**
> ResponseWrapperInvoice invoice(id, invoice_date, opts)

Create new invoice from order.



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

api_instance = TripletexApi::OrderApi.new

id = 56 # Integer | ID of order to invoice.

invoice_date = "invoice_date_example" # String | To and excluding

opts = { 
  send_to_customer: true, # BOOLEAN | Send invoice to customer
  payment_type_id: 56, # Integer | Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
  paid_amount: 8.14 # Float | Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
}

begin
  #Create new invoice from order.
  result = api_instance.invoice(id, invoice_date, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderApi->invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| ID of order to invoice. | 
 **invoice_date** | **String**| To and excluding | 
 **send_to_customer** | **BOOLEAN**| Send invoice to customer | [optional] [default to true]
 **payment_type_id** | **Integer**| Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. | [optional] 
 **paid_amount** | **Float**| Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid. | [optional] 

### Return type

[**ResponseWrapperInvoice**](ResponseWrapperInvoice.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperOrder post(opts)

Create order.



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

api_instance = TripletexApi::OrderApi.new

opts = { 
  body: TripletexApi::Order.new # Order | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Create order.
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Order**](Order.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperOrder**](ResponseWrapperOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperOrder put(id, opts)

Update order.



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

api_instance = TripletexApi::OrderApi.new

id = 56 # Integer | Element ID

opts = { 
  body: TripletexApi::Order.new # Order | Partial object describing what should be updated
}

begin
  #Update order.
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **body** | [**Order**](Order.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperOrder**](ResponseWrapperOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **search**
> ListResponseOrder search(order_date_from, order_date_to, opts)

Find orders corresponding with sent data.



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

api_instance = TripletexApi::OrderApi.new

order_date_from = "order_date_from_example" # String | From and including

order_date_to = "order_date_to_example" # String | To and excluding

opts = { 
  id: "id_example", # String | List of IDs
  number: "number_example", # String | Equals
  customer_id: "customer_id_example", # String | List of IDs
  is_closed: true, # BOOLEAN | Equals
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find orders corresponding with sent data.
  result = api_instance.search(order_date_from, order_date_to, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling OrderApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_date_from** | **String**| From and including | 
 **order_date_to** | **String**| To and excluding | 
 **id** | **String**| List of IDs | [optional] 
 **number** | **String**| Equals | [optional] 
 **customer_id** | **String**| List of IDs | [optional] 
 **is_closed** | **BOOLEAN**| Equals | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseOrder**](ListResponseOrder.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



