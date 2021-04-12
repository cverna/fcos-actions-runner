# Fedora CoreOS Github Actions Runner

This repository contains a [Butane](https://github.com/coreos/butane) configuration file that can be used to provition a Fedora CoreOS Github Action Runner.

## How to use

First clone this repository and make a copy of config.yaml.example.

```
$ git clone https://github.com/cverna/fcos-actions-runner
$ cd fcos-actions-runner
$ cp config.yaml.example config.yaml
```

Edit config.yaml to replace :
  - [github-alias] by your own GitHub alias or organization
  - [repo] by the name of the repository you want this action runner to be used
  - [alpha-numeric-token] by the token provide by GitHub. (Repository --> Settings --> Actions --> Add runner --> token in the configure command)

Once you have edited the file, use butane to create the ignition configuration

```
$ podman run -i --rm quay.io/coreos/butane:release --pretty --strict < config.yaml > config.ignition
```

Finally you can use config.ignition to provision an fcos instance on the supported [platforms](https://docs.fedoraproject.org/en-US/fedora-coreos/bare-metal/)
