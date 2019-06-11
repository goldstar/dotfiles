#!/bin/sh

if ! command -v >/dev/null terraform; then
  echo " Installing Terraform CLI"
  brew install terraform >> /tmp/hashicorp-install.log
fi

if ! command -v >/dev/null consul; then
  echo " Installing Consul CLI"
  brew install consul >> /tmp/hashicorp-install.log
fi

if ! command -v >/dev/null nomad; then
  echo " Installing Nomad CLI"
  brew install nomad >> /tmp/hashicorp-install.log
fi

if ! command -v >/dev/null vault; then
  echo " Installing Vault CLI"
  brew install vault >> /tmp/hashicorp-install.log
fi
