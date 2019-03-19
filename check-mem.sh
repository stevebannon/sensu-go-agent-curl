#!/bin/bash
#
# Check FREE mem
#
# ===
#
# Examples:
#
#   check-mem.sh -w 1024 -c 512
#

# get arguments
while getopts ':w:c:h' OPT; do
  case $OPT in
    w)  WARN=$OPTARG;;
    c)  CRIT=$OPTARG;;
    h)  hlp="yes";;
    *)  unknown="yes";;
  esac
done


# usage
HELP="
    usage: $0 [ -w value -c value -p -h ]

        -w --> Warning value 
        -c --> Critical value
        -h --> print this help screen
"

if [ "$hlp" = "yes" ]; then
  echo "$HELP"
  exit 0
fi

WARN=${WARN:=1024}
CRIT=${CRIT:=512}

mem_free=`free | grep ^Mem | awk '{print $4}'`

if [ "$(echo "${mem_free} < ${CRIT}" | bc)" -eq 1 ]; then
  echo "MEM CRITICAL - ${mem_free}% is less than critical point.[${CRIT}] | mem=${mem_free}"
  exit 2
fi

if [ "$(echo "${mem_free} < ${WARN}" | bc)" -eq 1 ]; then
  echo "MEM WARNING - ${mem_free}% is less than warning point.[${WARN}] | mem=${mem_free}"
  exit 1
fi

echo "MEM OK - Usage:${mem_free} | mem=${mem_free}"
exit 0
