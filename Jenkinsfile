pipeline {
    agent any

    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {

        stage('Checkout Source Code') {
            steps {
                git credentialsId: 'Anshu',
                    url: 'https://github.com/AnshuKumar380/JenkinsCI-CD.git',
                    branch: 'main'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh '''
                    echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                echo 'Building Docker Image...'
                docker build -t anshukr1021/cicd-e2e:${BUILD_NUMBER} .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                echo 'Pushing to DockerHub...'
                docker push anshukr1021/cicd-e2e:${BUILD_NUMBER}
                '''
            }
        }

        stage('Checkout K8s Manifests') {
            steps {
                git credentialsId: 'Anshu',
                    url: 'https://github.com/AnshuKumar380/K8S-Manifests.git',
                    branch: 'main'
            }
        }

        stage('Update & Push K8s Manifest') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'Anshu',
                    usernameVariable: 'GIT_USERNAME',
                    passwordVariable: 'GIT_PASSWORD'
                )]) {
                    sh '''
                    echo 'Updating deploy.yaml...'
                    cat deploy.yaml
                    sed -i "s/v__BUILD__/v${BUILD_NUMBER}/g" deploy.yaml
                    cat deploy.yaml

                    git config user.email "jenkins@example.com"
                    git config user.name "Jenkins CI"

                    git add deploy.yaml
                    git commit -m "Updated deploy.yaml | Jenkins Build ${BUILD_NUMBER}"

                    git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/AnshuKumar380/K8S-Manifests.git HEAD:main
                    '''
                }
            }
        }
    }
}
