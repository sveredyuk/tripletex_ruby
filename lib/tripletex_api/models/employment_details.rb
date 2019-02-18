=begin
#Tripletex API

#The Tripletex API is a **RESTful API**, which does not implement PATCH, but uses a PUT with optional fields.  **Actions** or commands are represented in our RESTful path with a prefixed `:`. Example: `/v2/hours/123/:approve`.  **Summaries** or aggregated results are represented in our RESTful path with a prefixed <code>&gt;</code>. Example: <code>/v2/hours/&gt;thisWeeksBillables</code>.  **\"requestID\"** is a key found in all validation and error responses. If additional log information is absolutely necessary, our support division can locate the key value.  **Download** the [swagger.json](/v2/swagger.json) file [OpenAPI Specification](https://github.com/OAI/OpenAPI-Specification) to [generate code](https://github.com/sveredyuk/tripletex_ruby). This document was generated from the Swagger JSON file.  **version:** This is a versioning number found on all DB records. If included, it will prevent your PUT/POST from overriding any updates to the record since your GET.  **Date & DateTime** follows the **ISO 8601** standard. Date: `YYYY-MM-DD`. DateTime: `YYYY-MM-DDThh:mm:ssZ`  **Sorting** is done by specifying a comma separated list, where a `-` prefix denotes descending. You can sort by sub object with the following format: `project.name, -date`.  **Searching:** is done by entering values in the optional fields for each API call. The values fall into the following categories: range, in, exact and like.  **Missing fields or even no response data** can occur because result objects and fields are filtered on authorization.  **See [FAQ](https://tripletex.no/execute/docViewer?articleId=906&language=0) for more additional information.**   ## Authentication: - **Tokens:** The Tripletex API uses 3 different tokens - **consumerToken**, **employeeToken** and **sessionToken**.  - **consumerToken** is a token provided to the consumer by Tripletex after the API 2.0 registration is completed.  - **employeeToken** is a token created by an administrator in your Tripletex account via the user settings and the tab \"API access\". Each employee token must be given a set of entitlements. [Read more here.](https://tripletex.no/execute/docViewer?articleId=853&language=0)  - **sessionToken** is the token from `/token/session/:create` which requires a consumerToken and an employeeToken created with the same consumer token, but not an authentication header. See how to create a sessionToken [here](https://tripletex.no/execute/docViewer?articleId=855&language=0). - The session token is used as the password in \"Basic Authentication Header\" for API calls.  - Use blank or `0` as username for accessing the account with regular employee token, or if a company owned employee token accesses <code>/company/&gt;withLoginAccess</code> or <code>/token/session/&gt;whoAmI</code>.  - For company owned employee tokens (accounting offices) the ID from <code>/company/&gt;withLoginAccess</code> can be used as username for accessing client accounts.  - If you need to create the header yourself use <code>Authorization: Basic &lt;base64encode('0:sessionToken')&gt;</code>.   ## Tags: - <div class=\"tag-icon-beta\"></div> **[BETA]** This is a beta endpoint and can be subject to change. - <div class=\"tag-icon-deprecated\"></div> **[DEPRECATED]** Deprecated means that we intend to remove/change this feature or capability in a future \"major\" API release. We therefore discourage all use of this feature/capability.  ## Fields: Use the `fields` parameter to specify which fields should be returned. This also supports fields from sub elements. Example values: - `project,activity,hours`  returns `{project:..., activity:...., hours:...}`. - just `project` returns `\"project\" : { \"id\": 12345, \"url\": \"tripletex.no/v2/projects/12345\"  }`. - `project(*)` returns `\"project\" : { \"id\": 12345 \"name\":\"ProjectName\" \"number.....startDate\": \"2013-01-07\" }`. - `project(name)` returns `\"project\" : { \"name\":\"ProjectName\" }`. - All elements and some subElements :  `*,activity(name),employee(*)`.  ## Changes: To get the changes for a resource, `changes` have to be explicitly specified as part of the `fields` parameter, e.g. `*,changes`. There are currently two types of change available:  - `CREATE` for when the resource was created - `UPDATE` for when the resource was updated  NOTE: For objects created prior to October 24th 2018 the list may be incomplete, but will always contain the CREATE and the last change (if the object has been changed after creation).  ## Rate limiting in each response header: Rate limiting is performed on the API calls for an employee for each API consumer. Status regarding the rate limit is returned as headers: - `X-Rate-Limit-Limit` - The number of allowed requests in the current period. - `X-Rate-Limit-Remaining` - The number of remaining requests. - `X-Rate-Limit-Reset` - The number of seconds left in the current period.  Once the rate limit is hit, all requests will return HTTP status code `429` for the remainder of the current period.   ## Response envelope: ``` {   \"fullResultSize\": ###,   \"from\": ###, // Paging starting from   \"count\": ###, // Paging count   \"versionDigest\": \"Hash of full result\",   \"values\": [...list of objects...] } {   \"value\": {...single object...} } ```   ## WebHook envelope: ``` {   \"subscriptionId\": ###,   \"event\": \"object.verb\", // As listed from /v2/event/   \"id\": ###, // Object id   \"value\": {... single object, null if object.deleted ...} } ```    ## Error/warning envelope: ``` {   \"status\": ###, // HTTP status code   \"code\": #####, // internal status code of event   \"message\": \"Basic feedback message in your language\",   \"link\": \"Link to doc\",   \"developerMessage\": \"More technical message\",   \"validationMessages\": [ // Will be null if Error     {       \"field\": \"Name of field\",       \"message\": \"Validation failure information\"     }   ],   \"requestId\": \"UUID used in any logs\" } ```   ## Status codes / Error codes: - **200 OK** - **201 Created** - From POSTs that create something new. - **204 No Content** - When there is no answer, ex: \"/:anAction\" or DELETE. - **400 Bad request** -   - **4000** Bad Request Exception   - **11000** Illegal Filter Exception   - **12000** Path Param Exception   - **24000**   Cryptography Exception - **401 Unauthorized** - When authentication is required and has failed or has not yet been provided   -  **3000** Authentication Exception   -  **9000** Security Exception - **403 Forbidden** - When AuthorisationManager says no. - **404 Not Found** - For content/IDs that does not exist.   -  **6000** Not Found Exception - **409 Conflict** - Such as an edit conflict between multiple simultaneous updates   -  **7000** Object Exists Exception   -  **8000** Revision Exception   - **10000** Locked Exception   - **14000** Duplicate entry - **422 Bad Request** - For Required fields or things like malformed payload.   - **15000** Value Validation Exception   - **16000** Mapping Exception   - **17000** Sorting Exception   - **18000** Validation Exception   - **21000** Param Exception   - **22000** Invalid JSON Exception   - **23000**   Result Set Too Large Exception - **429 Too Many Requests** - Request rate limit hit - **500 Internal Error** -  Unexpected condition was encountered and no more specific message is suitable   -  **1000** Exception

