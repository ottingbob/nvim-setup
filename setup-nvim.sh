#!/bin/bash

VERSION="v0.10.1"
DIRECTORY_NAME="./squashfs-root"

# Check to ensure the arch is correct
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
	echo "Unable to download NVIM for non-linux OS distribution"
  exit 1
fi


echo "Setting up NVIM for version: [${VERSION}]"

# Check and backup the previous version
if [ -d "${DIRECTORY_NAME}" ]; then
	OLD_VERSION=$(./${DIRECTORY_NAME}/usr/bin/nvim --version | grep 'NVIM' | awk '{print $2}')
	echo "Backing up previous version: [${OLD_VERSION}]"
	mv "${DIRECTORY_NAME}" "${DIRECTORY_NAME}-nvim-${OLD_VERSION}"
fi

echo "Starting NVIM download:"

curl -OL https://github.com/neovim/neovim/releases/download/${VERSION}/nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/usr/bin/nvim --version

echo "Moving NVIM download to /usr/bin"
sudo mv ./squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

echo "NVIM ${VERSION} setup completed!"
