# Dotfiles
This repository serves as the source of truth for my personal dotfiles and installation scripts. If you wish to use any of this, review the configuration scripts and code thoroughly. What works for me might not work for you.

## Usage
Although he main goal of this repository is to make setting up a new machine as easy as possible, there are some prerequisites and manual steps required.

### Requirements
- Git
- Zsh
- `xcode-select --install` (macOS will prompt you for this anyways)

### Set-up
Clone this repository to your home directory:
```bash
cd ~ && git clone https://github.com/pprotas/dotfiles.git
```

### Install
Just run the install script:
```bash
cd ~/dotfiles && ./install.sh
```

## Details
Let's discuss how all of this works under the hood.

### Structure
The directory structure of the important files in this repository is as follows:
```bash
.
├── .files
├── Brewfile
├── brew.sh
├── install.sh
├── maco.sh
├── osconfig.sh
└── symlink.sh
```

### .files
This directory houses all of the dotfiles. That's why we're here!

### install.sh
This is the main install script. It's purpose is to kick off other scripts that install other things:
- symlink.sh
- maco.sh

It also installs some non-Homebrew binaries.

### symlink.sh
This dotfiles repository uses a symlinking strategy to install the dotfiles in the home directory. This has multiple advantages:
- The git repository is located in `~/dotfiles` instead of `~`
- Easier `.gitignore` management -- no need to ignore `**/**` and include every individual dotfile

The `symlink.sh` script will go through the `.files` directory and symlink the files to the home directory accordingly.

### maco.sh
As macOS is my daily driver, I have some dedicated scripts for this OS.

This script will perform some macOS-specific tasks:
- Install Homebrew and use it to install some packages (`brew.sh` and `Brewfile`)
- Configure some OS settings to make macOS just how I like it (`osconfig.sh`)

### brew.sh and Brewfile
The purpose of `brew.sh` is simple: install Homebrew and download my Homebrew packages using `homebrew bundle`. This will download the packages listed in the `Brewfile`.

### osconfig.sh
I hate many of the macOS defaults! But I do like macOS overall. This script will change many macOS default configuration values, to make it just how I like it. I have provided comments in the script that detail all of the changes.
