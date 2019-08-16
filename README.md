#Jenkins

  Jenkins up and running in a docker container.

  It's a docker-compose project which has one service:

    - Jenkins (jenkins/jenkins:lts): The Jenkins master
      - Docker inside the Jenkins container

  The jenkins_home it's mapped to a localhost location for persistent storage, the container docker sock is also mapped to the host docker sock.

##Quickstart

  clone the repository, go to the project's root and type:

        ```
        docker build -t infile/jenkins .

        docker-compose up -d
        ```

  Wait for the container to start and Jenkins will be available on http://localhost:8080 or http://server-ip:8080

  The server will ask for an initial password, this can be found in /var/jenkins_home/secrets/initialAdminPassword inside the container or
  can be found in the localhost location, the location of jenkins_home is the folder where the project is located "./jenkins_home/secrets/initialAdminPassword"


            ```
             cat initialAdminPassword

            ```
  copy the password and paste it in the box in the Jenkins page, after that, fill the administrator user, password, etc.

  select Install suggested plugins if you want to use the default configuration or Select plugins to install option to search for a specific plugins

## Prerequisites

### 1. Plugins
  For this go to the Jenkins configuration section " Manage Jenkins" from the left panel, next, find the Manage Plugins option, it's necessary to add
  the docker hub, credentials,

### 2. Credentials
  In order to connect with the git repository it's necessary to configure the user and password or a ssh key, also it's necessary to create the
  credentials for the docker hub repository for the publish of the images created.

  To configure the access to the git repository and docker hub repository go to Credentials option in the left panel of the overview page.
  click to (global) option located in the Stores scoped to Jenkins area.
  select Add Credentials from the left panel.

  to authenticate we can use a user and password or SSH Username with private key

####  Docker Hub
    kind: username with password
    scope: Global
    username: username of docker hub repository (use only username that appears in the docker hub profile)
    password: the password to connect
    ID: create and id for the credential (this is the id that is needed in Jenkinsfile to create the connection withe the repository)
    Description: A Description of the credentials (use a Description that identify the project)

####  Git repository
    Kind: SSH Username with Private key
    Scope: Global
    ID: create and id for the credential (this is the id that is needed in Jenkinsfile to create the connection withe the repository)
    Description: A Description of the credentials (use a Description that identify the project)
    Username: username of git repository
      Select private key, click the add button and in the text box paste the private key
    Passphrase: the password of the private key if exist or let it blank

  Click on the OK button to finish the creation of the credential.

  create as many credentials you need.
