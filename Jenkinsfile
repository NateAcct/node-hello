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
    
    stage('JIRA') {
      def jiraServer = 'Nate_Jira'

      def testIssue = [fields: [
      project: ['key': 'AUTO'],
      summary: 'Test Bug',
      description: 'Test Bug',
      issuetype: [name: 'Bug']]]

      response = jiraNewIssue issue: testIssue, site: jiraServer

      echo response.successful.toString()
      echo response.data.toString()
    }
  }
 }
