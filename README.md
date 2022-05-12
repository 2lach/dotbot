# Dotbot
![sortbot](./assets/dotbot.png "Dotbot")
### Summary:
Dotbot creates a dotfile repository from the setup you have on your local machine then you can do what you want with it.
It is not a dotfiles manager there are plenty of those. Dotbot is a collector.
Dotbots job is to backup the files and folders listed in `files.txt` & `folders.txt` and save it.

Dotbot will then create a git repository (default: $HOME/project/dotfiles) with all your relevant files and folders
If you want a different setup then feel free to do so. 

Add all the folder(s) (realpath) you want to include in the repository in the file named "folders.txt"
Add all the file(s) (realpath) you want to include in the repository in the file named "files.txt"
txt files structure:

files:
```txt
/Users/username/.Brewfile
/Users/username/.gitconfig
/Users/username/.vimrc
/Users/username/.config/nvim/init.vim
...
...
# Leave this as the last line
```

folders:
```txt
/Users/username/.azure
/Users/username/.config
/Users/username/.docker
/Users/username/.vscode
...
...
# Leave this as the last line
```


I built it mostly for my own needs so dotbot should work fine on any unix based system, probably not on windows.
