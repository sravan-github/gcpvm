pipeline {
    agent {
        docker { image 'sravangcpdocker/terraform:2' }
    }
    stages {
        stage('git-clone') {
            steps {
                sh '''
                   #!/bin/bash
                   git clone https://github.com/sravan-github/gcpvm.git
                   ls -ltr
                   #ansible-playbook decrypt.yml
                   #ansible-vault decrypt key.json --vault-password-file pass --output key2.json
                   ls -l
                   #terraform init
                   #terraform plan
                   '''
            }
        }
        stage('vault') {
            steps {
                sh '''
                ansible-vault decrypt key.json --vault-password-file pass --output key2.json
                ls -ltr
                '''
            }
          }
        stage('terraform') {
            steps {
                sh '''
                terraform init
                terraform plan
                '''
            }
          }
    }

post {
        always {
            cleanWs deleteDirs: true
        }
     }
}
