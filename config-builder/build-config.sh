#!/usr/bin/env bash

# build haproxy.cfg file by concat base, control, loadbalancer with flags
# if -c flag is present, add control to the haproxy.cfg
# if -l flag is present, add loadbalancer to the haproxy.cfg
# shellcheck disable=SC2164
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
# haproxy.cfg file
haproxy_cfg="haproxy.cfg"

# base haproxy.cfg file
base_haproxy_cfg="${SCRIPTPATH}/configs/base-haproxy.cfg"

# control haproxy.cfg file
control_haproxy_cfg="${SCRIPTPATH}/configs/control-haproxy.cfg"

# loadbalancer haproxy.cfg file
loadbalancer_haproxy_cfg="${SCRIPTPATH}/configs/loadbalancer-haproxy.cfg"

# monitoring haproxy.cfg file
monitoring_haproxy_cfg="${SCRIPTPATH}/configs/monitoring-haproxy.cfg"

# check if the haproxy.cfg file exists
if [ -f $haproxy_cfg ]; then
    # remove the haproxy.cfg file
    rm $haproxy_cfg
fi

while getopts "clbm" flag
do
    case "${flag}" in
        b)
            # add the base haproxy.cfg file to the haproxy.cfg file
            cat "$base_haproxy_cfg" >> $haproxy_cfg
            ;;
        c)
            # add the control haproxy.cfg file to the haproxy.cfg file
            cat "$control_haproxy_cfg" >> $haproxy_cfg
            ;;
        l)
            # add the loadbalancer haproxy.cfg file to the haproxy.cfg file
            cat "$loadbalancer_haproxy_cfg" >> $haproxy_cfg
            ;;
        m)
            # add the monitoring haproxy.cfg file to the haproxy.cfg file
            cat "$monitoring_haproxy_cfg" >> $haproxy_cfg
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            ;;
    esac

done
