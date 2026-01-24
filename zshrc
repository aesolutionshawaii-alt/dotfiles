# Josh's Zsh Configuration
# Managed via ~/.dotfiles - sync with: dotfiles-sync

# ============================================
# PATH Configuration
# ============================================

# Add personal bin to PATH
export PATH="$HOME/bin:$PATH"

# ============================================
# History
# ============================================

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt SHARE_HISTORY

# ============================================
# Prompt
# ============================================

# Simple, clean prompt: directory (git branch) $
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' (%b)'
setopt PROMPT_SUBST
PROMPT='%F{cyan}%1~%f%F{yellow}${vcs_info_msg_0_}%f $ '

# ============================================
# Completion
# ============================================

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# ============================================
# Key Bindings
# ============================================

bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# ============================================
# Aliases
# ============================================

[ -f ~/.aliases ] && source ~/.aliases

# ============================================
# Node Version Manager (if installed)
# ============================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# ============================================
# Custom Functions
# ============================================

# Quick project starter
proj() {
  if [ -z "$1" ]; then
    echo "Usage: proj <project-name>"
    echo "Available: reel, mango, jnchev, ibsh, josh"
    return 1
  fi

  case "$1" in
    reel)   cd ~/Desktop/reel-addiction-iii ;;
    mango)  cd ~/Desktop/mango ;;
    jnchev) cd ~/Desktop/jn-chevrolet-content ;;
    ibsh)   cd ~/Desktop/ibsh-content-system ;;
    josh)   cd ~/Desktop/josh-x ;;
    *)      echo "Unknown project: $1" ;;
  esac
}

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Show my custom tools
tools() {
  echo "Available tools in ~/bin:"
  echo ""
  echo "  General:"
  echo "    webimg           - Optimize images for web (sharp-based)"
  echo "    generate-icons   - Generate PWA icons"
  echo ""
  echo "  JN Chevrolet:"
  echo "    scrape-news      - Scrape news (18 sources)"
  echo "    jnchev-replies   - Find reply opportunities"
  echo "    post-metricool   - Schedule posts to Metricool"
  echo "    generate-visual  - Create styled social visuals"
  echo "    run-demo         - Run terminal demos"
  echo ""
  echo "  IBSH:"
  echo "    ibsh-news        - Scrape news (23 sources)"
  echo "    ibsh-replies     - Find reply opportunities"
  echo "    ibsh-post        - Schedule posts to Metricool"
  echo "    ibsh-visual      - Create styled social visuals"
  echo "    ibsh-demo        - Run terminal demos"
  echo ""
  echo "  Josh X (Personal):"
  echo "    josh-news        - Scrape Bitcoin/AI news"
  echo "    josh-history     - Scrape Claude chats for content"
  echo "    josh-replies     - Find reply opportunities"
  echo "    josh-post        - Schedule posts to Metricool"
  echo ""
  echo "  Reel Addiction III:"
  echo "    warm-cloudinary  - Pre-warm Cloudinary CDN cache"
}

# Dotfiles sync helper
dotfiles-sync() {
  cd ~/.dotfiles
  git add -A
  git commit -m "Sync dotfiles $(date +%Y-%m-%d)"
  git push
  cd -
}

dotfiles-pull() {
  cd ~/.dotfiles
  git pull
  ~/.dotfiles/install.sh
  cd -
  source ~/.zshrc
}
export PATH="$HOME/.local/bin:$PATH"
