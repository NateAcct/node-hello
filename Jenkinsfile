pipeline {  
  agent {
    kubernetes {
      defaultContainer 'jnlp'
      yamlFile 'agentpod.yml'
    }
  }
  
//   tools {nodejs "node"}
  
  stages {
   stage('Clone') {
      steps {
        container('maven') {
          sh 'mvn -v'
        }
      }
    }
    
    stage('Anchore') {
      steps {
        container('anchore') {
          sh 'anchore-cli --url http://localhost:8228/v1 --u admin --p foobar system status'
        }
      }
    }  
  }
 }
  
