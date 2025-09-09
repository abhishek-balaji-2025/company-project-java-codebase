pipeline {
    agent {
        label 'jenkins-s1'
    }

    stages {
        stage("Checkout code") {  
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/abhishek-balaji-2025/company-project-java-codebase.git'
            }
        }

        stage("Validate-the-code") {
            steps {
                sh 'echo "validation process running..."'
                sh 'mvn validate'
            }
        }

        stage("Compile-the-code") {
            steps {
                sh 'echo "compilation process running"'
                sh 'mvn compile'
            }
        }

        stage("Testing-of-code") {
            steps {
                sh 'echo "testing process running..."'
                sh 'mvn test'
            }
        }

        stage("Package-the-code") {
            steps {
                sh 'echo "packaging the code"'
                sh 'mvn package'
            }
        }

        stage("Verify") {
            steps {
                sh 'echo "verification process running"'
                sh 'mvn verify'
            }
        }

        stage("Docker-build-image") {
            steps {
                sh 'echo "Building docker image"'
                sh 'sudo docker build -t sampleapp .'
                sh 'echo "docker image built successfully"'
            }
        }

        stage("tag-docker-image") {
            steps {
                sh 'echo "tagging docker image process begins..."'
                sh 'sudo docker tag sampleapp:latest abhishekbalaji/practice:v1'
                sh 'echo "docker image tagged successfully"'
            }
        }

        stage("trivy-docker-image-scan"){
            steps {
                sh 'which trivy'
                sh 'trivy --version'
                sh 'echo "scanning docker image..."'
                sh 'trivy image --exit-code 1 --severity HIGH,CRITICAL abhishekbalaji/practice:v1'
                sh 'echo "image scanned successfully"'
            }
        }

        stage("DockerHub-login") {
            steps {
                sh 'echo "logging into dockerhub account"'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-cred', passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USER')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage("docker-push-image") {
            steps {
                sh 'docker push abhishekbalaji/practice:v1'
                  }
             }
 
        post {
          always {
             sh 'docker logout'
          }
       }
    }
}

