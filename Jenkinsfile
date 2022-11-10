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
          sh 'anchore-cli image add rancher/mirrored-library-busybox:1.34.1'
          sh 'anchore-cli image wait rancher/mirrored-library-busybox:1.34.1'
          sh 'anchore-cli system feeds list'
          sh 'anchore-cli system wait'
          sh 'anchore-cli image vuln rancher/mirrored-library-busybox:1.34.1 os'
          sh 'anchore-cli image content rancher/mirrored-library-busybox:1.34.1 os'
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
  
