#!/bin/bash

url="$1"
file="$2"
procs="${3:-5}"

err() {
  echo "$@" >&2
}

err_quit() {
  [ -n "$1" ] && err "$1"
  exit "${2:-1}"
}

[ -z "$url" ] && err_quit "url '$url' can not be empty"
[ -z "$file" ] && err_quit "file '$file' can not be empty"

if [ -e "$file" ]; then
  err_quit "file/dir '$file' already exists, aborted"
fi

# da url file
da() { # download as
  curl $3 -A 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.1234.001 Safari/537.36' -L "$1" -o "$2"
}

# cl url
cl() { # content length
  da "$1" "-" "-I -s" | grep -iE '^Content-Length: [0-9]+$' | awk '{ print $2 }'
}

# unchanged url file
unchanged() {
  if [ -f "$2" ] && [ "$(cl "$1")" = "$(du -b "$2" | awk '{ print $1 }')" ]; then # file not changed
      return 0
  fi
  # echo "-------------- *$(cl "$1")* = *$(du -b "$2" | awk '{ print $1 }')*"
  return 1
}

# origin_from_url url
origin_from_url() {
  grep -oiE '(^https?|ftp)://[^/?#]+' <<<"$1"
}

basename_from_url() {
  sed 's/[#?].*//;s/[^/]*$//' <<<"$1" # note this does not work for url like http://abc.com
}

# download_if_needed url file
download_if_needed() {
  local url="$1" file="$2"
  err "downloading file from url '$url' as local file '$file'"
  if [ -z "$FORCE" ] && unchanged "$url" "$file"; then # non-force mode and file is unchanged
    err "file '$file' is unchanged, using existing one"
  else
    if ! da "$url" "$file" "$3"; then
      err_quit "failed to download from url '$url' as local file '$file'"
    fi
  fi
}

m3u8_downloaded=0
m3u8_file="$file.m3u8"
err "downloading m3u8 from url '$url'"
#if [ -z "$FORCE" ] && unchanged "$url" "$m3u8_file"; then # non-force mode and file is unchanged
#  err "file is unchanged, using existing one"
#else
#  if ! da "$url" "$m3u8_file"; then
#    err_quit "failed to download m3u8 file"
#  fi
# fi
download_if_needed "$url" "$m3u8_file"

export -f da cl unchanged download_if_needed err err_quit origin_from_url basename_from_url

url_origin=$(origin_from_url "$url")
url_basename=$(basename_from_url "$url" | sed 's#/$##')
m3u8_ts_list_file="$file.ts_list"
awk 'NF > 0' < "$m3u8_file" | sed -n '/^#EXTINF:/ {n; p;}' > "$m3u8_ts_list_file"
ts_count=$(wc -l "$m3u8_ts_list_file" | awk '{ print $1 }')
if [ -z "$ts_count" -o "$ts_count" = "0" ]; then
  err_quit "failed to get ts list from m3u8"
fi

err "downloading ts from m3u8 file:"
if cat "$m3u8_ts_list_file" | while read ts_url; do
  if [ -z "$(origin_from_url "$ts_url")" ]; then # not a url
    if [[ "$ts_url" = /* ]]; then # absolute url
      ts_url="$url_origin$ts_url"
    else # relative url
      ts_url="$url_basename/$ts_url"
    fi
  fi
  printf "download_if_needed %q %q_%03d_of_%03d.ts -s\n" "$ts_url" "$file" $((++i)) $ts_count;
done | xargs -d '\n' -L 1 -I {} -P "$procs" bash -c 'err shell_exec {}; {}'; then
  err "download successfully, start merging ts" 
  cat "$file"_[0-9]*.ts > "${file}_merged.ts"
  err "successfully merge to ts '${file}_merged.ts', all done" 
else
  err_quit "failed to download ts, please try again"
fi

