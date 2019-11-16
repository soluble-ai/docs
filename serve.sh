#!/bin/bash

docker build . -t docsify

docker run --init -it -p 3000:3000 -v `pwd`:/docs docsify