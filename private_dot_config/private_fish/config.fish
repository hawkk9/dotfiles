alias chrome='open -a "Google Chrome"'
alias vscode='open -a "Visual Studio Code"'

# cd後にls 
function cd 
    builtin cd $argv; and ls
end

# fzfでPRチェックアウト
function fzf-checkout-pull-request
  set selected_pr_id (gh pr list | fzf | awk '{ print $1 }')
  if test -n "$selected_pr_id"
    commandline "gh pr checkout $selected_pr_id"
  end
  commandline -f repaint
end
