pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'performDestroy', defaultValue: false, description: 'Set to true to perform terraform destroy')
    }

    environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        REGION = credentials('AWS_REGION')
    }

    stages {
        stage('Terraform - Backend') {
            stages {
                stage('Initialize and Plan') {
                    steps {
                        dir('terraform-backend') {
                            script {
                                sh 'terraform init -upgrade'
                                sh "terraform validate"
                                sh "terraform plan"
                            }
                        }
                    }
                }
                stage('Approval') {
                    when {
                        not {
                            equals expected: true, actual: params.autoApprove
                        }
                    }

                    steps {
                        script {
                            input message: "Do you want to apply the plan?",
                            parameters: [text(name: 'Plan', description: 'Please review the plan')]
                        }
                    }
                }
                stage('Apply') {
                    steps {
                        dir('terraform-backend') {
                            sh "terraform apply --auto-approve"
                        }
                    }
                }
                stage('Destroy') {
                    when {
                        expression { params.performDestroy == true }
                    }
                    steps {
                        dir('terraform-codes') {
                            sh 'terraform init -input=false'
                            sh 'terraform destroy -input=false -auto-approve'
                        }
                    }
                }
            }
        }
        stage('Terraform - Codes') {
            stages {
                stage('Initialize and Plan') {
                    steps {
                        dir('terraform-codes') {
                            script {
                                sh 'terraform init -upgrade'
                                sh "terraform validate"
                                sh "terraform plan"
                            }
                        }
                    }
                }
                stage('Approval') {
                    when {
                        not {
                            equals expected: true, actual: params.autoApprove
                        }
                    }

                    steps {
                        script {
                            input message: "Do you want to apply the plan?",
                            parameters: [text(name: 'Plan', description: 'Please review the plan')]
                        }
                    }
                }
                stage('Apply') {
                    steps {
                        dir('terraform-codes') {
                            sh "terraform apply --auto-approve"
                        }
                    }
                }
                    
                stage('Destroy') {
                    when {
                        expression { params.performDestroy == true }
                    }
                    steps {
                        dir('terraform-backend') {
                            sh 'terraform init -input=false'
                            sh 'terraform destroy -input=false -auto-approve'
                        }
                    }
                }
            }
        }
    }
}