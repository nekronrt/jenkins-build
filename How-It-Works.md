#Jenkins

##  How it works
      Once the server is up and running, credentials and plugins configured, we need to create a pipeline project to automatize the clone of the repository to Jenkins server, build image and publish it of the docker hub repository

###  Pipeline
      In the dashboard page of jenkins server, select New Item from the left panel
        Type a name for the project.
        Select Pipeline.
        pres Ok button.

      Now we are in the project configuration page:
      In General Section
        Descripton: type a description for the project.

      Build Triggers section
        check the box for Build when a change is pushed to GitLab. right after is the webhook URL to configure in the git Repository (copy the URL)
          check the box Push Events
          click on the button advance
          generate a Secret Token that we going to use in the get repository webhook configuration.

      Pipeline
        Definition: Pipeline script from scm
          SCM: Git
            Repositories:
              Repository Url: git Repository
              credentials:  credential previously created for SSH
              Branches to build: master
          Script Path: Jenkinsfile
          Lightweigth checkout checkbox on

      After we finish the configuration press the Save button.
      in the project page click the build Now button in the left panel to start the pipeline job

## Git Repository

  In the repository we need to configure de webhook to trigger the project in Jenkins

  to configure the webhook we used the secret token created before in order to connect to the repository.

  go to the repository.
  click on settings
  find webhooks
    Payload URL: paste the webhook url that copy before
    content type: application/json
    secret: paste the secret token created before.
    save webhook.

## Testing

  in order to test the pipeline we need to make changes in some archive and push the change to git repository.
