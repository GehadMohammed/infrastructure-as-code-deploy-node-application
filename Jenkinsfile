
pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'DEV', description: 'Workspace/environment file to use for deployment')
       
    }


     environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }


    stages {
//             stage('checkout') {
    //             steps {
    //                  script{
    //                         dir("terraform")
    //                         {
    //                             git "git@github.com:GehadMohammed/IAC.git"
    //                         }
    //                     }
    //                 }
    //             }

        stage('Plan') {
          
            steps {
                sh 'terraform init -reconfigure'
                sh 'terraform workspace select ${environment} || terraform workspace new ${environment}'

                sh "terraform plan "
                sh 'terraform show  > tfplan.txt'
            }
        }
       
        stage('Apply') {
        
            steps {

                sh "terraform apply -var-file  IAC/dev.tfvars -input=false -"
            }
        }

  }
}
