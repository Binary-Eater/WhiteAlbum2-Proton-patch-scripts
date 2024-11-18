#!/bin/sh
# SPDX-License-Identifier: MIT
# Author: Rahul Rameshbabu <sergeantsagara@protonmail.com>
#
# This patch program is meant to prevent the d3d9.dll stub vendored with "WHITE
# ALBUM 2" game installs from causing DXVK COM objects from being corrupted.
# This script can be run on both the original and After Story games that come
# with the Extended Edition. The most visible issue is that any movie asset
# played by the game crashes the game at the end of the movie without this
# patch.
#
# More details on the issue can be found in the README.org file

WA2_DIR=$1

if [ -f "${WA2_DIR}/d3d9.dll" ]; then
    echo "Found WHITE ALBUM 2 d3d9.dll"
    mv "${WA2_DIR}/d3d9.dll" "${WA2_DIR}/d3d9.dll.old"
    echo "Moved to ${WA2_DIR}/d3d9.dll.old..."
elif [ -f "${WA2_DIR}/d3d9.dll.old" ]; then
    echo "WHITE ALBUM 2 d3d9.dll has already been moved"
    echo "No patching needs to be done"
else
    echo "Did not find vendored d3d9.dll in path ${WA2_DIR}"
fi
