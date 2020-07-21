pipeline {
     agent any
     stages {
         stage('Build') {
              steps {
                  sh 'echo Building...'
              }
         }
         stage('Lint HTML') {
              steps {
                  sh 'tidy -q -e *.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  sh 'docker build -t capstone-project-cloud-devops .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                      sh "docker tag capstone-project-cloud-devops hemanthhr/capstone-project-cloud-devops"
                      sh 'docker push hemanthhr/capstone-project-cloud-devops'
                  }
              }
         }
        stage('Set current kubectl context') {
                        steps {
                        withAWS(region: 'us-west-2', credentials: 'aws') {
                                sh '''
                    aws eks update-kubeconfig --name capstone
                                        kubectl config use-context arn:aws:eks:us-west-2:904158542353:cluster/capstone
                                '''
                        }
                        }
                }
        stage('Deploying blue container') {
            steps {
                        withAWS(region: 'us-west-2', credentials: 'aws') {
                                sh '''
                                        kubectl apply -f ./blue-controller.json
                                '''
                                }
            }
        }

        stage('Deploying green container') {
            steps {
                        withAWS(region: 'us-west-2', credentials: 'aws') {
                                sh '''
                                        kubectl apply -f ./green-controller.json
                                '''
                        }
            }
        }

        stage('Running services for blue') {
            steps {
                        withAWS(region: 'us-west-2', credentials: 'aws') {
                                sh '''
                                        kubectl apply -f ./blue-service.json
                                '''
                        }
            }
        }
    
        stage('Running service for green') {
            steps {
                        withAWS(region: 'us-west-2', credentials: 'aws') {
                                sh '''
                                        kubectl apply -f ./green-service.json
                                '''
                        }
                  }
             }
        }
}

        
 