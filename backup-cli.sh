#!/bin/sh

config_home=${XDG_CONFIG_HOME}

if [ $config_home ]
then
	echo "XDG_CONFIG_HOME:" $config_home
else
	echo "Config Home Error!"
	exit 1
fi



#DstApplicationPath
dst_alacritty="${XDG_CONFIG_HOME}/alacritty/"
dst_fish="${XDG_CONFIG_HOME}/fish/"
dst_nvim="${XDG_CONFIG_HOME}/nvim/"
dst_starship="${XDG_CONFIG_HOME}"
dst_foot="${XDG_CONFIG_HOME}/foot/"
dst_tmux="$HOME"
dst_tmux_folder="$HOME/.tmux"
dst_mako="${XDG_CONFIG_HOME}/mako/"

if [ -d $dst_foot ];then
	mkdir -p ./foot && cp -r $dst_foot/foot.ini $_
	echo "Foot Found"
else
  echo "Foot Not Found"
fi

if [ -d $dst_alacritty ];then
	mkdir -p ./alacritty && cp -r $dst_alacritty/alacritty.yml $_
	echo "Alacritty Found"
else
  echo "Alacritty Not Found"
fi

if [ -a $HOME/.zshrc ];then
	mkdir -p ./zsh && cp $HOME/.zshrc $_
	echo "Zsh Found"
else
  echo "Zsh Skipped"
fi

if [ -d $dst_fish ];then
	mkdir -p ./fish && cp -r $dst_fish/* $_
	echo "fish Found"
else
  echo "fish Not Found"
fi

if [ -d $dst_nvim ];then
	mkdir -p ./nvim && cp -r $dst_nvim/autoload/ $_
	mkdir -p ./nvim && cp -r $dst_nvim/lua/ $_
	mkdir -p ./nvim && cp -r $dst_nvim/init.lua $_
	echo "Neovim Found"
else
  echo "nvim Not Found"
fi

if [ -d $dst_starship ];then
	mkdir -p ./starship && cp -r $dst_starship/starship.toml $_
	echo "StarShip Found"
else
  echo "starship Not Found"
fi

if [ -d $dst_tmux ];then
	mkdir -p ./tmux && cp -r $dst_tmux/.tmux.conf $_
	echo "Tmux  Found"
else
  echo "tmux  Not Found"
fi

if [ -d $dst_tmux_folder ];then
	mkdir -p ./tmux/.tmux && cp -r $dst_tmux_folder/* $_
	echo "Tmux folder Found"
else
  echo "tmux folder Not Found"
fi
if [ -d $dst_mako ];then
	mkdir -p ./mako && cp -r $dst_mako/config $_
	echo "Mako Found"
else
  echo "Mako Not Found"
fi

echo "backUp Finished"




