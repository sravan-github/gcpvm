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
                   pwd
                   ansible-vault decrypt key.json --vault-password-file password1 --output key2.json
                   pwd
                   ls -l
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
