# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=(~/.zsh/completion $fpath)
autoload -U compinit && compinit
autoload -U promptinit && promptinit
autoload -U edit-command-line

export CLICOLOR=1
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select

HISTSIZE=2000
SAVEHIST=1000
HISTFILE=~/.zshhistory
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# Ignore extensions when completing
fignore=(.o)

alias grep='grep --color=auto'
export GREP_COLOR=31

# Lang settings
_locale=$(locale -a | grep -i en.us.utf)
if  [[ $? == 0 ]]; then
  export LC_ALL=${_locale}
  export LANG=${_locale}
  export LANGUAGE=${_locale}
fi

export GOPATH=$HOME/go

[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
