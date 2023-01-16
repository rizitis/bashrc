. /etc/profile
# history modifications
export HISTSIZE=1000 #500 is default
export HISTFILESIZE=1000000
export HISTTIMEFORMAT='%b %d %I:%M %p ' # using strftime format
export HISTCONTROL=ignoreboth # ignoreups:ignorespace
#I like nano
export EDITOR=nano
export VISUAL=nano 
# Dynamic resizing
shopt -s checkwinsize
#
#save bash history so as to share

shopt -s histappend
PROMPT_COMMAND='history -a'

# Custom prompt
#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$\033[00m\] '
#PS1='\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;34m\]#\033[00m\] '
export col_white='\033[00m'
export col_black='\033[01;30m'

export col_red='\033[01;31m'
export col_green='\033[01;32m'
export col_yel='\033[01;33m'
export col_blue='\033[01;34m'

if [ "$LOGNAME" = root ] || [ "`id -u`" -eq 0 ] ; then
    PS1="$col_red\u@\h:$col_purple\w$col_green# $col_white"
else
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$\033[00m\] '
fi

# Add color
eval `dircolors -b`



#aliases make life better
alias  grub-mk='grub-mkconfig -o /boot/grub/grub.cfg'
alias  grub-i='grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub'
alias edit='gnome-text-editor'
alias ..='cd ..'
alias ...='cd../..'
alias reboot='sudo reboot'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='diff --color'
alias search='sudo slackpkg search'
alias slackup='sudo slackpkg update'
alias slackall='sudo slackpkg upgrade-all'
alias slacknew='sudo slackpkg install-new'
alias upr='sudo upgradepkg --reinstall'
alias upn='sudo upgradepkg --install-new'
alias upnr='sudo upgradepkg --install-new --reinstall'
alias sbopkg='sudo sbopkg'
alias slpkg='sudo slpkg'
# To have colors for ls and all grep commands such as grep, egrep and zgrep
export CLICOLOR=1
export LS_COLORS='no=00:fi=00:di=00;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.xml=00;31:'
#export GREP_OPTIONS='--color=auto' #deprecated
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# Color for manpages in less makes manpages a little easier to read
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Easy way to extract archives
ksezip () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1;;
           *.tar.gz)    tar xvzf $1;;
           *.bz2)       bunzip2 $1 ;;
           *.rar)       unrar x $1 ;;
           *.gz)        gunzip $1  ;;
           *.tar)       tar xvf $1 ;;
           *.tbz2)      tar xvjf $1;;
           *.tgz)       tar xvzf $1;;
           *.zip)       unzip $1   ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1;;
           *) echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

display=( z y a b c d e f g h i j k l m n )

c0="\033[0m" # Reset Text
bold="\033[1m" # Bold Text
underline="\033[4m" # Underline Text

colorize () {
  printf "\033[38;5;$1m"
}

getColor() {
  tmp_color=${1,,}

  case "${tmp_color}" in
    'light grey')   color_ret='\033[0m\033[37m';;
    'light green')  color_ret='\033[0m\033[1;32m';;
    'light red')	color_ret='\033[0m\033[1;31m';;
    'orange')       color_ret="$(colorize '202')";;
    'yellow')       color_ret='\033[0m\033[1;33m';;
    'cyan')         color_ret='\033[0;36m';;
  esac
  echo "${color_ret}"
}

