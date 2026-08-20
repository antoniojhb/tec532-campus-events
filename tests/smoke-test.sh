#!/usr/bin/env sh

set -eu

URL="${1:-http://localhost:8080}"
EXPECTED_FILE="${2:-index.html}"

OUTPUT="/tmp/campus-events.html"
ATTEMPT=1
MAX_ATTEMPTS=10

rm -f "$OUTPUT"

echo "Checking application at: $URL"

while [ "$ATTEMPT" -le "$MAX_ATTEMPTS" ]; do

    if curl --fail --silent --show-error "$URL" > "$OUTPUT"; then
        break
    fi

    echo "Application not ready. Attempt $ATTEMPT/$MAX_ATTEMPTS"

    ATTEMPT=$((ATTEMPT + 1))
    sleep 2
done

if [ ! -s "$OUTPUT" ]; then
    echo "ERROR: Application did not respond."
    exit 1
fi

grep -q "SFIC Campus Events" "$OUTPUT" || {
    echo "ERROR: Expected application title was not found."
    exit 1
}

grep -q 'id="app-version"' "$OUTPUT" || {
    echo "ERROR: Application version identifier was not found."
    exit 1
}

if [ -f "$EXPECTED_FILE" ]; then

    if ! cmp -s "$EXPECTED_FILE" "$OUTPUT"; then
        echo "ERROR: Running application does not match the current repository version."
        echo
        echo "Difference:"
        diff -u "$EXPECTED_FILE" "$OUTPUT" || true
        exit 1
    fi

fi

echo "Smoke test passed."
echo "Running application matches the current repository."
