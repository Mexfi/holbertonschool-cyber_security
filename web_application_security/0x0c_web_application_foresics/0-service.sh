#!/bin/bash
grep "pam_unix" auth.log | awk '{print $5}' | sort | uniq -c | sort -nr
