pipeline {  
//   agent any
  agent {
    kubernetes {
      defaultContainer 'jnlp'
      yamlFile 'agentpod.yml'
    }
  }
  
//   tools {nodejs "node"}
  environment {
    ANCHORE_CLI_URL=http://172.18.242.118:8228/v1
    ANCHORE_CLI_USER=admin
    ANCHORE_CLI_PASS=foobar
  }
  
  stages {
     stage('Anchore') {
      steps {
        container('anchore') {
          sh 'anchore-cli --url http://172.18.242.118:8228/v1 --u admin --p anchore-engine system status'
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
  
