pipeline{
	agent any
	stages{
		stage("Build archive"){
			steps{
			 git poll: true, url: 'https://github.com/marcopu/app'
			 sh 'mvn clean -DskipTests'
			 sh 'mvn compile -DskipTests'
			 sh 'mvn package -DskipTests'
			}
		}
	}
}
