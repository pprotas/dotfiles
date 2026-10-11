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

## Git and SSH identities

Personal Git identity and signing are the defaults. Signing uses `ssh-keygen`
and the key loaded into `SSH_AUTH_SOCK`, not the 1Password signer. GitHub and
Forgejo authentication use separate public-key selectors under `~/.ssh/`;
load their private keys through KeePassXC or your SSH agent. Other hosts may
try all agent keys.

### Work laptop

Keep all work configuration outside this repository. Before adopting the new
Git config, replace the old directory-based work setup with the following:

1. Create a real `~/.gitconfig_h1` file (replace any old dangling symlink).
   It is included globally, so put only conditional rules here:

   ```gitconfig
   [includeIf "hasconfig:remote.*.url:git@github.com:WORK_ORG/**"]
       path = ~/.config/git/work.inc
   [includeIf "hasconfig:remote.*.url:https://github.com/WORK_ORG/**"]
       path = ~/.config/git/work.inc
   [includeIf "hasconfig:remote.*.url:git@github-work:WORK_ORG/**"]
       path = ~/.config/git/work.inc

   [url "git@github-work:WORK_ORG/"]
       insteadOf = git@github.com:WORK_ORG/
       insteadOf = https://github.com/WORK_ORG/
   ```

   Repeat for each work organization. Add equivalent remote patterns for the
   actual Enterprise and GitLab hosts and URL spellings. Any matching remote,
   including `upstream`, activates the work identity.

2. Create `~/.config/git/work.inc` with your work identity and signing public key:

   ```gitconfig
   [user]
       name = YOUR_NAME
       email = YOUR_WORK_EMAIL
       signingKey = ssh-ed25519 YOUR_WORK_SIGNING_PUBLIC_KEY
   [gpg "ssh"]
       program = /Applications/1Password.app/Contents/MacOS/op-ssh-sign
   ```

   Keep the signer override only while the work signing key lives in 1Password.
   Otherwise use `program = ssh-keygen` with the key loaded into your agent.

3. Create `~/.ssh/work.config`:

   ```sshconfig
   Host github-work
       HostName github.com
       User git
       IdentityFile ~/.ssh/github-work.pub
       IdentitiesOnly yes
   ```

   Save the work authentication public key to `~/.ssh/github-work.pub`, load
   its private key into your agent, and authorize it for the work organizations'
   GitHub SSO. If it uses a different agent, add `IdentityAgent /path/to/socket`
   within this host block. Add Enterprise and GitLab host blocks here too.

Check a work and personal checkout with `git config --show-origin --get
user.email` and `git config --show-origin --get user.signingkey`. Use
`ssh -G github-work` to inspect routing and `ssh -T git@github-work` to test
GitHub authentication; test access to a work repository separately for SSO.

The optional work includes may be absent on personal machines. Do not copy
work files or private keys into `files/`.
