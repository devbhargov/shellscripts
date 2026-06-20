pipeline{
  agent any
  stages{
    stage('Check multi branch pipeline'){
      steps{
        echo 'this is from ${env.BRANCH_NAME} branch'
      }
    }
  }
  post{
    always{
      mail bcc: '', body: 'Congratulations, it works !! Job build successful. this is from ${env.BRANCH_NAME} branch ', cc: '', from: '', replyTo: '', subject: 'Email Checker - Job status', to: 'devopstest@sharklasers.com'
    }
  }
}
