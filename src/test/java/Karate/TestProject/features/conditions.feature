Feature: Conditions in Karate

	Background:
		* def expOutPut = read ('../jsonData/conditionsexpResult.json')
	
	Scenario: request user 3 details
		Given url 'https://reqres.in/api/users?page=1'
		When method GET
		Then status 200
		* def myFun = function(){return "Hello"}
		* def res = call myFun
		Then print 'ActRes-',response
		And match response == expOutPut
		
		* def totRes = response.data
		Then print 'Total result',totRes
		
		* def resFun =
		"""
		function(vals){
			for(i=0;i<vals.length; i++){
				if(vals[i].id == 5){
					return vals[i]
				}
			}
		}
		"""
		
		* def numUsers = call resFun totRes
		Then print numUsers
		
	
	