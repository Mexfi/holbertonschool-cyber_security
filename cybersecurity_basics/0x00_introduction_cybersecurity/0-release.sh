#!/bin/bash
grep -Po '(?<=^ID=).*' /etc/os-release
