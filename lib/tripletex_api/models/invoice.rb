=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/swagger-api/swagger-codegen). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.26.2

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'date'

module TripletexApi

  class Invoice
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    # If value is set to 0, the invoice number will be generated.
    attr_accessor :invoice_number

    attr_accessor :invoice_date

    # The invoice customer
    attr_accessor :customer

    attr_accessor :invoice_due_date

    # KID - Kundeidentifikasjonsnummer.
    attr_accessor :kid

    attr_accessor :comment

    # Related orders. Only one order per invoice is supported at the moment.
    attr_accessor :orders

    # ProjectInvoiceDetails contains additional information about the invoice, in particular invoices for projects. It contains information about the charged project, the fee amount, extra percent and amount, extra costs, travel expenses, invoice and project comments, akonto amount and values determining if extra costs, akonto and hours should be included. ProjectInvoiceDetails is an object which represents the relation between an invoice and a Project, Orderline and OrderOut object.
    attr_accessor :project_invoice_details

    # The invoice voucher.
    attr_accessor :voucher

    # The delivery date.
    attr_accessor :delivery_date

    # In the company’s currency, typically NOK.
    attr_accessor :amount

    # In the specified currency.
    attr_accessor :amount_currency

    # Amount excluding VAT (NOK).
    attr_accessor :amount_excluding_vat

    # Amount excluding VAT in the specified currency.
    attr_accessor :amount_excluding_vat_currency

    # Amount of round off to nearest integer.
    attr_accessor :amount_roundoff

    # Amount of round off to nearest integer in the specified currency.
    attr_accessor :amount_roundoff_currency

    # The amount outstanding based on the history collection, excluding reminders and any existing remits, in the invoice currency.
    attr_accessor :amount_outstanding

    # The amount outstanding based on the history collection and including the last reminder and any existing remits. This is the total invoice balance including reminders and remittances, in the invoice currency.
    attr_accessor :amount_outstanding_total

    # The sum of all open remittances of the invoice. Remittances are reimbursement payments back to the customer and are therefore relevant to the bookkeeping of the invoice in the accounts.
    attr_accessor :sum_remits

    attr_accessor :currency

    attr_accessor :is_credit_note

    # The invoice postings, which includes a posting for the invoice with a positive amount, and one or more posting for the payments with negative amounts.
    attr_accessor :postings

    # Invoice debt collection and reminders.
    attr_accessor :reminders

    attr_accessor :ehf_send_status

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
        :'id' => :'id',
        :'version' => :'version',
        :'changes' => :'changes',
        :'url' => :'url',
        :'invoice_number' => :'invoiceNumber',
        :'invoice_date' => :'invoiceDate',
        :'customer' => :'customer',
        :'invoice_due_date' => :'invoiceDueDate',
        :'kid' => :'kid',
        :'comment' => :'comment',
        :'orders' => :'orders',
        :'project_invoice_details' => :'projectInvoiceDetails',
        :'voucher' => :'voucher',
        :'delivery_date' => :'deliveryDate',
        :'amount' => :'amount',
        :'amount_currency' => :'amountCurrency',
        :'amount_excluding_vat' => :'amountExcludingVat',
        :'amount_excluding_vat_currency' => :'amountExcludingVatCurrency',
        :'amount_roundoff' => :'amountRoundoff',
        :'amount_roundoff_currency' => :'amountRoundoffCurrency',
        :'amount_outstanding' => :'amountOutstanding',
        :'amount_outstanding_total' => :'amountOutstandingTotal',
        :'sum_remits' => :'sumRemits',
        :'currency' => :'currency',
        :'is_credit_note' => :'isCreditNote',
        :'postings' => :'postings',
        :'reminders' => :'reminders',
        :'ehf_send_status' => :'ehfSendStatus'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'invoice_number' => :'Integer',
        :'invoice_date' => :'String',
        :'customer' => :'Customer',
        :'invoice_due_date' => :'String',
        :'kid' => :'String',
        :'comment' => :'String',
        :'orders' => :'Array<Order>',
        :'project_invoice_details' => :'Array<ProjectInvoiceDetails>',
        :'voucher' => :'Voucher',
        :'delivery_date' => :'String',
        :'amount' => :'Float',
        :'amount_currency' => :'Float',
        :'amount_excluding_vat' => :'Float',
        :'amount_excluding_vat_currency' => :'Float',
        :'amount_roundoff' => :'Float',
        :'amount_roundoff_currency' => :'Float',
        :'amount_outstanding' => :'Float',
        :'amount_outstanding_total' => :'Float',
        :'sum_remits' => :'Float',
        :'currency' => :'Currency',
        :'is_credit_note' => :'BOOLEAN',
        :'postings' => :'Array<Posting>',
        :'reminders' => :'Array<Reminder>',
        :'ehf_send_status' => :'String'
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

      if attributes.has_key?(:'invoiceNumber')
        self.invoice_number = attributes[:'invoiceNumber']
      end

      if attributes.has_key?(:'invoiceDate')
        self.invoice_date = attributes[:'invoiceDate']
      end

      if attributes.has_key?(:'customer')
        self.customer = attributes[:'customer']
      end

      if attributes.has_key?(:'invoiceDueDate')
        self.invoice_due_date = attributes[:'invoiceDueDate']
      end

      if attributes.has_key?(:'kid')
        self.kid = attributes[:'kid']
      end

      if attributes.has_key?(:'comment')
        self.comment = attributes[:'comment']
      end

      if attributes.has_key?(:'orders')
        if (value = attributes[:'orders']).is_a?(Array)
          self.orders = value
        end
      end

      if attributes.has_key?(:'projectInvoiceDetails')
        if (value = attributes[:'projectInvoiceDetails']).is_a?(Array)
          self.project_invoice_details = value
        end
      end

      if attributes.has_key?(:'voucher')
        self.voucher = attributes[:'voucher']
      end

      if attributes.has_key?(:'deliveryDate')
        self.delivery_date = attributes[:'deliveryDate']
      end

      if attributes.has_key?(:'amount')
        self.amount = attributes[:'amount']
      end

      if attributes.has_key?(:'amountCurrency')
        self.amount_currency = attributes[:'amountCurrency']
      end

      if attributes.has_key?(:'amountExcludingVat')
        self.amount_excluding_vat = attributes[:'amountExcludingVat']
      end

      if attributes.has_key?(:'amountExcludingVatCurrency')
        self.amount_excluding_vat_currency = attributes[:'amountExcludingVatCurrency']
      end

      if attributes.has_key?(:'amountRoundoff')
        self.amount_roundoff = attributes[:'amountRoundoff']
      end

      if attributes.has_key?(:'amountRoundoffCurrency')
        self.amount_roundoff_currency = attributes[:'amountRoundoffCurrency']
      end

      if attributes.has_key?(:'amountOutstanding')
        self.amount_outstanding = attributes[:'amountOutstanding']
      end

      if attributes.has_key?(:'amountOutstandingTotal')
        self.amount_outstanding_total = attributes[:'amountOutstandingTotal']
      end

      if attributes.has_key?(:'sumRemits')
        self.sum_remits = attributes[:'sumRemits']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'isCreditNote')
        self.is_credit_note = attributes[:'isCreditNote']
      else
        self.is_credit_note = false
      end

      if attributes.has_key?(:'postings')
        if (value = attributes[:'postings']).is_a?(Array)
          self.postings = value
        end
      end

      if attributes.has_key?(:'reminders')
        if (value = attributes[:'reminders']).is_a?(Array)
          self.reminders = value
        end
      end

      if attributes.has_key?(:'ehfSendStatus')
        self.ehf_send_status = attributes[:'ehfSendStatus']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@invoice_number.nil? && @invoice_number < 0
        invalid_properties.push("invalid value for 'invoice_number', must be greater than or equal to 0.")
      end

      if @invoice_date.nil?
        invalid_properties.push("invalid value for 'invoice_date', invoice_date cannot be nil.")
      end

      if @invoice_due_date.nil?
        invalid_properties.push("invalid value for 'invoice_due_date', invoice_due_date cannot be nil.")
      end

      if !@kid.nil? && @kid.to_s.length > 25
        invalid_properties.push("invalid value for 'kid', the character length must be smaller than or equal to 25.")
      end

      if @orders.nil?
        invalid_properties.push("invalid value for 'orders', orders cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@invoice_number.nil? && @invoice_number < 0
      return false if @invoice_date.nil?
      return false if @invoice_due_date.nil?
      return false if !@kid.nil? && @kid.to_s.length > 25
      return false if @orders.nil?
      ehf_send_status_validator = EnumAttributeValidator.new('String', ["DO_NOT_SEND", "SEND", "SENT", "SEND_FAILURE_RECIPIENT_NOT_FOUND"])
      return false unless ehf_send_status_validator.valid?(@ehf_send_status)
      return true
    end

    # Custom attribute writer method with validation
    # @param [Object] invoice_number Value to be assigned
    def invoice_number=(invoice_number)

      if !invoice_number.nil? && invoice_number < 0
        fail ArgumentError, "invalid value for 'invoice_number', must be greater than or equal to 0."
      end

      @invoice_number = invoice_number
    end

    # Custom attribute writer method with validation
    # @param [Object] kid Value to be assigned
    def kid=(kid)

      if !kid.nil? && kid.to_s.length > 25
        fail ArgumentError, "invalid value for 'kid', the character length must be smaller than or equal to 25."
      end

      @kid = kid
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] ehf_send_status Object to be assigned
    def ehf_send_status=(ehf_send_status)
      validator = EnumAttributeValidator.new('String', ["DO_NOT_SEND", "SEND", "SENT", "SEND_FAILURE_RECIPIENT_NOT_FOUND"])
      unless validator.valid?(ehf_send_status)
        fail ArgumentError, "invalid value for 'ehf_send_status', must be one of #{validator.allowable_values}."
      end
      @ehf_send_status = ehf_send_status
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
          invoice_number == o.invoice_number &&
          invoice_date == o.invoice_date &&
          customer == o.customer &&
          invoice_due_date == o.invoice_due_date &&
          kid == o.kid &&
          comment == o.comment &&
          orders == o.orders &&
          project_invoice_details == o.project_invoice_details &&
          voucher == o.voucher &&
          delivery_date == o.delivery_date &&
          amount == o.amount &&
          amount_currency == o.amount_currency &&
          amount_excluding_vat == o.amount_excluding_vat &&
          amount_excluding_vat_currency == o.amount_excluding_vat_currency &&
          amount_roundoff == o.amount_roundoff &&
          amount_roundoff_currency == o.amount_roundoff_currency &&
          amount_outstanding == o.amount_outstanding &&
          amount_outstanding_total == o.amount_outstanding_total &&
          sum_remits == o.sum_remits &&
          currency == o.currency &&
          is_credit_note == o.is_credit_note &&
          postings == o.postings &&
          reminders == o.reminders &&
          ehf_send_status == o.ehf_send_status
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, invoice_number, invoice_date, customer, invoice_due_date, kid, comment, orders, project_invoice_details, voucher, delivery_date, amount, amount_currency, amount_excluding_vat, amount_excluding_vat_currency, amount_roundoff, amount_roundoff_currency, amount_outstanding, amount_outstanding_total, sum_remits, currency, is_credit_note, postings, reminders, ehf_send_status].hash
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
