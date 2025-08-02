#! /bin/sh

set -e

: ${SOURCE_DIR:?"SOURCE_DIR is required"}
: ${TARGET_DIR:?"TARGET_DIR is required"}

if [ ! -d "$SOURCE_DIR" ]; then 
	echo "$SOURCE_DIR doesnt exist, aborting."
	exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then 
	mkdir -p "$TARGET_DIR"
fi

for name in $SOURCE_DIR/*; do
	filename=`basename "$name"`
	destination="$TARGET_DIR/$TARGET_LEADER$filename"

    if [ -z "$DRY_RUN" ]; then
        if [ -f "$destination" ] || [ -d "$destination" ] || [ -L "$destination" ]; then
            rm -rf "$destination"
        fi
    else 
        if [ -f "$destination" ] || [ -d "$destination" ] || [ -L "$destination" ]; then
            echo "[DRY-RUN] rm -rf $destination"
        fi
    fi
done

exit 0
