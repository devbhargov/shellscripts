pipeline{
  agent any
  stages{
    stage('Check multi branch pipeline'){
      steps{
        echo 'this is from ${env.BRANCH_NAME} branch'
        echo "Current Git Branch: ${env.BRANCH_NAME}"
      }
    }
  }
  post{
    always{
      mail bcc: '', body: 'Congratulations, it works !! Job build successful. echo "Current Git Branch: ${env.BRANCH_NAME}" ', cc: '', from: '', replyTo: '', subject: 'Email Checker - Job status', to: 'devopstest@sharklasers.com'
    }
  }
}
