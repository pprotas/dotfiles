#!/bin/bash

# Heavily inspired by https://github.com/mathiasbynens/dotfiles/blob/main/.macos
# Special thanks to: GitHub Copilot and https://macos-defaults.com/finder/appleshowallextensions.html
echo "[osconfig] INFO: Installation started"

# Close System Settings so it doesn't override the settings below
osascript -e 'tell application "System Settings" to quit'

# Dock
# ====
# Show open application indicator
defaults write com.apple.dock show-process-indicators -bool true

# Menu bar
# ========
# Show playing now when active
defaults write com.apple.menuextra.airplay ShowInMenuBarIfPresent -bool true
# Show focus mode when active
defaults write com.apple.menuextra.clock ShowFocusModes -bool true

# Mission Control
# ===============
# Disable automatic workspace re-ordering
defaults write com.apple.dock mru-spaces -bool false

# Mouse/Trackpad
# ==============
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

# Apply Dock and Finder changes
killall Dock Finder

echo "[osconfig] INFO: Installation finished"
