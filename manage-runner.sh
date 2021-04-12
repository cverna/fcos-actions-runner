#!/bin/bash
# Handles the Github Action runner configuration.
# Remove and Registration token expires after 1 hour, if we want our runner
# to work after a reboot (auto update) we need to refresh the tokens.

# First remove the runner with a fresh remove token
REMOVE_TOKEN=$(curl -u ${GITHUB_USER}:${GITHUB_TOKEN} -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/actions/runners/remove-token | jq -r '.token')
/usr/local/sbin/actions-runner/config.sh remove --token ${REMOVE_TOKEN}


# Then register the runner with a fresh registration token
REGISTRATION_TOKEN=$(curl -u ${GITHUB_USER}:${GITHUB_TOKEN} -X POST -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/${GITHUB_USER}/${GITHUB_REPO}/actions/runners/registration-token | jq -r '.token')
/usr/local/sbin/actions-runner/config.sh --url https://github.com/cverna/fcos-actions-runner --token ${REGISTRATION_TOKEN} --labels fcos --unattended

