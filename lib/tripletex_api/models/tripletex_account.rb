=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/sveredyuk/tripletex_ruby). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.32.0

Generated by: https://github.com/sveredyuk/tripletex_ruby.git
Swagger Codegen version: 2.3.1

=end

require 'date'

module TripletexApi

  class TripletexAccount
    # Information about the company to create. Supply as much info as you have, but at least name, type and address.
    attr_accessor :company

    # Employee to create. Department on this object will also be created if supplied. If null a dummy user and department will be created instead
    attr_accessor :administrator

    # Is this a test account or a paying account?
    attr_accessor :account_type

    # Modules (functionality in the application) to activate for the newly created account. Some modules have extra costs.
    attr_accessor :modules

    # Password for the administrator user to create. Not a part of the administrator employee object since this is a value that never can be read (it is salted and hashed before storing)
    attr_accessor :administrator_password

    # Should the regular creation emails be sent to the company created and its users? If false you probably want to set autoValidateUserLogin to true
    attr_accessor :send_emails

    # If true, the users created will be allowed to log in without validating their email address. ONLY USE THIS IF YOU ALREADY HAVE VALIDATED THE USER EMAILS.
    attr_accessor :auto_validate_user_login

    # Create an API token for the administrator user for the consumer token used during this call. The token will be returned in the response.
    attr_accessor :create_administrator_api_token

    # Create an API token for the company to use to call their clients, only possible for accounting and auditor accounts. The token will be returned in the response.
    attr_accessor :create_company_owned_api_token

    # Should the company we are creating be able to create new Tripletex accounts?
    attr_accessor :may_create_tripletex_accounts

    # Used to calculate prices.
    attr_accessor :number_of_vouchers

    # The chart of accounts to use for the new company
    attr_accessor :chart_of_accounts_type

    attr_accessor :reseller

    attr_accessor :accounting_office

    attr_accessor :auditor

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'company' => :'company',
        :'administrator' => :'administrator',
        :'account_type' => :'accountType',
        :'modules' => :'modules',
        :'administrator_password' => :'administratorPassword',
        :'send_emails' => :'sendEmails',
        :'auto_validate_user_login' => :'autoValidateUserLogin',
        :'create_administrator_api_token' => :'createAdministratorApiToken',
        :'create_company_owned_api_token' => :'createCompanyOwnedApiToken',
        :'may_create_tripletex_accounts' => :'mayCreateTripletexAccounts',
        :'number_of_vouchers' => :'numberOfVouchers',
        :'chart_of_accounts_type' => :'chartOfAccountsType',
        :'reseller' => :'reseller',
        :'accounting_office' => :'accountingOffice',
        :'auditor' => :'auditor'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'company' => :'Company',
        :'administrator' => :'Employee',
        :'account_type' => :'String',
        :'modules' => :'Modules',
        :'administrator_password' => :'String',
        :'send_emails' => :'BOOLEAN',
        :'auto_validate_user_login' => :'BOOLEAN',
        :'create_administrator_api_token' => :'BOOLEAN',
        :'create_company_owned_api_token' => :'BOOLEAN',
        :'may_create_tripletex_accounts' => :'BOOLEAN',
        :'number_of_vouchers' => :'String',
        :'chart_of_accounts_type' => :'String',
        :'reseller' => :'BOOLEAN',
        :'accounting_office' => :'BOOLEAN',
        :'auditor' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'company')
        self.company = attributes[:'company']
      end

      if attributes.has_key?(:'administrator')
        self.administrator = attributes[:'administrator']
      end

      if attributes.has_key?(:'accountType')
        self.account_type = attributes[:'accountType']
      end

      if attributes.has_key?(:'modules')
        self.modules = attributes[:'modules']
      end

      if attributes.has_key?(:'administratorPassword')
        self.administrator_password = attributes[:'administratorPassword']
      end

      if attributes.has_key?(:'sendEmails')
        self.send_emails = attributes[:'sendEmails']
      else
        self.send_emails = false
      end

      if attributes.has_key?(:'autoValidateUserLogin')
        self.auto_validate_user_login = attributes[:'autoValidateUserLogin']
      else
        self.auto_validate_user_login = false
      end

      if attributes.has_key?(:'createAdministratorApiToken')
        self.create_administrator_api_token = attributes[:'createAdministratorApiToken']
      else
        self.create_administrator_api_token = false
      end

      if attributes.has_key?(:'createCompanyOwnedApiToken')
        self.create_company_owned_api_token = attributes[:'createCompanyOwnedApiToken']
      else
        self.create_company_owned_api_token = false
      end

      if attributes.has_key?(:'mayCreateTripletexAccounts')
        self.may_create_tripletex_accounts = attributes[:'mayCreateTripletexAccounts']
      else
        self.may_create_tripletex_accounts = false
      end

      if attributes.has_key?(:'numberOfVouchers')
        self.number_of_vouchers = attributes[:'numberOfVouchers']
      end

      if attributes.has_key?(:'chartOfAccountsType')
        self.chart_of_accounts_type = attributes[:'chartOfAccountsType']
      end

      if attributes.has_key?(:'reseller')
        self.reseller = attributes[:'reseller']
      else
        self.reseller = false
      end

      if attributes.has_key?(:'accountingOffice')
        self.accounting_office = attributes[:'accountingOffice']
      else
        self.accounting_office = false
      end

      if attributes.has_key?(:'auditor')
        self.auditor = attributes[:'auditor']
      else
        self.auditor = false
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @company.nil?
        invalid_properties.push("invalid value for 'company', company cannot be nil.")
      end

      if @account_type.nil?
        invalid_properties.push("invalid value for 'account_type', account_type cannot be nil.")
      end

      if @modules.nil?
        invalid_properties.push("invalid value for 'modules', modules cannot be nil.")
      end

      if @administrator_password.nil?
        invalid_properties.push("invalid value for 'administrator_password', administrator_password cannot be nil.")
      end

      if @number_of_vouchers.nil?
        invalid_properties.push("invalid value for 'number_of_vouchers', number_of_vouchers cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @company.nil?
      return false if @account_type.nil?
      account_type_validator = EnumAttributeValidator.new('String', ["TEST", "PAYING"])
      return false unless account_type_validator.valid?(@account_type)
      return false if @modules.nil?
      return false if @administrator_password.nil?
      return false if @number_of_vouchers.nil?
      number_of_vouchers_validator = EnumAttributeValidator.new('String', ["INTERVAL_0_100", "INTERVAL_101_500", "INTERVAL_0_500", "INTERVAL_501_1000", "INTERVAL_1001_2000", "INTERVAL_2001_3500", "INTERVAL_3501_5000", "INTERVAL_5001_10000", "INTERVAL_UNLIMITED"])
      return false unless number_of_vouchers_validator.valid?(@number_of_vouchers)
      chart_of_accounts_type_validator = EnumAttributeValidator.new('String', ["DEFAULT", "MAMUT_STD_PAYROLL", "MAMUT_NARF_PAYROLL", "AGRO_FORRETNING_PAYROLL", "AGRO_LANDBRUK_PAYROLL", "AGRO_FISKE_PAYROLL", "AGRO_FORSOKSRING_PAYROLL", "AGRO_IDRETTSLAG_PAYROLL", "AGRO_FORENING_PAYROLL"])
      return false unless chart_of_accounts_type_validator.valid?(@chart_of_accounts_type)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] account_type Object to be assigned
    def account_type=(account_type)
      validator = EnumAttributeValidator.new('String', ["TEST", "PAYING"])
      unless validator.valid?(account_type)
        fail ArgumentError, "invalid value for 'account_type', must be one of #{validator.allowable_values}."
      end
      @account_type = account_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] number_of_vouchers Object to be assigned
    def number_of_vouchers=(number_of_vouchers)
      validator = EnumAttributeValidator.new('String', ["INTERVAL_0_100", "INTERVAL_101_500", "INTERVAL_0_500", "INTERVAL_501_1000", "INTERVAL_1001_2000", "INTERVAL_2001_3500", "INTERVAL_3501_5000", "INTERVAL_5001_10000", "INTERVAL_UNLIMITED"])
      unless validator.valid?(number_of_vouchers)
        fail ArgumentError, "invalid value for 'number_of_vouchers', must be one of #{validator.allowable_values}."
      end
      @number_of_vouchers = number_of_vouchers
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] chart_of_accounts_type Object to be assigned
    def chart_of_accounts_type=(chart_of_accounts_type)
      validator = EnumAttributeValidator.new('String', ["DEFAULT", "MAMUT_STD_PAYROLL", "MAMUT_NARF_PAYROLL", "AGRO_FORRETNING_PAYROLL", "AGRO_LANDBRUK_PAYROLL", "AGRO_FISKE_PAYROLL", "AGRO_FORSOKSRING_PAYROLL", "AGRO_IDRETTSLAG_PAYROLL", "AGRO_FORENING_PAYROLL"])
      unless validator.valid?(chart_of_accounts_type)
        fail ArgumentError, "invalid value for 'chart_of_accounts_type', must be one of #{validator.allowable_values}."
      end
      @chart_of_accounts_type = chart_of_accounts_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          company == o.company &&
          administrator == o.administrator &&
          account_type == o.account_type &&
          modules == o.modules &&
          administrator_password == o.administrator_password &&
          send_emails == o.send_emails &&
          auto_validate_user_login == o.auto_validate_user_login &&
          create_administrator_api_token == o.create_administrator_api_token &&
          create_company_owned_api_token == o.create_company_owned_api_token &&
          may_create_tripletex_accounts == o.may_create_tripletex_accounts &&
          number_of_vouchers == o.number_of_vouchers &&
          chart_of_accounts_type == o.chart_of_accounts_type &&
          reseller == o.reseller &&
          accounting_office == o.accounting_office &&
          auditor == o.auditor
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [company, administrator, account_type, modules, administrator_password, send_emails, auto_validate_user_login, create_administrator_api_token, create_company_owned_api_token, may_create_tripletex_accounts, number_of_vouchers, chart_of_accounts_type, reseller, accounting_office, auditor].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = TripletexApi.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
