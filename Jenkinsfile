pipeline {
  agent any
  
  tools {nodejs "nodejs"}
  
  stage('Install dependencies') {
      steps {
        sh 'npm i -save express'
      }
    }     
    stage('Test') {
      steps {
        sh 'npm start'
      }
    }            
 }
  
