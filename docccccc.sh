PATH_TO_DOCS_DIR="./Build/Products/Debug-iphonesimulator/DocCBox.doccarchive"
PATH_TO_STATIC_HTML="../docs"
TARGET_NAME="DocCBox"
HOSTING_BASE_PATH="/DocCBox"
PATH_TO_SAVE_DERIVED_DATA_FOLDER="./"

xcodebuild docbuild \
    -scheme "$TARGET_NAME" \
    -derivedDataPath $PATH_TO_SAVE_DERIVED_DATA_FOLDER \
    -destination 'platform=iOS Simulator,name=iPhone 13'

CURRENT=$(pwd)
echo $CURRENT
cd ../
ls docs
if [[ $? == -1 ]]; then
    mkdir docs
fi
cd $CURRENT

$(xcrun --find docc) process-archive \
    transform-for-static-hosting $PATH_TO_DOCS_DIR \
    --output-path $PATH_TO_STATIC_HTML \
    --hosting-base-path $HOSTING_BASE_PATH
