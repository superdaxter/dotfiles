#!/bin/bash
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
ssh-add -l > /dev/null 2>&1
if [ $? -ne 0 ]; then
    ssh-add ~/.ssh/arch-hypr-ed25519 < /dev/null
fi

