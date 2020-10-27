  
pipeline {
  agent { label 'docker' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  triggers {
    cron('0 0 * * *')
  }
  stages {
    stage('Build') {
      steps {
        ansiColor('ansi') {
            timestamps {
              sh "docker build -t computerminds/phpcs-phpcompatibility:latest ."
            }
        }
      }
    }
    stage('Publish') {
      when {
        branch 'master'
      }
      steps {
        withDockerRegistry([ credentialsId: "1679f2a2-5b25-4749-8f17-163fd0ec35af", url: "" ]) {
          sh "docker push computerminds/phpcs-phpcompatibility:latest"
        }
      }
    }
  }
}