asciiText () {
    c1=$(getColor 'orange')
    c2=$(getColor 'light red')
    c3=$(getColor 'yellow')
    c4=$(getColor 'cyan')
    startline="0"                                                             
	fulloutput=("$c4                                                          %s"
"$c4  ██████  ██▓    ▄▄▄       ▄████▄   ██ ▄█▀ █     █░ ▄▄▄       ██▀███  ▓█████  %s"
"$c4▒██    ▒ ▓██▒   ▒████▄    ▒██▀ ▀█   ██▄█▒ ▓█░ █ ░█░▒████▄    ▓██ ▒ ██▒▓█   ▀  %s"
"$c4░ ▓██▄   ▒██░   ▒██  ▀█▄  ▒▓█    ▄ ▓███▄░ ▒█░ █ ░█ ▒██  ▀█▄  ▓██ ░▄█ ▒▒███    %s"
"$c4 ▒   ██▒▒██░   ░██▄▄▄▄██ ▒▓▓▄ ▄██▒▓██ █▄  ░█░ █ ░█ ░██▄▄▄▄██ ▒██▀▀█▄  ▒▓█  ▄   %s"
"$c4▒██████▒▒░██████▒▓█   ▓██▒▒ ▓███▀░▒██▒ █▄░░██▒██▓  ▓█   ▓██▒░██▓ ▒██▒░▒████▒ %s"
"$c4▒ ▒▓▒ ▒ ░░ ▒░▓  ░▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▒ ▓▒░ ▓░▒ ▒   ▒▒   ▓▒█░░ ▒▓ ░▒▓░░░ ▒░ ░ %s"
"$c4░ ░▒  ░ ░░ ░ ▒  ░ ▒   ▒▒ ░  ░  ▒   ░ ░▒ ▒░  ▒ ░ ░    ▒   ▒▒ ░  ░▒ ░ ▒░ ░ ░  ░ %s"
"$c4░ ░  ░    ░ ░    ░   ▒   ░        ░ ░░ ░   ░   ░    ░   ▒     ░░   ░    ░    %s"
"$c4  ░      ░  ░     ░  ░░ ░      ░  ░       ░          ░  ░   ░        ░  ░ %s"
"$c4                         ░   %s"  "$c4                                        %s"                                                     
"$c4                               %s"  "$c4                                      %s"
"$c4                              %s"  "$c4                                       %s"
"$c4                                 %s"  "$c4                                    %s"
"$c4                                 %s"  "$c4                                   %s")
for ((i=0; i<${#fulloutput[*]}; i++)); do
        printf "${fulloutput[i]}$c0\n" "${out_array}"
        if [[ "$i" -ge "$startline" ]]; then
            unset out_array[0]
            out_array=( "${out_array[@]}" )
        fi
    done

}

infoDisplay () {
    display_index=0
    labelcolor=$(getColor 'light green')
	textcolor=$(getColor 'light grey')
    if [[ "${display[@]}" =~ "z" ]]; then
        z=$(echo -e "${labelcolor} ");
        out_array=( "${out_array[@]}" "$z" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "y" ]]; then
        y=$(echo -e "${labelcolor} ");
        out_array=( "${out_array[@]}" "$y" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "a" ]]; then
        a=$(echo -e "${labelcolor} ");
        out_array=( "${out_array[@]}" "$a" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "b" ]]; then
        b=$(echo -e "$labelcolor  ");
        out_array=( "${out_array[@]}" "$b" )
        ((display_index++))
    fi
    if [[ "${display[@]}" =~ "c" ]]; then
        c=$(echo -e "$labelcolor ");
        out_array=( "${out_array[@]}" "$c" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "d" ]]; then
        d=$(echo -e "$labelcolor ");
        out_array=( "${out_array[@]}" "$d" )
        ((display_index++))
    fi
    if [[ "${display[@]}" =~ "e" ]]; then
        e=$(echo -e "$labelcolor  ");
        out_array=( "${out_array[@]}" "$e" )
        ((display_index++))
    fi
    if [[ "${display[@]}" =~ "f" ]]; then
        f=$(echo -e "$labelcolor");
        out_array=( "${out_array[@]}" "$f" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "g" ]]; then
        g=$(echo -e "$labelcolor  ");
        out_array=( "${out_array[@]}" "$g" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "h" ]]; then
        h=$(echo -e "$labelcolor  ");
        out_array=( "${out_array[@]}" "$h" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "i" ]]; then
        i=$(echo -e "$labelcolor ");
        out_array=( "${out_array[@]}" "$i" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "j" ]]; then
        j=$(echo -e "$labelcolor  ");
        out_array=( "${out_array[@]}" "$j" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "k" ]]; then
        k=$(echo -e "$labelcolor    ");
        out_array=( "${out_array[@]}" "$k" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "l" ]]; then
        l=$(echo -e "$labelcolor   ");
        out_array=( "${out_array[@]}" "$l" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "m" ]]; then
        m=$(echo -e "$labelcolor    ");
        out_array=( "${out_array[@]}" "$m" );
        ((display_index++));
    fi
    if [[ "${display[@]}" =~ "n" ]]; then
        n=$(echo -e "$labelcolor   ");
        out_array=( "${out_array[@]}" "$n" );
        ((display_index++));
    fi
    

    asciiText
}

for i in "${display[@]}"; do
    detect${i} 2>/dev/null
done

echo
infoDisplay
echo


