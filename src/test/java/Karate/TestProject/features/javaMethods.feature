Feature: Java Functions

  Scenario: calling java methods (static and non static)
    * def sumRes =
      """
      function(a,b) {
        var JavaDemo = Java.type('Karate.TestProject.features.javaFunctions');
        var jd = new JavaDemo();
        return jd.sumFun(a,b);  
      }
      """
    * def res = call sumRes(6,9)
    * print 'Sum of-', res
    * def jvDemo = Java.type('Karate.TestProject.features.javaFunctions')
    * def result = jvDemo.myName('OM SithaRama')
    * print 'My Name is-',result



  Scenario: request user 3 details
    Given url 'https://reqres.in/api/users?page=1'
    When method GET
    Then status 200
    * def totRes = response.data
    Then print 'Total result',totRes
    * def myFun =
      """
      function(vals){
      	for(i=0; i<vals.length; i++){
      		if(vals[i].id == 5){
      			return vals[i].email
      		}
      	}
      }
      """
    * def result3 = call myFun totRes
    * def writeDataObj = Java.type('Karate.TestProject.features.WriteData')
    * def res3 = writeDataObj.writeData(result3)
