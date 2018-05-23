# Instantly Dockerized Utilities

## What's included
With only few commands you instantly receive utilities helpful in docker development:
- Docker (will be installed automatically if not installed yet)
- Docker Compose (will be installed automatically if not installed yet)
- Tools: 
  - Portainer - for docker management
  - PgAdmin4 - for database management
  - Self signed certificates generator
- Local Docker registry
  - Including registry and registry UI    
- Developer commands
  - To make work faster and simpler (read about **ins** command below) 

## How to access
After successful installation of all components you receive access to a few applications. 
Assuming you haven't changed default ports during installation (of course you can!) you can find them here:
- Portainer: [http://localhost:9000](http://localhost:9000)
- PgAdmin: [http://localhost:5050](http://localhost:5050)
- Docker registry UI: [http://localhost:5001](http://localhost:5001)

And also:
- Docker registry: **https**://[docker_registry_container_gateway|localhost]:5000

## How to use
Pleas check project documentation

* [Utilities installation](docs/installation.md)
* [Utilities management](docs/management.md) (Pgadmin 4, Portainer, Docker registry and Docker registry UI)
* [Certificates](docs/certificate.md) (Generate self signed certificates)
* [Customisation](docs/customisation.md) (Adjust this tool to your needs)
* [Frequent problems](docs/problems.md) (Before you waste your time on searching - just look here)

## You might also want
If you want make your life easier, and I bet you do, pleas check my others instantly dockerized repositories:
* [Instantly Dockerized Symfony](https://github.com/wkulinski/instantly-dockerized-symfony) -
Symfony, Nginx, Postgres and Kibana in a few minutes :)
* [Instantly Dockerized Angular](https://github.com/wkulinski/instantly-dockerized-angular) - 
Angular, NativeScript and Docker together :) 
