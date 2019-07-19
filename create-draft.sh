#!/usr/bin/env bash

todaysdate=$(date +%Y-%m-%d)
currentdatetime=$(date +"%Y-%m-%d %H:%M:%S %z")

title=${todaysdate}
for item in "$@"
do
    title+="-${item}"
done

cat << EOF > _drafts/${title}.markdown
---
layout: post
title:  ""
date:   ${currentdatetime}
categories:
---
EOF
