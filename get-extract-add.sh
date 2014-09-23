#!/bin/sh
set -e
url=$1
if [ -z "$url" ]; then
	echo "Usage: extract.sh <url>"
	exit 1
fi

tarball=$(basename $url)

# Extract the "aspell?-XX" part from the tarball
dir=$(echo $tarball|sed -e 's/^\(aspell[^-]*-[^-]*\)-.*/\1/')
if [ -z "$dir" ]; then
	echo "Tarball name did not match aspellN-XX-*?"
	exit 1
fi

already_downloaded_marker="$dir/.$tarball"
if [ ! -f "$already_downloaded_marker" ]; then
	if which curl >/dev/null; then
		echo "Downloading $url"
		curl -# --continue-at - -O "$url"
	elif which wget >/dev/null; then
		# wget is already chatty enough so don't announce what is
		# being downloaded
		wget --progress=bar --continue "$url"
	else
		echo "Neither curl nor wget are available to fetch $url"
		exit 1
	fi
fi

# We do the following so that deleted files will be removed and can be properly
# recorded as such for the following git commit.
if [ -d ./"$dir" ]; then
	rm -rf "./$dir"
fi
mkdir "$dir"

tar -C "$dir" -xjf $tarball --strip-components=1

# Add a marker for where the content was added from
echo "Extracted from this file" >$already_downloaded_marker

git add -f "$dir"
