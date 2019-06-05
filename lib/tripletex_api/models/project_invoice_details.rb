=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/sveredyuk/tripletex_ruby). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.32.0

Generated by: https://github.com/sveredyuk/tripletex_ruby.git
Swagger Codegen version: 2.3.1

=end

require 'date'

module TripletexApi

  class ProjectInvoiceDetails
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # The Project related to the Invoice and ProjectInvoiceAdditionalInfo.
    attr_accessor :project

    # Fee amount of the project. For example: 100 NOK.
    attr_accessor :fee_amount

    # Fee amount of the project in the invoice currency.
    attr_accessor :fee_amount_currency

    # The percentage value of mark-up of amountFee. For example: 10%.
    attr_accessor :markup_percent

    # The amount value of mark-up of amountFee on the project invoice. For example: 10 NOK.
    attr_accessor :markup_amount

    # The amount value of mark-up of amountFee on the project invoice, in the invoice currency.
    attr_accessor :markup_amount_currency

    # The amount of chargeable manual order lines and vendor invoices on the project invoice.
    attr_accessor :amount_order_lines_and_reinvoicing

    # The amount of chargeable manual order lines and vendor invoices on the project invoice, in the invoice currency.
    attr_accessor :amount_order_lines_and_reinvoicing_currency

    # The amount of travel costs and expenses on the project invoice.
    attr_accessor :amount_travel_reports_and_expenses

    # The amount of travel costs and expenses on the project invoice, in the invoice currency.
    attr_accessor :amount_travel_reports_and_expenses_currency

    # The fee comment on the project invoice.
    attr_accessor :fee_invoice_text

    # The comment on the project invoice.
    attr_accessor :invoice_text

    # Determines if extra costs should be included on the project invoice.
    attr_accessor :include_order_lines_and_reinvoicing

    # Determines if hours should be included on the project invoice.
    attr_accessor :include_hours

    # Determines if akonto should be included on the project invoice.
    attr_accessor :include_on_account_balance

    # The akonto amount on the project invoice.
    attr_accessor :on_account_balance_amount

    # The akonto amount on the project invoice in the invoice currency.
    attr_accessor :on_account_balance_amount_currency

    # The VAT type of the project invoice.
    attr_accessor :vat_type


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'project' => :'project',
        :'fee_amount' => :'feeAmount',
        :'fee_amount_currency' => :'feeAmountCurrency',
        :'markup_percent' => :'markupPercent',
        :'markup_amount' => :'markupAmount',
        :'markup_amount_currency' => :'markupAmountCurrency',
        :'amount_order_lines_and_reinvoicing' => :'amountOrderLinesAndReinvoicing',
        :'amount_order_lines_and_reinvoicing_currency' => :'amountOrderLinesAndReinvoicingCurrency',
        :'amount_travel_reports_and_expenses' => :'amountTravelReportsAndExpenses',
        :'amount_travel_reports_and_expenses_currency' => :'amountTravelReportsAndExpensesCurrency',
        :'fee_invoice_text' => :'feeInvoiceText',
        :'invoice_text' => :'invoiceText',
        :'include_order_lines_and_reinvoicing' => :'includeOrderLinesAndReinvoicing',
        :'include_hours' => :'includeHours',
        :'include_on_account_balance' => :'includeOnAccountBalance',
        :'on_account_balance_amount' => :'onAccountBalanceAmount',
        :'on_account_balance_amount_currency' => :'onAccountBalanceAmountCurrency',
        :'vat_type' => :'vatType'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'project' => :'Project',
        :'fee_amount' => :'Float',
        :'fee_amount_currency' => :'Float',
        :'markup_percent' => :'Float',
        :'markup_amount' => :'Float',
        :'markup_amount_currency' => :'Float',
        :'amount_order_lines_and_reinvoicing' => :'Float',
        :'amount_order_lines_and_reinvoicing_currency' => :'Float',
        :'amount_travel_reports_and_expenses' => :'Float',
        :'amount_travel_reports_and_expenses_currency' => :'Float',
        :'fee_invoice_text' => :'String',
        :'invoice_text' => :'String',
        :'include_order_lines_and_reinvoicing' => :'BOOLEAN',
        :'include_hours' => :'BOOLEAN',
        :'include_on_account_balance' => :'BOOLEAN',
        :'on_account_balance_amount' => :'Float',
        :'on_account_balance_amount_currency' => :'Float',
        :'vat_type' => :'VatType'
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

      if attributes.has_key?(:'project')
        self.project = attributes[:'project']
      end

      if attributes.has_key?(:'feeAmount')
        self.fee_amount = attributes[:'feeAmount']
      end

      if attributes.has_key?(:'feeAmountCurrency')
        self.fee_amount_currency = attributes[:'feeAmountCurrency']
      end

      if attributes.has_key?(:'markupPercent')
        self.markup_percent = attributes[:'markupPercent']
      end

      if attributes.has_key?(:'markupAmount')
        self.markup_amount = attributes[:'markupAmount']
      end

      if attributes.has_key?(:'markupAmountCurrency')
        self.markup_amount_currency = attributes[:'markupAmountCurrency']
      end

      if attributes.has_key?(:'amountOrderLinesAndReinvoicing')
        self.amount_order_lines_and_reinvoicing = attributes[:'amountOrderLinesAndReinvoicing']
      end

      if attributes.has_key?(:'amountOrderLinesAndReinvoicingCurrency')
        self.amount_order_lines_and_reinvoicing_currency = attributes[:'amountOrderLinesAndReinvoicingCurrency']
      end

      if attributes.has_key?(:'amountTravelReportsAndExpenses')
        self.amount_travel_reports_and_expenses = attributes[:'amountTravelReportsAndExpenses']
      end

      if attributes.has_key?(:'amountTravelReportsAndExpensesCurrency')
        self.amount_travel_reports_and_expenses_currency = attributes[:'amountTravelReportsAndExpensesCurrency']
      end

      if attributes.has_key?(:'feeInvoiceText')
        self.fee_invoice_text = attributes[:'feeInvoiceText']
      end

      if attributes.has_key?(:'invoiceText')
        self.invoice_text = attributes[:'invoiceText']
      end

      if attributes.has_key?(:'includeOrderLinesAndReinvoicing')
        self.include_order_lines_and_reinvoicing = attributes[:'includeOrderLinesAndReinvoicing']
      else
        self.include_order_lines_and_reinvoicing = false
      end

      if attributes.has_key?(:'includeHours')
        self.include_hours = attributes[:'includeHours']
      else
        self.include_hours = false
      end

      if attributes.has_key?(:'includeOnAccountBalance')
        self.include_on_account_balance = attributes[:'includeOnAccountBalance']
      else
        self.include_on_account_balance = false
      end

      if attributes.has_key?(:'onAccountBalanceAmount')
        self.on_account_balance_amount = attributes[:'onAccountBalanceAmount']
      end

      if attributes.has_key?(:'onAccountBalanceAmountCurrency')
        self.on_account_balance_amount_currency = attributes[:'onAccountBalanceAmountCurrency']
      end

      if attributes.has_key?(:'vatType')
        self.vat_type = attributes[:'vatType']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @fee_invoice_text.nil?
        invalid_properties.push("invalid value for 'fee_invoice_text', fee_invoice_text cannot be nil.")
      end

      if @invoice_text.nil?
        invalid_properties.push("invalid value for 'invoice_text', invoice_text cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @fee_invoice_text.nil?
      return false if @invoice_text.nil?
      return true
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
          project == o.project &&
          fee_amount == o.fee_amount &&
          fee_amount_currency == o.fee_amount_currency &&
          markup_percent == o.markup_percent &&
          markup_amount == o.markup_amount &&
          markup_amount_currency == o.markup_amount_currency &&
          amount_order_lines_and_reinvoicing == o.amount_order_lines_and_reinvoicing &&
          amount_order_lines_and_reinvoicing_currency == o.amount_order_lines_and_reinvoicing_currency &&
          amount_travel_reports_and_expenses == o.amount_travel_reports_and_expenses &&
          amount_travel_reports_and_expenses_currency == o.amount_travel_reports_and_expenses_currency &&
          fee_invoice_text == o.fee_invoice_text &&
          invoice_text == o.invoice_text &&
          include_order_lines_and_reinvoicing == o.include_order_lines_and_reinvoicing &&
          include_hours == o.include_hours &&
          include_on_account_balance == o.include_on_account_balance &&
          on_account_balance_amount == o.on_account_balance_amount &&
          on_account_balance_amount_currency == o.on_account_balance_amount_currency &&
          vat_type == o.vat_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, project, fee_amount, fee_amount_currency, markup_percent, markup_amount, markup_amount_currency, amount_order_lines_and_reinvoicing, amount_order_lines_and_reinvoicing_currency, amount_travel_reports_and_expenses, amount_travel_reports_and_expenses_currency, fee_invoice_text, invoice_text, include_order_lines_and_reinvoicing, include_hours, include_on_account_balance, on_account_balance_amount, on_account_balance_amount_currency, vat_type].hash
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
