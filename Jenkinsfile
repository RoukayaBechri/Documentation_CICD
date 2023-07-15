
pipeline {
    agent any

    tools {
        git 'Default'
        nodejs 'NodeJS'
        dockerTool 'docker'
    }
    environment {
        imageName = "myapp"
        registryCredentials = "nexus"
        registry = "172.16.0.3:8085"
        dockerImage = ''
    }


    stages {
        stage('Clone') {
            steps {
                   sh 'echo test clone '
                   git branch: 'main', url: 'https://github.com/RoukayaBechri/Documentation_CICD.git'
            //    sh 'rm -rf Documentation_CICD '
            //    sh 'git clone https://github.com/RoukayaBechri/Documentation_CICD.git'
            }
        }

        stage('install dependency') {
            steps {
              //  sh 'npm install'
              sh 'echo hi'
            }
        }
        stage('Build') {
            steps {
               // sh 'npm run build'
               sh 'echo hi'
            }
        }
        
      
        
        stage('dockerize the app') {
             steps {
              //  sh 'docker build -t doc:v1 .'
              sh 'echo hi'
            }
        }
        
        stage('push to nexus') {
             steps {
                 sh 'echo hi'
                // sh '''
                
                // docker login localhost:8085 -u admin -p nexus
                // docker tag doc:v1 localhost:8085/documentation:v1
                // docker push localhost:8085/documentation:v1
                
                // '''
                
            }
        }
        
        stage('Ansible Playbook') {
            steps {
                withCredentials([file(credentialsId: 'key', variable: 'SERVICE_ACCOUNT_KEY')]) {
                    sh '''
                    cat ${SERVICE_ACCOUNT_KEY} > demo.pem
                    chmod 400 demo.pem
                    ansible-playbook --user=ubuntu --private-key=demo.pem installdocker.yml -i hosts
                    '''
                }
            }
        }
    }    
}