@Library('sharedLib')
String version = ''

pipeline {
    agent { label 'master' }

    stages {
        stage('Prepare artifacts') {
            steps {
                script {
                    currentBuild.displayName = params.version
                }
                archiveArtifacts artifacts:'assets,Dockerfile,tinyfilemanager.php'
            }
        }
        
        stage('Build Component') {
            steps {
                build job: 'dockerBuild', parameters: [
                    string(name: 'componentName', value: 'tinyfilemanager'),
                    string(name: 'archivePath', value: '/'),
                    string(name: 'componentVersion', value: params.version)
                ]
            }
            post {
                always {
                    deleteDir()
                }
            }
        }
    }
}