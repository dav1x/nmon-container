#!/bin/sh

#mount distribution info files
cd /rootfs
find etc/ -maxdepth 1 -name "*-release" -exec mount -o bind /rootfs/{} /{} 2>/dev/null \;

stdout=false

if [ -z $1 ]; then
    stdout=true
fi


#check extra agruments
topRequired=""
if [ "$T" = "true" ]; then
    topRequired="-T"
fi

NMON_OUTPUT="/opt/nmon/output"
mkdir -p ${NMON_OUTPUT} >/dev/null 2>&1

while true; do
    echo "Running /usr/bin/nmon -F $fn -s $s -c $c $topRequired" 
    fn="${NMON_OUTPUT}/$(date +%y%m%d_%H%M%S).nmon"
    pd="$(/usr/bin/nmon -F $fn -s $s -c $c $topRequired -p)"
    
    if $stdout; then
        tail -f $fn -n +0 --pid=$pd
    fi

    if kill -0 $pd 2>/dev/null; then
        kill -9 $pd
    fi
    /usr/bin/nmonchart $fn
exit 0

done
