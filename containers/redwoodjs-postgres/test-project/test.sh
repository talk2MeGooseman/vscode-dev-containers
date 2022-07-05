#!/bin/bash
cd $(dirname "$0")

source test-utils.sh node

# Remote - Containers does not auto-sync UID/GID for Docker Compose,
# so make sure test project prvs match the non-root user in the container.
fixTestProjectFolderPrivs

# Run common tests
checkCommon

# Actual tests
check "create example project" yarn create redwood-app ./example
check "linting works" cd ./example && yarn redwood lint
check "generators work" yarn redwood generate page home /
check "setup and migrate postgres database" cp ../schema.prisma api/db/ && cp ../.env ./ && echo "test migrate" | yarn redwood prisma migrate dev
check "run default tests" yarn redwood test --watch false
check "build succeeds" yarn redwood build

cd .. && rm -rf example

# Report result
reportResults
