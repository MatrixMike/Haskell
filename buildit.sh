#!/bin/sh
git pull && stack clean && stack install && stack list-dependencies && grep resolver stack.yaml


