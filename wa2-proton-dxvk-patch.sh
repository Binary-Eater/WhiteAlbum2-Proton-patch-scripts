#!/bin/sh
# SPDX-License-Identifier: MIT
# Author: Rahul Rameshbabu <sergeantsagara@protonmail.com>
#
# This patch program is meant to replace the d3d9.dll intercept dll vendored
# with "WHITE ALBUM 2" game translation project installs,
# https://github.com/TodokanaiTL/subtitles. The original d3d9.dll from the
# project would cause COM objects to get corrupted. This issue is more apparent
# when using DXVK. The most visible issue is that any movie asset played by the
# game crashes the game at the end of the movie without this patch. A secondary
# issue that is patched is an incorrect lifetime issue that could lead to
# crashes or unexpected behavior.
#
# https://github.com/TodokanaiTL/subtitles/pull/1
# https://github.com/Binary-Eater/WA2-subtitles/commit/a2950e82bd2048ff92120b90cbdb4831eee5db7b
# https://github.com/TodokanaiTL/subtitles/pull/2
# https://github.com/Binary-Eater/WA2-subtitles/commit/b4e43a8068c612d008b1043602e3fe089e18986a
#
# More details on the issue can be found in the README.org file

WA2_DIR=$1

if [ -f "${WA2_DIR}/d3d9.dll" ]; then
    echo "Found WHITE ALBUM 2 d3d9.dll from the translation project"
    echo "https://github.com/TodokanaiTL/subtitles"
    echo ""
    echo "Replacing the d3d9.dll with one including a bugfix for DXVK..."
else
    echo "Did not find translation project d3d9.dll in path ${WA2_DIR}"
    echo "https://github.com/TodokanaiTL/subtitles"
    echo ""
    echo "Copying patched d3d9.dll containing a bugfix for DXVK..."
fi
echo "https://github.com/TodokanaiTL/subtitles/pull/1"
echo "https://github.com/Binary-Eater/WA2-subtitles/commit/a2950e82bd2048ff92120b90cbdb4831eee5db7b"
echo "https://github.com/TodokanaiTL/subtitles/pull/2"
echo "https://github.com/Binary-Eater/WA2-subtitles/commit/b4e43a8068c612d008b1043602e3fe089e18986a"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cp "${SCRIPT_DIR}/dlls/release/d3d9.dll" "${WA2_DIR}/"
