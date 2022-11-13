#!/bin/bash
# Heavily inspired by https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# Special thanks to: GitHub Copilot and https://macos-defaults.com/finder/appleshowallextensions.html
echo "[osconfig] INFO: Installation started"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Dock
# ====
# Smaller dock
defaults write com.apple.dock tilesize -int 36
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# Instant dock hiding
defaults write com.apple.dock autohide-delay -float 0
# Instant dock showing
defaults write com.apple.dock autohide-time-modifier -int 0
# Remove recents from dock
defaults write com.apple.dock show-recents -bool false
# Show open application indicator
defaults write com.apple.dock show-process-indicators -bool true
# Restart Dock (execute last)
killall Dock

# Menu bar
# ========
# Get rid of all the default menu bar items
# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# Show playing now when active
defaults write com.apple.menuextra.airplay ShowInMenuBarIfPresent -bool true
# Show focus mode when active
defaults write com.apple.menuextra.clock ShowFocusModes -bool true
# Show SpaceID and hide the rest behind Dozer
# Show full time and date
defaults write com.apple.menuextra.clock DateFormat -string "\"EEE d MMM HH:mm:ss\""

# Mission Control
# ===============
# Disable automatic workspace re-ordering
defaults write com.apple.dock mru-spaces -bool false

# Desktop
# =======
# Disable desktop icons
defaults write com.apple.finder CreateDesktop false

# Mouse/Trackpad
# ==============
# Disable natural scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# Disable scroll acceleration
defaults write NSGlobalDomain com.apple.scrollwheel.scaling -float 0
# Enable tap to click on trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1


# Keyboard
# ========
# Disable auto correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
# Disable auto capitalisation
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
# Remove key repeat delay
defaults write NSGlobalDomain InitialKeyRepeat -int 10
# Fast key repeat
defaults write NSGlobalDomain KeyRepeat -int 1

# Screenshots
# ===========
# Use JPG for screenshots
defaults write com.apple.screencapture type jpg

# Finder
# ======
# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true
# Show path bar
defaults write com.apple.finder ShowPathbar -bool true
# Show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Default to list view
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
# Keep folders on top
defaults write com.apple.finder _FXSortFoldersFirst -bool true
# Search current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
# Show Library
chflags nohidden ~/Library
# Activity Monitor
# ================
# Update very often
defaults write com.apple.ActivityMonitor UpdatePeriod -int 1

# iTerm2
# ======
# Path to config
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.config/iterm2/"

# Google Chrome
# =============
# Use the system-native print preview dialog
defaults write com.google.Chrome DisablePrintPreview -bool true

# Expand the print dialog by default
defaults write com.google.Chrome PMPrintingExpandedStateForPrint2 -bool true

echo "[osconfig] INFO: Installation finished"
