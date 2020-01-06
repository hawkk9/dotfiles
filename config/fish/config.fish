# 環境変数
set -x GOPATH $HOME/Dev
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin

set -x PATH $PATH $HOME/Library/Python/3.7/bin
set -x PATH $PATH $HOME/.nodebrew/current/bin
set -x PATH $PATH /usr/local/opt/cassandra/bin
set -x LIBRARY_PATH $LIBRARY_PATH /usr/local/opt/openssl/lib
set -x JAVA_HOME (/usr/libexec/java_home -v "1.8")
set -x PATH $PATH $JAVA_HOME/bin
set -x PATH $PATH /Users/yuichi.nishitani/Dev/github.com/yuichi-nishitani/beaver/node_modules/.bin

status --is-interactive; and source (rbenv init -|psub)

# THEME PURE #
# set fish_function_path /Users/nishitaniyuuichi/.config/fish/functions/theme-pure/functions/ $fish_function_path

# cd後にls 
function cd 
    builtin cd $argv; and ls
end

alias chrome='open -a "Google Chrome"'
alias rubymine='open -a "RubyMine"'

bind \cs 'vi ~/.config/fish/config.fish'
