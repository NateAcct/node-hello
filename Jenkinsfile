// def URL_WEBHOOK = "https://afs365.webhook.office.com/webhookb2/0cee3138-f333-4beb-a4c4-8e80e4c93422@0ee6c63b-4eab-4748-b74a-d1dc22fc1a24/IncomingWebhook/0f8868d8be674c5f8e676d5b8673dd1a/90eef32b-e7be-4051-bb2e-6ecf23540627"
pipeline {  
  agent {
    kubernetes {
      defaultContainer 'jnlp'
      yamlFile 'agentpod.yml'
    }
  }
  
  environment {
//             EMAIL_INFORM = 'nathan.nti@accenturefederal.com;nathan.nti@afs.com'
          EMAIL_INFORM = 'nathan@zector.io'
        }
  
//   options {
//         office365ConnectorWebhooks([
//             [name: "Office 365", url: "${URL_WEBHOOK}", notifyBackToNormal: true, notifyFailure: true, notifyRepeatedFailure: true, notifySuccess: true, notifyAborted: true]
//         ])
//     }
  
//   tools {nodejs "node"}
  
  stages {
   stage('Clone') {
      steps {
        container('maven') {
          sh 'mvn -v'
//           sh 'giberish'
        }
      }
    }
  }
  
  post {
    success {  
      emailext body: 'Check console output at $BUILD_URL to view the results.', 
              to: "${EMAIL_INFORM}", 
              subject: 'Jenkins - Released $PROJECT_NAME - #$BUILD_NUMBER'
      }
  }
 }
