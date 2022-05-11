#!/bin/bash

# exit on error
# set -e

function sync() {
  cp -r "$HOME/$1" .
}

# Folders
declare -a folders=(".azure" ".config" ".docker" ".iterm2" ".todo" ".vim" ".vscode" ".z-scripts" ".zfunc" ".zsh" "fonts" "go/bin" "utility-scripts")

for i in "${folders[@]}"; do
  echo "syncing folder: $i"
  sync "$i"
done

# Files
declare -a files=(".vimrc" ".hushlogin" ".bash_profile" ".bashrc" ".gitconfig" ".gem" ".profile" ".zshenv" "Brewfile" "Brewfile.lock.json" ".config/neofetch/config.conf" ".config/nvim/coc-settings.json" ".config/nvim/plugins.vim" ".config/nvim/init.vim" ".config/nvim/plugin-settings.vim" ".config/nvim/space.vim" ".zshenv" ".fzf.zsh" ".zshrc" "jira-cli.,json" "$HOME/Library/Application Support/Code/User/keybindings.json" "$HOME/Library/Application Support/Code/User/settings.json")

for i in "${files[@]}"; do
  echo "sync files: $i"
  sync "$i"
done

mv settings.json keybindings.json .vscode

mv Brew* homebrew/

sudo rm -rf .config/nvim/plugged
rm -rf .config/coc/extensions

echo 'sync completed'

#################
# ignored files and folders
#################

# .CFUserTextEncoding
# .DS_Store
# .IdentityService/
# .Trash/
# .bash_history
# .bash_sessions/
# .cache/
# .cargo/
# .cups/
# .geometry_upgrade
# .gitconfig.local
# .haxornewsconfig@
# .iterm2_shell_integration.zsh*
# .node_history
# .npm/
# .nuget/
# .omnisharp/
# .pcloud/
# .prismic
# .sentryclirc@
# .ssh/
# .step/
# .templateengine/
# .viminfo
# .yarnrc@
# .z
# .netrc
# .zsh_history
# .gnupg/
# .gnupg_pre_2.1/
#################
