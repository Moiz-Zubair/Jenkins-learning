pipeline {
  agent any
  stages {
    stage('Hello') {
      steps {
        echo "Hello from Jenkins! Running on: ${env.NODE_NAME}"
        // run a simple shell step (works on typical Linux host)
        sh 'echo Running shell step; uname -a || true'
      }
    }
  }
  post {
    always {
      echo 'Pipeline finished.'
    }
  }
}
