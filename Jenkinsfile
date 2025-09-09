pipeline {
    agent {
        label 'jenkins-s1'
    }

    stages {
        stage("Checkout code") {  
            steps {
                git changelog: false, poll: false, url: 'https://github.com/abhishek-balaji-2025/company-project-java-codebase.git'
            }
        }

        stage("Validate-the-code") {
            steps {
                sh 'echo "validation process running..."'
                sh '/usr/share/maven/mvn validate'
            }
        }

        stage("Compile-the-code") {
            steps {
                sh 'echo "compilation process running"'
                sh '/usr/share/maven/mvn compile'
            }
        }

        stage("Testing-of-code") {
            steps {
                sh 'echo "testing process running..."'
                sh '/usr/share/maven/mvn test'
            }
        }

        stage("Package-the-code") {
            steps {
                sh 'echo "packaging the code"'
                sh '/usr/share/maven/mvn package'
            }
        }

        stage("Verify") {
            steps {
                sh 'echo "verification process running"'
                sh '/usr/share/maven/mvn verify'
            }
        }

        stage("Docker-build-image") {
            steps {
                sh 'echo "Building docker image"'
                sh 'docker build -t sampleapp .'
                sh 'echo "docker image built successfully"'
            }
        }

        stage("tag-docker-image") {
            steps {
                sh 'echo "tagging docker image process begins..."'
                sh 'docker tag sampleapp:latest abhishekbalaji/practice:v1'
                sh 'echo "docker image tagged successfully"'
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

        stage("trivy-docker-image-scan"){
            steps {
                sh 'echo "scanning docker image..."'
                sh '/usr/bin/trivy image --exit-code 1 --severity HIGH,CRITICAL abhishekbalaji/practice:v1'
                sh 'echo "image scanned successfully"'
            }
        }

        stage("docker-push-image") {
            steps {
                sh 'echo "pushing the tagged docker image"'
                sh 'docker push abhishekbalaji/practice:v1'
            }
        }

        stage("dockerhub-logout") {
            steps {
                sh 'echo "logging out of dockerhub account"'
                sh 'docker logout'
            }
        }
    }
}

