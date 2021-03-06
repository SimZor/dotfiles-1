#!/bin/bash

# Set some useful OS X defaults.
# Source for some of the important things:
# https://github.com/nicksp/dotfiles


# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

########################
# Safari Stuff
########################

# Privacy: don’t send Safari search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Prevent Safari from opening ‘safe’ files automatically after downloading
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Set Safari’s home page to `about:blank` for faster loading
defaults write com.apple.Safari HomePage -string "about:blank"

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable stupid menu bar items
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
  "/System/Library/CoreServices/Menu Extras/Volume.menu" \
  "/System/Library/CoreServices/Menu Extras/User.menu"
done

########################
# Activity Monitor
########################

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5
# Sort by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

########################
# Interface and Finder
########################

# Set a really fast keyboard repeat rate.
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1

# Disable press-and-hold for keys in favor of key repeat.
defaults write com.apple.universalaccess slowKey -int 0 # Disable Slow Keys.
defaults write -g ApplePressAndHoldEnabled -bool false

# Require password immediately after sleep or screen saver.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable and kill Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES; killall Dock

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set the Finder prefs for showing a few different volumes on the Desktop.
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Always open everything in Finder's column view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show hidden files and file extensions by default
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Disable the warning when changing file extensions
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Allow text-selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# DISABLE auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Disable the crash reporter
defaults write com.apple.CrashReporter DialogType -string "none"

############
# OTHER
############

# Disable the sudden motion sensor as it’s not useful for SSDs
sudo pmset -a sms 0

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

############
# MOJAVE
############

# Make text readable in Mojave
defaults write -g CGFontRenderingFontSmoothingDisabled -bool FALSE
