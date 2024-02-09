#!/bin/bash

# Define plugin and installation paths
PLUGIN_NAME="braiins-toolbox"
GITHUB_URL="https://raw.githubusercontent.com/airoweb/TB-auto-complete-omyz/main/braiins-toolbox.plugin.zsh"
PLUGIN_PATH="$HOME/.oh-my-zsh/custom/plugins/$PLUGIN_NAME"

# Check if Oh My Zsh is installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Please install it first."
    exit 1
fi

# Create plugin directory if it doesn't exist
mkdir -p "$PLUGIN_PATH"

# Download the plugin
echo "Downloading $PLUGIN_NAME plugin..."
curl -fsSL "$GITHUB_URL" -o "$PLUGIN_PATH/$PLUGIN_NAME.plugin.zsh"

# Check if the plugin is already in the .zshrc file
if ! grep -q "$PLUGIN_NAME" "$HOME/.zshrc"; then
    # Add the plugin to the .zshrc file
    echo "Adding $PLUGIN_NAME to .zshrc..."
    sed -i '' "/^plugins=(/ s/)$/ $PLUGIN_NAME)/" "$HOME/.zshrc"
    echo "Installation complete! Please restart your terminal or source your .zshrc file."
else
    echo "$PLUGIN_NAME is already installed."
fi
