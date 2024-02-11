# Sample Runtime configuration for React / Node.js

Sample React.js project demonstrating configuring runtime configuration for a Node.js web application. The application is built and packaged using Docker through a Makefile, and the runtime values are decided based on the DEPLOYMENT_ENV environment variable.
The **env-config.js** holds the used runtime configuration and the **env-config.sh** script is used to create the correct values based on the **DEPLOYMWENT_ENV**.


# Requirements
- Docker
- Node.js

## Build and Run

In the project directory, you can run:
DEPLOYMENT_ENV, by default, will be dev.

### `make run`
- Builds the Docker image
- Runs the Docker container

Open [http://localhost](http://localhost) to view it in the browser.

## Switch Environment
Now run the following to switch to prod:

### `DEPLOYMENT_ENV=prod make run`

The page in the browser should show the new environment.