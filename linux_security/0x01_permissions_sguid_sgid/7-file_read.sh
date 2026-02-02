#!/bin/bash
find "$1" -type f -exec chmod o-w {} \; -exec chmod o-x {} \;
