#!/usr/bin/env zsh

set -ex
ssh-keygen -t ed25519

/bin/zsh ./setup_brew.sh
/bin/zsh ./setup_config.sh
/bin/zsh ./setup_dev.sh
