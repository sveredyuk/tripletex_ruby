# TripletexApi::EmploymentDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** |  | [optional] 
**version** | **Integer** |  | [optional] 
**changes** | [**Array&lt;Change&gt;**](Change.md) |  | [optional] 
**url** | **String** |  | [optional] 
**employment** | [**Employment**](Employment.md) |  | [optional] 
**date** | **String** |  | [optional] 
**employment_type** | **Integer** | To find the right value to enter in this field, you could go to &lt;br&gt;GET /employee/employment/employmentType and select TYPE_OF_EMPLOYMENT_RELATIONSHIP in the dropdown. | [optional] 
**remuneration_type** | **Integer** | To find the right value to enter in this field, you could go to &lt;br&gt; GET /employee/employment/remunerationType and select REMUNERATION_TYPE in the dropdown. | [optional] 
**working_hours_scheme** | **Integer** | To find the right value to enter in this field, you could go to GET /employee/employment/workingHoursScheme and select WORKING_HOURS_SCHEME in the dropdown. | [optional] 
**occupation_code** | **Integer** | To find the right value to enter in this field, you could go to GET /employee/employment/occupationCode to get a list of valid ID&#39;s. | [optional] 
**percentage_of_full_time_equivalent** | **Float** |  | 
**annual_salary** | **Float** |  | [optional] 
**hourly_wage** | **Float** |  | [optional] 


