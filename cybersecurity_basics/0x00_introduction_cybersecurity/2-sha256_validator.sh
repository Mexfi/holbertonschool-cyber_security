#!/bin/bash
echo "$2  $1" > temp.sha256 && sha256sum -c temp.sha256 && rm temp.sha256
