# ---environments---
set -x GOPATH $HOME/dev
set -x GOROOT /usr/local/Cellar/go/1.9.2/libexec
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/.nodebrew/current/bin
set -x LIBRARY_PATH /usr/local/opt/openssl/lib/

# ---functions---

# cd後にexa
function cd 
  builtin cd $argv; and exa
end

# fzfでPRチェックアウト
function fzf-checkout-pull-request
  set selected_pr_id (gh pr list | fzf | awk '{ print $1 }')
  if test -n "$selected_pr_id"
    commandline "gh pr checkout $selected_pr_id"
  end
  commandline -f repaint
end

# fzfでリポジトリにcd
function fzf-ghq-cd
  set selected_path (ghq list --full-path | fzf)
  if test -n "$selected_path"
    commandline "cd $selected_path"
  end
  commandline -f repaint
end

function fzf-history
  set selected_path (history | fzf --no-sort)
  if test -n "$selected_path"
    commandline "$selected_path"
  end
  commandline -f repaint
end

# ---aliases---

alias chrome='open -a "Google Chrome"'
alias mine='open -a "RubyMine.app"'
alias vi='/usr/local/Cellar/vim/8.2.0750/bin/vim'

# ---binds---

bind -M insert \cr fzf-history
bind -M insert \cg fzf-ghq-cd
bind -M insert \ch fzf-checkout-pull-request

bind -M insert \cp up-or-search
bind -M insert \cf forward-char
bind -M insert \cb backward-char
bind -M insert \ca beginning-of-line
bind -M insert \ce end-of-line

status --is-interactive; and source (rbenv init -|psub)
