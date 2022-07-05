# RedwoodJS & Postgres (Community)

## Summary

Includes everything you need to develop in a RedwoodJS project using PostgreSQL as your development and testing database.

| Metadata                    | Value                                                                        |
|---------------------------- | -----------------------------------------------------------------------------|
| *Contributors*              | [talk2megooseman](https://github.com/talk2MeGooseman)                                                  |
| *Categories*                | Community, Languages, Frameworks |
| *Definition type*           | Docker Compose                                                               |
| *Works in Codespaces*       | Yes                                                                     |
| *Container host OS support* | Linux, macOS, Windows                                                        |
| *Container OS*              | Debian                                          |
| *Languages, platforms*      | Node.js, JavaScript, PostgreSQL DB                             |

## [Optional] Description

This definition creates three containers, one to run RedwoodJS, one for PostgreSQL development database, and one for PostgreSQL testing database. VS Code will attach to the RedwoodJS container, and from within that container the PostgreSQL containers will be available on **`localhost`** port 5432. The development database is named `development_db` and the test database is named `test_db`, both with a user of `postgres` whose password is `postgres`, and if desired this may be changed in `docker-compose.yml`. Data is stored in a volume named `postgres-data` and `postgres-test-data`.

## Using this definition

While the definition itself works unmodified, it uses the `mcr.microsoft.com/vscode/devcontainers/javascript-node` image which includes `git`, `eslint`, `zsh`, [Oh My Zsh!](https://ohmyz.sh/), a non-root `node` user with `sudo` access, and a set of common dependencies for development. You can pick a different version of this image by updating the `VARIANT` arg in `.devcontainer/docker-compose.yml` to pick a Node.js version.

```yaml
build:
  context: .
  dockerfile: Dockerfile
  args:
    # Update 'VARIANT' to pick an LTS version of Node.js: 18, 16, 14.
    # Append -bullseye or -buster to pin to an OS version.
    # Use -bullseye variants on local arm64/Apple Silicon.
    VARIANT: 16-bullseye
```

### Adding another service

You can add other services to your `docker-compose.yml` file [as described in Docker's documentation](https://docs.docker.com/compose/compose-file/#service-configuration-reference). However, if you want anything running in this service to be available in the container on localhost, or want to forward the service locally, be sure to add this line to the service config:

```yaml
# Runs the service on the same network as the app container, allows "forwardPorts" in devcontainer.json function.
network_mode: service:app
```

### Adding the definition to a project or codespace

1. If this is your first time using a development container, please see getting started information on [setting up](https://aka.ms/vscode-remote/containers/getting-started) Remote-Containers or [creating a codespace](https://aka.ms/ghcs-open-codespace) using GitHub Codespaces.

2. Start VS Code and open your project folder or connect to a codespace.

3. Press <kbd>F1</kbd> select and **Add Development Container Configuration Files...** command for **Remote-Containers** or **Codespaces**.

   > **Note:** If needed, you can drag-and-drop the `.devcontainer` folder from this sub-folder in a locally cloned copy of this repository into the VS Code file explorer instead of using the command.

4. Select this definition. You may also need to select **Show All Definitions...** for it to appear.

5. Finally, press <kbd>F1</kbd> and run **Remote-Containers: Reopen Folder in Container** or **Codespaces: Rebuild Container** to start using the definition.

## Testing the definition

This definition includes some test code that will help you verify it is working as expected on your system. Follow these steps:

1. If this is your first time using a development container, please follow the [getting started steps](https://aka.ms/vscode-remote/containers/getting-started) to set up your machine.
2. Clone this repository.
3. Start VS Code, press <kbd>F1</kbd>, and select **Remote-Containers: Open Folder in Container...**
4. Select the `containers/redwoodjs-postgres` folder.
5. After the folder has opened in the container, press <kbd>F5</kbd> to start the project.
6. From here, you can run the test script inside the `test-project` subfolder by executing `./test.sh` in the terminal.
    i. The script will generate a RedwoodJS project, test Postgres is working properly, run generators, and tests.

## License

Copyright (c) Microsoft Corporation. All rights reserved.

Licensed under the MIT License. See [LICENSE](https://github.com/Microsoft/vscode-dev-containers/blob/main/LICENSE).
