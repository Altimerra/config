#!/usr/bin/env zsh

alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

alias r='ranger'

alias m="mkdir"

# Exa
alias l="exa --icons"
alias ll="exa -l --icons"
alias la="exa -la --icons"
alias lr="exa -R"

# Package management
alias p="sudo pacman -S"
alias pac-remove="sudo pacman -Rs"
alias pac-upgrade-all="sudo pacman -Syu"
alias pac-search-sync="pacman -Ss"
alias pac-search-local="pacman -Qi"
alias pac-search-files="pacman -F"

#Git

alias gis="git status"
alias gid="git diff"
alias gia="git add"
alias gic="git commit -am"

# emacs
alias e="emacsclient -nc"

# file menu
alias ff="ls | rofi -dmenu -i -multi-select | xargs -d '\n'"
alias f="ls | fzf -m | xargs -d '\n' handlr open"
alias fo="ls | fzf -m | xargs -d '\n'"
alias fr="fzf -m | xargs -d '\n' handlr open"

# image pipe
alias i="nsxiv -tfo . | xargs -d '\n'"
alias ir="nsxiv -trfo . | xargs -d '\n'"
alias iw="nsxiv -tfo . | xargs -d '\n' feh --bg-fill"
alias iwr="nsxiv -trfo . | xargs -d '\n' feh --bg-fill"

# mpv
alias mpv-webcam="mpv --demuxer-lavf-format=video4linux2 --demuxer-lavf-o-set=input_format=mjpeg av://v4l2:/dev/video0 --profile=low-latency --untimed"

# ffmpeg
alias ff-rec="ffmpeg -f x11grab -video_size 1920x1080 -framerate 25 -i $DISPLAY -f alsa -i default -c:v libx264 -preset ultrafast -c:a aac"

# clipboard
alias clip="xsel -b"
