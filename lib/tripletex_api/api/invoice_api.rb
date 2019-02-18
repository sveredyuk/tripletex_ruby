=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/sveredyuk/tripletex_ruby). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.32.0

Generated by: https://github.com/sveredyuk/tripletex_ruby.git
Swagger Codegen version: 2.3.1

=end

require "uri"

module TripletexApi
  class InvoiceApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # [BETA] Creates a new Invoice representing a credit memo that nullifies the given invoice. Updates this invoice and any pre-existing inverse invoice.
    # 
    # @param id Invoice id
    # @param date Credit note date
    # @param [Hash] opts the optional parameters
    # @option opts [String] :comment Comment
    # @option opts [String] :credit_note_email The credit note will be sent electronically if this field is filled out
    # @return [ResponseWrapperInvoice]
    def create_credit_note(id, date, opts = {})
      data, _status_code, _headers = create_credit_note_with_http_info(id, date, opts)
      return data
    end

    # [BETA] Creates a new Invoice representing a credit memo that nullifies the given invoice. Updates this invoice and any pre-existing inverse invoice.
    # 
    # @param id Invoice id
    # @param date Credit note date
    # @param [Hash] opts the optional parameters
    # @option opts [String] :comment Comment
    # @option opts [String] :credit_note_email The credit note will be sent electronically if this field is filled out
    # @return [Array<(ResponseWrapperInvoice, Fixnum, Hash)>] ResponseWrapperInvoice data, response status code and response headers
    def create_credit_note_with_http_info(id, date, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.create_credit_note ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoiceApi.create_credit_note"
      end
      # verify the required parameter 'date' is set
      if @api_client.config.client_side_validation && date.nil?
        fail ArgumentError, "Missing the required parameter 'date' when calling InvoiceApi.create_credit_note"
      end
      # resource path
      local_var_path = "/invoice/{id}/:createCreditNote".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'date'] = date
      query_params[:'comment'] = opts[:'comment'] if !opts[:'comment'].nil?
      query_params[:'creditNoteEmail'] = opts[:'credit_note_email'] if !opts[:'credit_note_email'].nil?

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
        :return_type => 'ResponseWrapperInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoiceApi#create_credit_note\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Create invoice reminder and sends it by the given dispatch type. Supports the reminder types SOFT_REMINDER, REMINDER and NOTICE_OF_DEBT_COLLECTION. DispatchType NETS_PRINT must have type NOTICE_OF_DEBT_COLLECTION. SMS and NETS_PRINT must be activated prior to usage in the API.
    # 
    # @param id Element ID
    # @param type type
    # @param date yyyy-MM-dd. Defaults to today.
    # @param dispatch_type dispatchType
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :include_charge Equals (default to false)
    # @option opts [BOOLEAN] :include_interest Equals (default to false)
    # @option opts [String] :sms_number SMS number (must be a valid Norwegian telephone number)
    # @return [nil]
    def create_reminder(id, type, date, dispatch_type, opts = {})
      create_reminder_with_http_info(id, type, date, dispatch_type, opts)
      return nil
    end

    # [BETA] Create invoice reminder and sends it by the given dispatch type. Supports the reminder types SOFT_REMINDER, REMINDER and NOTICE_OF_DEBT_COLLECTION. DispatchType NETS_PRINT must have type NOTICE_OF_DEBT_COLLECTION. SMS and NETS_PRINT must be activated prior to usage in the API.
    # 
    # @param id Element ID
    # @param type type
    # @param date yyyy-MM-dd. Defaults to today.
    # @param dispatch_type dispatchType
    # @param [Hash] opts the optional parameters
    # @option opts [BOOLEAN] :include_charge Equals
    # @option opts [BOOLEAN] :include_interest Equals
    # @option opts [String] :sms_number SMS number (must be a valid Norwegian telephone number)
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def create_reminder_with_http_info(id, type, date, dispatch_type, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.create_reminder ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoiceApi.create_reminder"
      end
      # verify the required parameter 'type' is set
      if @api_client.config.client_side_validation && type.nil?
        fail ArgumentError, "Missing the required parameter 'type' when calling InvoiceApi.create_reminder"
      end
      # verify enum value
      if @api_client.config.client_side_validation && !['SOFT_REMINDER', 'REMINDER', 'NOTICE_OF_DEBT_COLLECTION', 'DEBT_COLLECTION'].include?(type)
        fail ArgumentError, "invalid value for 'type', must be one of SOFT_REMINDER, REMINDER, NOTICE_OF_DEBT_COLLECTION, DEBT_COLLECTION"
      end
      # verify the required parameter 'date' is set
      if @api_client.config.client_side_validation && date.nil?
        fail ArgumentError, "Missing the required parameter 'date' when calling InvoiceApi.create_reminder"
      end
      # verify the required parameter 'dispatch_type' is set
      if @api_client.config.client_side_validation && dispatch_type.nil?
        fail ArgumentError, "Missing the required parameter 'dispatch_type' when calling InvoiceApi.create_reminder"
      end
      # verify enum value
      if @api_client.config.client_side_validation && !['NETS_PRINT', 'EMAIL', 'SMS'].include?(dispatch_type)
        fail ArgumentError, "invalid value for 'dispatch_type', must be one of NETS_PRINT, EMAIL, SMS"
      end
      # resource path
      local_var_path = "/invoice/{id}/:createReminder".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'type'] = type
      query_params[:'date'] = date
      query_params[:'dispatchType'] = dispatch_type
      query_params[:'includeCharge'] = opts[:'include_charge'] if !opts[:'include_charge'].nil?
      query_params[:'includeInterest'] = opts[:'include_interest'] if !opts[:'include_interest'].nil?
      query_params[:'smsNumber'] = opts[:'sms_number'] if !opts[:'sms_number'].nil?

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
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoiceApi#create_reminder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get invoice document by invoice ID.
    # 
    # @param invoice_id Invoice ID from which PDF is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [String]
    def download_pdf(invoice_id, opts = {})
      data, _status_code, _headers = download_pdf_with_http_info(invoice_id, opts)
      return data
    end

    # Get invoice document by invoice ID.
    # 
    # @param invoice_id Invoice ID from which PDF is downloaded.
    # @param [Hash] opts the optional parameters
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def download_pdf_with_http_info(invoice_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.download_pdf ..."
      end
      # verify the required parameter 'invoice_id' is set
      if @api_client.config.client_side_validation && invoice_id.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_id' when calling InvoiceApi.download_pdf"
      end
      # resource path
      local_var_path = "/invoice/{invoiceId}/pdf".sub('{' + 'invoiceId' + '}', invoice_id.to_s)

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
        @api_client.config.logger.debug "API called: InvoiceApi#download_pdf\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get invoice by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [ResponseWrapperInvoice]
    def get(id, opts = {})
      data, _status_code, _headers = get_with_http_info(id, opts)
      return data
    end

    # Get invoice by ID.
    # 
    # @param id Element ID
    # @param [Hash] opts the optional parameters
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ResponseWrapperInvoice, Fixnum, Hash)>] ResponseWrapperInvoice data, response status code and response headers
    def get_with_http_info(id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.get ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoiceApi.get"
      end
      # resource path
      local_var_path = "/invoice/{id}".sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'ResponseWrapperInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoiceApi#get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Update invoice. The invoice is updated with payment information. The amount is in the invoice’s currency.
    # 
    # @param id Invoice id
    # @param payment_date Payment date
    # @param payment_type_id PaymentType id
    # @param paid_amount Amount paid by customer in the company currency, typically NOK.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :paid_amount_currency Amount paid by customer in the invoice currency. Optional, but required for invoices in alternate currencies.
    # @return [ResponseWrapperInvoice]
    def payment(id, payment_date, payment_type_id, paid_amount, opts = {})
      data, _status_code, _headers = payment_with_http_info(id, payment_date, payment_type_id, paid_amount, opts)
      return data
    end

    # Update invoice. The invoice is updated with payment information. The amount is in the invoice’s currency.
    # 
    # @param id Invoice id
    # @param payment_date Payment date
    # @param payment_type_id PaymentType id
    # @param paid_amount Amount paid by customer in the company currency, typically NOK.
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :paid_amount_currency Amount paid by customer in the invoice currency. Optional, but required for invoices in alternate currencies.
    # @return [Array<(ResponseWrapperInvoice, Fixnum, Hash)>] ResponseWrapperInvoice data, response status code and response headers
    def payment_with_http_info(id, payment_date, payment_type_id, paid_amount, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.payment ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoiceApi.payment"
      end
      # verify the required parameter 'payment_date' is set
      if @api_client.config.client_side_validation && payment_date.nil?
        fail ArgumentError, "Missing the required parameter 'payment_date' when calling InvoiceApi.payment"
      end
      # verify the required parameter 'payment_type_id' is set
      if @api_client.config.client_side_validation && payment_type_id.nil?
        fail ArgumentError, "Missing the required parameter 'payment_type_id' when calling InvoiceApi.payment"
      end
      # verify the required parameter 'paid_amount' is set
      if @api_client.config.client_side_validation && paid_amount.nil?
        fail ArgumentError, "Missing the required parameter 'paid_amount' when calling InvoiceApi.payment"
      end
      # resource path
      local_var_path = "/invoice/{id}/:payment".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'paymentDate'] = payment_date
      query_params[:'paymentTypeId'] = payment_type_id
      query_params[:'paidAmount'] = paid_amount
      query_params[:'paidAmountCurrency'] = opts[:'paid_amount_currency'] if !opts[:'paid_amount_currency'].nil?

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
        :return_type => 'ResponseWrapperInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoiceApi#payment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create invoice.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Invoice] :body JSON representing the new object to be created. Should not have ID and version set.
    # @option opts [BOOLEAN] :send_to_customer Equals (default to true)
    # @option opts [Integer] :payment_type_id Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
    # @option opts [Float] :paid_amount Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
    # @return [ResponseWrapperInvoice]
    def post(opts = {})
      data, _status_code, _headers = post_with_http_info(opts)
      return data
    end

    # Create invoice.
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Invoice] :body JSON representing the new object to be created. Should not have ID and version set.
    # @option opts [BOOLEAN] :send_to_customer Equals
    # @option opts [Integer] :payment_type_id Payment type to register prepayment of the invoice. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
    # @option opts [Float] :paid_amount Paid amount to register prepayment of the invoice, in invoice currency. paymentTypeId and paidAmount are optional, but both must be provided if the invoice has already been paid.
    # @return [Array<(ResponseWrapperInvoice, Fixnum, Hash)>] ResponseWrapperInvoice data, response status code and response headers
    def post_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.post ..."
      end
      # resource path
      local_var_path = "/invoice"

      # query parameters
      query_params = {}
      query_params[:'sendToCustomer'] = opts[:'send_to_customer'] if !opts[:'send_to_customer'].nil?
      query_params[:'paymentTypeId'] = opts[:'payment_type_id'] if !opts[:'payment_type_id'].nil?
      query_params[:'paidAmount'] = opts[:'paid_amount'] if !opts[:'paid_amount'].nil?

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
        :return_type => 'ResponseWrapperInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoiceApi#post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find invoices corresponding with sent data. Includes charged outgoing invoices only.
    # 
    # @param invoice_date_from From and including
    # @param invoice_date_to To and excluding
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :invoice_number Equals
    # @option opts [String] :kid Equals
    # @option opts [String] :voucher_id Equals
    # @option opts [String] :customer_id Equals
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseInvoice]
    def search(invoice_date_from, invoice_date_to, opts = {})
      data, _status_code, _headers = search_with_http_info(invoice_date_from, invoice_date_to, opts)
      return data
    end

    # Find invoices corresponding with sent data. Includes charged outgoing invoices only.
    # 
    # @param invoice_date_from From and including
    # @param invoice_date_to To and excluding
    # @param [Hash] opts the optional parameters
    # @option opts [String] :id List of IDs
    # @option opts [String] :invoice_number Equals
    # @option opts [String] :kid Equals
    # @option opts [String] :voucher_id Equals
    # @option opts [String] :customer_id Equals
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseInvoice, Fixnum, Hash)>] ListResponseInvoice data, response status code and response headers
    def search_with_http_info(invoice_date_from, invoice_date_to, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.search ..."
      end
      # verify the required parameter 'invoice_date_from' is set
      if @api_client.config.client_side_validation && invoice_date_from.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_date_from' when calling InvoiceApi.search"
      end
      # verify the required parameter 'invoice_date_to' is set
      if @api_client.config.client_side_validation && invoice_date_to.nil?
        fail ArgumentError, "Missing the required parameter 'invoice_date_to' when calling InvoiceApi.search"
      end
      # resource path
      local_var_path = "/invoice"

      # query parameters
      query_params = {}
      query_params[:'invoiceDateFrom'] = invoice_date_from
      query_params[:'invoiceDateTo'] = invoice_date_to
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'invoiceNumber'] = opts[:'invoice_number'] if !opts[:'invoice_number'].nil?
      query_params[:'kid'] = opts[:'kid'] if !opts[:'kid'].nil?
      query_params[:'voucherId'] = opts[:'voucher_id'] if !opts[:'voucher_id'].nil?
      query_params[:'customerId'] = opts[:'customer_id'] if !opts[:'customer_id'].nil?
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
        :return_type => 'ListResponseInvoice')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoiceApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # [BETA] Send invoice by ID and sendType. Optionally override email recipient.
    # 
    # @param id Element ID
    # @param send_type SendType
    # @param [Hash] opts the optional parameters
    # @option opts [String] :override_email_address Will override email address if sendType &#x3D; EMAIL
    # @return [nil]
    def send(id, send_type, opts = {})
      send_with_http_info(id, send_type, opts)
      return nil
    end

    # [BETA] Send invoice by ID and sendType. Optionally override email recipient.
    # 
    # @param id Element ID
    # @param send_type SendType
    # @param [Hash] opts the optional parameters
    # @option opts [String] :override_email_address Will override email address if sendType &#x3D; EMAIL
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def send_with_http_info(id, send_type, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InvoiceApi.send ..."
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoiceApi.send"
      end
      # verify the required parameter 'send_type' is set
      if @api_client.config.client_side_validation && send_type.nil?
        fail ArgumentError, "Missing the required parameter 'send_type' when calling InvoiceApi.send"
      end
      # verify enum value
      if @api_client.config.client_side_validation && !['EMAIL', 'EHF'].include?(send_type)
        fail ArgumentError, "invalid value for 'send_type', must be one of EMAIL, EHF"
      end
      # resource path
      local_var_path = "/invoice/{id}/:send".sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}
      query_params[:'sendType'] = send_type
      query_params[:'overrideEmailAddress'] = opts[:'override_email_address'] if !opts[:'override_email_address'].nil?

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
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InvoiceApi#send\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
