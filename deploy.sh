#!/bin/bash
cd /home/a_a_alinichenko_otus/
git clone -b monolith https://github.com/express42/reddit.git
cd /home/a_a_alinichenko_otus/reddit
bundle install
puma -d

