source $HOME/.config/nvim/basic.vimrc

if system('whoami') != "root\n"
  source $HOME/.config/nvim/plugins-install.vimrc
  source $HOME/.config/nvim/plugins-conf.vimrc
endif

source $HOME/.config/nvim/colors.vimrc

