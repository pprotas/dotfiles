# Dotfiles

This repository serves as the source of truth for my personal dotfiles and
installation scripts. If you wish to use any of this, review the configuration
scripts and code thoroughly. What works for me might not work for you.

## Set-up

Clone this repository to your home directory:

```bash
cd ~ && git clone https://github.com/pprotas/dotfiles.git
```

### Install

Just run the install script:

```bash
cd ~/dotfiles && ./install.sh
```

It installs Homebrew packages from the `Brewfile`, links `files/` into `~`
with [GNU Stow](https://www.gnu.org/software/stow/), and applies macOS
settings from `osconfig.sh`.

On first run `brew.sh` asks whether this is a personal or work machine and
stores the answer in `~/.config/dotfiles/machine`. Delete that file to change
it.

After adding a new file under `files/`, link it with:

```bash
stow -d ~/dotfiles -t ~ files
```
