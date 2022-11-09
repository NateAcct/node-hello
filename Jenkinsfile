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
     stage('Buildah') {
      steps {
        container('buildah12') {
          sh 'buildah --version'
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
  
