
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
               sh 'npm install'
              //sh 'echo hi'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
               //sh 'echo hi'
            }
        }
        
      
        stage('sonrqube'){
            agent { 
                docker { 
                    image 'sonarsource/sonar-scanner-cli' 
                    args '-v //var/run/docker.sock:/var/run/docker.sock  --network documentation_cicd_devops'
                } 
            }
            steps{
             
             sh '''
              sonar-scanner \
               -Dsonar.projectKey=doc \
               -Dsonar.sources=./src \
               -Dsonar.host.url=http://sonarqube:9000 \
               -Dsonar.login=admin \
               -Dsonar.password=sonar
             '''
            }

        }
        stage('dockerize the app') {
             steps {
              //  sh 'docker build -t doc:v1 .'
              sh 'echo hi'
            }
        }
        
        /*stage('push to nexus') {
             steps {
                 sh 'echo hi'
                 sh '''
                
                 docker login localhost:8085 -u admin -p nexus
                 docker tag doc:v1 localhost:8085/documentation:v1
                 docker push localhost:8085/documentation:v1
                
                 '''
                
            }
        }*/
        stage('Push to Docker Hub') {
             environment {
                DOCKERHUB_USERNAME = 'dockerusername2023'
                DOCKERHUB_PASSWORD = 'adminDocker'
              }
             steps {
               withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                  sh '''
                  docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}
                  docker tag doc:v1 ${DOCKERHUB_USERNAME}/documentation:v1
                  docker push dockerusername2023/documentation:v1

                  '''
                }
            }
        }

        stage('Ansible Playbook') {
            steps {
                withCredentials([file(credentialsId: 'ec2key', variable: 'SERVICE_ACCOUNT_KEY')]) {
                    sh '''

                    
                    printf "%s" "${SERVICE_ACCOUNT_KEY}" > del.pem
                    chmod 400 to.pem
                    ansible-playbook --user=ubuntu --private-key=to.pem installdocker.yml -i hosts
                    
                    '''
                }
            }
        }

        //stage('Pull img from nexus') {
          //  steps {
             /*  sh '''
               
               docker push dockerusername2023/documentation:tagname

               '''
          }
        }*/
        stage('Deploy the container to ec2') {
            environment {
                DOCKERHUB_USERNAME = 'dockerusername2023'
                DOCKERHUB_PASSWORD = 'adminDocker'
                container_name = 'documentation'
                image_name = 'dockerusername2023/doc'
                tag = 'v1'
              }
             steps {
                  withCredentials([file(credentialsId: 'ec2key', variable: 'SERVICE_ACCOUNT_KEY')]) {
                    sh '''

                    
                    printf "%s" "${SERVICE_ACCOUNT_KEY}" > del.pem
                    chmod 400 to.pem
                    ansible-playbook --user=ubuntu --private-key=to.pem pull_image.yml --extra-vars \
                    'DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME} \
                    DOCKERHUB_PASSWORD=${DOCKERHUB_PASSWORD} \
                    image_name=${image_name} \
                    tag=${tag} \
                    container_name=${container_name}' \
                    -i hosts
                    
                    '''
                }
        }

    }    
        stage('Deploy the container to EC2') {
          environment {
            DOCKERHUB_USERNAME = 'dockerusername2023'
            DOCKERHUB_PASSWORD = 'adminDocker'
            container_name = 'doc'
            image_name = 'dockerusername2023/documentation'
            tag = 'v1'
          }
          steps {
            withCredentials([file(credentialsId: 'ec2key', variable: 'SERVICE_ACCOUNT_KEY')]) {
              sh '''
              printf "%s" "${SERVICE_ACCOUNT_KEY}" > del.pem
              chmod 400 to.pem
              docker login -u "${DOCKERHUB_USERNAME}" -p "${DOCKERHUB_PASSWORD}"
              ansible-playbook --user=ubuntu --private-key=to.pem pull_image.yml --extra-vars \
                "DOCKERHUB_USERNAME=${DOCKERHUB_USERNAME} \
                DOCKERHUB_PASSWORD=${DOCKERHUB_PASSWORD} \
                image_name=${image_name} \
                tag=${tag} \
                container_name=${container_name}" \
                -i hosts
              '''
            }
          }
        }

}

}