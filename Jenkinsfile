

pipeline {
        agent any

        stages {
            stage('Checkout') {
                steps {
                                checkout scm                            }
                    }
                stage('Build') {
                steps {
                                sh ('/home/raavana/distros/apache-maven-3.6.0/bin/mvn install')
                }
                }
                stage('Deployment') {
                      steps {
                            sh 'sshpass -p "raja" scp target/gamutkart.war raja@172.17.0.2:/home/raja/distros/apache-tomcat-8.5.39/webapps'                    }
                 }
                 stage('Startup') {
			steps {
			   sh 'sshpass -p "raja" ssh raja@172.17.0.2 JAVA_HOME=/home/raja/distros/jdk1.8.0_202 /home/raja/distros/apache-tomcat-8.5.39/bin/startup.sh' 
                 }
                 }
                 }
                triggers {
                 pollSCM('H/1 * * * *')
                }
        }

