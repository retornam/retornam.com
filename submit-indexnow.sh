#!/bin/bash
# shellcheck disable=SC2001

check_binary() {
  missing=false
  for cmd in "${@}"; do
    if ! command -v "${cmd}" &> /dev/null; then
      echo "Error: ${cmd} is not installed."
      missing=true
    else
      : # do nothing
    fi
  done

  if $missing; then
    echo -n "Exiting....."
    exit 1
  else
    return 0
  fi
}


check_binary jq curl xmllint tr



json_data=$(echo "${json_data}" | sed 's/\(,\s*\)\]/\]/')

loc_values=$(curl -s https://retornam.com/sitemap.xml | xmllint --xpath "//*[local-name()='loc']/text()" - | tr '\n' ' ')

if [ -z "${loc_values}" ]; then
  echo "No URLs found in the sitemap or failed to fetch sitemap."
  exit 1
fi

json_data=$(cat <<EOF
{
  "host": "retornam.com",
  "key": "5ea8d2156ddd4106bbd928f21a967061",
  "keyLocation": "https://retornam.com/5ea8d2156ddd4106bbd928f21a967061.txt",
  "urlList": [
EOF
)

for loc in ${loc_values}; do
  json_data="${json_data}\"${loc}\","
done


json_data="${json_data}]}"
json_data=$(echo "${json_data}" | sed 's/\(,\s*\)\]/\]/')

printf "Data to POST via curl\n"
echo ${json_data} | jq -r '.'



printf "POSTing data....\n"
response=$(curl -s -o /dev/null -w "%{http_code}" -X POST https://www.bing.com/indexnow \
  -d "$json_data" \
  --header "Content-Type: application/json")

if [[ ${response} -ge 200 && ${response} -lt 300 ]]; then
  echo "Request successful! HTTP status: ${response}"
else
  echo "Request failed. HTTP status: ${response}"
  exit 1
fi
