=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/sveredyuk/tripletex_ruby). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.32.0

Generated by: https://github.com/sveredyuk/tripletex_ruby.git
Swagger Codegen version: 2.3.1

=end

require "uri"

module TripletexApi
  class TimesheetweekApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Approve week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [ResponseWrapperWeek]
    def approve(opts = {})
      data, _status_code, _headers = approve_with_http_info(opts)
      return data
    end

    # Approve week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [Array<(ResponseWrapperWeek, Fixnum, Hash)>] ResponseWrapperWeek data, response status code and response headers
    def approve_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimesheetweekApi.approve ..."
      end
      # resource path
      local_var_path = "/timesheet/week/:approve"

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeId'] = opts[:'employee_id'] if !opts[:'employee_id'].nil?
      query_params[:'weekYear'] = opts[:'week_year'] if !opts[:'week_year'].nil?

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
        :return_type => 'ResponseWrapperWeek')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetweekApi#approve\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Complete week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [ResponseWrapperWeek]
    def complete(opts = {})
      data, _status_code, _headers = complete_with_http_info(opts)
      return data
    end

    # Complete week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [Array<(ResponseWrapperWeek, Fixnum, Hash)>] ResponseWrapperWeek data, response status code and response headers
    def complete_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimesheetweekApi.complete ..."
      end
      # resource path
      local_var_path = "/timesheet/week/:complete"

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeId'] = opts[:'employee_id'] if !opts[:'employee_id'].nil?
      query_params[:'weekYear'] = opts[:'week_year'] if !opts[:'week_year'].nil?

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
        :return_type => 'ResponseWrapperWeek')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetweekApi#complete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Reopen week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [ResponseWrapperWeek]
    def reopen(opts = {})
      data, _status_code, _headers = reopen_with_http_info(opts)
      return data
    end

    # Reopen week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [Array<(ResponseWrapperWeek, Fixnum, Hash)>] ResponseWrapperWeek data, response status code and response headers
    def reopen_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimesheetweekApi.reopen ..."
      end
      # resource path
      local_var_path = "/timesheet/week/:reopen"

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeId'] = opts[:'employee_id'] if !opts[:'employee_id'].nil?
      query_params[:'weekYear'] = opts[:'week_year'] if !opts[:'week_year'].nil?

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
        :return_type => 'ResponseWrapperWeek')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetweekApi#reopen\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find weekly status By ID, week/year combination, employeeId. or an approver
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :ids List of IDs
    # @option opts [String] :employee_ids List of IDs
    # @option opts [String] :week_year ISO-8601 week-year
    # @option opts [Integer] :approved_by Equals
    # @option opts [Integer] :from From index (default to 0)
    # @option opts [Integer] :count Number of elements to return (default to 1000)
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [ListResponseWeek]
    def search(opts = {})
      data, _status_code, _headers = search_with_http_info(opts)
      return data
    end

    # Find weekly status By ID, week/year combination, employeeId. or an approver
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :ids List of IDs
    # @option opts [String] :employee_ids List of IDs
    # @option opts [String] :week_year ISO-8601 week-year
    # @option opts [Integer] :approved_by Equals
    # @option opts [Integer] :from From index
    # @option opts [Integer] :count Number of elements to return
    # @option opts [String] :sorting Sorting pattern
    # @option opts [String] :fields Fields filter pattern
    # @return [Array<(ListResponseWeek, Fixnum, Hash)>] ListResponseWeek data, response status code and response headers
    def search_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimesheetweekApi.search ..."
      end
      # resource path
      local_var_path = "/timesheet/week"

      # query parameters
      query_params = {}
      query_params[:'ids'] = opts[:'ids'] if !opts[:'ids'].nil?
      query_params[:'employeeIds'] = opts[:'employee_ids'] if !opts[:'employee_ids'].nil?
      query_params[:'weekYear'] = opts[:'week_year'] if !opts[:'week_year'].nil?
      query_params[:'approvedBy'] = opts[:'approved_by'] if !opts[:'approved_by'].nil?
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
        :return_type => 'ListResponseWeek')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetweekApi#search\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Unapprove week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [ResponseWrapperWeek]
    def unapprove(opts = {})
      data, _status_code, _headers = unapprove_with_http_info(opts)
      return data
    end

    # Unapprove week. By ID or (ISO-8601 week and employeeId combination).
    # 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :id Equals
    # @option opts [Integer] :employee_id Equals
    # @option opts [String] :week_year ISO-8601 week-year
    # @return [Array<(ResponseWrapperWeek, Fixnum, Hash)>] ResponseWrapperWeek data, response status code and response headers
    def unapprove_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: TimesheetweekApi.unapprove ..."
      end
      # resource path
      local_var_path = "/timesheet/week/:unapprove"

      # query parameters
      query_params = {}
      query_params[:'id'] = opts[:'id'] if !opts[:'id'].nil?
      query_params[:'employeeId'] = opts[:'employee_id'] if !opts[:'employee_id'].nil?
      query_params[:'weekYear'] = opts[:'week_year'] if !opts[:'week_year'].nil?

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
        :return_type => 'ResponseWrapperWeek')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TimesheetweekApi#unapprove\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
