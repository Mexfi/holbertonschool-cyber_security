#!/bin/bash
grep "Accepted" auth.log | grep -v "127.0.0.1" | grep -oE '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | sort -u | wc -l
