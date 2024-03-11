source $HOME/.config/nvim/enabled-conf/00-basic.vimrc
source $HOME/.config/nvim/enabled-conf/00-functions-misc.vimrc

if system('whoami') != "root\n"
  source $HOME/.config/nvim/enabled-conf/10-golang-misc.vimrc
  source $HOME/.config/nvim/enabled-conf/10-sql-misc.vimrc
  source $HOME/.config/nvim/enabled-conf/10-install-plugins.vimrc

  source $HOME/.config/nvim/enabled-conf/20-auto-completion.vimrc
  source $HOME/.config/nvim/enabled-conf/20-code-formating.vimrc
  source $HOME/.config/nvim/enabled-conf/20-git-integration.vimrc
  source $HOME/.config/nvim/enabled-conf/20-gitlab.vimrc
  source $HOME/.config/nvim/enabled-conf/20-javascript-misc.vimrc
  source $HOME/.config/nvim/enabled-conf/20-neomake.vimrc
  source $HOME/.config/nvim/enabled-conf/20-pair-plugins.vimrc
  source $HOME/.config/nvim/enabled-conf/20-snippet-management.vimrc
  source $HOME/.config/nvim/enabled-conf/20-ui-mods.vimrc
  source $HOME/.config/nvim/enabled-conf/20-search.vimrc
  source $HOME/.config/nvim/enabled-conf/20-lsp.vimrc
  source $HOME/.config/nvim/enabled-conf/20-spellcheck.vimrc
endif

source $HOME/.config/nvim/enabled-conf/30-colors.vimrc

