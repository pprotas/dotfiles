# Machine type comes from brew.sh, which stores it in ~/.config/dotfiles/machine
machine = ENV['MACHINE_TYPE'] || (File.read(File.expand_path('~/.config/dotfiles/machine')).strip rescue nil)

# Always installed packages
# =========================
cask '1password'
cask 'adguard'
cask 'bettermouse'
cask 'firefox'
cask 'ghostty'
cask 'keepassxc'
cask 'middle'
cask 'paseo'
cask 'spotify'
cask 'syncthing-app'
cask 'tailscale-app'
cask 'zed'

brew 'coreutils'
brew 'direnv'
brew 'fzf'
brew 'gh'
brew 'mise'
brew 'neovim'
brew 'pi-coding-agent'
brew 'pure'
brew 'ripgrep'
brew 'stow'
brew 'uv'
brew 'zoxide'
brew 'zsh-completions'

# Personal machine packages
# =========================
if machine == 'personal'
end

# Work machine packages
# =====================
if machine == 'work'
  cask 'aws-vpn-client'
  cask 'figma'
  cask 'gcloud-cli'
  cask 'linear'
  cask 'orbstack'
  cask 'slack'

  brew 'awscli'
  brew 'glab'
  brew 'googleworkspace-cli'
  brew 'snowflake-cli'
end
