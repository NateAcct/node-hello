pipeline {  
//   agent any
  agent {
    kubernetes {
      defaultContainer 'jnlp'
      yamlFile 'agentpod.yml'
    }
  }
  
//   tools {nodejs "node"}
  
  stages {
     stage('Anchore') {
      steps {
        container('anchore') {
          sh 'anchore-cli system status'
          sh 'anchore-cli image add jenkins/jenkins:2.361.1-jdk11'
          sh 'anchore-cli image wait jenkins/jenkins:2.361.1-jdk11'
          sh 'anchore-cli system feeds list'
          sh 'anchore-cli system wait'
          sh 'anchore-cli image vuln jenkins/jenkins:2.361.1-jdk11 os'
          sh 'anchore-cli image content jenkins/jenkins:2.361.1-jdk11 os'
        }
      }
    }
    
//     stage('Anchore Version') {
//       steps {
//         container('anchoreapi') {
//           sh 'anchore-cli --version'
//         }
//       }
//     } 
    
//     stage('Anchore Status') {
//       steps {
//         container('anchore') {
//           sh 'anchore-cli --url http://localhost:8228/v1 --u admin --p anchore-engine system status'
//         }
//       }
//     }  
  }
 }
  
