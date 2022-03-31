#!/usr/bin/env bash

set -e
set -x


${UNITY_EXECUTABLE:-xvfb-run --auto-servernum --server-args='-screen 0 640x480x24' unity-editor} \
  -projectPath $UNITY_DIR \
  -quit \
  -batchmode \
  -nographics \
  -logFile /dev/stdout \
  -executeMethod BuildCommand.SyncSolution \


UNITY_EXIT_CODE=$?

if [ $UNITY_EXIT_CODE -eq 0 ]; then
  echo "Run succeeded, no failures occurred";
else
  echo "Exit code $UNITY_EXIT_CODE";
fi



