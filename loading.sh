#!/bin/bash

master_array=()
nerr() {
  echo "-${1} flag only deals with postive integers (n >= 0)."
  exit 1
}

clrer() {
  echo -e "invalid argument: ${1}: unknown color name" && exit 1
}

limex(){
  echo -e "invalid argument: ${1}: Argument limit exceeded" && exit 1
}


while getopts 'c:b:s:f:p:t:' FLAG; do
  case ${FLAG} in
    c) case ${OPTARG} in
      'red'|'blue'|'yellow'|'green'|'purple'|'orange'|'pink') DEFAULT_FCOLOR=${OPTARG^^};;
      *) clrer "${OPTARG}";;
    esac
    ;;
    b) case ${OPTARG} in
      'red'|'blue'|'yellow'|'green'|'purple'|'orange'|'pink') DEFAULT_BCOLOR=${OPTARG^^};;
      *) clrer "${OPTARG}";;
    esac
    ;;
    s) SPD=${OPTARG}

      if [[ ! ${SPD} =~ ^\+?[1-5]$ ]]; then
        echo "-s flag only allows digit from 1-5 integers (1 <= n <= 5)"
        exit 1
      fi
    ;;
    f) FILENAME=${OPTARG};;
    t) TIME_OUT=${OPTARG}

      if [[ ! ${TIME_OUT} =~ ^\+?[0-9]*$ ]]; then
        nerr 't'
      fi

      if [[ ${TIME_OUT} =~ ^\+?[0-9]{20,}$ ]]; then
        limex "${TIME_OUT}"
      fi
    ;;
    p) case ${OPTARG} in
      'red'|'blue'|'yellow'|'green'|'purple'|'orange'|'pink') DEFAULT_PCOLOR=${OPTARG^^};;
      *) clrer "${OPTARG}";;
    esac
    ;;
  esac
done

if [[ -n "${FILENAME}" ]]; then
  string=$(<${FILENAME})
else
  read -p "Enter String: " string
fi
true_len=$((${#string} - 1))


str_conversion() {
  local RED="\033[38;5;1m"
  local BLUE="\033[38;5;23m"
  local YELLOW="\033[38;5;11m"
  local GREEN="\033[38;5;2m"
  local PURPE="\033[38;5;12m"
  local ORANGE="\033[38;5;196m"
  local PINK="\033[38;5;13m"
  local END="\033[0m"
  for ((uchar=0; uchar<=true_len; uchar++)); do
    local var="${string:${uchar}:1}"
    if [[ "${var}" == [a-z] ]]; then 
      local new_var="${var^^}"
    else
      new_var="${var,,}"
    fi
    if [[ -n "${DEFAULT_FCOLOR}" ]]; then
      case "${DEFAULT_FCOLOR}" in
        'RED') new_var=$(echo -e "${RED}${new_var}${END}");;
        'BLUE') new_var=$(echo -e "${BLUE}${new_var}${END}");;
        'YELLOW') new_var=$(echo -e "${YELLOW}${new_var}${END}");;
        'GREEN') new_var=$(echo -e "${GREEN}${new_var}${END}");;
        'PURPLE') new_var=$(echo -e "${PURPLE}${new_var}${END}");;
        'ORANGE') new_var=$(echo -e "${ORANGE}${new_var}${END}");;
        'PINK') new_var=$(echo -e "${PINK}${new_var}${END}");;
      esac
    fi
    local PRE_str="${string:0:${uchar}}"
    local POST_str="${string:$((uchar+1))}"
    local CPOST_str="${POST_str}"
    if [[ -n "${DEFAULT_BCOLOR}" ]]; then
      case "${DEFAULT_BCOLOR}" in
        'RED') 
          PRE_str=$(echo -e "${RED}${PRE_str}${END}")
          POST_str=$(echo -e "${RED}${POST_str}${END}")
          ;;
        'BLUE')
          PRE_str=$(echo -e "${BLUE}${PRE_str}${END}")
          POST_str=$(echo -e "${BLUE}${POST_str}${END}")
          ;;
        'YELLOW')
          PRE_str=$(echo -e "${YELLOW}${PRE_str}${END}")
          POST_str=$(echo -e "${YELLOW}${POST_str}${END}")
          ;;
        'GREEN')
          PRE_str=$(echo -e "${GREEN}${PRE_str}${END}")
          POST_str=$(echo -e "${GREEN}${POST_str}${END}")
          ;;
        'PURPLE')
          PRE_str=$(echo -e "${PURPLE}${PRE_str}${END}")
          POST_str=$(echo -e "${PURPLE}${POST_str}${END}")
          ;;
        'ORANGE')
          PRE_str=$(echo -e "${ORANGE}${PRE_str}${END}")
          POST_str=$(echo -e "${ORANGE}${POST_str}${END}")
          ;;
        'PINK')
          PRE_str=$(echo -e "${PINK}${PRE_str}${END}")
          POST_str=$(echo -e "${PINK}${POST_str}${END}")
          ;;
      esac
    fi
    if [[ -n "${DEFAULT_PCOLOR}" ]]; then
      case "${DEFAULT_PCOLOR}" in
        'RED') POST_str=$(echo -e "${RED}${CPOST_str}${END}");;
        'BLUE') POST_str=$(echo -e "${BLUE}${CPOST_str}${END}");;
        'YELLOW') POST_str=$(echo -e "${YELLOW}${CPOST_str}${END}");;
        'GREEN') POST_str=$(echo -e "${GREEN}${CPOST_str}${END}");;
        'PURPLE') POST_str=$(echo -e "${PURPLE}${CPOST_str}${END}");;
        'ORANGE') POST_str=$(echo -e "${ORANGE}${CPOST_str}${END}");;
        'PINK') POST_str=$(echo -e "${PINK}${CPOST_str}${END}");;
      esac
    fi
    local new_str="${PRE_str}${new_var}${POST_str}"
    master_array+=("${new_str}")
  done
}

EACH_REP() {
  max=$1
  while [ ${count} -lt ${max} ]; do
    if [ -n ${TIME_OUT} ]; then
      [ ${SECONDS} -ge ${TIME_OUT} ] && break
    fi
    sleep 0.1s
    count=$((count+1))
  done
  count=0
}


main() {
  str_conversion
  SECONDS=0
  local count=0
  while true; do
    for ITR in "${master_array[@]}"; do
      if [[ -n ${TIME_OUT} ]]; then
        (( ${SECONDS} >= ${TIME_OUT} )) && exit 0
      fi
      echo -ne "\r${ITR}"
      if [[ -n "${SPD}" ]]; then
        case "${SPD}" in
          1) EACH_REP 1;;
          2) EACH_REP 4;;
          3) EACH_REP 9;;
          4) while [ ${count} -lt 16 ]; do
            if [ -n ${TIME_OUT} ]; then
              if [ ${SECONDS} -ge ${TIME_OUT} ]; then
                break
              fi
            fi
            sleep 0.1s
            count=$((count+1))
          done
          count=0
          ;;

          5) EACH_REP 25;;
        esac
      else
        sleep 0.16s
      fi
    done
  done
}
main
