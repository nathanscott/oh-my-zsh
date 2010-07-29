
alias sd='ruby script/destroy'
alias sp='ruby script/plugin'
alias ssp='ruby script/spec'
alias rdbm='rake db:migrate'
alias sd='ruby script/server --debugger'
alias devlog='tail -f log/development.log'

sc () {
  if [ -f ./script/rails ]; then 
    rails console $argv
  else
    ./script/console $argv
  fi
}

ss () {
  if [ -f ./script/rails ]; then 
    ./script/rails server $argv
  else
    ./script/server $argv
  fi
}

gen () {
  if [ -f ./script/rails ]; then 
    ./script/rails g $argv
  else
    ./script/generate $argv
  fi
}

function _cap_does_task_list_need_generating () {
  if [ ! -f .cap_tasks~ ]; then return 0;
  else
    accurate=$(stat -f%m .cap_tasks~)
    changed=$(stat -f%m config/deploy.rb)
    return $(expr $accurate '>=' $changed)
  fi
}

function _cap () {
  if [ -f config/deploy.rb ]; then
    if _cap_does_task_list_need_generating; then
      echo "\nGenerating .cap_tasks~..." > /dev/stderr
      cap show_tasks -q | cut -d " " -f 1 | sed -e '/^ *$/D' -e '1,2D'
> .cap_tasks~
    fi
    compadd `cat .cap_tasks~`
  fi
}

compctl -K _cap cap

function remote_console() {
  /usr/bin/env ssh $1 "( cd $2 && ruby script/console production )"
}

