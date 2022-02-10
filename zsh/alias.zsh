#!/usr/bin/env zsh

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias weather="pwy Colombo"
alias r='ranger'
alias ca='conda activate'
alias yt720="youtube-dl -f 'bestvideo[ext=webm][height<=720]+bestaudio[ext=webm]' --add-metadata"
alias yt1080="youtube-dl -f 'bestvideo[ext=webm][height<=1080]+bestaudio[ext=webm]' --add-metadata"
alias ytm="youtube-dl -x --add-metadata"
alias clip="xsel -b"
alias youtube="ytfzf -t"
alias yt="ytfzf -tlf"
alias weather="pwy Maharagama"
alias rmcolor="sed 's/\x1b\[[0-9;]*m//g'"
alias ascii-img="ascii-image-converter -Cfc"
alias img="sxiv -to ."
alias timetable="zathura /mnt/data/Library/Academic/General/S3_mech_2021.pdf"
alias vi="vim.tiny"
alias ytm-album="youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' -x --add-metadata"
alias ytm-playlist="youtube-dl -o '%(playlist)s/%(title)s.%(ext)s' -x --add-metadata"

alias m="mkdir"

# Exa
alias l="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"
alias lr="exa -R"

# Wallpaper
alias paper="nitrogen ~/Pictures/Wallhaven"

# Directories
alias Ytm="/mnt/data/Library/Music/Ytm"
alias Aca="/mnt/data/Library/Academic/Modules"
alias Wall="/mnt/data/Library/Wallpapers"

# Package management
alias pac-install="sudo pacman -S"
alias pac-remove="sudo pacman -Rs"
alias pac-upgrade-all="sudo pacman -Syu"
alias pac-search-sync="pacman -Ss"
alias pac-search-local="pacman -Qi"
alias pac-search-files="pacman -F"

alias lynx="lynx -accept_all_cookies"

alias mnt="udiskctl mount -b"

# Cloud drives
alias mega="rclone mount Mega:/ /home/harindu/Drives/Mega"

alias e="emacsclient -nc"

# file menu
alias f="ls | rofi -dmenu -i -multi-select | xargs -d '\n' "
