#!/bin/bash
if lsb_release -i | grep -q "Distributor ID:"; then
  echo "ok"
else
  echo "invalid"
fi
