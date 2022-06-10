
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

        stage('Terraform Plan') {
          
            steps {
                sh 'pwd'
                sh 'terraform -chdir=terraform/  init -reconfigure'
                sh 'terraform -chdir=terraform/  workspace select ${environment} || terraform -chdir=terraform/  workspace new ${environment}'
                // sh "terraform  -chdir=terraform/  plan -var-file dev.tfvars"
            }
        }
       
        stage('build infrastructure') {
        
            steps {
                sh "terraform  -chdir=terraform/ destroy -var-file ${environment}.tfvars -input=false -auto-approve "
//                 sh "echo build infrastructure on aws"
                
//                 sh "terraform  -chdir=terraform/ apply -var-file ${environment}.tfvars -input=false -auto-approve "
                
//                 sh "echo configure ssh file to allow jenkins master ssh private instance host our application"
                
//                 sh "chmod +x scripts/jump-host-ssh.sh"
//                 sh "./scripts/jump-host-ssh.sh"
            }
        }
//     stage('slave-configurtion') {
//             steps {
//                 script {
//                     dir("${env.WORKSPACE}/ansible/"){
//                             sh "pwd"
//                             echo 'configure slave -private instance- as jenkins slave using ansible'
//                             sh 'ansible-playbook playbook.yml -i inventory'
                        
//                         }
//                 }
//                 }
//             }
  }
}
