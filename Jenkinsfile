pipeline{
	
	agent any
	
	/*triggers {
                pollSCM '* * * * *'
	}*/
	 
	stages{
		stage("Build archive"){
			steps{
			 sh 'mvn clean -DskipTests'
			 sh 'mvn compile -DskipTests'
			 sh 'mvn package -DskipTests'
			}
			
			/*post {
   			 success {
      		            archive "**"
   			 }
		        }*/
		 }
		
		stage("Unit test"){
			steps{
			//Transfer set
			//sh 'scp -r /var/lib/jenkins/jobs/DeclarativePipeline/workspace/** root@192.168.90.10:/home'
			sh 'scp -r ** root@192.168.90.10:/home'
			sh 'ssh root@192.168.90.10 ansible-playbook /home/playbooks/unit.yml'
			} 
			
		 }
		
		stage("Code Analysis"){
			steps{
		        sh 'ssh root@192.168.90.10 ansible-playbook /home/playbooks/analyzer.yml'
			}
			
		 }
		
		stage("Deploy"){
			steps{
			 sh 'scp -r target/*.war root@192.168.90.30:/opt/tomcat/webapps'
			 sh 'ssh root@192.168.90.10 ansible-playbook /home/playbooks/starttomcat.yml'
			} 
		 }
		
		stage("Functional test"){
			steps{
			 sh 'ssh root@192.168.90.10 ansible-playbook /home/playbooks/functional.yml'
			}
			
			post{
        		   always {
            			echo 'Deleting workspace. . .'
    				  deleteDir()
				   }
    
        		   success {
            			echo 'SUCCESS!'
        		       }
			 }
		 }
	}
}
