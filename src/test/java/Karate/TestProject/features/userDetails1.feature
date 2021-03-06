@ignore
Feature: User Details

Background:
	* def expResponse = read('../jsonData/expResult.json')
	* url 'https://reqres.in/api/users'
	
	* def sleep =
	"""
	function(seconds){
		for(i=0; i<=seconds; i++){
			java.lang.Thread.sleep(1*1000);
		}
	}
	"""
	
	Scenario: request user 6 details
		Given path 6
		When method GET
		Then status 200
		Then print response
		#And match response == expResponse[1]				
		#* call sleep 10
	
	@parallel=false
	Scenario: request user 3 details
		Given path 3
		When method GET
		Then status 200
		Then print response
		#* call sleep 10
	