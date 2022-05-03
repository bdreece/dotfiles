# Environment variables
export PATH=$PATH:/usr/local/go/bin:$HOME/.local/bin
export PATH=$PATH:$HOME/Code/go/bin:/opt/flutter/bin:$HOME/.cargo-target/release
export PATH=$PATH:"$HOME/.wine/drive_c/Program Files/Image-Line/FL Studio 20"
export GOPATH=$HOME/Code/go
export CHROME_EXECUTABLE=$(which vivaldi-stable)
export CMAKE_GENERATOR=Ninja
export EDITOR=nvim
export TERM=linux

clear
if [[ $(printenv | rg "TMUX_PANE" | awk -F% '{print $2}') == 0 ]]
then
  	pfetch | lolcat
	errands ls -o random -c 5
elif [[ $(printenv | rg "TMUX_PANE" | awk -F% '{print $2}') > 0 ]]
then
    if [ -d ".git" ]
    then
        octofetch bdreece -c $HOME/.config/octofetch/config.json
    else
  		fortune /usr/share/fortune/definitions | cowsay | lolcat
    fi
	echo ""
	errands ls -o random -c 5
fi


# Path to your oh-my-zsh installation.
export ZSH="/home/bdreece/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="jnrowe"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  zsh-interactive-cd
  # zsh-vi-mode
  git
  tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

source $HOME/.cargo/env

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias t="touch"
alias m="mkdir -p"
alias c="clear"
alias grep="rg --ignore-vcs"
alias ls="exa"
alias ll="exa -lah"
alias l="exa -lh"
alias lg="exa -lh --git --git-ignore"
alias llg="exa -lah --git --git-ignore"
alias tree="exa -lah --tree"
alias vim="nvim"
alias svim="nvim -c 'call Scratch()'"
alias man="man -P most"
alias config='/usr/bin/git --git-dir=/home/bdreece/.cfg --work-tree=/home/bdreece'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
