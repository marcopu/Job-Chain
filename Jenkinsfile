pipeline{
	agent any
	git "https://github.com/marcopu/app"
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
