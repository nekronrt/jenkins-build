node {
    def app
    def commit_id

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
        sh "git rev-parse HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id').trim()
        println commit_id.substring(0,8)
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("nekronrt/jenkins")
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */

        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push("${commit_id.substring(0,8)}")
            app.push("lts")
        }
    }

    stage('Deploy QA'){
      sh "ssh -v jenkins@172.27.173.33 /bin/bash <<'EOT'"
      sh "echo "These commands will be run on: $( uname -a )""
      sh "echo "They are executed by: $( whoami )""
      sh "EOT"
      sh "echo deploying image"
      //sh "ssh jenkins@172.27.173.33"
      sh "docker rm -f jenkins || true"
      sh "docker-compose up -d"
      //sh "docker run -d -p 8080:8080 --name jenkins nekronrt/jenkins:${commit_id.substring(0,8)}"
    }
}
