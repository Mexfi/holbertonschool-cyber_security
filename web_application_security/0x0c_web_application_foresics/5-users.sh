#!/bin/bash
grep "new user" auth.log | awk -F'[=,]' '{print $2}' | sort -u | paste -sd "," -
