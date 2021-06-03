#!/bin/bash

main() {
    # run rails server
    cd /rask
    rails s -b 0.0.0.0 -p 3000 &

    pid=$!

    # stop server when receive SIGTERM
    trap 'signal_handler $pid' SIGTERM

    # wait for daemon stopping
    wait

    rm ./tmp/pids/server.pid
}

signal_handler() {
    echo "Stopping daemon pid: $1"
    kill -2 $1
}

main
