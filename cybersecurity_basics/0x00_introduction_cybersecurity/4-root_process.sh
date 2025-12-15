#!/bin/bash
ps -u "$1" -eo user,pid,%cpu,%mem,vsz,rss,command --sort=pid | grep -v ' 0 0 ' | grep -v '^USER'
