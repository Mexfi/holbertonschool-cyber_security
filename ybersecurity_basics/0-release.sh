#!/bin/bash
grep -oP '^ID=\K.*' /etc/os-release
