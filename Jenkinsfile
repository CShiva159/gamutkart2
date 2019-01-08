

pipeline {
        agent any

        stages {
            stage('Checkout') {
                steps {
                                checkout scm                            }
                    }
                stage('Build') {
                steps {
                                sh ('/home/raj/Distros/apache-maven-3.6.0/bin/mvn install')
                }
                }
                stage('Deployment') {
                      steps {
                            sh 'sshpass -p "raj" scp target/gamutkart.war raj@172.17.0.3:/home/raj/Distros/apache-tomcat-8.5.35/webapps'                    }
                 }
                 stage('Startup') {
			steps {
			   sh 'sshpass -p "raj" ssh raj@172.17.0.3 JAVA_HOME=/home/raj/Distros/jdk1.8.0_191 /home/raj/Distros/apache-tomcat-8.5.35/bin/startup.sh' 
                 }
                 }
                 }
                triggers {
                 pollSCM('H/1 * * * *')
                }
        }

