### Setup

This is my nvim setup that needs some more documentation

#### Structure

This setup has moved over to using [`lazy.nvim`](https://github.com/folke/lazy.nvim) over packer

For the most part things still seem to be working!!

The loading configuration seems to happen in this order
```bash
$ tree -L 2
.
├──── # First `init.lua`
├── init.lua
├── lazy-lock.json
├── lua
├──── # Second `base.lua`
│   ├── base.lua
├──── # Third `lazy nvim is loaded`
├──── # Fourth `lazyplugins.lua`
│   ├── lazyplugins.lua
├──── # All other required `*.lua` files
│   ├── lsp.lua
│   └── terminal.lua
```

After a plugin is loaded it will run a corresponding file in [`/after/plugin`](/after/plugin) to usually
setup some type of config for the respective plugin

#### Upgrading and setup

Get a new release here: [`Neovim` Releases Page](https://github.com/neovim/neovim/releases)

And then run the following steps to get the package installed
```bash
curl -OL https://github.com/neovim/neovim/releases/download/v0.9.4/nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/usr/bin/nvim --version
# NVIM v0.9.4
# Build type: Release
# LuaJIT 2.1.1692716794
#
#    system vimrc file: "$VIM/sysinit.vim"
#   fall-back for $VIM: "/__w/neovim/neovim/build/nvim.AppDir/usr/share/nvim"
#
# Run :checkhealth for more info

# Backup the previous version if you want
sudo mv /squashfs-root ./squashfs-root-old-nvimv0.9.1
sudo mv ./squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
```
