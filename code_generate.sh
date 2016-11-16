#!/bin/bash

if [ -d "gen-cpp" ]; then
    rm gen-cpp -rf
fi

if [ -d "gen-java" ]; then
    rm gen-java -rf
fi

thrift -r --gen java interface.thrift
thrift -r --gen cpp  interface.thrift
