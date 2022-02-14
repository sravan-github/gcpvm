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
                   ansible-playbook decrypt.yml
                   pwd
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
