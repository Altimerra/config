#!/usr/bin/env zsh

cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "$dir: Directory not found"
	fi
}

star() {
    local word="$1"
    sdcv -cn $word | bat
}

img-darken(){
	 local image="$1"
	 magick convert  -brightness-contrast -18 -sigmoidal-contrast -25 $image -set filename:name '%t-dark.%e' '%[filename:name]' 
}

img-rmback(){
	 local image="$1"
         magick convert "$image" -fill none -fuzz 12% -draw 'color 0,0 floodfill' -flop -draw 'color 0,0 floodfill' -flip -draw 'color 0,0 floodfill' -flop -draw 'color 0,0 floodfill' -flip \
           -set filename:name '%t-subject.png' '%[filename:name]'
}

openbg(){
  local command="$1"
  local file="$2"
  nohup "$command" "$file" &
}

c() {
  local dir="$1"
  local dir="${dir:=$PWD}"
  z "$dir" && exa -l || echo "Directory not found"
}

o() {
  local file="$1"
  filetype=$( file -b --mime-type "$file" )
  [[ "$filetype" = "inode/symlink" ]] && filetype=$( readlink -f "$file" | xargs file -b --mime-type )

  case "$filetype" in
    text*)
      emacsclient "$file"
      ;;
    application/pdf)
      zathura "$file" &
      ;;
    video*)
      mpv "$file" &
      ;;
    audio*)
      mpv "$file"
      ;;
    image*)
      sxiv "$file" &
      ;;
    inode/directory)
      local dir="${file:=$PWD}"
      z "$dir" && exa || echo "Directory not found"
      ;;
    *)
      echo "What the fuck is this?"
      ;;
  esac
}


git-sparse-clone() {
  [[ -z "$1" ]] && echo "Usage: git-sparse-clone [url] [subtrees]" && return 
  
  url="$1" && shift 1
  localdir="${url##*/}"

  mkdir -p "$localdir"
  cd "$localdir"

  git init
  git remote add origin "$url"
  
  git config core.sparseCheckout true
  
  for i; do
    echo "$i" >> .git/info/sparse-checkout
  done

  git pull --depth 1 origin master
}

screencast() {
  [[ -z "$1" ]] && output=screencast.mp4 || output="$1" 
  ffmpeg -video_size 1920x1080 -framerate 25 -f x11grab -i :0.0+0,0 "$output"
}

text-img(){
  local text="$1"
  convert -background black -fill cyan -font DejaVu-Serif -pointsize 72 -size 1920x1080 -gravity center caption:"$text" "$text".png
}

set-wallpaper(){
  wallpaper="$( sxiv -to . )" 
  feh --bg-fill "$wallpaper"
}

insert-to-line(){ 
  [[ -z "$1" ]] && echo "Usage: echo [text] | insert-to-line [line] [file]" && return 0
  read text
  local line="$1"
  local file="$2"
  sed  ""$line"i "$text"" "$file"
}

syncwork(){ #WIP
  rsync -a ~/Data/Workbench ~/Drives/Mega
}

change-wallpaper(){
 nitrogen --random --set-zoom-fill /home/harindu/Data/Library/Wallpapers
}

textcleanerall(){
  [[ -z "$1" ]] && intensity="40" || intensity="$1"
  for file in $( ls -p | grep -v / ) 
  do
    textcleaner -f "$intensity" "$file" "clean-$file"
  done
}
