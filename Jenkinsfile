pipeline{
	
	agent any
	
	/*triggers {
                pollSCM '* * * * *'
	}
	*/
	
	stages{
		stage("Build archive"){
			steps{
			 sh 'mvn clean -DskipTests'
			 sh 'mvn compile -DskipTests'
			 sh 'mvn package -DskipTests'
			}
			post {
   			 success {
      		            archive "**"
   			 }
		        }
		}
		
		stage("Unit test"){
			steps{
			 sh 'mvn test'
			} 
		}
	}
}
