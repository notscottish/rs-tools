# Note: The '$(printf "\t")' is due to OSX, use "\t" instead when using on Linux
function rswhois() {
  dig +noall +answer $1
  whois "$(dig +noall +answer $1 | \
      grep "IN[$(printf "\t") ]\+A" | \
      head -1 | \
      sed -e "s/.*[^0-9]\([0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\)/\1/")" | \
      grep -E "(^irt:|^role:)"
}
