#!/usr/bin/env bash

refresh_rate=1
separator="     %{F#404040}|%{F-}     "

foreground_start="%{F#01AB84}"
foreground_end="%{F-}"

function local_date() {
    local current_date=$(date '+%a  %Y / %m / %d')
    local symbol=""
    echo -n "${foreground_start}${symbol}${foreground_end} ${current_date}"
}

function local_time() {
    local time_now=$(date '+%H:%M' | awk '{$1=$1};1')
    local symbol=""
    echo -n "${foreground_start}${symbol}${foreground_end} ${time_now}"
}

function loadavg() {
    local symbol=""
    echo -n "${foreground_start}${symbol}${foreground_end} $(cat /proc/loadavg | awk -F' ' '{print $1,"  ",$2,"  "$3}')"
}

while true; do
    echo -n " ${separator} "
    loadavg
    echo -n " ${separator} "
    local_date
    echo -n " ${separator} "
    local_time
    echo " "
    sleep "${refresh_rate}"
done
