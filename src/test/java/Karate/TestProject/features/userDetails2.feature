@ignore
Feature: User Details

Background:
	* def expResponse = read('../jsonData/expResult.json')
	# * def firstUserDetails = read('userDetails1.feature')
	# * def firstFeatureResult = call firstUserDetails
	* def firstFeatureResult = call read('userDetails1.feature')

	Scenario: request user 9 details
		Given url 'https://reqres.in/api/users/9'
		When method GET
		Then status 200
		#Then print response									
		#Then print expResponse
		And match response == expResponse[0]					
		And match response.data.id == 9
		And match response.data.email != null
		* def testCode = response.data.testCode
		And match testCode == null 		
	
		Then print 'First Name:', firstFeatureResult.response.data.first_name