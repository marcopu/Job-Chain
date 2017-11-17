pipeline{
	agent any
	
	triggers {
                pollSCM 'H/* * * * *'
	}
	
	stages{
		stage("Build archive"){
			steps{
			 sh 'mvn clean -DskipTests'
			 sh 'mvn compile -DskipTests'
			 sh 'mvn package -DskipTests'
			}
		}
	}
}
