=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/swagger-api/swagger-codegen). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.26.2

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'date'

module TripletexApi

  class Cost
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :travel_expense

    attr_accessor :vat_type

    attr_accessor :currency

    attr_accessor :cost_category

    attr_accessor :payment_type

    attr_accessor :category

    attr_accessor :comments

    attr_accessor :rate

    attr_accessor :amount_currency_inc_vat

    attr_accessor :amount_nok_incl_vat

    attr_accessor :amount_nok_incl_vat_low

    attr_accessor :amount_nok_incl_vat_medium

    attr_accessor :amount_nok_incl_vat_high

    attr_accessor :is_paid_by_employee

    attr_accessor :is_chargeable

    attr_accessor :date


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'travel_expense' => :'travelExpense',
        :'vat_type' => :'vatType',
        :'currency' => :'currency',
        :'cost_category' => :'costCategory',
        :'payment_type' => :'paymentType',
        :'category' => :'category',
        :'comments' => :'comments',
        :'rate' => :'rate',
        :'amount_currency_inc_vat' => :'amountCurrencyIncVat',
        :'amount_nok_incl_vat' => :'amountNOKInclVAT',
        :'amount_nok_incl_vat_low' => :'amountNOKInclVATLow',
        :'amount_nok_incl_vat_medium' => :'amountNOKInclVATMedium',
        :'amount_nok_incl_vat_high' => :'amountNOKInclVATHigh',
        :'is_paid_by_employee' => :'isPaidByEmployee',
        :'is_chargeable' => :'isChargeable',
        :'date' => :'date'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'travel_expense' => :'TravelExpense',
        :'vat_type' => :'VatType',
        :'currency' => :'Currency',
        :'cost_category' => :'TravelCostCategory',
        :'payment_type' => :'TravelPaymentType',
        :'category' => :'String',
        :'comments' => :'String',
        :'rate' => :'Float',
        :'amount_currency_inc_vat' => :'Float',
        :'amount_nok_incl_vat' => :'Float',
        :'amount_nok_incl_vat_low' => :'Float',
        :'amount_nok_incl_vat_medium' => :'Float',
        :'amount_nok_incl_vat_high' => :'Float',
        :'is_paid_by_employee' => :'BOOLEAN',
        :'is_chargeable' => :'BOOLEAN',
        :'date' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'version')
        self.version = attributes[:'version']
      end

      if attributes.has_key?(:'changes')
        if (value = attributes[:'changes']).is_a?(Array)
          self.changes = value
        end
      end

      if attributes.has_key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.has_key?(:'travelExpense')
        self.travel_expense = attributes[:'travelExpense']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'costCategory')
        self.cost_category = attributes[:'costCategory']
      end

      if attributes.has_key?(:'paymentType')
        self.payment_type = attributes[:'paymentType']
      end

      if attributes.has_key?(:'category')
        self.category = attributes[:'category']
      end

      if attributes.has_key?(:'comments')
        self.comments = attributes[:'comments']
      end

      if attributes.has_key?(:'rate')
        self.rate = attributes[:'rate']
      end

      if attributes.has_key?(:'amountCurrencyIncVat')
        self.amount_currency_inc_vat = attributes[:'amountCurrencyIncVat']
      end

      if attributes.has_key?(:'amountNOKInclVAT')
        self.amount_nok_incl_vat = attributes[:'amountNOKInclVAT']
      end

      if attributes.has_key?(:'amountNOKInclVATLow')
        self.amount_nok_incl_vat_low = attributes[:'amountNOKInclVATLow']
      end

      if attributes.has_key?(:'amountNOKInclVATMedium')
        self.amount_nok_incl_vat_medium = attributes[:'amountNOKInclVATMedium']
      end

      if attributes.has_key?(:'amountNOKInclVATHigh')
        self.amount_nok_incl_vat_high = attributes[:'amountNOKInclVATHigh']
      end

      if attributes.has_key?(:'isPaidByEmployee')
        self.is_paid_by_employee = attributes[:'isPaidByEmployee']
      else
        self.is_paid_by_employee = false
      end

      if attributes.has_key?(:'isChargeable')
        self.is_chargeable = attributes[:'isChargeable']
      else
        self.is_chargeable = false
      end

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @cost_category.nil?
        invalid_properties.push("invalid value for 'cost_category', cost_category cannot be nil.")
      end

      if @payment_type.nil?
        invalid_properties.push("invalid value for 'payment_type', payment_type cannot be nil.")
      end

      if !@category.nil? && @category.to_s.length > 100
        invalid_properties.push("invalid value for 'category', the character length must be smaller than or equal to 100.")
      end

      if @amount_currency_inc_vat.nil?
        invalid_properties.push("invalid value for 'amount_currency_inc_vat', amount_currency_inc_vat cannot be nil.")
      end

      if @date.nil?
        invalid_properties.push("invalid value for 'date', date cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @cost_category.nil?
      return false if @payment_type.nil?
      return false if !@category.nil? && @category.to_s.length > 100
      return false if @amount_currency_inc_vat.nil?
      return false if @date.nil?
      return true
    end

    # Custom attribute writer method with validation
    # @param [Object] category Value to be assigned
    def category=(category)

      if !category.nil? && category.to_s.length > 100
        fail ArgumentError, "invalid value for 'category', the character length must be smaller than or equal to 100."
      end

      @category = category
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          version == o.version &&
          changes == o.changes &&
          url == o.url &&
          travel_expense == o.travel_expense &&
          vat_type == o.vat_type &&
          currency == o.currency &&
          cost_category == o.cost_category &&
          payment_type == o.payment_type &&
          category == o.category &&
          comments == o.comments &&
          rate == o.rate &&
          amount_currency_inc_vat == o.amount_currency_inc_vat &&
          amount_nok_incl_vat == o.amount_nok_incl_vat &&
          amount_nok_incl_vat_low == o.amount_nok_incl_vat_low &&
          amount_nok_incl_vat_medium == o.amount_nok_incl_vat_medium &&
          amount_nok_incl_vat_high == o.amount_nok_incl_vat_high &&
          is_paid_by_employee == o.is_paid_by_employee &&
          is_chargeable == o.is_chargeable &&
          date == o.date
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, travel_expense, vat_type, currency, cost_category, payment_type, category, comments, rate, amount_currency_inc_vat, amount_nok_incl_vat, amount_nok_incl_vat_low, amount_nok_incl_vat_medium, amount_nok_incl_vat_high, is_paid_by_employee, is_chargeable, date].hash
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
