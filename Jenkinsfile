@Library('Jenkins_shared_library') _ // name usedin jenkinssystem for library
def COLOR_MAP = [
    'FAILURE' = 'danger'
    'SUCESS' = 'good'
]



pipeline {

    agent any
    parameters {
        choice(name: 'action', choices: 'create\ndelete', description: 'Select create or destroy.')
    }

    stages {
        stage ('Clean Workspace') {
            steps {
                cleanWorkspace()
            }
        }
        
        stage ('Git Checkout') {
            steps {
                checkoutGit('url', 'main')
            }
        }
    }

    post {
        always {
            echo 'Slack Notifications'
            slackSend (
                channel: '#Channel Name',
                color: COLOR_MAP[currentBuild.currentResult],
                message: "*${currentBuild.currentResult}:* Job ${env.JOB_NAME} \n build ${env.BUILD_NUMBER} \n More info at: ${env.BUILD_URL}"
            )
        }
    }
}