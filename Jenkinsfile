

pipeline {
        agent any

        stages {
            stage('Checkout') {
                steps {
                                checkout scm                            }
                    }
                stage('Build') {
                steps {
                                sh ('mvn install')
                }
                }
                stage('Deployment') {
                      steps {
                            sh 'cp -R target/gamutkart.war /home/ubuntu/apache-tomcat-8.5.45/webapps'                    }
                 }
                 stage('Startup') {
			steps {
			   sh 'JAVA_HOME=/home/ubuntu/jdk1.8.0_141 /home/ubuntu/apache-tomcat-8.5.45/bin/startup.sh' 
                 }
                 }
                 }
                triggers {
                 pollSCM('H/1 * * * *')
                }
        }

