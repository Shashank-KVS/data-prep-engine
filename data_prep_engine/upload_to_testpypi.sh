#!/bin/bash
# Helper script to upload to Test PyPI
# Usage: ./upload_to_testpypi.sh YOUR_TOKEN_HERE

if [ -z "$1" ]; then
    echo "Usage: $0 YOUR_TEST_PYPI_TOKEN"
    echo ""
    echo "Get your token from: https://test.pypi.org/manage/account/token/"
    exit 1
fi

export TWINE_USERNAME=__token__
export TWINE_PASSWORD="$1"

echo "Uploading to Test PyPI..."
twine upload --repository testpypi dist/*

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Upload successful!"
    echo "Install with: pip install -i https://test.pypi.org/simple/ data-prep-engine"
else
    echo ""
    echo "❌ Upload failed. Check your token and try again."
fi

