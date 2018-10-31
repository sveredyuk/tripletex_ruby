# TripletexApi::LedgervoucherApi

All URIs are relative to *https://tripletex.no/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete**](LedgervoucherApi.md#delete) | **DELETE** /ledger/voucher/{id} | [BETA] Delete voucher by ID.
[**download_pdf**](LedgervoucherApi.md#download_pdf) | **GET** /ledger/voucher/{voucherId}/pdf | Get attachment by voucher ID.
[**get**](LedgervoucherApi.md#get) | **GET** /ledger/voucher/{id} | Get voucher by ID.
[**import_document**](LedgervoucherApi.md#import_document) | **POST** /ledger/voucher/importDocument | [BETA] Upload a document to create one or more vouchers. Valid document formats are PDF, PNG, JPEG, TIFF and EHF. Send as multipart form.
[**import_gbat10**](LedgervoucherApi.md#import_gbat10) | **POST** /ledger/voucher/importGbat10 | Import GBAT10. Send as multipart form.
[**non_posted**](LedgervoucherApi.md#non_posted) | **GET** /ledger/voucher/&gt;nonPosted | [BETA] Find non-posted vouchers.
[**post**](LedgervoucherApi.md#post) | **POST** /ledger/voucher | Add new voucher. IMPORTANT: Also creates postings. Only the gross amounts will be used
[**put**](LedgervoucherApi.md#put) | **PUT** /ledger/voucher/{id} | [BETA] Update voucher. Postings with guiRow&#x3D;&#x3D;0 will be deleted and regenerated.
[**put_list**](LedgervoucherApi.md#put_list) | **PUT** /ledger/voucher/list | [BETA] Update multiple vouchers. Postings with guiRow&#x3D;&#x3D;0 will be deleted and regenerated.
[**reverse**](LedgervoucherApi.md#reverse) | **PUT** /ledger/voucher/{id}/:reverse | Reverses the voucher, and returns the reversed voucher. Supports reversing most voucher types, except salary transactions.
[**search**](LedgervoucherApi.md#search) | **GET** /ledger/voucher | Find vouchers corresponding with sent data.
[**send_to_inbox**](LedgervoucherApi.md#send_to_inbox) | **PUT** /ledger/voucher/{id}/:sendToInbox | [BETA] Send voucher to inbox.
[**send_to_ledger**](LedgervoucherApi.md#send_to_ledger) | **PUT** /ledger/voucher/{id}/:sendToLedger | [BETA] Send voucher to ledger.
[**upload_pdf**](LedgervoucherApi.md#upload_pdf) | **POST** /ledger/voucher/{voucherId}/pdf/{fileName} | Upload attachment to voucher. Send as multipart form.


# **delete**
> delete(id)

[BETA] Delete voucher by ID.



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

api_instance = TripletexApi::LedgervoucherApi.new

id = 56 # Integer | Element ID


begin
  #[BETA] Delete voucher by ID.
  api_instance.delete(id)
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->delete: #{e}"
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



# **download_pdf**
> String download_pdf(voucher_id)

Get attachment by voucher ID.



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

api_instance = TripletexApi::LedgervoucherApi.new

voucher_id = 56 # Integer | Voucher ID from which PDF is downloaded.


begin
  #Get attachment by voucher ID.
  result = api_instance.download_pdf(voucher_id)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->download_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **voucher_id** | **Integer**| Voucher ID from which PDF is downloaded. | 

### Return type

**String**

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/octet-stream



# **get**
> ResponseWrapperVoucher get(id, opts)

Get voucher by ID.



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

api_instance = TripletexApi::LedgervoucherApi.new

id = 56 # Integer | Element ID

opts = { 
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Get voucher by ID.
  result = api_instance.get(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ResponseWrapperVoucher**](ResponseWrapperVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **import_document**
> ListResponseVoucher import_document(file, opts)

[BETA] Upload a document to create one or more vouchers. Valid document formats are PDF, PNG, JPEG, TIFF and EHF. Send as multipart form.



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

api_instance = TripletexApi::LedgervoucherApi.new

file = File.new("/path/to/file.txt") # File | The file

opts = { 
  description: "description_example", # String | Optional description to use for the voucher(s). If omitted the file name will be used.
  split: false # BOOLEAN | If the document consists of several pages, should the document be split into one voucher per page?
}

begin
  #[BETA] Upload a document to create one or more vouchers. Valid document formats are PDF, PNG, JPEG, TIFF and EHF. Send as multipart form.
  result = api_instance.import_document(file, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->import_document: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **File**| The file | 
 **description** | **String**| Optional description to use for the voucher(s). If omitted the file name will be used. | [optional] 
 **split** | **BOOLEAN**| If the document consists of several pages, should the document be split into one voucher per page? | [optional] [default to false]

### Return type

[**ListResponseVoucher**](ListResponseVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



# **import_gbat10**
> import_gbat10(generate_vat_postings, file, opts)

Import GBAT10. Send as multipart form.



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

api_instance = TripletexApi::LedgervoucherApi.new

generate_vat_postings = true # BOOLEAN | If the import should generate VAT postings

file = File.new("/path/to/file.txt") # File | The file

opts = { 
  encoding: "utf-8" # String | The file encoding
}

begin
  #Import GBAT10. Send as multipart form.
  api_instance.import_gbat10(generate_vat_postings, file, opts)
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->import_gbat10: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **generate_vat_postings** | **BOOLEAN**| If the import should generate VAT postings | 
 **file** | **File**| The file | 
 **encoding** | **String**| The file encoding | [optional] [default to utf-8]

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



# **non_posted**
> ListResponseVoucher non_posted(include_non_approved, opts)

[BETA] Find non-posted vouchers.



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

api_instance = TripletexApi::LedgervoucherApi.new

include_non_approved = false # BOOLEAN | Include non-approved vouchers in the result.

opts = { 
  date_from: "date_from_example", # String | From and including
  date_to: "date_to_example", # String | To and excluding
  changed_since: "changed_since_example", # String | Only return elements that have changed since this date and time
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #[BETA] Find non-posted vouchers.
  result = api_instance.non_posted(include_non_approved, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->non_posted: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **include_non_approved** | **BOOLEAN**| Include non-approved vouchers in the result. | [default to false]
 **date_from** | **String**| From and including | [optional] 
 **date_to** | **String**| To and excluding | [optional] 
 **changed_since** | **String**| Only return elements that have changed since this date and time | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**ListResponseVoucher**](ListResponseVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **post**
> ResponseWrapperVoucher post(opts)

Add new voucher. IMPORTANT: Also creates postings. Only the gross amounts will be used



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

api_instance = TripletexApi::LedgervoucherApi.new

opts = { 
  send_to_ledger: true, # BOOLEAN | Should the voucher be sent to ledger? Requires the \"Advanced Voucher\" permission.
  body: TripletexApi::Voucher.new # Voucher | JSON representing the new object to be created. Should not have ID and version set.
}

begin
  #Add new voucher. IMPORTANT: Also creates postings. Only the gross amounts will be used
  result = api_instance.post(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **send_to_ledger** | **BOOLEAN**| Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission. | [optional] [default to true]
 **body** | [**Voucher**](Voucher.md)| JSON representing the new object to be created. Should not have ID and version set. | [optional] 

### Return type

[**ResponseWrapperVoucher**](ResponseWrapperVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put**
> ResponseWrapperVoucher put(id, opts)

[BETA] Update voucher. Postings with guiRow==0 will be deleted and regenerated.



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

api_instance = TripletexApi::LedgervoucherApi.new

id = 56 # Integer | Element ID

opts = { 
  send_to_ledger: true, # BOOLEAN | Should the voucher be sent to ledger? Requires the \"Advanced Voucher\" permission.
  body: TripletexApi::Voucher.new # Voucher | Partial object describing what should be updated
}

begin
  #[BETA] Update voucher. Postings with guiRow==0 will be deleted and regenerated.
  result = api_instance.put(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| Element ID | 
 **send_to_ledger** | **BOOLEAN**| Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission. | [optional] [default to true]
 **body** | [**Voucher**](Voucher.md)| Partial object describing what should be updated | [optional] 

### Return type

[**ResponseWrapperVoucher**](ResponseWrapperVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **put_list**
> ListResponseVoucher put_list(opts)

[BETA] Update multiple vouchers. Postings with guiRow==0 will be deleted and regenerated.



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

api_instance = TripletexApi::LedgervoucherApi.new

opts = { 
  send_to_ledger: true, # BOOLEAN | Should the voucher be sent to ledger? Requires the \"Advanced Voucher\" permission.
  body: [TripletexApi::Voucher.new] # Array<Voucher> | JSON representing updates to object. Should have ID and version set.
}

begin
  #[BETA] Update multiple vouchers. Postings with guiRow==0 will be deleted and regenerated.
  result = api_instance.put_list(opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->put_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **send_to_ledger** | **BOOLEAN**| Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission. | [optional] [default to true]
 **body** | [**Array&lt;Voucher&gt;**](Voucher.md)| JSON representing updates to object. Should have ID and version set. | [optional] 

### Return type

[**ListResponseVoucher**](ListResponseVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: application/json; charset=utf-8
 - **Accept**: Not defined



# **reverse**
> ResponseWrapperVoucher reverse(id, date)

Reverses the voucher, and returns the reversed voucher. Supports reversing most voucher types, except salary transactions.



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

api_instance = TripletexApi::LedgervoucherApi.new

id = 56 # Integer | ID of voucher that should be reversed.

date = "date_example" # String | Reverse voucher date


begin
  #Reverses the voucher, and returns the reversed voucher. Supports reversing most voucher types, except salary transactions.
  result = api_instance.reverse(id, date)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->reverse: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| ID of voucher that should be reversed. | 
 **date** | **String**| Reverse voucher date | 

### Return type

[**ResponseWrapperVoucher**](ResponseWrapperVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **search**
> VoucherSearchResponse search(date_from, date_to, opts)

Find vouchers corresponding with sent data.



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

api_instance = TripletexApi::LedgervoucherApi.new

date_from = "date_from_example" # String | From and including

date_to = "date_to_example" # String | To and excluding

opts = { 
  id: "id_example", # String | List of IDs
  number: "number_example", # String | List of IDs
  number_from: 56, # Integer | From and including
  number_to: 56, # Integer | To and excluding
  type_id: "type_id_example", # String | List of IDs
  from: 0, # Integer | From index
  count: 1000, # Integer | Number of elements to return
  sorting: "sorting_example", # String | Sorting pattern
  fields: "fields_example" # String | Fields filter pattern
}

begin
  #Find vouchers corresponding with sent data.
  result = api_instance.search(date_from, date_to, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **date_from** | **String**| From and including | 
 **date_to** | **String**| To and excluding | 
 **id** | **String**| List of IDs | [optional] 
 **number** | **String**| List of IDs | [optional] 
 **number_from** | **Integer**| From and including | [optional] 
 **number_to** | **Integer**| To and excluding | [optional] 
 **type_id** | **String**| List of IDs | [optional] 
 **from** | **Integer**| From index | [optional] [default to 0]
 **count** | **Integer**| Number of elements to return | [optional] [default to 1000]
 **sorting** | **String**| Sorting pattern | [optional] 
 **fields** | **String**| Fields filter pattern | [optional] 

### Return type

[**VoucherSearchResponse**](VoucherSearchResponse.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **send_to_inbox**
> ResponseWrapperVoucher send_to_inbox(id, opts)

[BETA] Send voucher to inbox.



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

api_instance = TripletexApi::LedgervoucherApi.new

id = 56 # Integer | ID of voucher that should be sent to inbox.

opts = { 
  version: 56, # Integer | Version of voucher that should be sent to inbox.
  comment: "comment_example" # String | Description of why the voucher was rejected. This parameter is only used if the approval feature is enabled.
}

begin
  #[BETA] Send voucher to inbox.
  result = api_instance.send_to_inbox(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->send_to_inbox: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| ID of voucher that should be sent to inbox. | 
 **version** | **Integer**| Version of voucher that should be sent to inbox. | [optional] 
 **comment** | **String**| Description of why the voucher was rejected. This parameter is only used if the approval feature is enabled. | [optional] 

### Return type

[**ResponseWrapperVoucher**](ResponseWrapperVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **send_to_ledger**
> ResponseWrapperVoucher send_to_ledger(id, opts)

[BETA] Send voucher to ledger.



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

api_instance = TripletexApi::LedgervoucherApi.new

id = 56 # Integer | ID of voucher that should be sent to ledger.

opts = { 
  version: 56, # Integer | Version of voucher that should be sent to ledger.
  number: 0 # Integer | Voucher number to use. If omitted or 0 the system will assign the number.
}

begin
  #[BETA] Send voucher to ledger.
  result = api_instance.send_to_ledger(id, opts)
  p result
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->send_to_ledger: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **Integer**| ID of voucher that should be sent to ledger. | 
 **version** | **Integer**| Version of voucher that should be sent to ledger. | [optional] 
 **number** | **Integer**| Voucher number to use. If omitted or 0 the system will assign the number. | [optional] [default to 0]

### Return type

[**ResponseWrapperVoucher**](ResponseWrapperVoucher.md)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined



# **upload_pdf**
> upload_pdf(voucher_id, file_name, file)

Upload attachment to voucher. Send as multipart form.



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

api_instance = TripletexApi::LedgervoucherApi.new

voucher_id = 56 # Integer | Voucher ID to upload PDF to.

file_name = "file_name_example" # String | File name to store the pdf under. Will not be the same as the filename on the file returned.

file = File.new("/path/to/file.txt") # File | The file


begin
  #Upload attachment to voucher. Send as multipart form.
  api_instance.upload_pdf(voucher_id, file_name, file)
rescue TripletexApi::ApiError => e
  puts "Exception when calling LedgervoucherApi->upload_pdf: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **voucher_id** | **Integer**| Voucher ID to upload PDF to. | 
 **file_name** | **String**| File name to store the pdf under. Will not be the same as the filename on the file returned. | 
 **file** | **File**| The file | 

### Return type

nil (empty response body)

### Authorization

[tokenAuthScheme](../README.md#tokenAuthScheme)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: Not defined



