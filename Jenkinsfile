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
			sh 'ssh root@192.168.100.10 mkdir /pipeline'
			sh 'scp -r ** root@192.168.100.10:/pipeline'
			sh 'ssh root@192.168.100.10 ansible-playbook /pipeline/playbooks/unit.yml'
			} 
			
		 }
		
		stage("Code Analysis"){
			steps{	
		        sh 'ssh root@192.168.100.10 ansible-playbook /pipeline/playbooks/analyzer.yml'
			}
			
		 }
		
		stage("Deploy"){
			steps{
			 sh 'ssh root@192.168.100.10 ansible-playbook /pipeline/playbooks/starttomcat.yml'
			 sh 'ssh root@192.168.100.30 rm -f /opt/tomcat/webapps/*.war'
			 sh 'scp -r target/*.war root@192.168.100.30:/opt/tomcat/webapps'
			} 
		 }
		
		stage("Functional test"){
			steps{
			 sh 'ssh root@192.168.100.40 mkdir pipeline'
			 sh 'scp -r ** root@192.168.100.40:/pipeline'
			 sh 'ssh root@192.168.100.10 ansible-playbook /pipeline/playbooks/functional.yml'
			}
			
			post{
        		   always {
            			echo 'Deleting workspace. . .'
    				  deleteDir()
				
    				echo 'Cleaning. . .'
    				  sh 'ssh root@192.168.100.10 rm -r /pipeline'
				  sh 'ssh root@192.168.100.40 rm -r /pipeline'
				   }
			
        		   success {
            			echo 'GAME OVER!'
        		       }
			 }
		 }
	}
}
