#!/bin/bash

set -x

function dcp()
{
    BIN_PATH=`which $1`

    file $BIN_PATH | grep ELF > /dev/null

    if [ "$?" = "0" ]; then
        diff `readlink -f $BIN_PATH` ../bin/`basename $BIN_PATH`
        if [ "$?" != "0" ]; then
            cp -rf `readlink -f $BIN_PATH` ../bin/`basename $BIN_PATH`
        fi

        for lib in `/lib/ld-linux-aarch64.so.1 --list $BIN_PATH | sed -r 's/.*(=> )/\1/g' | sed -r 's/=> //g' | sed -r 's/(\(0x.*)//g' | awk '{print $1}'`; do
            diff `readlink -f $lib` ../lib/`basename $lib`
            if [ "$?" != "0" ]; then
                cp -rf `readlink -f $lib` ../lib/`basename $lib`
            fi
        done
    else
        cp -rf `readlink -f $BIN_PATH` ../bin/`basename $BIN_PATH`
    fi
}

apt install -y silversearcher-ag iperf blktrace	bash-static htop sysstat wget linux-tools-common linux-tools-generic-lpae

dcp ag
dcp awk
dcp bash-static
dcp blkparse
dcp blktrace
dcp btrace
dcp busybox
dcp env
dcp file
dcp find
dcp grep
dcp htop
dcp ifconfig
dcp ionice
dcp iostat
dcp ip
dcp iperf
dcp ldd
dcp ltrace
dcp perl
dcp pidstat
dcp ping
dcp pmap
dcp ps
dcp python
dcp readlink
dcp sed
dcp slabtop
dcp strace
dcp tcpdump
dcp top
dcp vim.tiny
dcp vmstat
dcp wget
dcp `readlink -f /usr/lib/linux-tools/\`uname -r\`/perf`


mv ../bin/bash-static ../bin/bash
mv ../bin/vim.tiny ../bin/vim