OpenAPI spec version: 2.32.0

Generated by: https://github.com/sveredyuk/tripletex_ruby.git
Swagger Codegen version: 2.3.1

=end

require 'date'

module TripletexApi

  class EmploymentDetails
    attr_accessor :id

    attr_accessor :version

    attr_accessor :changes

    attr_accessor :url

    attr_accessor :employment

    attr_accessor :date

    # Define the employment type.
    attr_accessor :employment_type

    attr_accessor :maritime_employment

    # Define the remuneration type.
    attr_accessor :remuneration_type

    # Define the working hours scheme type. If you enter a value for SHIFT WORK, you must also enter value for shiftDurationHours
    attr_accessor :working_hours_scheme

    attr_accessor :shift_duration_hours

    # To find the right value to enter in this field, you could go to GET /employee/employment/occupationCode to get a list of valid ID's.
    attr_accessor :occupation_code

    attr_accessor :percentage_of_full_time_equivalent

    attr_accessor :annual_salary

    attr_accessor :hourly_wage

    attr_accessor :payroll_tax_municipality_id

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
        :'employment' => :'employment',
        :'date' => :'date',
        :'employment_type' => :'employmentType',
        :'maritime_employment' => :'maritimeEmployment',
        :'remuneration_type' => :'remunerationType',
        :'working_hours_scheme' => :'workingHoursScheme',
        :'shift_duration_hours' => :'shiftDurationHours',
        :'occupation_code' => :'occupationCode',
        :'percentage_of_full_time_equivalent' => :'percentageOfFullTimeEquivalent',
        :'annual_salary' => :'annualSalary',
        :'hourly_wage' => :'hourlyWage',
        :'payroll_tax_municipality_id' => :'payrollTaxMunicipalityId'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'Integer',
        :'version' => :'Integer',
        :'changes' => :'Array<Change>',
        :'url' => :'String',
        :'employment' => :'Employment',
        :'date' => :'String',
        :'employment_type' => :'String',
        :'maritime_employment' => :'MaritimeEmployment',
        :'remuneration_type' => :'String',
        :'working_hours_scheme' => :'String',
        :'shift_duration_hours' => :'Float',
        :'occupation_code' => :'Integer',
        :'percentage_of_full_time_equivalent' => :'Float',
        :'annual_salary' => :'Float',
        :'hourly_wage' => :'Float',
        :'payroll_tax_municipality_id' => :'Integer'
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

      if attributes.has_key?(:'employment')
        self.employment = attributes[:'employment']
      end

      if attributes.has_key?(:'date')
        self.date = attributes[:'date']
      end

      if attributes.has_key?(:'employmentType')
        self.employment_type = attributes[:'employmentType']
      end

      if attributes.has_key?(:'maritimeEmployment')
        self.maritime_employment = attributes[:'maritimeEmployment']
      end

      if attributes.has_key?(:'remunerationType')
        self.remuneration_type = attributes[:'remunerationType']
      end

      if attributes.has_key?(:'workingHoursScheme')
        self.working_hours_scheme = attributes[:'workingHoursScheme']
      end

      if attributes.has_key?(:'shiftDurationHours')
        self.shift_duration_hours = attributes[:'shiftDurationHours']
      end

      if attributes.has_key?(:'occupationCode')
        self.occupation_code = attributes[:'occupationCode']
      end

      if attributes.has_key?(:'percentageOfFullTimeEquivalent')
        self.percentage_of_full_time_equivalent = attributes[:'percentageOfFullTimeEquivalent']
      end

      if attributes.has_key?(:'annualSalary')
        self.annual_salary = attributes[:'annualSalary']
      end

      if attributes.has_key?(:'hourlyWage')
        self.hourly_wage = attributes[:'hourlyWage']
      end

      if attributes.has_key?(:'payrollTaxMunicipalityId')
        self.payroll_tax_municipality_id = attributes[:'payrollTaxMunicipalityId']
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @percentage_of_full_time_equivalent.nil?
        invalid_properties.push("invalid value for 'percentage_of_full_time_equivalent', percentage_of_full_time_equivalent cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      employment_type_validator = EnumAttributeValidator.new('String', ["ORDINARY", "MARITIME", "FREELANCE"])
      return false unless employment_type_validator.valid?(@employment_type)
      remuneration_type_validator = EnumAttributeValidator.new('String', ["MONTHLY_WAGE", "HOURLY_WAGE", "COMMISION_PERCENTAGE", "FEE", "PIECEWORK_WAGE"])
      return false unless remuneration_type_validator.valid?(@remuneration_type)
      working_hours_scheme_validator = EnumAttributeValidator.new('String', ["NOT_SHIFT", "ROUND_THE_CLOCK", "SHIFT_365", "OFFSHORE_336", "CONTINUOUS"])
      return false unless working_hours_scheme_validator.valid?(@working_hours_scheme)
      return false if @percentage_of_full_time_equivalent.nil?
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] employment_type Object to be assigned
    def employment_type=(employment_type)
      validator = EnumAttributeValidator.new('String', ["ORDINARY", "MARITIME", "FREELANCE"])
      unless validator.valid?(employment_type)
        fail ArgumentError, "invalid value for 'employment_type', must be one of #{validator.allowable_values}."
      end
      @employment_type = employment_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] remuneration_type Object to be assigned
    def remuneration_type=(remuneration_type)
      validator = EnumAttributeValidator.new('String', ["MONTHLY_WAGE", "HOURLY_WAGE", "COMMISION_PERCENTAGE", "FEE", "PIECEWORK_WAGE"])
      unless validator.valid?(remuneration_type)
        fail ArgumentError, "invalid value for 'remuneration_type', must be one of #{validator.allowable_values}."
      end
      @remuneration_type = remuneration_type
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] working_hours_scheme Object to be assigned
    def working_hours_scheme=(working_hours_scheme)
      validator = EnumAttributeValidator.new('String', ["NOT_SHIFT", "ROUND_THE_CLOCK", "SHIFT_365", "OFFSHORE_336", "CONTINUOUS"])
      unless validator.valid?(working_hours_scheme)
        fail ArgumentError, "invalid value for 'working_hours_scheme', must be one of #{validator.allowable_values}."
      end
      @working_hours_scheme = working_hours_scheme
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
          employment == o.employment &&
          date == o.date &&
          employment_type == o.employment_type &&
          maritime_employment == o.maritime_employment &&
          remuneration_type == o.remuneration_type &&
          working_hours_scheme == o.working_hours_scheme &&
          shift_duration_hours == o.shift_duration_hours &&
          occupation_code == o.occupation_code &&
          percentage_of_full_time_equivalent == o.percentage_of_full_time_equivalent &&
          annual_salary == o.annual_salary &&
          hourly_wage == o.hourly_wage &&
          payroll_tax_municipality_id == o.payroll_tax_municipality_id
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, version, changes, url, employment, date, employment_type, maritime_employment, remuneration_type, working_hours_scheme, shift_duration_hours, occupation_code, percentage_of_full_time_equivalent, annual_salary, hourly_wage, payroll_tax_municipality_id].hash
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
