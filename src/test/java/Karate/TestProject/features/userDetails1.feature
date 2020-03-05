Feature: User Details

Background:
	* def expResponse = read('../expectedResultData/expResult.json')
	
	Scenario: request user 6 details
		Given url 'https://reqres.in/api/users/6'
		When method GET
		Then status 200
		#Then print response
		And match response == expResponse[1]				
	