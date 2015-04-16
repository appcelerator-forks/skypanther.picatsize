##
## Build an Appcelerator Android Module
## Then copy it to the default module directory
##
## (c) Napp ApS
## Mads Møller
##


## How to run the script
## write in terminal in the root folder of your project:
## bash ./buildit.sh

## clean build folder
## find ./build -mindepth 1 -delete

## compile the module
ant

## where is manifest
FILENAME='./manifest'


## FIND MODULE ID
MODULE_ID=$(grep 'moduleid' $FILENAME -m 1)
MODULE_ID=${MODULE_ID#*: } # Remove everything up to a colon and space

## FIND MODULE VERSION
MODULE_VERSION=$(grep 'version' $FILENAME -m 1) ## only one match
MODULE_VERSION=${MODULE_VERSION#*: } # Remove everything up to a colon and space

PROJECT_PATH='/Users/timpoulsen/Documents/Titanium_Studio_Workspace/camtest'


## Delete the old build if existing
rm -rf $PROJECT_PATH/modules/android/$MODULE_ID/*

## unzip compiled module
unzip -o ./dist/$MODULE_ID-android-$MODULE_VERSION.zip -d $PROJECT_PATH


## Optional: You could run a app now - using your new module
##cd $PROJECT_PATH

titanium clean -d $PROJECT_PATH

titanium build -p android -T device -d $PROJECT_PATH