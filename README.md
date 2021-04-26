# Fedora CoreOS Github Actions Runner

This repository contains a [Butane](https://github.com/coreos/butane) configuration file that can be used to provition a Fedora CoreOS Github Action Runner.

## How to use

First clone this repository and make a copy of actions-runner.example.

```
$ git clone https://github.com/cverna/fcos-actions-runner
$ cd fcos-actions-runner
$ cp actions-runner.example actions-runner
```

Edit actions-runner to set the following variables
  * GITHUB_USER: Your github username
  * GITHUB_REPO: Repository the runner will be configured to.
  * GITHUB_TOKEN: GitHub personal access token with the `repo` permission [docs](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token)

Once you have edited the file, use butane to create the ignition configuration

```
$ podman run -i --rm -v $PWD:/code:z --workdir /code quay.io/coreos/butane:release --pretty --strict config.yaml -o config.ignition
```

Finally you can use config.ignition to provision an fcos instance on the supported [platforms](https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/)
