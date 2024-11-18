#!/bin/sh
# SPDX-License-Identifier: MIT
# Author: Rahul Rameshbabu <sergeantsagara@protonmail.com>
#
# This patch program is meant to use ffmpeg to convert all movie assets in the
# "WHITE ALBUM 2" game installs to a format supported by the gstreamer plugins
# that come with Proton installs from Valve.
#
# More details on the issue can be found in the README.org file

WA2_DIR=$1

# Needs to be a case-insensitive match since the assets have mixed cases. Likely
# due to Windows VFS being case-insensitive and not causing issues for the
# games. Use find -exec in place of an outer bash loop through the find results
# to avoid whitespace in file paths from breaking the script logic.
find "$WA2_DIR" -type f -iname 'mv*.pak' -exec sh -c '
    for mv_pak; do
        if [ -f "${mv_pak}.old" ]; then
            echo "${mv_pak} already converted to mp4..."
        else
            echo "Converting ${mv_pak} to mp4..."
            ffmpeg -i "$mv_pak" "${mv_pak}.mp4"
            mv "$mv_pak" "${mv_pak}.old"
            mv "${mv_pak}.mp4" "$mv_pak"
        fi
    done
' exec-sh {} +
echo "Finished converting all WHITE ALBUM 2 movie .pak files to mp4"
