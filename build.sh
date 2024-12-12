#!/bin/sh

set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $DIR

PRESENTATIONS="presentations"
PUBLICINDEX="index.html"

echo "updating reveal.js..."
git clone https://github.com/hakimel/reveal.js reveal || true
pushd reveal
git stash
git fetch
npm install
popd

echo "linking dependencies..."
rm -frv reveal/presentations
rm -frv reveal/.git
rm -frv reveal/.github
rn -frv reveal/.gitignore
ln -srv presentations reveal/presentations

echo "creating index file..."
>$PUBLICINDEX
echo "<a>Available presentations:</a><br>" >>$PUBLICINDEX
for SUBFOLDER in "$PRESENTATIONS"/*/; do
	if [[ -f "${SUBFOLDER}index.html" ]]; then
		# Get the subfolder name (basename)
		FOLDER_NAME=$(basename "$SUBFOLDER")
		# Append the href link to the global index
		echo "<a href=\"$PRESENTATIONS/$FOLDER_NAME/index.html\">$FOLDER_NAME</a><br>" >>$PUBLICINDEX
	fi
done

ln -srv index.html reveal/index.html
echo "build successful"
