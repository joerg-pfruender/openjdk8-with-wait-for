#!/usr/bin/env bash
#   Copyright 2019 Joerg Pfruender
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

CURRENT_BRANCH=$(git branch | grep \* | cut -d ' ' -f2)

if [ $CURRENT_BRANCH = "master" ]; then
  echo "on master, update_branch not possible."
else
  CHANGED=$(git diff-index --name-only HEAD --)
  if [ -n "$CHANGED" ]; then
    echo "You have local changes, please stash first!"
  else
    git checkout master \
    && git pull \
    && git checkout $CURRENT_BRANCH \
    && git rebase master
  fi
fi

