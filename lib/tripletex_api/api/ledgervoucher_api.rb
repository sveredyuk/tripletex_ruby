=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/sveredyuk/tripletex_ruby). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.32.0

Generated by: https://github.com/sveredyuk/tripletex_ruby.git
Swagger Codegen version: 2.3.1

=end

require "uri"

module TripletexApi
  class LedgervoucherApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # [BETA] Delete voucher by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete(id, opts = {})
      delete_with_http_info(id, opts)
      return nil
    end

    # [BETA] Delete voucher by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.delete ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling LedgervoucherApi.delete"
      end
      # resource path
      local_var_path = "/ledger/voucher/{id}".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get attachment by voucher ID.
    # 
    # @param voucher_id Voucher ID from which PDF is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [String]
    def download_pdf(voucher_id, opts = {})
      data, _status_code, _headers = download_pdf_with_http_info(voucher_id, opts)
      return data
    end

    # Get attachment by voucher ID.
    # 
    # @param voucher_id Voucher ID from which PDF is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def download_pdf_with_http_info(voucher_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.download_pdf ..."
      end
      # verify the required parameter 'voucher_id' is set
      if @api_client.config.client_side_validation && voucher_id.nil?
        fail ArgumentError, "Missing the required parameter 'voucher_id' when calling LedgervoucherApi.download_pdf"
      end
      # resource path
      local_var_path = "/ledger/voucher/{voucherId}/pdf".sub('{' + 'voucherId' + '}', voucher_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/octet-stream'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'String')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#download_pdf\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get voucher by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperVoucher]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      return data
    end

    # Get voucher by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperVoucher, Fixnum, Hash)>] ResponseWrapperVoucher data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.get ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling LedgervoucherApi.get"
      end
      # resource path
      local_var_path = "/ledger/voucher/{id}".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'fields'] = opts[:'fields'] if !opts[:'fields'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Upload a document to create one or more vouchers. Valid document formats are PDF, PNG, JPEG, TIFF and EHF. Send as multipart form.
    # 
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @option opts [String] :description Optional description to use for the voucher(s). If omitted the file name will be used.
    # @option opts [BOOLEAN] :split If the document consists of several pages, should the document be split into one voucher per page? (default to false)
    # @return [ListResponseVoucher]
    def import_document(file, opts = {})
      data, _status_code, _headers = import_document_with_http_info(file, opts)
      return data
    end

    # [BETA] Upload a document to create one or more vouchers. Valid document formats are PDF, PNG, JPEG, TIFF and EHF. Send as multipart form.
    # 
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @option opts [String] :description Optional description to use for the voucher(s). If omitted the file name will be used.
    # @option opts [BOOLEAN] :split If the document consists of several pages, should the document be split into one voucher per page?
    # @return [Array<(ListResponseVoucher, Fixnum, Hash)>] ListResponseVoucher data, response status code and response headers
    def import_document_with_http_info(file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.import_document ..."
      end
      # verify the required parameter 'file' is set
      if @api_client.config.client_side_validation && file.nil?
        fail ArgumentError, "Missing the required parameter 'file' when calling LedgervoucherApi.import_document"
      end
      # resource path
      local_var_path = "/ledger/voucher/importDocument"

      # query parameters
      query_params = {}
      query_params[:'split'] = opts[:'split'] if !opts[:'split'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params["file"] = file
      form_params["description"] = opts[:'description'] if !opts[:'description'].nil?

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListResponseVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#import_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Import GBAT10. Send as multipart form.
    # 
    # @param generate_vat_postings If the import should generate VAT postings
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @option opts [String] :encoding The file encoding (default to utf-8)
    # @return [nil]
    def import_gbat10(generate_vat_postings, file, opts = {})
      import_gbat10_with_http_info(generate_vat_postings, file, opts)
      return nil
    end

    # Import GBAT10. Send as multipart form.
    # 
    # @param generate_vat_postings If the import should generate VAT postings
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @option opts [String] :encoding The file encoding
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def import_gbat10_with_http_info(generate_vat_postings, file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.import_gbat10 ..."
      end
      # verify the required parameter 'generate_vat_postings' is set
      if @api_client.config.client_side_validation && generate_vat_postings.nil?
        fail ArgumentError, "Missing the required parameter 'generate_vat_postings' when calling LedgervoucherApi.import_gbat10"
      end
      # verify the required parameter 'file' is set
      if @api_client.config.client_side_validation && file.nil?
        fail ArgumentError, "Missing the required parameter 'file' when calling LedgervoucherApi.import_gbat10"
      end
      # resource path
      local_var_path = "/ledger/voucher/importGbat10"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params["generateVatPostings"] = generate_vat_postings
      form_params["file"] = file
      form_params["encoding"] = opts[:'encoding'] if !opts[:'encoding'].nil?

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#import_gbat10\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Find non-posted vouchers.
    # 
    # @param include_non_approved Include non-approved vouchers in the result.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :date_from From and including
    # @option opts [String] :date_to To and excluding
    # @option opts [String] :changed_since Only return elements that have changed since this date and time
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseVoucher]
    def non_posted(include_non_approved, opts = {})
      data, _status_code, _headers = non_posted_with_http_info(include_non_approved, opts)
      return data
    end

    # [BETA] Find non-posted vouchers.
    # 
    # @param include_non_approved Include non-approved vouchers in the result.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :date_from From and including
    # @option opts [String] :date_to To and excluding
    # @option opts [String] :changed_since Only return elements that have changed since this date and time
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseVoucher, Fixnum, Hash)>] ListResponseVoucher data, response status code and response headers
    def non_posted_with_http_info(include_non_approved, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.non_posted ..."
      end
      # verify the required parameter 'include_non_approved' is set
      if @api_client.config.client_side_validation && include_non_approved.nil?
        fail ArgumentError, "Missing the required parameter 'include_non_approved' when calling LedgervoucherApi.non_posted"
      end
      # resource path
      local_var_path = "/ledger/voucher/>nonPosted"

      # query parameters
      query_params = {}
      query_params[:'includeNonApproved'] = include_non_approved
      query_params[:'dateFrom'] = opts[:'date_from'] if !opts[:'date_from'].nil?
      query_params[:'dateTo'] = opts[:'date_to'] if !opts[:'date_to'].nil?
      query_params[:'changedSince'] = opts[:'changed_since'] if !opts[:'changed_since'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'sorting'] = opts[:'sorting'] if !opts[:'sorting'].nil?
      query_params[:'fields'] = opts[:'fields'] if !opts[:'fields'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListResponseVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#non_posted\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Add new voucher. IMPORTANT: Also creates postings. Only the gross amounts will be used
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :send_to_ledger Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission. (default to true)
    # @option opts [Voucher] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [ResponseWrapperVoucher]
    def post(opts = {})
      data, _status_code, _headers = post_with_http_info(opts)
      return data
    end

    # Add new voucher. IMPORTANT: Also creates postings. Only the gross amounts will be used
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :send_to_ledger Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission.
    # @option opts [Voucher] :body JSON representing the new object to be created. Should not have ID and version set.
    # @return [Array<(ResponseWrapperVoucher, Fixnum, Hash)>] ResponseWrapperVoucher data, response status code and response headers
    def post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.post ..."
      end
      # resource path
      local_var_path = "/ledger/voucher"

      # query parameters
      query_params = {}
      query_params[:'sendToLedger'] = opts[:'send_to_ledger'] if !opts[:'send_to_ledger'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Update voucher. Postings with guiRow==0 will be deleted and regenerated.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :send_to_ledger Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission. (default to true)
    # @option opts [Voucher] :body Partial object describing what should be updated
    # @return [ResponseWrapperVoucher]
    def put(id, opts = {})
      data, _status_code, _headers = put_with_http_info(id, opts)
      return data
    end

    # [BETA] Update voucher. Postings with guiRow&#x3D;&#x3D;0 will be deleted and regenerated.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :send_to_ledger Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission.
    # @option opts [Voucher] :body Partial object describing what should be updated
    # @return [Array<(ResponseWrapperVoucher, Fixnum, Hash)>] ResponseWrapperVoucher data, response status code and response headers
    def put_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.put ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling LedgervoucherApi.put"
      end
      # resource path
      local_var_path = "/ledger/voucher/{id}".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'sendToLedger'] = opts[:'send_to_ledger'] if !opts[:'send_to_ledger'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Update multiple vouchers. Postings with guiRow==0 will be deleted and regenerated.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :send_to_ledger Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission. (default to true)
    # @option opts [Array<Voucher>] :body JSON representing updates to object. Should have ID and version set.
    # @return [ListResponseVoucher]
    def put_list(opts = {})
      data, _status_code, _headers = put_list_with_http_info(opts)
      return data
    end

    # [BETA] Update multiple vouchers. Postings with guiRow&#x3D;&#x3D;0 will be deleted and regenerated.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :send_to_ledger Should the voucher be sent to ledger? Requires the \&quot;Advanced Voucher\&quot; permission.
    # @option opts [Array<Voucher>] :body JSON representing updates to object. Should have ID and version set.
    # @return [Array<(ListResponseVoucher, Fixnum, Hash)>] ListResponseVoucher data, response status code and response headers
    def put_list_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.put_list ..."
      end
      # resource path
      local_var_path = "/ledger/voucher/list"

      # query parameters
      query_params = {}
      query_params[:'sendToLedger'] = opts[:'send_to_ledger'] if !opts[:'send_to_ledger'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json; charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(opts[:'body'])
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ListResponseVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#put_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reverses the voucher, and returns the reversed voucher. Supports reversing most voucher types, except salary transactions.
    # 
    # @param id ID of voucher that should be reversed.
    # @param date Reverse voucher date
    # @param [Hash] opts the optional parameters
    # @return [ResponseWrapperVoucher]
    def reverse(id, date, opts = {})
      data, _status_code, _headers = reverse_with_http_info(id, date, opts)
      return data
    end

    # Reverses the voucher, and returns the reversed voucher. Supports reversing most voucher types, except salary transactions.
    # 
    # @param id ID of voucher that should be reversed.
    # @param date Reverse voucher date
    # @param [Hash] opts the optional parameters
    # @return [Array<(ResponseWrapperVoucher, Fixnum, Hash)>] ResponseWrapperVoucher data, response status code and response headers
    def reverse_with_http_info(id, date, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.reverse ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling LedgervoucherApi.reverse"
      end
      # verify the required parameter 'date' is set
      if @api_client.config.client_side_validation && date.nil?
        fail ArgumentError, "Missing the required parameter 'date' when calling LedgervoucherApi.reverse"
      end
      # resource path
      local_var_path = "/ledger/voucher/{id}/:reverse".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'date'] = date

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#reverse\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find vouchers corresponding with sent data.
    # 
    # @param date_from From and including
    # @param date_to To and excluding
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :number List of IDs
    # @option opts [Integer] :number_from From and including
    # @option opts [Integer] :number_to To and excluding
    # @option opts [String] :type_id List of IDs
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [VoucherSearchResponse]
    def search(date_from, date_to, opts = {})
      data, _status_code, _headers = search_with_http_info(date_from, date_to, opts)
      return data
    end

    # Find vouchers corresponding with sent data.
    # 
    # @param date_from From and including
    # @param date_to To and excluding
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :number List of IDs
    # @option opts [Integer] :number_from From and including
    # @option opts [Integer] :number_to To and excluding
    # @option opts [String] :type_id List of IDs
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(VoucherSearchResponse, Fixnum, Hash)>] VoucherSearchResponse data, response status code and response headers
    def search_with_http_info(date_from, date_to, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.search ..."
      end
      # verify the required parameter 'date_from' is set
      if @api_client.config.client_side_validation && date_from.nil?
        fail ArgumentError, "Missing the required parameter 'date_from' when calling LedgervoucherApi.search"
      end
      # verify the required parameter 'date_to' is set
      if @api_client.config.client_side_validation && date_to.nil?
        fail ArgumentError, "Missing the required parameter 'date_to' when calling LedgervoucherApi.search"
      end
      # resource path
      local_var_path = "/ledger/voucher"

      # query parameters
      query_params = {}
      query_params[:'dateFrom'] = date_from
      query_params[:'dateTo'] = date_to
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'number'] = opts[:'number'] if !opts[:'number'].nil?
      query_params[:'numberFrom'] = opts[:'number_from'] if !opts[:'number_from'].nil?
      query_params[:'numberTo'] = opts[:'number_to'] if !opts[:'number_to'].nil?
      query_params[:'typeId'] = opts[:'type_id'] if !opts[:'type_id'].nil?
      query_params[:'from'] = opts[:'from'] if !opts[:'from'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'sorting'] = opts[:'sorting'] if !opts[:'sorting'].nil?
      query_params[:'fields'] = opts[:'fields'] if !opts[:'fields'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'VoucherSearchResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Send voucher to inbox.
    # 
    # @param id ID of voucher that should be sent to inbox.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :version Version of voucher that should be sent to inbox.
    # @option opts [String] :comment Description of why the voucher was rejected. This parameter is only used if the approval feature is enabled.
    # @return [ResponseWrapperVoucher]
    def send_to_inbox(id, opts = {})
      data, _status_code, _headers = send_to_inbox_with_http_info(id, opts)
      return data
    end

    # [BETA] Send voucher to inbox.
    # 
    # @param id ID of voucher that should be sent to inbox.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :version Version of voucher that should be sent to inbox.
    # @option opts [String] :comment Description of why the voucher was rejected. This parameter is only used if the approval feature is enabled.
    # @return [Array<(ResponseWrapperVoucher, Fixnum, Hash)>] ResponseWrapperVoucher data, response status code and response headers
    def send_to_inbox_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.send_to_inbox ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling LedgervoucherApi.send_to_inbox"
      end
      if @api_client.config.client_side_validation && !opts[:'version'].nil? && opts[:'version'] < 0
        fail ArgumentError, 'invalid value for "opts[:"version"]" when calling LedgervoucherApi.send_to_inbox, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = "/ledger/voucher/{id}/:sendToInbox".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'version'] = opts[:'version'] if !opts[:'version'].nil?
      query_params[:'comment'] = opts[:'comment'] if !opts[:'comment'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#send_to_inbox\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Send voucher to ledger.
    # 
    # @param id ID of voucher that should be sent to ledger.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :version Version of voucher that should be sent to ledger.
    # @option opts [Integer] :number Voucher number to use. If omitted or 0 the system will assign the number. (default to 0)
    # @return [ResponseWrapperVoucher]
    def send_to_ledger(id, opts = {})
      data, _status_code, _headers = send_to_ledger_with_http_info(id, opts)
      return data
    end

    # [BETA] Send voucher to ledger.
    # 
    # @param id ID of voucher that should be sent to ledger.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :version Version of voucher that should be sent to ledger.
    # @option opts [Integer] :number Voucher number to use. If omitted or 0 the system will assign the number.
    # @return [Array<(ResponseWrapperVoucher, Fixnum, Hash)>] ResponseWrapperVoucher data, response status code and response headers
    def send_to_ledger_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.send_to_ledger ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling LedgervoucherApi.send_to_ledger"
      end
      if @api_client.config.client_side_validation && !opts[:'version'].nil? && opts[:'version'] < 0
        fail ArgumentError, 'invalid value for "opts[:"version"]" when calling LedgervoucherApi.send_to_ledger, must be greater than or equal to 0.'
      end

      if @api_client.config.client_side_validation && !opts[:'number'].nil? && opts[:'number'] < 0
        fail ArgumentError, 'invalid value for "opts[:"number"]" when calling LedgervoucherApi.send_to_ledger, must be greater than or equal to 0.'
      end

      # resource path
      local_var_path = "/ledger/voucher/{id}/:sendToLedger".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'version'] = opts[:'version'] if !opts[:'version'].nil?
      query_params[:'number'] = opts[:'number'] if !opts[:'number'].nil?

      # header parameters
      header_params = {}

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ResponseWrapperVoucher')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#send_to_ledger\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Upload attachment to voucher. Send as multipart form.
    # 
    # @param voucher_id Voucher ID to upload PDF to.
    # @param file_name File name to store the pdf under. Will not be the same as the filename on the file returned.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def upload_pdf(voucher_id, file_name, file, opts = {})
      upload_pdf_with_http_info(voucher_id, file_name, file, opts)
      return nil
    end

    # Upload attachment to voucher. Send as multipart form.
    # 
    # @param voucher_id Voucher ID to upload PDF to.
    # @param file_name File name to store the pdf under. Will not be the same as the filename on the file returned.
    # @param file The file
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def upload_pdf_with_http_info(voucher_id, file_name, file, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LedgervoucherApi.upload_pdf ..."
      end
      # verify the required parameter 'voucher_id' is set
      if @api_client.config.client_side_validation && voucher_id.nil?
        fail ArgumentError, "Missing the required parameter 'voucher_id' when calling LedgervoucherApi.upload_pdf"
      end
      # verify the required parameter 'file_name' is set
      if @api_client.config.client_side_validation && file_name.nil?
        fail ArgumentError, "Missing the required parameter 'file_name' when calling LedgervoucherApi.upload_pdf"
      end
      # verify the required parameter 'file' is set
      if @api_client.config.client_side_validation && file.nil?
        fail ArgumentError, "Missing the required parameter 'file' when calling LedgervoucherApi.upload_pdf"
      end
      # resource path
      local_var_path = "/ledger/voucher/{voucherId}/pdf/{fileName}".sub('{' + 'voucherId' + '}', voucher_id.to_s).sub('{' + 'fileName' + '}', file_name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params["file"] = file

      # http body (model)
      post_body = nil
      auth_names = ['tokenAuthScheme']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LedgervoucherApi#upload_pdf\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
