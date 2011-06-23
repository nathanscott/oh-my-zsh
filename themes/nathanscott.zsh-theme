grey='\e[0;90m'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$grey%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$grey%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$grey%})"

setopt prompt_subst

PROMPT='
%n@%m:%{%F{green}%}$PWD%{%F{red}%}
%(?,%{%F{green}%},%{%F{red}%})✪%{$reset_color%} '

RPROMPT='$(rvm_prompt_info)%{$reset_color%} $(git_prompt_info)'
