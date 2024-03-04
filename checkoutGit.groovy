def call(String gitUrl, String gitBranch) {
    Checkout ([
        $class: 'GitSCM',
        branches: [[name: gitBranch]],
        userRemotConfigs: [[url: gitUrl]]
    ])
}