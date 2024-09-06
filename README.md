# Ansible and Jenkins

This repository demonstrates the power of Ansible to set up a Jenkins master
(commander) and agents in a Docker Compose environment. Ansible automation
configures software for both the Jenkins commander and agents with the necessary
configurations and highlights its extensibilty for provisioning infrastructure.

## Prerequisites

- [Docker Engine](https://docs.docker.com/engine/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup Instructions

1. Build and run the environment.

To set up the environment, simply build the Docker containers and start the
services using Docker Compose:

```bash
docker compose up -d --build
```

2. Run the Ansible playbook to install and configure Jenkins.

Next, execute the Ansible playbook to install Jenkins on the commander (Jenkins
master) and register the agents automatically:

```bash
docker compose exec commander ansible-playbook -i inventory.ini playbooks/install_jenkins.yaml
```

3. Retrieve the Jenkins UI initial admin password.

To access Jenkins for the first time, you need the initial admin password. You
can retrieve it using the following command:

```bash
docker compose exec commander cat /root/.jenkins/secrets/initialAdminPassword
```

4. Access Jenkins Web UI.

Navigate to the following URL to access the Jenkins UI:

```
http://localhost:8080
```

5. Skip user creation and set up.

Jenkins will prompt you to install some plugins. Do that. You can decline
creating a user and setting the Jenkins URL, however.

6. Verify agents are connected.

Once you’ve logged into Jenkins, you will see the agents automatically connected
to the Jenkins master under the “Manage Jenkins” -> “Manage Nodes and Clouds”
section. The agents are configured to be ready for builds.

## How it Works

1. **Docker Compose**: Defines a multi-container environment with the Jenkins
   master (commander) and agents.
2. **Ansible**: Automates the Jenkins installation, plugin setup, and agent
   registration process.
3. **Jenkins Agents**: The agents automatically connect to the Jenkins master
   through the Swarm plugin, which is installed via the Ansible playbook.

## License

This project is licensed under the MIT License.
