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
                   '''
            }
        }
        stage('vault') {
            steps {
                sh '''
                #ansible-playbook decrypt.yml
                ansible-vault decrypt key.json --vault-password-file pass --output key2.json
                ls -ltr
                '''
            }
          }
        stage('terraform') {
            steps {
                sh '''
                terraform init
                terraform plan -out terraform_compute_instance-${BUILD_NUMBER}.tfplan
                terraform apply terraform_compute_instance-${BUILD_NUMBER}.tfplan
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
