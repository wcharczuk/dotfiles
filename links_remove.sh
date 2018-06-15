#! /bin/sh

set -e

: ${SOURCE_DIR:?"SOURCE_DIR is required"}
: ${TARGET_DIR:?"TARGET_DIR is required"}

TARGET_LEADER="."
if [ -z "$FILE_LEADER" ]; then
	TARGET_LEADER="$FILE_LEADER"
fi

if [ ! -d "$TARGET_DIR" ]; then 
	mkdir -p "$TARGET_DIR"
fi

if [ ! -d "$SOURCE_DIR" ]; then 
	echo "$SOURCE_DIR doesnt exist, aborting."
	exit 1
fi

for name in $SOURCE_DIR/*; do
	filename=`basename "$name"`
	destination="$TARGET_DIR/$TARGET_LEADER$filename"

	if [ -f "$destination" ] || [ -d "$destination" ] || [ -L "$destination" ]; then
		rm -rf "$destination"
	fi
done

exit 0