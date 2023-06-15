pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }

     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        REGION = credentials('AWS_REGION')
    }

    stages {
      stage ('Checkout') {
          steps {
              checkout scm
         }
      }

        stage ('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage ('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage ('Terraform Plan') {
            steps {
                sh 'terraform plan -out=myplan'
            }
        }

        stage ('Terraform Apply') {
            steps {
                script {
                    def response = input(message: 'Do you want to apply the Terraform changes?', ok: 'Apply', parameters: [booleanParam(defaultValue: false, description: 'Check this box to apply the changes', name: 'applyChanges')])
                    if (response) {
                        sh 'terraform apply myplan'
                    }
                }
            }
        }
    }

    post {
        always {
            deleteDir()
        }
    }
}