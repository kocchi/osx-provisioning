#!/bin/bash

. Context.sh
show_context

TASK_NAME=$(basename $0)
function pa_echo () {
  echo [${TASK_NAME}] $1
}

cd provisioning

pa_echo "Doing common playbook"
HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook playbook.yml -i hosts


if [ $ANSIBLE_VERSION_MAJOR -eq 1 ]
then
  DEFAULTS_PLAYBOOK=playbook_defaults_v1.yml
else
  DEFAULTS_PLAYBOOK=playbook_defaults.yml
fi

pa_echo "Doing playbook is ${DEFAULTS_PLAYBOOK}, which is depending ansible version"
ansible-playbook ${DEFAULTS_PLAYBOOK} -i hosts

osascript -e 'display notification "Successfull prease restart or re-login" with title "osx-provisioning"'
