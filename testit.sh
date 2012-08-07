#!/bin/sh
set -e
clang -w -framework Foundation RTUtil.m crudetest.m -o testrun
./testrun
