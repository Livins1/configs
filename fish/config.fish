

alias  vim="nvim"
alias  pc="proxychains"

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

setenv EDITOR nvim
setenv NAME "Davinc"
setenv EMAIL "coldpure9ev@gmail.com"
setenv CARGO_INCREMENTAL 1
setenv LESS "-F -X -R"
setenv BROWSER firefox

setenv RUSTUP_DIST_SERVER "https://mirrors.sjtug.sjtu.edu.cn/rust-static/"
# setenv RUSTUP_UPDATE_ROOT "https://mirrors.ustc.edu.cn/rust-static/rustup"
setenv GO111MODULE "on"
setenv GOPROXY "https://goproxy.cn"

set LD_LIBRARY_PATH $LD_LIBRARY_PATH /opt/gtk/lib

# Debian 
set PKG_CONFIG_PATH $PKG_CONFIG_PATH /usr/local/lib/pkgconfig
set PKG_CONFIG_PATH $PKG_CONFIG_PATH /opt/gtk/lib/pkgconfig

# snapd
set PATH $PATH /var/lib/snapd/snap/bin
set PATH $PATH /opt/gtk/bin 
# path
set PATH $PATH ~/.cargo/bin
set PATH $PATH ~/go/bin
set PATH $PATH ~/.local/bin

set MANPATH /usr/share/man
set MANPATH $MANPATH /usr/local/share/man
# Fish should not add things to clipboard when killing
# See https://github.com/fish-shell/fish-shell/issues/772
set FISH_CLIPBOARD_CMD "cat"

setenv XDG_CONFIG_HOME $HOME/.config
setenv XDG_DATA_DIRS /usr/local/share:/usr/share:/var/lib/snapd/desktop


set TTY1 (tty)

if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  # Debug
  #exec dbus-run-session sway -d 2> ~/sway.log
  exec dbus-run-session sway
end

# 关闭未知命令搜索
function __fish_command_not_found_handler --on-event fish_command_not_found
    echo "fish: Unknown command '$argv'"
end

#  Fish 启动调用 
if status --is-interactive
	if ! set -q TMUX
		exec tmux
	end
	#	tmux ^ /dev/null; and exec true 
end




# pacman -S inetutils 
# /usr/bin/hostname
# function fish_prompt
# 	set_color brblack
# 	echo -n "["(date "+%H:%M")"] "
# 	set_color blue
# 	echo -n (hostname)
# 	if [ $PWD != $HOME ]
# 		set_color brblack
# 		echo -n ':'
# 		set_color yellow
# 		echo -n (basename $PWD)
# 	end
# 	set_color green
# 	printf '%s ' (__fish_git_prompt)
# 	set_color red
# 	echo -n '| '
# 	set_color normal
# 	if set -q VIRTUAL_ENV
# 		echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
# 	end
# end


#if not set -q TMUX
#    set -g TMUX tmux new-session -d -s base
#    eval $TMUX
#    tmux attach-session -d -t base
#end

function quickgit # This is the function name and command we call
 	git --git-dir=$PWD/.git add . # Stage all unstaged files
	git --git-dir=$PWD/.git commit -a -m $argv # Commit files with the given argument as the commit message
	git --git-dir=$PWD/.git push # Push to remote
end

function proxy
  set -xg ALL_PROXY http://192.168.1.184:1080
end

function noproxy
  set -e ALL_PROXY
end


function sway_getwindowinfo
    slurp -p -f "%x %y" | read x_sel y_sel
    or return 1

    # TODO: this returns everything when there is only one container open in the workspace
    # need to fix the logic
    for rect in (swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x) \(.width) \(.y) \(.height)"')
        echo $rect | read x1 w y1 h
        set x2 (math $x1 + $w)
        set y2 (math $y1 + $h)
        if test \( $x_sel -ge $x1 \) -a \( $x_sel -le $x2 \)
            and test \( $y_sel -ge $y1 \) -a \( $y_sel -le $y2 \)
            #swaymsg --type get_tree | jq ".. | objects | select(.rect.x == $x1 and .rect.y == $y1 and .rect.width == $w and .rect.height == $h) | .id, .name, .pid, .title, .app_id, .marks, .type"
            swaymsg --type get_tree | jq ".. | objects | select(.rect.x == $x1 and .rect.y == $y1 and .rect.width == $w and .rect.height == $h)"
        end
    end
end
# startship 
# starship init fish | source



# zoxide
zoxide init fish | source


