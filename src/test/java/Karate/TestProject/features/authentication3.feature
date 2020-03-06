@ignore	
Feature: Call Authentication token from another feature file

	Background: 
	* def myFeature = call read('authentication2.feature') {email:'eve.holt@reqres.in',pwd:'pistol'}
	* def authToken = myFeature.accessToken
	
	Scenario: Authentiction Test
	
	When url = 'https://reqres.in/api/users?=page=3'
	And header Autherization = 'Bearer'+ authToken
	When method GET
	Then status 204