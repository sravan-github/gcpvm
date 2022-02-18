pipeline {
    agent {
        docker { 
            image 'sravangcpdocker/terraform:2'
            args '-u root:root'
        }
    }
    environment {
       passwd=credentials('password') 
      }
    stages {
        stage('git-clone') {
            steps {
                sh '''
                   #!/bin/bash
                   git clone https://github.com/sravan-github/gcpvm.git
                   ls -ltr
                   '''
            }
        }
        stage('vault') {
            steps {
                sh '''
                #ansible-playbook decrypt.yml
                ansible-vault decrypt key.json --vault-password-file $passwd --output key2.json
                ls -ltr
                '''
            }
          }
        stage('terraform') {
            steps {
                sh '''
                terraform init
                terraform plan
                terraform apply --auto-approve
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
