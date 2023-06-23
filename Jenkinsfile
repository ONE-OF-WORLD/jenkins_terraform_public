pipeline {
    agent any
    stages {
        stage('Terraform - Initialize and Apply Backend') {
            steps {
                dir('terraform-backend') {
                    script {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
        
        stage('Terraform - Initialize and Apply Codes') {
            steps {
                dir('terraform-codes') {
                    script {
                        sh 'terraform init'
                        sh 'terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
