function rscdn() {
   if [ ${#1} -eq 0 ]; then
      echo "error: no argument supplied" >&2
      return
   fi

   echo "$1" | sed -e "s/\./-/g;s/$/.cdn.red-shield.net/"
}

function rsify() {
   if [ "$1" = "" ]; then return; fi
   if [ $(echo $1 | grep -Ec "^https?://") ]; then
      FQDN="$(echo $1 | sed -e "s/^https*:\/\///")"
   else
      FQDN="$1"
   fi

   echo -n $FQDN | sed -e "s/\./-/g;s/$/.cdn.red-shield.net/"
}

function rsdig() {
   FQDN="$1"
   if [ "$FQDN" = "" ]; then return; fi
   if [ $(echo $1 | grep -Ec "^https?://") ]; then
      FQDN="$(echo $1 | sed -e "s/^https*:\/\///")"
   fi
   if [ $(echo $1 | grep -Ec "/" ) ]; then
      FQDN="$(echo -n $FQDN | sed -e "s/\/.*//")"
   fi

   FQDN="$(echo -n $FQDN | sed -e "s/\./-/g;s/$/.cdn.red-shield.net/")"

   dig +noall +answer $FQDN
}

function rsnc() {
   FQDN="$1"
   if [ $(echo $1 | grep -Ec "^https?://") ]; then
      FQDN="$(echo $1 | sed -e "s/^https*:\/\///")"
   fi
   if [ $(echo $1 | grep -Ec "/" ) ]; then
      FQDN="$(echo -n $FQDN | sed -e "s/\/.*//")"
   fi

   echo "nc -G3 ${FQDN} 80"
}

alias s_client="openssl s_client -connect"
